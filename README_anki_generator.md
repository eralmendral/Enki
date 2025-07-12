# Anki Question Generator

This Python script automatically generates Anki flashcards from your markdown knowledge base files.

## Features

- **Automatic Question Generation**: Converts markdown content into question-answer pairs
- **Multiple Content Types**: Handles headers, lists, definitions, and examples
- **Dual Output Formats**: Generates both JSON and CSV files
- **Duplicate Removal**: Automatically removes duplicate questions
- **Source Tracking**: Tracks which file each question came from

## How It Works

The script analyzes markdown files and extracts questions from:

1. **Headers** (##, ###, ####): Creates "What is X?" questions
2. **Bullet Points**: Converts list items into questions
3. **Definitions**: Finds "X is Y" or "X - Y" patterns
4. **Examples**: Extracts example content and pairs with concepts

## Usage

### Basic Usage
```bash
python anki_generator.py
```

This will:
- Search for all `.md` files in the current directory and subdirectories
- Generate both `anki_deck.json` and `anki_deck.csv` files

### Advanced Usage

```bash
# Specify a different root directory
python anki_generator.py --root-dir /path/to/your/markdown/files

# Generate only JSON format
python anki_generator.py --format json --output-json my_deck.json

# Generate only CSV format
python anki_generator.py --format csv --output-csv my_deck.csv

# Generate both with custom names
python anki_generator.py --output-json my_deck.json --output-csv my_deck.csv
```

## Output Formats

### JSON Format
```json
{
  "name": "Enki Knowledge Base",
  "description": "Generated from markdown files in the Enki knowledge base",
  "cards": [
    {
      "question": "What is Artificial Intelligence?",
      "answer": "It's the science and engineering of making intelligent machines.",
      "source": "Artificial Intelligence/README.md",
      "type": "header_definition"
    }
  ]
}
```

### CSV Format
The CSV file has columns: `Question`, `Answer`, `Source`, `Type`

## Importing to Anki

### Method 1: CSV Import (Recommended)
1. Open Anki
2. Go to File → Import
3. Select your generated CSV file
4. Choose the appropriate note type (Basic is usually fine)
5. Map the columns: Question → Front, Answer → Back
6. Import

### Method 2: JSON Processing
You can use the JSON output with Anki's API or convert it to Anki's `.apkg` format using additional tools.

## Question Types Generated

- **header_definition**: Questions from markdown headers
- **list_item**: Questions from bullet points and numbered lists
- **definition**: Questions from definition patterns
- **example**: Questions from example content

## Customization

You can modify the script to:
- Add new question extraction patterns
- Change question formatting
- Filter questions by source or type
- Add tags or categories

## Example Output

Based on your markdown files, the script will generate questions like:

- **Q**: What is Artificial Intelligence?
- **A**: It's the science and engineering of making intelligent machines.

- **Q**: What is Narrow/Weak AI?
- **A**: AI can perform simple tasks. Example: Apple Siri -> limited to question and answer, and basic calculations.

- **Q**: What is Data Structures?
- **A**: The way you organize the data in the main memory during execution time of a program.

## Tips

1. **Review Generated Questions**: Always review the generated questions before importing to Anki
2. **Edit for Clarity**: Some questions may need manual editing for better clarity
3. **Batch Processing**: You can run the script periodically to update your Anki deck as you add new content
4. **Source Tracking**: Use the source field to organize cards by topic

## Troubleshooting

- **No questions generated**: Check if your markdown files have proper headers or list formatting
- **Encoding issues**: The script uses UTF-8 encoding. If you have encoding issues, check your markdown files
- **Large files**: Very large markdown files may take longer to process 