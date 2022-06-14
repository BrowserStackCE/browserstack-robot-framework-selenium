*** Settings ***
Library    SeleniumLibrary
Library    mark-test-status.py
Library    manage-local-testing.py

*** Variables ***
${USERNAME}=     %{BROWSERSTACK_USERNAME}
${ACCESSKEY}=    %{BROWSERSTACK_ACCESS_KEY}
${REMOTE_URL}=  https://${USERNAME}:${ACCESSKEY}@hub-cloud.browserstack.com/wd/hub

*** Keywords ***
Open Session
    [Arguments]    ${capabilities}  ${website_url}
    open browser    remote_url=${REMOTE_URL}     desired_capabilities=${capabilities}   url=${website_url}

Close Session
    close browser

Add Implicit Wait
    set selenium implicit wait    3

Mark Test Status
    [Arguments]    ${status}    ${reason}
    TEST STATUS    ${status}   ${reason}

Start Local Testing
    START LOCAL

Stop Local Testing
    STOP LOCAL

Click on Sign In
    click element    id=signin

Enter Credentials
    [Arguments]    ${username}  ${password}
    input text    css=#username input   ${username} \n
    input text    css=#password input   ${password} \n

Click on Login
    click element    id=login-btn

Verify username
    [Arguments]    ${assert_username}
    ${retrived_username}=   get text    css=.username
    run keyword and return if    "${retrived_username}" == "${assert_username}"    mark test status    passed    Username validated!
    run keyword and return      mark test status    failed    Something went wrong!

Verify site content
    ${site_content}=   get text    css=h3
    run keyword and return if    "${site_content}" == "This is a sample localhost website to test Local testing."    mark test status    passed    Site Content validated!
    run keyword and return      mark test status    failed    Something went wrong!