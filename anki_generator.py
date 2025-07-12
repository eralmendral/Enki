#!/usr/bin/env python3
"""
Anki Question Generator from Markdown Files

This script reads markdown files from the Enki knowledge base and generates
questions and answers suitable for Anki flashcards.
"""

import os
import re
import json
from pathlib import Path
from typing import List, Dict, Tuple, Optional
import argparse


class MarkdownToAnkiConverter:
    def __init__(self, root_dir: str = "."):
        self.root_dir = Path(root_dir)
        self.questions = []
        
    def find_markdown_files(self) -> List[Path]:
        """Find all markdown files in the directory tree."""
        markdown_files = []
        for file_path in self.root_dir.rglob("*.md"):
            if file_path.is_file():
                markdown_files.append(file_path)
        return markdown_files
    
    def read_markdown_file(self, file_path: Path) -> str:
        """Read and return the content of a markdown file."""
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                return f.read()
        except Exception as e:
            print(f"Error reading {file_path}: {e}")
            return ""
    
    def extract_questions_from_headers(self, content: str, file_path: Path) -> List[Dict]:
        """Extract questions from markdown headers."""
        questions = []
        lines = content.split('\n')
        
        for i, line in enumerate(lines):
            # Match headers (##, ###, ####)
            header_match = re.match(r'^(#{2,4})\s+(.+)$', line.strip())
            if header_match:
                level = len(header_match.group(1))
                header_text = header_match.group(2).strip()
                
                # Skip if it's just a separator or empty
                if header_text in ['---', '***', '___', '']:
                    continue
                
                # Find the content under this header
                content_lines = []
                j = i + 1
                while j < len(lines):
                    next_line = lines[j].strip()
                    # Stop if we hit another header of same or higher level
                    if re.match(r'^#{1,' + str(level) + r'}\s+', next_line):
                        break
                    if next_line:  # Only add non-empty lines
                        content_lines.append(next_line)
                    j += 1
                
                if content_lines:
                    answer = ' '.join(content_lines[:3])  # Take first 3 lines as answer
                    if len(answer) > 200:  # Truncate if too long
                        answer = answer[:200] + "..."
                    
                    questions.append({
                        'question': f"What is {header_text}?",
                        'answer': answer,
                        'source': str(file_path),
                        'type': 'header_definition'
                    })
        
        return questions
    
    def extract_questions_from_lists(self, content: str, file_path: Path) -> List[Dict]:
        """Extract questions from bullet points and numbered lists."""
        questions = []
        lines = content.split('\n')
        
        for i, line in enumerate(lines):
            line = line.strip()
            
            # Match bullet points and numbered lists
            list_match = re.match(r'^[\s]*[-*+]\s+(.+)$', line)
            numbered_match = re.match(r'^[\s]*\d+\.\s+(.+)$', line)
            
            if list_match or numbered_match:
                item_text = (list_match or numbered_match).group(1).strip()
                
                # Skip if it's just a separator or very short
                if len(item_text) < 10 or item_text in ['---', '***', '___']:
                    continue
                
                # Create question from the item
                if ':' in item_text:
                    # Split on first colon
                    parts = item_text.split(':', 1)
                    if len(parts) == 2:
                        question_part = parts[0].strip()
                        answer_part = parts[1].strip()
                        
                        questions.append({
                            'question': f"What is {question_part}?",
                            'answer': answer_part,
                            'source': str(file_path),
                            'type': 'list_item'
                        })
                else:
                    # Create a fill-in-the-blank style question
                    # Remove common prefixes and create a question
                    clean_text = re.sub(r'^(The|A|An)\s+', '', item_text)
                    if clean_text != item_text:
                        questions.append({
                            'question': f"Complete: {clean_text}",
                            'answer': item_text,
                            'source': str(file_path),
                            'type': 'list_item'
                        })
        
        return questions
    
    def extract_questions_from_definitions(self, content: str, file_path: Path) -> List[Dict]:
        """Extract questions from definition-like patterns."""
        questions = []
        
        # Pattern for "X is Y" or "X - Y" definitions
        definition_patterns = [
            r'^([A-Z][A-Za-z\s]+)\s+is\s+(.+)$',
            r'^([A-Z][A-Za-z\s]+)\s+-\s+(.+)$',
            r'^([A-Z][A-Za-z\s]+):\s+(.+)$'
        ]
        
        lines = content.split('\n')
        for line in lines:
            line = line.strip()
            for pattern in definition_patterns:
                match = re.match(pattern, line)
                if match:
                    term = match.group(1).strip()
                    definition = match.group(2).strip()
                    
                    # Skip if too short or too long
                    if len(term) < 3 or len(definition) < 10 or len(definition) > 300:
                        continue
                    
                    questions.append({
                        'question': f"What is {term}?",
                        'answer': definition,
                        'source': str(file_path),
                        'type': 'definition'
                    })
                    break
        
        return questions
    
    def extract_questions_from_examples(self, content: str, file_path: Path) -> List[Dict]:
        """Extract questions from example patterns."""
        questions = []
        
        # Look for "Example:" or "Ex:" patterns
        example_pattern = r'Example[s]?[:]\s*(.+)'
        ex_pattern = r'Ex[:]\s*(.+)'
        
        lines = content.split('\n')
        for i, line in enumerate(lines):
            line = line.strip()
            
            # Find example patterns
            example_match = re.search(example_pattern, line, re.IGNORECASE)
            ex_match = re.search(ex_pattern, line, re.IGNORECASE)
            
            if example_match or ex_match:
                example_text = (example_match or ex_match).group(1).strip()
                
                # Look for the concept being exemplified in previous lines
                for j in range(max(0, i-5), i):
                    prev_line = lines[j].strip()
                    if re.match(r'^#{2,4}\s+', prev_line):  # Found a header
                        concept = re.sub(r'^#{2,4}\s+', '', prev_line)
                        questions.append({
                            'question': f"Give an example of {concept}",
                            'answer': example_text,
                            'source': str(file_path),
                            'type': 'example'
                        })
                        break
        
        return questions
    
    def process_file(self, file_path: Path) -> List[Dict]:
        """Process a single markdown file and extract questions."""
        content = self.read_markdown_file(file_path)
        if not content:
            return []
        
        questions = []
        
        # Extract different types of questions
        questions.extend(self.extract_questions_from_headers(content, file_path))
        questions.extend(self.extract_questions_from_lists(content, file_path))
        questions.extend(self.extract_questions_from_definitions(content, file_path))
        questions.extend(self.extract_questions_from_examples(content, file_path))
        
        return questions
    
    def generate_anki_deck(self, output_file: str = "anki_deck.json"):
        """Generate Anki deck from all markdown files."""
        markdown_files = self.find_markdown_files()
        print(f"Found {len(markdown_files)} markdown files")
        
        all_questions = []
        
        for file_path in markdown_files:
            print(f"Processing: {file_path}")
            questions = self.process_file(file_path)
            all_questions.extend(questions)
            print(f"  Generated {len(questions)} questions")
        
        # Remove duplicates based on question text
        unique_questions = []
        seen_questions = set()
        
        for q in all_questions:
            question_text = q['question'].lower().strip()
            if question_text not in seen_questions:
                seen_questions.add(question_text)
                unique_questions.append(q)
        
        # Create Anki-compatible format
        anki_deck = {
            "name": "Enki Knowledge Base",
            "description": "Generated from markdown files in the Enki knowledge base",
            "cards": unique_questions
        }
        
        # Save to JSON file
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(anki_deck, f, indent=2, ensure_ascii=False)
        
        print(f"\nGenerated {len(unique_questions)} unique questions")
        print(f"Saved to: {output_file}")
        
        return anki_deck
    
    def generate_csv_for_anki(self, output_file: str = "anki_deck.csv"):
        """Generate CSV file that can be imported directly into Anki."""
        markdown_files = self.find_markdown_files()
        all_questions = []
        
        for file_path in markdown_files:
            questions = self.process_file(file_path)
            all_questions.extend(questions)
        
        # Remove duplicates
        unique_questions = []
        seen_questions = set()
        
        for q in all_questions:
            question_text = q['question'].lower().strip()
            if question_text not in seen_questions:
                seen_questions.add(question_text)
                unique_questions.append(q)
        
        # Write CSV file
        import csv
        with open(output_file, 'w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            writer.writerow(['Question', 'Answer', 'Source', 'Type'])
            
            for q in unique_questions:
                writer.writerow([
                    q['question'],
                    q['answer'],
                    q['source'],
                    q['type']
                ])
        
        print(f"Generated CSV file: {output_file}")
        print(f"Total questions: {len(unique_questions)}")


def main():
    parser = argparse.ArgumentParser(description='Generate Anki cards from markdown files')
    parser.add_argument('--root-dir', default='.', help='Root directory to search for markdown files')
    parser.add_argument('--output-json', default='anki_deck.json', help='Output JSON file')
    parser.add_argument('--output-csv', default='anki_deck.csv', help='Output CSV file')
    parser.add_argument('--format', choices=['json', 'csv', 'both'], default='both', 
                       help='Output format')
    
    args = parser.parse_args()
    
    converter = MarkdownToAnkiConverter(args.root_dir)
    
    if args.format in ['json', 'both']:
        converter.generate_anki_deck(args.output_json)
    
    if args.format in ['csv', 'both']:
        converter.generate_csv_for_anki(args.output_csv)


if __name__ == "__main__":
    main() 