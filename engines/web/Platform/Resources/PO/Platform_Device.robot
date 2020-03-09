*** Settings ***
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
${web_PLATFORM_METER_GUIDEOVER}  id:guideOver
${web_PLATFORM_METER_GUIDEPRE}  id:guidePre
${web_PLATFORM_METER_GUIDENEXT}  id:guideNext
${web_PLATFORM_METER_LONGITUDE}  id:longitude
${web_PLATFORM_METER_LATITUDE}   id:latitude
${web_PLATFORM_METER_DETAILEDIT}  id:detailEdit
${web_PLATFORM_METER_CONTINUECCHANGE}  id:continuecChange
${web_PLATFORM_METER_EDITMETERNUMBER}  id:editMeterNumber
${web_PLATFORM_METER_REPLACEMETER}  id:replaceMeter
${web_PLATFORM_METER_CLOSETHISDIALOG}  id:closeThisDialog
${web_PLATFORM_METER_ORGNAME}  id:orgName
${web_PLATFORM_METER_TOCONNECTCONCENTRATOR}  id:toConnectConcentrator

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

#    安装位置
Set meter_instalLOC
    [Arguments]  ${instalLoc}
    input text  ${web_PLATFORM_METER_INSTALLOC}  ${instalLoc}

#    备注
Set meter_remark
    [Arguments]  ${remark}
    input text  ${web_PLATFORM_METER_REMARK}  ${remark}

#    向导第二步
Cleck meter_nextButton
    click element when is enabled  ${web_PLATFORM_METER_GUIDENEXT}
    sleep  2s

#   经度
Set meter_longitude
    [Arguments]  ${longitude}
    input text  ${web_PLATFORM_METER_LONGITUDE}  ${longitude}

#    纬度
Set meter_latitude
    [Arguments]  ${latitude}
    input text  ${web_PLATFORM_METER_LATITUDE}  ${latitude}

#    完成按钮
Cleck meter_over
    click element when is enabled   ${web_PLATFORM_METER_GUIDEOVER}

#    编辑仪表编号
Click meter_meterNumberEdit
    [Arguments]  ${editNumbrt}
    click element when is enabled  ${web_PLATFORM_METER_DETAILEDIT}
    sleep  1s
    click element when is enabled  ${web_PLATFORM_METER_CONTINUECCHANGE}
    input text  ${web_PLATFORM_METER_EDITMETERNUMBER}  ${editNumbrt}

#   去换表按钮
Click meter bottom button replaceMeter
    click element when is enabled  ${web_PLATFORM_METER_REPLACEMETER}

#    取消按钮
Click meter bottom button close
    click element when is enabled  ${web_PLATFORM_METER_CLOSETHISDIALOG}

#   仪表信息
Set meter_infor
    [Arguments]  ${assetNumber}  ${usageType}  ${size}  ${actMedium}  ${machMtype}  ${instalLoc}  ${remark}  ${longitude}  ${latitude}
    Set meter_assetNumber  ${assetNumber}
    Set meter_usageType  ${usageType}
    Set meter_size  ${size}
    Set meter_actMedium  ${actMedium}
    Set meter_machMtype  ${machMtype}
    Set meter_instalLOC  ${instalLoc}
    Set meter_remark  ${remark}
    Set meter_isFireEquipment
    Cleck meter_nextButton
    Set meter_longitude  ${longitude}
    Set meter_latitude  ${latitude}
    Cleck meter_over

#   关联集中器完成按钮
Click meter button connect_concentrator
    click element when is enabled  ${web_PLATFORM_METER_TOCONNECTCONCENTRATOR}
    sleep  2s
