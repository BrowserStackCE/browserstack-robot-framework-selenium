*** Settings ***
Library    SeleniumLibrary
Resource    common/KeywordsFile.robot

*** Variables ***
&{CAPS}      name=bstack_test  build=browserstack-robot-framework   browser=Edge     browser_version=latest  os=Windows  os_version=10
${WEBSITE_URL}=     https://bstackdemo.com

*** Test Cases ***
Bstack Website Login
    Open Session    ${CAPS}     ${WEBSITE_URL}
    Add Implicit Wait
    Click on Sign In
    Enter Credentials   demouser    testingisfun99
    Click on Login
    Verify username     demouser
    Close Session

