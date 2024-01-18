# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Library                   QForce
Resource                  ../resources/keywords.robot
Library                   FakerLibrary
Test Setup                Home
Suite Setup               Setup Browser
Suite Teardown            End suite

*** Variables ***


*** Keywords ***


*** Test Cases ***
Entering A Lead
    [Documentation]       This testscript is used for entering a lead within Salesforce.
    [tags]                lead                        create                 smoke
    LaunchApp             Leads
    ClickText             New
    UseModal              On
    VerifyText            New Lead
    PickList              Salutation                  Mr.
    TypeText              First Name                  Hidde
    TypeText              Last Name                   Visser
    TypeText              *Company                    Copado
    PickList              *Lead Status                Working - Contacted
    ClickText             Save                        partial_match=False
    UseModal              Off
    VerifyText            Lead "Mr. Hidde Visser" was created.


Modify A Lead With Faker Data
    [Documentation]       This test script serves the purpose of modifying a lead within Salesforce,
    ...                   utilizing the FakerLibrary to generate and manipulate data dynamically.
    [Tags]                lead                        Modify
    Launch App            Leads
    Click Text            Hidde Visser
    Click Text            Show more actions
    Click Text            Edit                        anchor=Change Owner
    Use Modal             On
    ${first_name}=        FakerLibrary.FirstName
    ${last_name}=         FakerLibrary.LastName
    Type Text             First Name                  ${first_name}
    Type Text             Last Name                   ${last_name}
    Type Text             *Company                    iovio
    Click Text            Save                        partial_match=False
    Use Modal             Off
    Verify Text           Lead "Mr. ${first_name} ${last_name}" was saved.
    Set Suite Variable    ${first_name}
    Set Suite Variable    ${last_name}


Delete lead
    [Documentation]       This test script is designed for the deletion of a lead within Salesforce.
    [Tags]                lead                        delete
    Launch App            Leads
    ClickText             ${first_name} ${last_name}
    ClickText             Show more actions
    ClickText             Delete
    UseModal              On
    VerifyText            Delete Lead
    ClickText             Delete                      partial_match=False
    UseModal              Off
    VerifyText            Lead "${first_name} ${last_name}" was deleted.
