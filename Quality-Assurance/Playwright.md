# Installation
- npm init playwright@latest

<br>
<hr>

# Test Execution CLI
- npx playwright test
- npx playwright show-report
<br>

## Specify browser
- npx playwright test --project=chromium --headed


## Specify what test file
- npx playwright test example.spec.ts --project=chromium

## Specify what test block
- npx playwright test -g "has title" 

## Skip a test 
- test.skip('has title') .... 


## Only one test
- test.only('has title') ... 

<br>
<hr>

# Test Execution with UI

