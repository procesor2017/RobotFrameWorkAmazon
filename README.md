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
## For Report portal
robot --listener robotframework_reportportal.listener \
--variable RP_UUID:"<uuid>" \
--variable RP_ENDPOINT:"<end_point>" \
--variable RP_LAUNCH:"<launch>" \
--variable RP_PROJECT:"<project>" \
test/test.robot