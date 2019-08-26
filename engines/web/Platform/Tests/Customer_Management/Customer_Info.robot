

*** Settings ***
Resource  ../../PlatformShare.robot

Suite Setup  Start Platform with default user account
Suite Teardown  close browser

*** Variables ***

*** Test Cases ***
IP-ADD: add customer
    When User is in customer info page
    then add customer

IP-edit edit customer
    When User is in customer info page
    then edit customer

IP-delete delete customer
    then delete customer

IP-deleteAll deleteAll customer
    then deleteAll customer

IP-connectDevice customer connect device
    then customer connect device

IP-customer cancel connect device
    then customer cancel connect device

IP-customer meter exchange
    then customer meter exchange

#IP-TEST test list
#    When User is in customer info page
#    then test list

*** Keywords ***
User is in customer info page
    sleep  2s
    Platform_TopMenu.Get into customer page

#    添加客户
add customer
    wait for loading page
#    选中左侧树
    Platform_CustomerPage.Click left ztree button  customerOrgTree_3_a
    Platform_CustomerPage.Click bottom button add
    Set cus_info  kh002  002客户  1  2  2.6  450  210  5  15165021524  15241@125.com  test
    Platform_CustomerPage.Click one_guide next_step button
#    选中列表中某一行
    Select list one row  jqg_connectMeterGrid_0
    Platform_CustomerPage.Click one_guide accomplish button

#    编辑客户
edit customer
    Platform_CustomerPage.Click left ztree button  customerOrgTree_3_a
#    判断列表是否有值
    Click list is value  customerGrid
    Select list one row  jqg_customerGrid_0
    Platform_CustomerPage.Click bottom button edit
    Set cus_info  kh002--xx  002客户  1  2  2.6  450  210  5  15165021524  15241@125.com  test
    Platform_CustomerPage.Click one_guide accomplish button

#    删除客户
delete customer
    Select list one row  jqg_customerGrid_0
    Platform_CustomerPage.Click bottom button deleted
    Set deletde reason  3
    Click delete confirm button

#    全部删除
deleteAll customer
    Platform_CustomerPage.Click bottom button deletedAll
    Set deletde reason  2
    Click delete confirm button

#    关联设备
customer connect device
    Select list one row  jqg_customerGrid_3
    Platform_CustomerPage.Click bottom button connect device
#    选中列表中某一行
    Select list one row  jqg_connectMeterGrid_0
    Platform_CustomerPage.Click button relevance

#    取消关联仪表
customer cancel connect device
    Select list one row  jqg_customerGrid_3
    Platform_CustomerPage.Click bottom button canale connect device
#    选中列表中某一行
    Select list one row  jqg_connectMeterGrid_0
    Platform_CustomerPage.Click button cancel relevance
    Click button_confirm

#   仪表位置互换
customer meter exchange
    Platform_CustomerPage.Click left ztree button  customerOrgTree_4_a
    Select list one row  jqg_customerGrid_3
    Select list one row  jqg_customerGrid_4
    Platform_CustomerPage.Click bottom button meter exchange
    Click button_confirm

#    批量更新客户供热状态  todo
customer edit serviceStatus
    Platform_CustomerPage.Click left ztree button  customerOrgTree_4_a
    Select list one row  jqg_customerGrid_3
    Platform_CustomerPage.Click bottom button edit serviceStatus






