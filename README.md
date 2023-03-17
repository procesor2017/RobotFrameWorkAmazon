# Test Mobile Automatization

## Basics
Python world: Robot Framework with Appium
JS world: WebdriverIO with Appium

## How to Run
GGet to folder for JavaScript or Robot  Framework and use this command:

RobotFramework:
```
robot test/test.robot
```

WebdriverIO:
```
npm run wdio
```

robot --listener robotframework_reportportal.listener \
--variable RP_UUID:"7b7daff4-a962-4751-bb1b-fdeb04e91e0a" \
--variable RP_ENDPOINT:"http://167.235.231.123:8080" \
--variable RP_LAUNCH:"superadmin_TEST_EXAMPLE" \
--variable RP_PROJECT:"tesena" \
test/test.robot