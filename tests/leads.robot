# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Library                         QForce
Resource                        ../resources/keywords.robot
Library                         FakerLibrary
Suite Setup                     Setup Browser
Suite Teardown                  End suite

*** Variables ***


*** Keywords ***


*** Test Cases ***
Entering A Lead
    [Documentation]             This testscript is used for entering a lead within Salesforce.
    [tags]                      lead                        create                      smoke



Modify A Lead With Faker Data
    [Documentation]             This test script serves the purpose of modifying a lead within Salesforce,
    ...                         utilizing the FakerLibrary to generate and manipulate data dynamically.
    [Tags]                      lead                        Modify


Delete lead via API
    [Documentation]             This test script is designed for the deletion of a lead within Salesforce.
    [Tags]                      lead                        delete
    Appstate                    Home
    LaunchApp                   Leads