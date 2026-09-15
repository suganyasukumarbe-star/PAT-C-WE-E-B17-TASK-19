*** Settings ***
Documentation     Reusable keywords and configuration for the application under test.
Library           SeleniumLibrary

*** Variables ***
${URL}            https://robotsparebinindustries.com
${BROWSER}        chrome
# Update these selectors with actual application locators once inspected
${USERNAME_FIELD}    id=username
${PASSWORD_FIELD}    id=password
${LOGIN_BUTTON}      css=button[type='submit']
${LANDING_PAGE_ELEMENT}    id=dashboard  # Specific element verifying a successful login
${LOGOUT_BUTTON}     id=logout

*** Keywords ***
Open Browser To Application
    [Documentation]    Opens the designated browser and navigates to the application URL.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5 seconds

Login To Application
    [Arguments]    ${username}    ${password}
    [Documentation]    Inputs the user credentials and submits the login form.
    Input Text        ${USERNAME_FIELD}    ${username}
    Input Text        ${PASSWORD_FIELD}    ${password}
    Click Button      ${LOGIN_BUTTON}

Verify Login Success
    [Documentation]    Checks for the presence of a specific element to confirm successful login.
    Wait Until Element Is Visible    ${LANDING_PAGE_ELEMENT}    timeout=10s

Logout Of Application
    [Documentation]    Clicks the logout button and verifies exit from the session.
    Click Element     ${LOGOUT_BUTTON}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=5s
    Close Browser
