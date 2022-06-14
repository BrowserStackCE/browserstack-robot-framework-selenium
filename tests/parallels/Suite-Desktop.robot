*** Settings ***
Library    SeleniumLibrary
Resource   ../common/KeywordsFile.robot

*** Variables ***
&{CAPS}      name=parallel_chrome  build=browserstack-robot-framework   browser=Chrome     browser_version=latest-1  os=OS X  os_version=Big Sur
${WEBSITE_URL}=     https://bstackdemo.com

*** Test Cases ***
Bstack parallel session - Demouser
    Open Session    ${CAPS}     ${WEBSITE_URL}
    Add Implicit Wait
    Click on Sign In
    Enter Credentials   demouser    testingisfun99
    Click on Login
    Verify username     demouser
    Close Session

Bstack parallel session - Favuser
    Open Session    ${CAPS}     ${WEBSITE_URL}
    Add Implicit Wait
    Click on Sign In
    Enter Credentials   fav_user    testingisfun99
    Click on Login
    Verify username     fav_user
    Close Session

Bstack parallel session - Image not loading user
    Open Session    ${CAPS}     ${WEBSITE_URL}
    Add Implicit Wait
    Click on Sign In
    Enter Credentials   image_not_loading_user    testingisfun99
    Click on Login
    Verify username     image_not_loading_user
    Close Session
