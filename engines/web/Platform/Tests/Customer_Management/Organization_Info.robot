#-*- coding: utf-8 -*-

*** Settings ***
Resource  ../../PlatformShare.robot

Suite Setup  Start Platform with default user account
Suite Teardown  close browser

*** Variables ***

*** Test Cases ***
IP-xxx : Add organization
#   添加组织
    Given User is in organization info page
    Then add organization
    sleep  3s
#    编辑组织
    Then edit organization
    sleep  3s
#    删除组织
    Then deleted organization


*** Keywords ***
User is in organization info page
    sleep  2s
    Platform_TopMenu.Get into organization page

add organization
    wait for loading page
    Platform_OrganizationPage.Click bottom button add
#    向导第一步
    Platform_OrganizationPage.Set org_name  zdh测试
#    Platform_OrganizationPage.Set org_ztree
    Platform_OrganizationPage.Set org_ramark  1352624
    Platform_OrganizationPage.click element button neat
    sleep  2s
#    向导第二步
    Platform_OrganizationPage.Set cus_info
    Platform_OrganizationPage.Click button orgComplete

#    编辑组织信息
edit organization
    wait for loading page
#    向导第一步
    Platform_OrganizationPage.Select list edit_org_info
    Platform_OrganizationPage.Click bottom button edit
    Platform_OrganizationPage.Click button_confirm
    Platform_OrganizationPage.Set org_name  zdh测试修改
#    Platform_OrganizationPage.Set org_ztree
    Platform_OrganizationPage.Set org_ramark  testtest
    Platform_OrganizationPage.click element button neat
#    向导第二步
    Platform_OrganizationPage.Set cus_info
    Platform_OrganizationPage.Click button orgComplete

#    删除组织
deleted organization
    wait for loading page
    Platform_OrganizationPage.Select list deleted_org_info
    Platform_OrganizationPage.Click bottom button deleted
    Platform_OrganizationPage.Set deletde reason  1
    Platform_OrganizationPage.Click del_button_confirm

