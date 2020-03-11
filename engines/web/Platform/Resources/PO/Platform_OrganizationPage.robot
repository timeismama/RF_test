*** Settings ***
Resource    ../Platform_Common.robot

*** Variables ***
# 向导第一步组织信息
${WEB_PLATFORM_ORG_NAME}  id:orgName
${WEB_PLATFORM_ORG_PARENTNAME}  id:parentName
${WEB_PLATFORM_ORG_ramark}  class:inputremark
${WEB_PLATFORM_ORG_NEAT_BUTTON}  id:button_accomplish
${WEB_PLATFORM_ORG_CANCEL_BUTTON}  id:button_cancel
${WEB_PLATFORM_ORG_TYPE}  id:orgType
${WEB_PLATFORM_ORG_LONGITUDE}  id:org_longitude
${WEB_PLATFORM_ORG_LATITUDE}  id:org_latitude
${WEB_PLATFORM_ORG_ROOMCOUNT}  id:org_roomCount

#   确认删除按钮
${WEB_PLATFORM_CUSTOMER_DELETEBUTTONCONFIRM}  id:delete_button_confirm


*** Keywords ***
# 组织添加相关

#    添加按钮
Click bottom button add
    ${add_button_ele}     Get bottom button    organizationPager_left  添加
    click element when is enabled   ${add_button_ele}
     sleep  2s

#    编辑按钮
Click bottom button edit
    ${add_button_ele}     Get bottom button    organizationPager_left  编辑
    click element when is enabled   ${add_button_ele}
     sleep  2s

#    删除按钮
Click bottom button deleted
    ${add_button_ele}     Get bottom button    organizationPager_left  删除
    click element when is enabled   ${add_button_ele}
     sleep  2s

#   组织名称
Set org_name
    [Arguments]  ${org_name}
    input text  ${WEB_PLATFORM_ORG_NAME}   ${org_name}

#    组织树选择
Set org_ztree
    [Arguments]  ${orgTreeId}
    click element  ${WEB_PLATFORM_ORG_PARENTNAME}
    click orgtree  ${orgTreeId}

#    组织类型选择
Select org_type
    [Arguments]  ${orgTypeId}
    select from list by index   ${WEB_PLATFORM_ORG_TYPE}   ${orgTypeId}

#  备注
Set org_ramark
   [Arguments]  ${org_ramark}
   input text  ${WEB_PLATFORM_ORG_ramark}   ${org_ramark}

#    添加组织向导第一步
Add organization first step
    [Arguments]  ${org_name}  ${org_TypeId}  ${org_ramark}
    Set org_name  ${org_name}
    Select org_type  ${org_TypeId}
    Set org_ramark  ${org_ramark}

#   输入经纬度
Set org_lon_lat
    [Arguments]  ${longitude}  ${latitude}
    input text  ${WEB_PLATFORM_ORG_LONGITUDE}  ${longitude}
    input text  ${WEB_PLATFORM_ORG_LATITUDE}  ${latitude}

#   输入户数
Set org_roomCount
    [Arguments]  ${roomCount}
    input text  ${WEB_PLATFORM_ORG_ROOMCOUNT}  ${roomCount}

#   添加组织向导第一步完成按钮
Click element button complete
    click element when is enabled  ${WEB_PLATFORM_ORG_NEAT_BUTTON}

#    验证组织名称是否存在
#Click org_name
#    ${error_org_name}=  get text  //p[@id="warnMsg"]
#    run keyword if   '组织名称已经存在' in $error_org_name   Set org_name  ceshi123

#   添加组织向导第一步下一步按钮
Click element button neat
    click element when is enabled  ${WEB_PLATFORM_CUSTOMER_NEATBUTTON}
    sleep  2s

#    添加组织向导第一步取消按钮
Click element button
    click element when is enabled  ${WEB_PLATFORM_ORG_CANCEL_BUTTON}
    sleep  2s


#    客户信息向导第二步完成按钮
Click button orgComplete
    click element when is enabled  ${WEB_PLATFORM_CUSTOMER_ORGCOMPLETE}
    sleep  2s

#    组织删除
#    点击删除确认按钮
Click next delete confirm button
    click element when is enabled  ${WEB_PLATFORM_CUSTOMER_DELETEBUTTONCONFIRM}
    sleep  2s

#   验证添加组织是否存在
Add organization success
    [Arguments]    ${text}    ${loglevel}=INFO
    Page Should Contain    ${text}    ${loglevel}
