*** Settings ***
Documentation     Test suite to verify the login functionality of RobotSpareBin Industries.
Resource          ../resources/keywords.resource

*** Test Cases ***
Verify Valid User Login And Logout
    [Documentation]    This test case covers browsing to the app, executing a login,
    ...               validating a successful landing, and securely logging out.
    [Tags]            Regression    Smoke

    # 1. Open the browser and navigate to the application
    Open Browser To Application

    # 2. Input valid credentials and submit the form
    # Note: Replace 'maria' and 'thinslices' with actual valid demo credentials if required
    Login To Application    maria    thinslices

    # 3. Verify that the login is successful by checking a landing page element
    Verify Login Success

    # 4. Log out of the application safely
    Logout Of Application
