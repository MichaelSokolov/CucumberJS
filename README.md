This is an example of the Cucumber test automation framework.
Created by Michael S for Portnov Computer School.

<!-- ********************************************************************************** -->

This project contains 3 feature files with 4 tests, 9 scenarios, and 28 steps in total.
One test (getQuoteUsername.feature) is failing.
This was done on purpose to demonstrate the capabilities of the report and screenshot.

<!-- ********************************************************************************** -->

How to use:

Download:

1. Download this project from GitHub - click on the green "Code" button and select "Download ZIP"
2. Navigate to the place where the archive was saved on your PC and unzip it.
3. Open the unzipped folder in VS Code.
4. Open a terminal and run `npm install`, to install all dependencies.

How to run tests:

1. Type `npm run test` in the terminal and press Enter to run the tests.
2. Type `npm run report` in the terminal and press Enter to open an HTML report after the tests execution.

<!-- ********************************************************************************** -->

All the tests are running in parallel, using 3 chrome browser windows.
To change this - edit parameters in the `test:` string in the package.json file.

To execute tests from specific feature files run:
`npx cucumber-js test --tags @email`
Replace `@email` with the one you need. Check the tag names in the .feature files.
