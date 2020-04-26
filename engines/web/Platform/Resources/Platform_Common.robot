#-*- coding: utf-8 -*-
*** Settings ***
Resource    ../PlatformShare.robot

*** Variables ***
${WEB_PLATFORM_URL}   http://demo.metering-cloud.com/test
${WEB_PLATFORM_USER_NAME}    admin
${WEB_PLATFORM_USER_PASSWORD}    radio123
${WEB_PLATFORM_SELENIUM_TIMEOUT}    3s
${WEB_PLATFORM_LOADING_PAGE_ICON}   //img[@id="organizationLoader"]

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

#   删除弹框的错误原因
${web_PLATFORM_CUSTOMER_DEMOSELECT}  id:demoSelect

#   确认删除按钮
${web_PLATFORM_CUSTOMER_REMOVEBUTTONCONFIRM}  id:remove_button_confirm
${web_PLATFORM_CUSTOMER_REMOVEBUTTONCANCEL}  id:remove_button_cancel

#   编辑提醒框中按钮
${web_PLATFORM_CUSTOMER_CONFIRMbUTTON}  id:confirm_button_confirm

#   列表id
${web_PLATFORM_CUSTOMER_CUSTOMERGRIDONE}  id:customerGrid

#   更换仪表
${web_PLATFORM_REPLACEMETER_WARM_CONFIEM}  id:warm_confirm
${web_PLATFORM_REPLACEMETER_GUIDENEXT}  id:replaceGuideNext
${web_PLATFORM_REPLACEMETER_GUIDEOVER}  id:replaceGuideOver

#   温馨提示
${web_PLATFORM_WARM_DELDIALOG_CONFIRM}  id:delDialog_confirm

#操作完成后的弹窗提示信息
${web_PLATFORM_INFOMSG}  xpath://*[@id="infoMsg"]

#警告弹窗信息
${web_PLATFORM_WARNMSG}  id:warnMsg

#下一页按钮
${web_PLATFORM_NEXT_PAGE}  xpath://span[@ng-click='next(nowPage)']

#列表
${web_PLATFORM_METER_LIST}  xpath:td[@title[])
*** Keywords ***
wait for loading page
    [Documentation]    Wait for dissapearing all loading page icons
    Sleep    20ms    reason=wait for load loading indicator
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds    ${WEB_PLATFORM_SELENIUM_TIMEOUT}    20 ms    Page Should Not Contain element    ${WEB_PLATFORM_LOADING_PAGE_ICON}    loglevel=NONE

Select unGroup left tree button
    [Arguments]  ${orgName}
    click element when is enabled    //span[contains(text(),"${orgName}")]


#   列表中的添加、编辑、删除、全部删除按钮
Get bottom button
    [Arguments]     ${td_id}  ${button_title}
    [Return]    //td[@id="${td_id}"]/table/tbody/tr/td[@title="${button_title}"]

#   根据名称关键字选中列表中的数据
select list by value
    [Arguments]     ${table_id}  ${td_title}
    click element when is enabled   //table[@id="${table_id}"]/tbody/tr/td[starts-with(@title,'${td_title}')]



#     客户添加向导第一步
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
    [Arguments]  ${cus_num}  ${cus_name}  ${cus_cuNature}  ${cus_serviceStatus}  ${cus_correctionfactor}  ${cus_floorSpace}  ${cus_serviceFloorArea}  ${cus_population}  ${cus_tel}  ${cus_email}  ${cus_remark}
    Set cus_num  ${cus_num}
    Set cus_name  ${cus_name}
    Set cus_cuNature  ${cus_cuNature}
    Set cus_serviceStatus  ${cus_serviceStatus}
    Set cus_correctionfactor  ${cus_correctionfactor}
    Set cus_floorSpace  ${cus_floorSpace}
    Set cus_serviceFloorArea  ${cus_serviceFloorArea}
    Set cus_population  ${cus_population}
    Set cus_tel  ${cus_tel}
    Set cus_email  ${cus_email}
    Set cus_remark  ${cus_remark}
    sleep  2s

#    选中列表中某一行
Select list one row
    [Arguments]  ${row_id}
    click element  //input[contains(@id,"${row_id}")]
    sleep  2s

#    输入删除原因
Set deletde reason
    [Arguments]  ${demoSelect}
    select from list by index  ${web_PLATFORM_CUSTOMER_DEMOSELECT}  ${demoSelect}
    sleep  2s

#    点击删除确认按钮
Click delete confirm button
    click element when is enabled  ${web_PLATFORM_CUSTOMER_REMOVEBUTTONCONFIRM}
    sleep  2s

#    点击删除取消按钮
Click delete cancel button
    click element when is enabled  ${web_PLATFORM_CUSTOMER_REMOVEBUTTONCANCEL}
    sleep  2s

#    点击确认编辑按钮
Click button_confirm
    click element when is enabled  ${web_PLATFORM_CUSTOMER_CONFIRMbUTTON}
    sleep  2s

#    判断列表中的是否存在值
Click list is value
    [Arguments]  ${table_id}
    ${table}=  get element size  //table[@id="${table_id}"]
    ${choose}=  Click left ztree button  customerOrgTree_4_a
    run keyword if  '(1356，0)' in $table  log to console  ${choose}
    sleep  2s

#    编辑向导框中组织树的选择
Click orgTree
    [Arguments]  ${orgTreeId}
    click element  //a[contains(@id,"${orgTreeId}")]

#    提示语中的确认按钮
Click warm comfirem
    click element when is enabled  ${web_PLATFORM_REPLACEMETER_WARM_CONFIEM}


#    更换仪表相关信息  //tr[contains(@id,"${rowId}")/span]
#    旧表截止数据
Select meterReplace_oldMeter_measval
    [Arguments]  ${rowId}
    click element  //span[@id='${rowId}']
    sleep  2s


#    添加抄表数据
Click bottom bottom replace oldMeter add
    ${add_button_ele}     Get bottom button    endMeasPager_left  添加
    click element when is enabled   ${add_button_ele}
    sleep  2s
    Click warm comfirem

#    下一步按钮
Click meterReplace_next
    click element when is enabled  ${web_PLATFORM_REPLACEMETER_GUIDENEXT}
    sleep  2s

#    完成按钮
Click meterReplace_over
    click element when is enabled  ${web_PLATFORM_REPLACEMETER_GUIDEOVER}
    sleep  2s

#    温馨提示语
Click warm delDialog_confirm
    click element when is enabled  ${web_PLATFORM_WARM_DELDIALOG_CONFIRM}
    sleep  2s






