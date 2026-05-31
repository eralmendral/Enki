import type React from 'react';
import { useCallback, useEffect, useRef, useState } from 'react';
import './TypingTest.css';

// Common words for the typing test
const COMMON_WORDS = [
  'the',
  'be',
  'to',
  'of',
  'and',
  'a',
  'in',
  'that',
  'have',
  'I',
  'it',
  'for',
  'not',
  'on',
  'with',
  'he',
  'as',
  'you',
  'do',
  'at',
  'this',
  'but',
  'his',
  'by',
  'from',
  'they',
  'we',
  'say',
  'her',
  'she',
  'or',
  'an',
  'will',
  'my',
  'one',
  'all',
  'would',
  'there',
  'their',
  'what',
  'so',
  'up',
  'out',
  'if',
  'about',
  'who',
  'get',
  'which',
  'go',
  'me',
  'when',
  'make',
  'can',
  'like',
  'time',
  'no',
  'just',
  'him',
  'know',
  'take',
  'people',
  'into',
  'year',
  'your',
  'good',
  'some',
  'could',
  'them',
  'see',
  'other',
  'than',
  'then',
  'now',
  'look',
  'only',
  'come',
  'its',
  'over',
  'think',
  'also',
  'back',
  'after',
  'use',
  'two',
  'how',
  'our',
  'work',
  'first',
  'well',
  'way',
  'even',
  'new',
  'want',
  'because',
  'any',
  'these',
  'give',
  'day',
  'most',
  'us',
];

const TEST_DURATION = 10; // seconds

interface TestStats {
  wpm: number;
  accuracy: number;
  correctChars: number;
  incorrectChars: number;
  correctWords: number;
  totalWords: number;
}

interface WordItem {
  id: string;
  word: string;
}

const TypingTest: React.FC = () => {
  // Game state
  const [timeLeft, setTimeLeft] = useState(TEST_DURATION);
  const [isActive, setIsActive] = useState(false);
  const [isFinished, setIsFinished] = useState(false);
  const [wordList, setWordList] = useState<WordItem[]>([]);

  // Input state
  const [userInput, setUserInput] = useState('');
  const [currentWordIndex, setCurrentWordIndex] = useState(0);
  const [wordHistory, setWordHistory] = useState<boolean[]>([]); // true if correct, false if incorrect

  // Stats state
  const [correctChars, setCorrectChars] = useState(0);
  const [incorrectChars, setIncorrectChars] = useState(0);

  const inputRef = useRef<HTMLInputElement>(null);
  const wordDisplayRef = useRef<HTMLButtonElement>(null);

  // Initialize randomized word list
  const generateWords = useCallback(() => {
    const words: WordItem[] = [];
    for (let i = 0; i < 200; i++) {
      const randomIndex = Math.floor(Math.random() * COMMON_WORDS.length);
      words.push({
        id: crypto.randomUUID(),
        word: COMMON_WORDS[randomIndex],
      });
    }
    setWordList(words);
  }, []);

  // Initial setup
  useEffect(() => {
    generateWords();
  }, [generateWords]);

  const finishTest = useCallback(() => {
    setIsActive(false);
    setIsFinished(true);
  }, []);

  // Timer logic
  useEffect(() => {
    let interval: ReturnType<typeof setInterval> | null = null;

    if (isActive && timeLeft > 0) {
      interval = setInterval(() => {
        setTimeLeft((prev) => prev - 1);
      }, 1000);
    } else if (timeLeft === 0) {
      finishTest();
    }

    return () => {
      if (interval) clearInterval(interval);
    };
  }, [isActive, timeLeft, finishTest]);

  // Maintain focus on hidden input
  useEffect(() => {
    if (!isFinished && inputRef.current) {
      inputRef.current.focus();
    }
  }, [isFinished]);

  // Scroll active word into view
  useEffect(() => {
    if (!wordDisplayRef.current) return;

    // Find the active word element
    const activeWordElement = wordDisplayRef.current.children[
      currentWordIndex
    ] as HTMLElement;

    if (activeWordElement) {
      const container = wordDisplayRef.current;
      const wordTop = activeWordElement.offsetTop;
      const wordHeight = activeWordElement.offsetHeight;
      const containerHeight = container.clientHeight;

      // Calculate target scroll position to center the word
      const targetScroll = wordTop - containerHeight / 2 + wordHeight / 2;

      container.scrollTo({
        top: Math.max(0, targetScroll),
        behavior: 'smooth',
      });
    }
  }, [currentWordIndex]);

  const startTest = () => {
    setIsActive(true);
    setIsFinished(false);
    if (inputRef.current) inputRef.current.focus();
  };

  const resetTest = () => {
    setIsActive(false);
    setIsFinished(false);
    setTimeLeft(TEST_DURATION);
    setUserInput('');
    setCurrentWordIndex(0);
    setWordHistory([]);
    setCorrectChars(0);
    setIncorrectChars(0);
    generateWords();
    // Focus input after reset
    setTimeout(() => {
      if (inputRef.current) inputRef.current.focus();
    }, 0);
  };

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = e.target.value;

    // Start timer on first keystroke if not active
    if (!isActive && !isFinished) {
      startTest();
    }

    // Check for space (word submission)
    if (value.endsWith(' ')) {
      const typedWord = value.trim();
      const currentWord = wordList[currentWordIndex].word;

      // Determine if word was correct
      const isCorrect = typedWord === currentWord;

      // Update stats
      if (isCorrect) {
        setCorrectChars((prev) => prev + currentWord.length + 1); // +1 for space
      } else {
        setIncorrectChars((prev) => prev + currentWord.length);
      }

      setWordHistory((prev) => [...prev, isCorrect]);
      setCurrentWordIndex((prev) => prev + 1);
      setUserInput('');
    } else {
      setUserInput(value);
    }
  };

  const handleDisplayClick = () => {
    if (inputRef.current) {
      inputRef.current.focus();
    }
  };

  const calculateStats = (): TestStats => {
    const totalWords = wordHistory.length;
    const correctWords = wordHistory.filter(Boolean).length;

    // WPM = (All correct characters / 5) / Time in minutes
    // If time is 0 (test just finished), use TEST_DURATION
    // If active, use elapsed time
    const timeElapsed = TEST_DURATION - timeLeft;
    const timeInMinutes = (timeElapsed === 0 ? 1 : timeElapsed) / 60;

    // Standard WPM formula: (Correct Characters + Spaces) / 5 / Minutes
    const wpm = Math.round(correctChars / 5 / (timeInMinutes || 1 / 60));

    const accuracy =
      totalWords > 0 ? Math.round((correctWords / totalWords) * 100) : 0;

    return {
      wpm,
      accuracy,
      correctChars,
      incorrectChars,
      correctWords,
      totalWords,
    };
  };

  const stats = calculateStats();

  return (
    <div className="typing-test-container">
      <div className="stats-bar">
        <div className={`timer ${timeLeft <= 10 ? 'warning' : ''}`}>
          Time: {timeLeft}s
        </div>
        <div className="wpm-display">WPM: {isActive ? stats.wpm : '0'}</div>
      </div>

      {!isFinished ? (
        <>
          <button
            type="button"
            className="word-display"
            onClick={handleDisplayClick}
            onKeyDown={() => inputRef.current?.focus()}
            tabIndex={0}
            ref={wordDisplayRef}
          >
            {wordList.map((wordObj, index) => {
              const word = wordObj.word;

              let wordClasses = 'word';
              let renderedContent: React.ReactNode = word;

              if (index === currentWordIndex) {
                wordClasses += ' current';
                // Render characters with cursor logic
                const chars = word.split('');
                renderedContent = (
                  <>
                    {chars.map((char, charIndex) => {
                      let charClass = 'char';
                      let showCaret = false;

                      if (charIndex < userInput.length) {
                        if (userInput[charIndex] === char) {
                          charClass += ' correct';
                        } else {
                          charClass += ' incorrect';
                        }
                      }

                      if (charIndex === userInput.length) {
                        showCaret = true;
                      }

                      return (
                        <span
                          key={`${wordObj.id}-${charIndex}`}
                          className={charClass}
                        >
                          {showCaret && <span className="caret"></span>}
                          {char}
                        </span>
                      );
                    })}
                    {/* Handle cursor at the end of the word */}
                    {userInput.length === word.length && (
                      <span className="caret-end"></span>
                    )}
                    {/* Handle extra characters typed beyond word length */}
                    {userInput.length > word.length &&
                      userInput
                        .slice(word.length)
                        .split('')
                        .map((extraChar, i) => (
                          <span
                            key={`extra-${wordObj.id}-${i}`}
                            className="char extra incorrect"
                          >
                            {i === userInput.length - word.length - 1 && (
                              <span className="caret-end"></span>
                            )}
                            {/* Simplified extra char caret logic: just show at end usually? 
                                            Actually, above caret logic handles up to word length. 
                                            For extras, we need to show them. Cursor should follow.
                                        */}
                            {extraChar}
                          </span>
                        ))}
                    {/* If cursor is way past, show caret at very end */}
                    {userInput.length > word.length && (
                      <span className="caret-end"></span>
                    )}
                  </>
                );
              } else if (index < currentWordIndex) {
                wordClasses += wordHistory[index] ? ' correct' : ' incorrect';
              }

              return (
                <span key={wordObj.id} className={wordClasses}>
                  {renderedContent}
                </span>
              );
            })}
          </button>

          <div className="input-area">
            <input
              ref={inputRef}
              type="text"
              className="typing-input"
              value={userInput}
              onChange={handleInputChange}
              disabled={isFinished}
              autoComplete="off"
              autoCorrect="off"
              autoCapitalize="off"
              spellCheck="false"
            />
          </div>

          <div style={{ marginTop: '1rem', textAlign: 'center' }}>
            <button
              type="button"
              onClick={resetTest}
              className="restart-btn"
              style={{
                padding: '0.5rem 1rem',
                fontSize: '1rem',
                backgroundColor: '#9e9e9e',
              }}
            >
              Restart
            </button>
          </div>
        </>
      ) : (
        <div className="results-overlay">
          <h2>Test Complete!</h2>
          <div className="stat-grid">
            <div className="stat-item">
              <span className="stat-label">WPM</span>
              <span className="stat-value">{stats.wpm}</span>
            </div>
            <div className="stat-item">
              <span className="stat-label">Accuracy</span>
              <span className="stat-value">{stats.accuracy}%</span>
            </div>
            <div className="stat-item">
              <span className="stat-label">Correct Words</span>
              <span className="stat-value">{stats.correctWords}</span>
            </div>
            <div className="stat-item">
              <span className="stat-label">Total Words</span>
              <span className="stat-value">{stats.totalWords}</span>
            </div>
          </div>
          <button type="button" className="restart-btn" onClick={resetTest}>
            Try Again
          </button>
        </div>
      )}
    </div>
  );
};

export default TypingTest;
