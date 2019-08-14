*** Settings ***
Resource    ../Platform_Common.robot

*** Variables ***
# 向导第一步组织信息
${WEB_PLATFORM_ORG_NAME}  id:orgName
${WEB_PLATFORM_ORG_PARENTNAME}  id:parentName
${WEB_PLATFORM_ORG_ramark}  class:inputremark
${web_PLATFORM_ORG_NEAT_BUTTON}  id:orgComplete
${web_PLATFORM_ORG_CANCEL_BUTTON}  id:button_cancel

# 向导第二步客户信息
${web_PLATFORM_CUSTOMER_NUMBER}  id:cusNum
${web_PLATFORM_CUSTOMER_NAME}  id:cusName
${web_PLATFORM_CUSTOMER_CUNATURE}  id:cuNature
${web_PLATFORM_CUSTOMER_SERVICESTATUS}  id:serviceStatus
${web_PLATFORM_CUSTOMER_CORRECTIONFACTOR}  id:correctionFactor
${web_PLATFORM_CUSTOMER_FLOORSPACE}  id:floorSpace
${web_PLATFORM_CUSTOMER_SERVICEFLOORAREA}  id:serviceFloorArea
${web_PLATFORM_CUSTOMER_TEL}  id:tel
${web_PLATFORM_CUSTOMER_EMAIL}  id:email
${web_PLATFORM_CUSTOMER_POPULATION}  id:population
${web_PLATFORM_CUSTOMER_REMARK}  id:remark
${web_PLATFORM_CUSTOMER_ORGCOMPLETE}  id:button_accomplish
${web_PLATFORM_CUSTOMER_NEATBUTTON}  id:button_next_step

#   编辑提醒框中按钮
${web_PLATFORM_CUSTOMER_CONFIRMbUTTON}  id:confirm_button_confirm

#   删除弹框的错误原因
${web_PLATFORM_CUSTOMER_DEMOSELECT}  id:demoSelect

#   确认删除按钮
${web_PLATFORM_CUSTOMER_DELBUTTONCONFIM}  id:remove_button_confirm

*** Keywords ***
# 组织添加相关
Get bottom button
    [Arguments]     ${button_title}
    [Return]    //td[@id="organizationPager_left"]/table/tbody/tr/td[@title="${button_title}"]

Click bottom button add
    ${add_button_ele}     Get bottom button    添加
    click element when is enabled   ${add_button_ele}

#   组织名称
Set org_name
    [Arguments]  ${org_name}
    input text  ${WEB_PLATFORM_ORG_NAME}   ${org_name}

#    组织树选择
Set org_ztree
    click element  ${WEB_PLATFORM_ORG_PARENTNAME}
    click element  //a[contains(@id,"orgTableEditOrgTree_2_a")]


#  备注
Set org_ramark
   [Arguments]  ${org_ramark}
   input text  ${WEB_PLATFORM_ORG_ramark}   ${org_ramark}

#   向导第一步完成按钮
click element button complete
    click element when is enabled  ${web_PLATFORM_ORG_NEAT_BUTTON}

#   向导第一步下一步按钮
click element button neat
    click element when is enabled  ${web_PLATFORM_CUSTOMER_NEATBUTTON}
    sleep  2s

#    向导第一步取消按钮
click element button
    click element when is enabled  ${web_PLATFORM_ORG_CANCEL_BUTTON}

#    向导第二步客户信息添加

#   客户编号
Set cus_num
    [Arguments]  ${cusNum}
    input text  ${web_PLATFORM_CUSTOMER_NUMBER}  ${cusNum}

#   客户名称
Set cus_name
   [Arguments]  ${cusName}
    input text  ${web_PLATFORM_CUSTOMER_NAME}  ${cusName}

#   客户性质
Set cus_cuNature
    [Arguments]  ${cuNature}
    select from list by index  ${web_PLATFORM_CUSTOMER_CUNATURE}  ${cuNature}

#   供热状态
Set cus_serviceStatus
    [Arguments]  ${serviceStatus}
    select from list by index  ${web_PLATFORM_CUSTOMER_SERVICESTATUS}  ${serviceStatus}

#    修正系数
Set cus_correctionFactor
    [Arguments]  ${correctionFactor}
    input text  ${web_PLATFORM_CUSTOMER_CORRECTIONFACTOR}  ${correctionFactor}

#    建筑面积
Set cus_floorSpace
    [Arguments]  ${floorSpace}
    input text  ${web_PLATFORM_CUSTOMER_FLOORSPACE}  ${floorSpace}

#    使用面积
Set cus_serviceFloorArea
    [Arguments]  ${serviceFloorArea}
    input text  ${web_PLATFORM_CUSTOMER_SERVICEFLOORAREA}  ${serviceFloorArea}

#    联系方式
Set cus_tel
    [Arguments]  ${tel}
    input text  ${web_PLATFORM_CUSTOMER_TEL}  ${tel}

#    电子邮箱
Set cus_email
    [Arguments]  ${email}
    input text  ${web_PLATFORM_CUSTOMER_EMAIL}  ${email}

#    人口数
Set cus_population
    [Arguments]  ${population}
    input text  ${web_PLATFORM_CUSTOMER_POPULATION}  ${population}

#   备注
Set cus_remark
    [Arguments]  ${remark}
    input text  ${web_PLATFORM_CUSTOMER_REMARK}  ${remark}

#    客户信息相关
Set cus_info
    Set cus_num  zdh002
    Set cus_name  001客户
    Set cus_cuNature  1
    Set cus_serviceStatus  2
    Set cus_correctionfactor  4
    Set cus_floorSpace  356
    Set cus_serviceFloorArea  200
    Set cus_population  5
    Set cus_tel  15245125625
    Set cus_email  15241@163.com
    Set cus_remark  自动化测试test

#    向导第二步完成按钮
Click button orgComplete
    click element when is enabled  ${web_PLATFORM_CUSTOMER_ORGCOMPLETE}
    sleep  5s

#   组织编辑
Click bottom button edit
    ${add_button_ele}     Get bottom button    编辑
    click element when is enabled   ${add_button_ele}

#    选中一行信息
Select list edit_org_info
    click element  //input[contains(@id,"jqg_organizationGrid_0")]
    sleep  2s

Select list deleted_org_info
    click element  //input[contains(@id,"jqg_organizationGrid_1")]
    sleep  2s

#    点击确认编辑按钮
Click button_confirm
    click element when is enabled  ${web_PLATFORM_CUSTOMER_CONFIRMbUTTON}

#    组织删除
#    点击删除按钮
Click bottom button deleted
    ${add_button_ele}     Get bottom button    删除
    click element when is enabled   ${add_button_ele}
    sleep  2s

#    输入删除原因
Set deletde reason
    [Arguments]  ${demoSelect}
    select from list by index  ${web_PLATFORM_CUSTOMER_DEMOSELECT}  ${demoSelect}

#    点击删除确认按钮
Click del_button_confirm
    click element when is enabled  ${web_PLATFORM_CUSTOMER_DELBUTTONCONFIM}
    sleep  5s
#    click button  ${web_PLATFORM_CUSTOMER_DELBUTTONCONFIM}
