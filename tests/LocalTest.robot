*** Settings ***
Library    SeleniumLibrary
Resource   common/KeywordsFile.robot

*** Variables ***
&{CAPS}      name=local_test  build=browserstack-robot-framework   browser=Chrome     browser_version=latest  os=Windows  os_version=10   browserstack.local=true
${WEBSITE_URL}=     http://localhost:3000

*** Test Cases ***
Localhost Website
    Add Implicit Wait
    Start Local Testing
    Open Session    ${CAPS}     ${WEBSITE_URL}
    Verify site content
    Close Session
    Stop Local Testing
