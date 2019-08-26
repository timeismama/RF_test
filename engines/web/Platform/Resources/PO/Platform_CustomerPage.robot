*** Settings ***
Resource  ../Platform_Common.robot


*** Variables ***
${web_PLATFORM_CUSTOMER_CUSBUTTONCONCEL}  id:cus_button_cancel
${web_PLATFORM_CUSTOMER_CUSBUTTONACCOMPLISH}  id:cus_button_accomplish
${web_PLATFORM_CUSTOMER_CUSBUTTONNEXTSTEP}  id:cus_button_next_step
${web_PLATFORM_CUSTOMER_INPUTSELECT}  id:inputselect
${web_PLATFORM_CUSTOMER_BUTTONRELEVANCE}  id:button_relevance
${web_PLATFORM_CUSTOMER_BUTTONCANCELRELEVANCE}  id:button_cancel_relevance


*** Keywords ***

#   选中左侧树
Click left ztree button
    [Arguments]  ${left_ztree_id}
    click element when is enabled  //a[contains(@id,"${left_ztree_id}")]
    sleep  2s

    #    添加按钮
Click bottom button add
    ${add_button_ele}     Get bottom button    customerPager_left  添加
    click element when is enabled   ${add_button_ele}
    sleep  2s

#    编辑按钮
Click bottom button edit
    ${add_button_ele}     Get bottom button    customerPager_left  编辑
    click element when is enabled   ${add_button_ele}
    sleep  2s

#    删除按钮
Click bottom button deleted
    ${add_button_ele}     Get bottom button    customerPager_left  删除
    click element when is enabled   ${add_button_ele}
    sleep  2s

#     全部删除按钮
Click bottom button deletedAll
    ${add_button_ele}     Get bottom button    customerPager_left  全部删除
    click element when is enabled   ${add_button_ele}
    sleep  2s

#     关联设备按钮
Click bottom button connect device
    ${add_button_ele}     Get bottom button    customerPager_left  关联设备
    click element when is enabled   ${add_button_ele}
    sleep  2s

#     取消关联设备按钮
Click bottom button canale connect device
    ${add_button_ele}     Get bottom button    customerPager_left  取消关联设备
    click element when is enabled   ${add_button_ele}
    sleep  2s

#     仪表位置互换按钮
Click bottom button meter exchange
    ${add_button_ele}     Get bottom button    customerPager_left  仪表位置互换
    click element when is enabled   ${add_button_ele}
    sleep  2s

#    批量更新客户供热状态
Click bottom button edit serviceStatus
    ${add_button_ele}     Get bottom button    customerPager_left  批量更新客户供热状态
    click element when is enabled   ${add_button_ele}
    sleep  2s

#   向导第一步完成按钮
Click one_guide accomplish button
    click element when is enabled  ${web_PLATFORM_CUSTOMER_CUSBUTTONACCOMPLISH}
    sleep  2s

#    向导第一步下一步按钮
Click one_guide next_step button
    click element when is enabled  ${web_PLATFORM_CUSTOMER_CUSBUTTONNEXTSTEP}
    sleep  2s

 #    向导第二步中是否存在值
Click meter list info
    run keyword if

#    关联设备弹框中的关联按钮
Click button relevance
    click element when is enabled  ${web_PLATFORM_CUSTOMER_BUTTONRELEVANCE}
    sleep  2s

#    取消关联设备按钮
Click button cancel relevance
    click element when is enabled  ${web_PLATFORM_CUSTOMER_BUTTONCANCELRELEVANCE}
    sleep  2s
