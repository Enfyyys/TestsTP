*** Settings ***
Library           SeleniumLibrary
Library           Collections
Resource          ../Keywords.robot

*** Variables ***
${USER_ROLE}      ESS
${STATUS}         Enabled
${EMPLOYEE_NAME}  a
${USERNAME}       Robotframework
${PASSWORD}       SecurePassword123*

*** Test Cases ***
User Management (Selenium) Robot Test
    Open Browser To Login Page
    Login With Credentials    Admin    admin123
    Wait And Click Element    xpath=/html/body/div/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a
    Logout
    Verify Logged Out
*** Keywords ***
