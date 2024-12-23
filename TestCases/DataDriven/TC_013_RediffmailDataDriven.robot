*** Settings ***
Documentation    To work with data driven test cases    -Suite level documentation in robot file
Library    SeleniumLibrary
Library     Collections
Resource    ../../Resources/RS_013_RediffmailDataDriven.robot
Library     ../../ExternalKeywords/DataDrivenKeywords.py
# Every ROBOT FILE with extension as robot is a SUITE BY ITSELF - Go to the path C:\Users\kaush\OneDrive\Desktop\JenkinsProjectSeleniun\TestCases>DataDriven and then fire robot -o Output/output.xml  -r Output/report.html -l Output/log.html TC_013_RediffmailDataDriven.robot
# Every folder is a suite by itself - DataDriven
Suite Setup   Before Suite         # Will run before the suite
Suite Teardown    After Suite       # Will run after the suite





*** Variables ***

*** Test Cases ***
Data_Driven_Test
    [Documentation]    Working with Data Driven Approach
    [Teardown]    run keyword if test failed    capture page screenshot     Failed_Screen_Data_Driven_{index}.png

    ${MAXROW}=    get max row number    Data
    log to console    Maximum number of row in the excel sheet is ${MAXROW}

    FOR     ${i}    IN RANGE    2   ${MAXROW}+1
    Open Website            https://mail.rediff.com/cgi-bin/login.cgi       chrome    --disable-notifications
    Type in Username    Data    ${i}    1
    Type in Password    Data    ${i}    2
    Click on Sign in Button
    Click on write mail link
    Type on TO field    Data    ${i}    3
    Type on SUBJECT field    Data    ${i}    4
    Move to frame from main page
    Write in compose area    Data    ${i}    5
    Get out from frame to main page
    Click on send button
    Click on Logout
    Close Website
    END

*** Keywords ***
Before Suite
    log to console    Before Suite Runs-robot file


After Suite
    log to console    After Suite Runs-robot file
