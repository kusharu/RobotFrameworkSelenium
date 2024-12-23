*** Settings ***
Documentation    To work with data driven test cases-Suite level documentation in Test Cases folder
Library    SeleniumLibrary
Library     Collections


# Every folder is a suite by itself - TestCases -     Go to the path C:\Users\kaush\OneDrive\Desktop\JenkinsProjectSeleniun\ and fire robot -o Output/output.xml  -r Output/report.html -l Output/log.html TestCases
Suite Setup   Before Suite         # Will run before the suite
Suite Teardown    After Suite       # Will run after the suite

*** Variables ***


*** Keywords ***
Before Suite
    log to console    Before Suite Runs- Test Cases Folder


After Suite
    log to console    After Suite Runs- Test Cases Folder