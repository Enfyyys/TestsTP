*** Settings ***
Library           SeleniumLibrary
Library           Collections
Resource          ../Keywords.robot

*** Variables ***
${USER_ROLE}      ESS
${STATUS}         Enabled
${EMPLOYEE_NAME}  a
${USERNAME}       Robotframework123
${PASSWORD}       SecurePassword123*

*** Test Cases ***
User Management (Selenium) Robot Test
    Open Browser To Login Page
    Login With Credentials    Admin    admin123
    Wait And Click Element    xpath=/html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a   
    Add New User    ${USER_ROLE}    ${STATUS}    ${EMPLOYEE_NAME}    ${USERNAME}    ${PASSWORD}
    Search User    ${USERNAME}
    Modify User
    Search User    ${USERNAME}
    Delete User
    Logout
    Verify Logged Out

*** Keywords ***
Add New User
    [Arguments]    ${role}    ${status}    ${employee_name}    ${username}    ${password}
    Wait And Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[1]/button
    
    Wait And Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div
    Wait And Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div[2]/div[2]
    
    Wait Until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[2]/div/div[2]/div/div/input    timeout=15s
    Input Text    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[2]/div/div[2]/div/div/input    ${employeeName}
    Wait And Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[2]/div/div[2]/div/div[2]/div[2]

    Wait And Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[3]/div/div[2]/div/div[1]
    Wait And Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[3]/div/div[2]/div/div[2]/div[2]

    Input Text    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[4]/div/div[2]/input    ${username}

    Input Text    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[1]/div/div[2]/input    ${password}
    Input Text    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[2]/div/div[2]/input    ${password}

    Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[3]/button[2]
    
Search User
    [Arguments]    ${username}
    Wait until Element Is Visible    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input    timeout=15s
    Input Text    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input    ${username}

    Wait And Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]
    
Modify User
    Wait And Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[2]
    
    Wait And Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div
    Wait And Click Element    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div[2]/div[3]

    Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div/form/div[2]/button[2]

Delete User
    Wait And Click Button    xpath=/html/body/div/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[1]

    Wait And Click Button    xpath=/html/body/div/div[3]/div/div/div/div[3]/button[2]

    Sleep    5s
