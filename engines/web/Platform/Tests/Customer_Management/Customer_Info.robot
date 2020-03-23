

*** Settings ***
Resource  ../../PlatformShare.robot

Suite Setup  Start Platform with default user account
Suite Teardown  close browser

*** Variables ***
${cus_leftTree}  customerOrgTree_2_a
${cus_customerError}  *客户编号不能为空
${cus_customerExist}  该组织已经关联客户
${cus_customerNumber}  客户001
@{cus_list}  kh002  002客户  1  1  2.6  450  210  5  15165021524  15241@125.com  test
${index}  30
${cus_customerMeterList}  jqg_connectMeterGrid_0
${cus_customerList_one}  jqg_customerGrid_0
${cus_customerList_two}  jqg_customerGrid_1
${cus_orgTreeId}  CustomerEditOrgTree_3_a

*** Test Cases ***
IP-6020: add cuatomer name is null
    Given User is in customer info page
    When Add cuatomer name is null
    Then Platform_CustomerPage.Add customer success  ${cus_customerError}

IP-6027: add customer nature as business
    Given User is in customer info page
    When Add customer nature as business
    Then Edit customer success  ${cus_customerNumber}
    [Teardown]  Delete customer

IP-6028: add customer heating is empty
    Given User is in customer info page
    When Add customer heating  0
    Then Edit customer success  ${cus_customerNumber}
    [Teardown]  Delete customer

IP-6041: add customer heating is stop
    Given User is in customer info page
    When Add customer heating  2
    Then Edit customer success  ${cus_customerNumber}
    [Teardown]  Delete customer

IP-6043: add customer
    Given User is in customer info page
    When Add customer

IP-6050: add customer and meter
    Given User is in customer info page
    When Add customer and meter
    Then Add customer and meter success
    [Teardown]  Delete customer and meter

IP-6102: add ifferent organization customer
    Given User is in customer info page
    When Add different organization customer
    Then Edit customer success  ${cus_customerNumber}
    [Teardown]  Delete customer

IP-6172: add customer additinal field
    Given User is in customer info page
    When Add customer additinal field
    Then Edit customer success  ${cus_customerNumber}
    [Teardown]  Delete customer

IP-6048: edit different organization customer
    Given User is in customer info page
    When Edit different organization customer
    Then Edit customer success  ${cus_customerNumber}
    [Teardown]  Delete customer

IP-6049: edit customer
    Given User is in customer info page
    When Edit customer
    Then Edit customer success  kh002--xx
    [Teardown]  Delete customer

IP-6173: edit customer additinal field
    Given User is in customer info page
    When Edit customer additinal field
    Then Edit customer success  ${cus_customerNumber}
    [Teardown]  Delete customer

IP-6053: delete customer
    Given User is in customer info page
    When Delete one customer

IP-6054: deleteAll customer
    Given User is in customer info page
    When DeleteAll customer

IP-6056: customer connect device
    Given User is in customer info page
    When Customer connect device
    Then Add customer and meter success

IP-6058: cancel connect device
    Given User is in customer info page
    When Customer cancel connect device

IP-6060: meter exchange
    Given User is in customer info page
    When Customer meter exchange

IP-6063:customer edit serviceStatus
    Given User is in customer info page
    When Customer edit serviceStatus
    Then Platform_CustomerPage.Edit customer heating state success  停热

*** Keywords ***
User is in customer info page
    Platform_TopMenu.Get into customer page
    wait for loading page

#    客户编号为空
Add cuatomer name is null
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Platform_CustomerPage.Click bottom button add
    Platform_CustomerPage.Click one_guide next_step button

#    添加客户性质为：非居民 business
Add customer nature as business
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Platform_CustomerPage.Click bottom button add
    Set cus_num  ${cus_customerNumber}
    Set cus_cuNature  1
    Platform_CustomerPage.Click one_guide next_step button
    Platform_CustomerPage.Click one_guide accomplish button

#    添加不同供热状态
Add customer heating
    [Arguments]  ${serviceStatus}
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Platform_CustomerPage.Click bottom button add
    Set cus_num  ${cus_customerNumber}
    Set cus_serviceStatus  ${serviceStatus}
    Platform_CustomerPage.Click one_guide next_step button
    Platform_CustomerPage.Click one_guide accomplish button

#    添加客户
Add customer
#    选中左侧树
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Platform_CustomerPage.Click bottom button add
    Set cus_info  @{cus_list}[0]  @{cus_list}[1]  @{cus_list}[2]  @{cus_list}[3]  @{cus_list}[4]  @{cus_list}[5]  @{cus_list}[6]  @{cus_list}[7]  @{cus_list}[8]  @{cus_list}[9]  @{cus_list}[10]
    Platform_CustomerPage.Click one_guide next_step button
    Platform_CustomerPage.Click one_guide accomplish button

#    添加客户与关联设备
Add customer and meter
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Platform_CustomerPage.Click bottom button add
    Set cus_num  ${cus_customerNumber}
    Platform_CustomerPage.Click one_guide next_step button
    wait for loading page
    Platform_CustomerPage.Click one_guide next_step button
    [Documentation]  选择一条记录
    Select list one row  ${cus_customerMeterList}
    Platform_CustomerPage.Click one_guide accomplish button

#   添加不同组织的客户
Add different organization customer
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Platform_CustomerPage.Click bottom button add
    Set cus_num  ${cus_customerNumber}
    Click orgTree  ${cus_orgTreeId}
    Platform_CustomerPage.Click one_guide next_step button
    Platform_CustomerPage.Click one_guide accomplish button

#    添加附加属性
Add customer additinal field
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Platform_CustomerPage.Click bottom button add
    Set cus_num  ${cus_customerNumber}
    Platform_CustomerPage.Click one_guide next_step button
    Set cus_additinalFieldName  费用数据
    Set cus_additinalFieldValue  123.456
    Click image add button
    Platform_CustomerPage.Click one_guide accomplish button

#    编辑客户
Edit customer
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Select list one row  ${cus_customerList_one}
    Platform_CustomerPage.Click bottom button edit
    wait for loading page
    Set cus_info  @{cus_list}[0]  @{cus_list}[1]  @{cus_list}[2]  @{cus_list}[3]  @{cus_list}[4]  @{cus_list}[5]  @{cus_list}[6]  @{cus_list}[7]  @{cus_list}[8]  @{cus_list}[9]  @{cus_list}[10]
    Platform_CustomerPage.Click one_guide next_step button
    Platform_CustomerPage.Click one_guide accomplish button

#    编辑客户为其他组织
Edit different organization customer
    Add customer nature as business
    Select list one row  ${cus_customerList_one}
    Platform_CustomerPage.Click bottom button edit
    Click orgTree  ${cus_orgTreeId}
    Platform_CustomerPage.Click one_guide next_step button
    Platform_CustomerPage.Click one_guide accomplish button

#    编辑附加属性的客户
Edit customer additinal field
    Add customer nature as business
    Select list one row  ${cus_customerList_one}
    Platform_CustomerPage.Click bottom button edit
    Platform_CustomerPage.Click one_guide next_step button
    Set cus_additinalFieldName  费用数据
    Set cus_additinalFieldValue  123.456
    Click image add button
    Platform_CustomerPage.Click one_guide accomplish button

#    单个客户删除
Delete one customer
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Delete customer

#    删除客户
Delete customer
    Select list one row  ${cus_customerList_one}
    Platform_CustomerPage.Click bottom button deleted
    Set deletde reason  3
    Click delete confirm button

#    全部删除
DeleteAll customer
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Platform_CustomerPage.Click bottom button deletedAll
    Set deletde reason  2
    Click delete confirm button

#    关联设备
Customer connect device
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Select list one row  ${cus_customerList_one}
    Platform_CustomerPage.Click bottom button connect device
#    选中列表中某一行
    Select list one row  ${cus_customerMeterList}
    Platform_CustomerPage.Click button relevance
    Platform_CustomerPage.Click button cancel relevance

#    取消关联仪表
Customer cancel connect device
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Select list one row  ${cus_customerList_one}
    Platform_CustomerPage.Click bottom button canale connect device
#    选中列表中某一行
    Select list one row  ${cus_customerMeterList}
    Platform_CustomerPage.Click button cancel connect device
    Click button_confirm
    Platform_CustomerPage.Click button cancel relevance

#   仪表位置互换
Customer meter exchange
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Select list one row  ${cus_customerList_one}
    Select list one row  ${cus_customerList_two}
    Platform_CustomerPage.Click bottom button meter exchange
    Click button_confirm

#    批量更新客户供热状态
Customer edit serviceStatus
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    Select list one row  ${cus_customerList_one}
    Select list one row  ${cus_customerList_two}
    Platform_CustomerPage.Click bottom button edit serviceStatus
    Platform_CustomerPage.Select customer heating state  1
    Platform_CustomerPage.Click customer heating state button
    wait for loading page

#    编辑客户成功
Edit customer success
    [Arguments]  ${edit_customerNumber}
    wait for loading page
    Platform_CustomerPage.Add customer success  ${edit_customerNumber}

#    添加客户跟关联仪表成功
Add customer and meter success
    Platform_TopMenu.Get into meter page
    wait for loading page
    Platform_Common.Select unGroup left tree button  123
    ${table_num}   Get Matching Xpath Count  //table[@id="meterGrid"]
    run keyword if  '${table_num}'=='1'  User is in customer info page

#   删除操作
Delete customer and meter
    Platform_CustomerPage.Click left ztree button  ${cus_leftTree}
    delete customer

