*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Keywords ***
Open Browser To Login Page
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    Firefox
    Maximize Browser Window

Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    name=username    timeout=15s
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Button    xpath=//button[@type='submit']

Wait And Click Element
    [Arguments]    ${path}
    Wait Until Element Is Visible    ${path}    timeout=15s
    Click Element    ${path}

Wait And Click Button
    [Arguments]    ${path}
    Wait Until Element Is Visible    ${path}    timeout=15s
    Click Button    ${path}

Logout
    Wait And Click Element    xpath=/html/body/div/div[1]/div[1]/header/div[1]/div[2]/ul
    Wait And Click Element    xpath=/html/body/div/div[1]/div[1]/header/div[1]/div[2]/ul/li/ul/li[4]/a

Verify Logged Out
    ${url}    Get Location
    Should Be Equal    ${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

    Close Browser