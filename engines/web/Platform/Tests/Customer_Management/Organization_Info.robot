﻿#-*- coding: utf-8 -*-

*** Settings ***
Resource  ../../PlatformShare.robot

Suite Setup  Start Platform with default user account
Suite Teardown  close browser

*** Variables ***
${org_name}  zd001
@{list}   kh002  001客户  1  2  2.6  450  210  5  15165021524  15241@125.com  test
${index}  12

*** Test Cases ***
IP-xxx : Add organization
#   添加组织
    Given User is in organization info page
    When add organization
    Then add success

IP-edit: edit organization
#    编辑组织
    Then edit organization

IP-deleted: deleted organization
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
    Platform_OrganizationPage.Set org_name  ${org_name}
#    Platform_OrganizationPage.Set org_ztree  orgTableEditOrgTree_2_a
    Platform_OrganizationPage.Set org_ramark  1352624
    Platform_OrganizationPage.click element button neat
#    向导第二步
    Set cus_info  @{list}[0]  @{list}[1]  @{list}[2]  @{list}[3]  @{list}[4]  @{list}[5]  @{list}[6]  @{list}[7]  @{list}[8]  @{list}[9]  @{list}[10]
    Platform_OrganizationPage.Click button orgComplete

add success
    Add cuatomer success  客户@{list}[0]添加成功！
    sleep  2s
    Add cuatomer success  ${org_name}

#    编辑组织信息
edit organization
    wait for loading page
#    向导第一步
#    选中某一行
    Select list one row  jqg_organizationGrid_0
    Platform_OrganizationPage.Click bottom button edit
#    Platform_OrganizationPage.Click button_confirm
    Platform_OrganizationPage.Set org_name  zdh测试修改
#    Platform_OrganizationPage.Set org_ztree  orgTableEditOrgTree_2_a
    Platform_OrganizationPage.Set org_ramark  testtest
    Platform_OrganizationPage.click element button neat
#    向导第二步
    Set cus_info  kh001——xg  001客户  2  1  2.5  350  260  5  13156452152  15241@163.com  test---xxx
    Platform_OrganizationPage.Click button orgComplete

#    删除组织
deleted organization
    wait for loading page
#    选中某一行
    Select list one row  jqg_organizationGrid_1
    Platform_OrganizationPage.Click bottom button deleted
    Set deletde reason  1
    Click delete confirm button
    Platform_OrganizationPage.Click next delete confirm button

