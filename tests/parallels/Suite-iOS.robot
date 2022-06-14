*** Settings ***
Library    SeleniumLibrary
Resource    ../common/KeywordsFile.robot

*** Variables ***
&{CAPS}      name=parallel_ios  build=browserstack-robot-framework  device=iPhone 12   os_version=14
${WEBSITE_URL}=     https://bstackdemo.com

*** Test Cases ***
Bstack parallel session on iOS
    Open Session    ${CAPS}     ${WEBSITE_URL}
    Add Implicit Wait
    Click on Sign In
    Enter Credentials   demouser    testingisfun99
    Click on Login
    Verify username     demouser
    Close Session
