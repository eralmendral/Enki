## Continuous Integration
Continuous Integration (CI) is where developers regularly push code changes into a central repository, and by doing so, automated builds and tests are automatically run.

Those tests can include unit tests, integration tests, styling checks, linting checks, security checks or any other type of automated test. If any of the tests fail, the build is considered "broken" and the developer is notified so they can fix it


<br>

## Workflows
A workflow is triggered when an event occurs in your GitHub repository. For example, we'll trigger our "tests" workflow when we open a pull request into the main branch.


## Jobs
A workflow is made up of one or more jobs. A job is a set of steps that run on the same runner, which is just a virtual machine that runs your job on GitHub's servers.

<br>

## Steps
Steps
A job is made up of one or more steps. A step is a single task that can run commands, a script, or an action. For example, the steps of a job might include:

Checking out the code
Installing dependencies
Running tests
In our case, the "Tests" job contains 3 steps:

Check out the code
Set up Node
Force failure of the CI job

<br>
<hr>
<br>

A good CI pipeline typically includes:

Unit tests
Integration tests
Styling checks
Linting checks
Security checks
Any other kind of automated test
