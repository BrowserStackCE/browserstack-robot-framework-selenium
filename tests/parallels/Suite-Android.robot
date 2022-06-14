*** Settings ***
Library    SeleniumLibrary
Resource    ../common/KeywordsFile.robot

*** Variables ***
&{CAPS}      name=parallel_android  build=browserstack-robot-framework   device=Samsung Galaxy S22  os_version=12
${WEBSITE_URL}=     https://bstackdemo.com

*** Test Cases ***
Bstack parallel session on Android
    Open Session    ${CAPS}     ${WEBSITE_URL}
    Add Implicit Wait
    Click on Sign In
    Enter Credentials   demouser    testingisfun99
    Click on Login
    Verify username     demouser
    Close Session
