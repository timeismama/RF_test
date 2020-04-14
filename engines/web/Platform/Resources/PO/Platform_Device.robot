﻿*** Settings ***
Resource  ../Platform_Common.robot


*** Variables ***
${METER_PADER}  meterPager_left

${web_PLATFORM_METER_METERNUMBER}  id:meterNumber
${web_PLATFORM_METER_ASSETNUMBER}  id:assetNumber
${web_PLATFORM_METER_USAGETYPE}  id:usageType
${web_PLATFORM_METER_SIZE}  id:size
${web_PLATFORM_METER_ACTMEDIUM}  id:actMedium
${web_PLATFORM_METER_INSTALLOC}  id:installLoc
${web_PLATFORM_METER_REMARK}  id:remark
${web_PLATFORM_METER_ISFIREEQUVIPMENT}  id:isFireEquipment
${web_PLATFORM_METER_GUIDEOVER_BUTTON}  id:meter_guideOver_button
${web_PLATFORM_METER_GUIDEPRE}  id:guidePre
${web_PLATFORM_METER_LONGITUDE}  id:longitude
${web_PLATFORM_METER_LATITUDE}   id:latitude
${web_PLATFORM_METER_DETAILEDIT}  id:detailEdit
${web_PLATFORM_METER_CONTINUECCHANGE}  id:continuecChange
${web_PLATFORM_METER_EDITMETERNUMBER}  id:editMeterNumber
${web_PLATFORM_METER_REPLACEMETER}  id:replaceMeter
${web_PLATFORM_METER_CLOSETHISDIALOG}  id:closeThisDialog
${web_PLATFORM_METER_ORGNAME}  id:orgName
${web_PLATFORM_METER_TOCONNECTCONCENTRATOR}  id:toConnectConcentrator
${web_PLATFORM_METER_GUIDENEXT_BUTTON}  id:meter_guideNext_button
${web_PLATFORM_METER_INSTALLTIME}  name:installTime
${web_PLATFORM_METER_ADDITINALFIELDNAME}  id:additinalFieldName
${web_PLATFORM_METER_ADDITINALFIELDVALUE}  id:additinalFieldValue
${web_PLATFORM_METER_IMG_ADDITINAL_ADD}  id:img_additinal_add


*** Keywords ***
#    添加按钮
Click bottom button add
    ${add_button_ele}     Get bottom button    ${METER_PADER}  添加
    click element when is enabled   ${add_button_ele}
    sleep  2s

#    编辑按钮
Click bottom button edit
    ${add_button_ele}     Get bottom button    ${METER_PADER}  编辑
    click element when is enabled   ${add_button_ele}
    sleep  2s

#    删除按钮
Click bottom button deleted
    ${add_button_ele}     Get bottom button    ${METER_PADER}  删除
    click element when is enabled   ${add_button_ele}
    sleep  2s

#     全部删除按钮
Click bottom button deletedAll
    ${add_button_ele}     Get bottom button    ${METER_PADER}  全部删除
    click element when is enabled   ${add_button_ele}
    sleep  2s

#    更换仪表按钮
Click bottom button replaceMeter
    ${add_button_ele}     Get bottom button    ${METER_PADER}  更换仪表
    click element when is enabled   ${add_button_ele}
    sleep  2s

#    关联M-BUS集中器按钮
Click bottom button correlationConcentrator
    ${add_button_ele}     Get bottom button    ${METER_PADER}  关联M-Bus集中器
    click element when is enabled   ${add_button_ele}
    sleep  2s

#    取消关联M-BUS集中器按钮
Click bottom button cancelTheAssociationConcentrator
    ${add_button_ele}     Get bottom button    ${METER_PADER}  取消关联M-Bus集中器
    click element when is enabled   ${add_button_ele}
    sleep  2s

#    向导第一步
#仪表编号
Set meter_meternumber
    [Arguments]  ${meterNumber}
    input text  ${web_PLATFORM_METER_METERNUMBER}  ${meterNumber}

#    仪表资产号
Set meter_assetNumber
    [Arguments]  ${assetNumber}
    input text  ${web_PLATFORM_METER_ASSETNUMBER}  ${assetNumber}

#    组织树选择
Set meter_orgTree
    [Arguments]  ${orgTreeId}
    click element  ${web_PLATFORM_METER_ORGNAME}
    click orgtree  ${orgTreeId}

#    计量场景
Set meter_usageType
    [Arguments]  ${usageType}
    select from list by index   ${web_PLATFORM_METER_USAGETYPE}  ${usageType}

#    口径
Set meter_size
    [Arguments]  ${size}
    select from list by index  ${web_PLATFORM_METER_SIZE}  ${size}

#    计量类型
Set meter_actMedium
    [Arguments]  ${actMedium}
    select from list by index  ${web_PLATFORM_METER_ACTMEDIUM}  ${actMedium}
    sleep  2s

#    消防用表
Set meter_isFireEquipment
    checkbox should not be selected  ${web_PLATFORM_METER_ISFIREEQUVIPMENT}

#    基表型号
Set meter_machMtype
    [Arguments]   ${machMtype}
    input text  //input[@name='machMtype']  ${machMtype}

#    安装时间
Select meter_installTime
    click element  ${web_PLATFORM_METER_INSTALLTIME}
    click element  //a[@id='laydate_today']

#    安装位置
Set meter_instalLOC
    [Arguments]  ${instalLoc}
    input text  ${web_PLATFORM_METER_INSTALLOC}  ${instalLoc}

#    备注
Set meter_remark
    [Arguments]  ${remark}
    input text  ${web_PLATFORM_METER_REMARK}  ${remark}

#    附加属性
Set meter_attributes
    [Arguments]  ${additinalFieldName}  ${additinalFieldValue}
    input text  ${web_PLATFORM_METER_ADDITINALFIELDNAME}  ${additinalFieldName}
    input text  ${web_PLATFORM_METER_ADDITINALFIELDVALUE}  ${additinalFieldValue}
    click image  ${web_PLATFORM_METER_IMG_ADDITINAL_ADD}

#   经度
Set meter_longitude
    [Arguments]  ${longitude}
    input text  ${web_PLATFORM_METER_LONGITUDE}  ${longitude}

#    纬度
Set meter_latitude
    [Arguments]  ${latitude}
    input text  ${web_PLATFORM_METER_LATITUDE}  ${latitude}

#    下一步按钮
Cleck meter_nextButton
    click element when is enabled  ${web_PLATFORM_METER_GUIDENEXT_BUTTON}

#    完成按钮
Cleck meter_over
    click element when is enabled   ${web_PLATFORM_METER_GUIDEOVER_BUTTON}

#    编辑仪表编号
Click meter_meterNumberEdit
    click element when is enabled  ${web_PLATFORM_METER_DETAILEDIT}
    click element when is enabled  ${web_PLATFORM_METER_CONTINUECCHANGE}
    sleep  2s

#   去换表按钮
Click meter bottom button replaceMeter
    click element when is enabled  ${web_PLATFORM_METER_REPLACEMETER}

#    取消按钮
Click meter bottom button close
    click element when is enabled  ${web_PLATFORM_METER_CLOSETHISDIALOG}

#   仪表信息
Set meter_info
    [Arguments]  ${assetNumber}  ${usageType}  ${size}  ${actMedium}  ${instalLOC}  ${remark}
    Set meter_assetNumber  ${assetNumber}
    Set meter_usageType  ${usageType}
    Set meter_size  ${size}
    Set meter_actMedium  ${actMedium}
    Set meter_instalLOC  ${instalLOC}
    Set meter_remark  ${remark}
    Set meter_isFireEquipment

#   关联集中器完成按钮
Click meter button connect_concentrator
    click element when is enabled  ${web_PLATFORM_METER_TOCONNECTCONCENTRATOR}
    sleep  2s

#    编辑仪表成功
Add meter success
    [Arguments]    ${text}    ${loglevel}=INFO
    Page Should Contain    ${text}    ${loglevel}

#    获取table页中的某行
Select table one row
    click element  //table[@id='connectConcentratorGrid']
