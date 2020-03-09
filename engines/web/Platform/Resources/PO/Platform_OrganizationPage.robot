*** Settings ***
Resource    ../Platform_Common.robot

*** Variables ***
# 向导第一步组织信息
${WEB_PLATFORM_ORG_NAME}  id:orgName
${WEB_PLATFORM_ORG_PARENTNAME}  id:parentName
${WEB_PLATFORM_ORG_ramark}  class:inputremark
${web_PLATFORM_ORG_NEAT_BUTTON}  id:orgComplete
${web_PLATFORM_ORG_CANCEL_BUTTON}  id:button_cancel

#   确认删除按钮
${web_PLATFORM_CUSTOMER_DELETEBUTTONCONFIRM}  id:delete_button_confirm


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

#  备注
Set org_ramark
   [Arguments]  ${org_ramark}
   input text  ${WEB_PLATFORM_ORG_ramark}   ${org_ramark}

#   向导第一步完成按钮
click element button complete
    click element when is enabled  ${web_PLATFORM_ORG_NEAT_BUTTON}

#    验证组织名称是否存在
#Click org_name
#    ${error_org_name}=  get text  //p[@id="warnMsg"]
#    run keyword if   '组织名称已经存在' in $error_org_name   Set org_name  ceshi123

#   向导第一步下一步按钮
click element button neat
    click element when is enabled  ${web_PLATFORM_CUSTOMER_NEATBUTTON}
    sleep  2s

#    向导第一步取消按钮
click element button
    click element when is enabled  ${web_PLATFORM_ORG_CANCEL_BUTTON}
    sleep  2s

#    客户信息向导第二步完成按钮
Click button orgComplete
    click element when is enabled  ${web_PLATFORM_CUSTOMER_ORGCOMPLETE}
    sleep  2s

#   组织编辑

#    组织删除
#    点击删除确认按钮
Click next delete confirm button
    click element when is enabled  ${web_PLATFORM_CUSTOMER_DELETEBUTTONCONFIRM}
    sleep  2s

#   追加判断
