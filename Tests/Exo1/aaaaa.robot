*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://opensource-demo.orangehrmlive.com
${BROWSER}        Firefox
${USER_ROLE}      ESS
${STATUS}         Enabled
${EMPLOYEE_NAME}  a
${USERNAME}       Robotframework
${PASSWORD}       secure password

*** Test Cases ***
User Management (Selenium) Robot Test
    Open Browser To Login Page
    Login With Credentials    Admin    admin123
    Navigate To Admin Page
    Add New User    ${USER_ROLE}    ${STATUS}    ${EMPLOYEE_NAME}    ${USERNAME}    ${PASSWORD}
    Search User    ${USERNAME}
    Modify User
    Delete User    ${USERNAME}
    Logout
    Verify Logged Out

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${BASE_URL}/web/index.php/auth/login    ${BROWSER}
    Maximize Browser Window

Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    name=username    timeout=15s
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Button    xpath=//button[@type='submit']

Navigate To Admin Page
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a    timeout=15s
    Click Element    xpath=/html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a

Add New User
    [Arguments]    ${role}    ${status}    ${employee_name}    ${username}    ${password}
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[1]/button    timeout=15s
    Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[1]/button
    
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div    timeout=15s
    Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div[2]/div[2]    timeout=15s
    Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div[2]/div[2]
    
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[2]/div/div[2]/div/div/input    timeout=15s
    Input Text    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[2]/div/div[2]/div/div/input    ${employeeName}
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[2]/div/div[2]/div/div[2]/div[2]    timeout=15s
    Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[2]/div/div[2]/div/div[2]/div[2]

    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[3]/div/div[2]/div/div[1]    timeout=15s
    Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[3]/div/div[2]/div/div[1]
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[3]/div/div[2]/div/div[2]/div[2]    timeout=15s
    Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[3]/div/div[2]/div/div[2]/div[2]

    Input Text    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[4]/div/div[2]/input    ${username}

    Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[3]/button[2]
    
Search User
    [Arguments]    ${username}
    Wait until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input    timeout=15s
    Input Text    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input    ${username}

    Wait until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]    timeout=15s
    Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]
    
Modify User
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[2]    timeout=15s
    Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[2]
    Input Text    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[4]/div/div[2]/input    ${username}
    
