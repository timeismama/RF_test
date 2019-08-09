*** Settings ***
Resource   ../PlatformShare.robot

Suite Teardown  close browser

*** Variables ***


*** Test Cases ***
Log in platform
    Start Platform with default user account

*** Keywords ***
