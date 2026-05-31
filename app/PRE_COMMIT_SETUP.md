# Pre-commit Hook Setup

This project uses Biome for code formatting and linting with a pre-commit hook to ensure code quality.

## Setup

The pre-commit hook is automatically set up when you run:

```bash
npm install
```

## How it works

1. **Husky**: Manages git hooks
2. **Biome**: Handles code formatting and linting
3. **Pre-commit hook**: Runs `npm run pre-commit` before each commit

## Commands

- `npm run pre-commit`: Run Biome check and format (used by git hook)
- `npm run check`: Run Biome check and format
- `npm run format`: Run Biome format only

## What happens on commit

When you commit, the pre-commit hook will:

1. Run Biome check and format on all files
2. If issues are found, the commit will be blocked
3. You'll need to fix the issues and try committing again

## Manual fixes

If the pre-commit hook blocks your commit:

1. Run `npm run check` to see what needs to be fixed
2. Fix the issues manually
3. Run `npm run format` to auto-fix formatting issues
4. Try committing again

## Configuration

- Biome configuration: `biome.json`
- Husky hooks: `.husky/pre-commit`
- Git hooks: `.git/hooks/pre-commit` (fallback)

## Troubleshooting

If the pre-commit hook isn't working:

1. Make sure husky is installed: `npm install`
2. Reinstall husky: `npx husky install`
3. Check hook permissions: `ls -la .husky/pre-commit`
