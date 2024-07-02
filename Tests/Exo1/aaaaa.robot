*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://opensource-demo.orangehrmlive.com
${BROWSER}        Firefox
${USER_ROLE}      ESS
${STATUS}         Enabled
${EMPLOYEE_NAME}  John Doe
${USERNAME}       Robotframework
${PASSWORD}       secure password

*** Test Cases ***
User Management (Selenium) Robot Test
    Open Browser To Login Page
    Login With Credentials    Admin    admin123
    Navigate To Admin Page
    Add New User    ${USER_ROLE}    ${STATUS}    ${EMPLOYEE_NAME}    ${USERNAME}    ${PASSWORD}
    Search User    ${USERNAME}
    Modify User    ${USERNAME}    ESS    Disabled
    Delete User    ${USERNAME}
    Logout
    Verify Logged Out

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${BASE_URL}/web/index.php/auth/login    ${BROWSER}
    Maximize Browser Window

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Button    xpath=//button[@type='submit']

Navigate To Admin Page
    # Localiser l'élément "Admin" avec un XPath plus générique
    Wait Until Element Is Visible    xpath=//span[text()='Admin']    timeout=10s
    Click Element    xpath=//span[text()='Admin']/ancestor::a

Add New User
    [Arguments]    ${role}    ${status}    ${employee_name}    ${username}    ${password}
    Click Button    xpath=//button[contains(text(),'Add')]
    Select From List By Label    xpath=//label[text()='User Role']/following::div[1]//select    ${role}
    Select From List By Label    xpath=//label[text()='Status']/following::div[1]//select    ${status}
    Input Text    xpath=//label[text()='Employee Name']/following::input    ${employee_name}
    Input Text    xpath=//label[text()='Username']/following::input    ${username}
    Input Text    xpath=//label[text()='Password']/following::input    ${password}
    Input Text    xpath=//label[text()='Confirm Password']/following::input    ${password}
    Click Button    xpath=//button[contains(text(),'Save')]

Search User
    [Arguments]    ${username}
    Input Text    xpath=//label[text()='Username']/following::input[1]    ${username}
    Click Button    xpath=//button[contains(text(),'Search')]

Modify User
    [Arguments]    ${username}    ${new_role}    ${new_status}
    Click Element    xpath=//a[contains(text(),${username})]
    Select From List By Label    xpath=//label[text()='User Role']/following::div[1]//select    ${new_role}
    Select From List By Label    xpath=//label[text()='Status']/following::div[1]//select    ${new_status}
    Click Button    xpath=//button[contains(text(),'Save')]

Delete User
    [Arguments]    ${username}
    Click Element    xpath=//a[contains(text(),${username})]/parent::td/preceding-sibling::td//input[@type='checkbox']
    Click Button    xpath=//button[contains(text(),'Delete')]
    Click Button    xpath=//button[contains(text(),'Ok')]

Logout
    Click Element    xpath=//a[@href='/web/index.php/auth/logout']

Verify Logged Out
    Wait Until Element Is Visible    xpath=//input[@name='username']
