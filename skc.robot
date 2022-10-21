*** Settings ***
Documentation     SKC AUTOMATION TEST
Library           Selenium2Library    implicit_wait=300

*** Variables ***
${URL}            http://sit.ada-soft.com:8999/login
${BROWSER}        chrome
${SELSPEED}       0.5s
${USERNAME}       009
${PASSWORD}       123456
${NPASS}          123456789
${SCREEN}         document.body.style.zoom="60%"

*** Test Cases ***
Login-FailCase
    [Setup]    Run Keywords    Open Browser    ${URL}    ${BROWSER}
    ...    AND    Set Selenium Speed    ${SELSPEED}
    Maximize Browser Window
    #Execute javascript    document.body.style.zoom="80%"
    type    id=oetUsername    009
    type    id=oetPassword    123456789
    click    xpath=//button[@id='obtLOGConfirmLogin']/span
    Wait Until Element Is Visible    xpath=//*[@id="ospUsrOrPwNotCorrect"]    300
    Wait Until Page Contains    ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง    300
    ${response}    Get Text    xpath=//*[@id="ospUsrOrPwNotCorrect"]
    Should Be Equal As Strings    ${response}    ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง    #Login_SC    #[Setup]    Run Keywords    Open Browser    ${URL}    ${BROWSER}    #...    # AND    Set Selenium Speed    ${SELSPEED}
    [Teardown]    Close Browser

Branch-Create
    [Setup]    Run Keywords    Open Browser    ${URL}    ${BROWSER}
    ...    AND    Set Selenium Speed    ${SELSPEED}
    Maximize Browser Window
    #Execute javascript    document.body.style.zoom="80%"
    type    id=oetUsername    009
    type    id=oetPassword    123456
    click    id=obtLOGConfirmLogin
    Wait Until Page Contains    AdaSoft    300
    ${response}    Get Text    id=spnCompanyName
    Should Be Equal As Strings    ${response}    AdaSoft
    click    xpath=//div[@id='wrapper']/div[2]/div[3]/button/img
    click    xpath=//nav[@id='oNavMenuMAS']/ul/li/ul/li[2]/a/span
    click    link=สาขา
    Wait Until Page Contains    ข้อมูลสาขา    300
    ${response}    Get Text    xpath=//*[@id="oliBCHTitle"]
    Should Be Equal As Strings    ${response}    ข้อมูลสาขา
    sleep    3s
    click    xpath=//*[@id="odvBtnBchInfo"]/button
    Wait Until Page Contains    เพิ่มสาขา    300
    ${response}    Get Text    xpath=//*[@id="oliBCHAdd"]/a
    Should Be Equal As Strings    ${response}    เพิ่มสาขา
    click    xpath=//*[@id="odvBchAutoGenCode"]/div/label/span
    type    id=oetBchCode    TESTAutomation-Test    #ทดสอบความยาวเกิน 5
    ${SAV}    Get WebElement    xpath=//*[@id="odvBtnCmpEditInfo"]/div/button[1]
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${SAV}
    ${pNameChk}    Set Variable    กรุณากรอกชื่อสาขา    #----ค่า Default ที่ต้องการเปรียบเทียบ #เช็คไม่กรอกชื่อ
    ${pName}    Get Text    id=oetBchName-error
    IF    "${pName}" == "${pNameChk}"    #ถ้าไม่พบข้อมูลให้เพิ่ม
    type    id=oetBchName    TESTER - Create by Automation
    END
    ${pNameChk}    Set Variable    กรุณากรอกรหัสสาขาที่จดทะเบียนไว้กับสรรพากร    #----ค่า Default ที่ต้องการเปรียบเทียบ #เช็คไม่กรอกรหัสสาขาที่จดทะเบียนไว้กับสรรพากร
    ${pName}    Get Text    id=oetBchRegNo-error
    IF    "${pName}" == "${pNameChk}"    #ถ้าไม่พบข้อมูลให้เพิ่ม
    type    id=oetBchRegNo    0123456
    END
    click    xpath=//button[@id='oimBchBrowseCountry']/img
    Wait Until Page Contains    แสดงข้อมูล : ประเทศ    300
    click    xpath=//*[@id="otbBrowserList"]/tbody/tr[5]/td[2]    #เลือกประเทศไทย
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBchBrowseCountry')"]
    click    xpath=//button[@id='oimBchBrowsePpl']/img
    Wait Until Page Contains    แสดงข้อมูล : กลุ่มราคาสินค้า    300
    click    xpath=//table[@id='otbBrowserList']/tbody/tr[3]/td[2]    #เลือกกลุ่มราคาประเทศไทย
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBchBrowsePpl')"]
    sleep    1s
    #click    xpath=//*[@id="odvBtnCmpEditInfo"]/div/button[1]    #ปุ่มบันทึก
    ${SAV}    Get WebElement    xpath=//*[@id="odvBtnCmpEditInfo"]/div/button[1]
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${SAV}
    Wait Until Page Contains    ข้อมูลทั่วไป    300
    click    xpath=//*[@id="oliBCHTitle"]
    Wait Until Page Contains    ค้นหา    300
    click    xpath=//*[@id="otrBranch0"]/td[10]/img
    Wait Until Page Contains    ที่อยู่    300
    click    link=ที่อยู่    #คลิกที่อยู่
    Wait Until Page Contains    ชื่อที่อยู่    300
    ${response}    Get Text    xpath=//*[@id="otbBranchAddressTableList"]/thead/tr/th[2]
    Should Be Equal As Strings    ${response}    ชื่อที่อยู่
    ${pNameChk}    Set Variable    ไม่พบข้อมูล    #----ค่า Default ที่ต้องการเปรียบเทียบ
    ${pName}    Get Text    xpath=//*[@id="otbBranchAddressTableList"]/tbody/tr/td
    IF    "${pName}" == "${pNameChk}"    #ถ้าไม่พบข้อมูลให้เพิ่ม
    click    id=obtBranchAddressCallPageAdd
    sleep    1s
    type    id=oetBranchAddressName    TESTER Company - Create by Automation-01
    type    id=oetBranchAddressTaxNo    212224238248
    type    id=oetBranchAddressWeb    www.google.co.th
    type    id=oetBranchAddressNo    99
    type    id=oetBranchAddressVillage    Sinthanee Create by Automation
    type    id=oetBranchAddressRoad    รอบเวียง
    type    id=oetBranchAddressSoi    ภัคมินฮา 33
    Execute JavaScript    window.scrollTo(0,500)
    click    id=obtBranchAddressBrowseProvince
    Wait Until Page Contains    แสดงข้อมูล : จังหวัด    300
    click    xpath=//table[@id='otbBrowserList']/tbody/tr/td[2]    #เลือกเชียงราย
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBranchAddressProvinceOption')"]
    click    id=obtBranchAddressBrowseDistrict
    Wait Until Page Contains    แสดงข้อมูล : อำเภอ/เขต    300
    click    xpath=//table[@id='otbBrowserList']/tbody/tr/td[2]    #เลือกอำเภอเมือง
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBranchAddressDistrictOption')"]
    click    id=obtBranchAddressBrowseSubDistrict
    Wait Until Page Contains    แสดงข้อมูล : ตำบล/แขวง    300
    click    xpath=//table[@id='otbBrowserList']/tbody/tr/td[2]    #เลือกตำบลรอบเวียง
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBranchAddressSubDistrictOption')"]
    type    id=oetBranchAddressPostCode    57000
    type    id=oetBranchAddressRmk    Create by Automation
    Execute JavaScript    window.scrollTo(0,0)
    sleep    3s
    click    id=obtBranchAddressSave
    sleep    3s
    click    id=oliBCHTitle
    sleep    3s
    ELSE    #ให้ Edit
    click    xpath=//table[@id='otbBranchAddressTableList']/tbody/tr/td[6]/img
    sleep    1s
    type    id=oetBranchAddressName    Company Create by Automation-02
    type    id=oetBranchAddressTaxNo    4144284312
    type    id=oetBranchAddressWeb    www.facebook.co.th
    type    id=oetBranchAddressNo    555
    type    id=oetBranchAddressVillage    Lumpinee vill condo Create by Automation
    type    id=oetBranchAddressRoad    ลาดพร้าว
    type    id=oetBranchAddressSoi    122
    Execute JavaScript    window.scrollTo(0,500)
    #click    id=obtBranchAddressBrowseProvince
    #Wait Until Page Contains    แสดงข้อมูล : จังหวัด    50
    #click    xpath=//table[@id='otbBrowserList']/tbody/tr[2]/td[2]
    #click    xpath=//button[@onclick="JCNxConfirmSelected('oBranchAddressProvinceOption')"]
    #click    id=obtBranchAddressBrowseDistrict
    #Wait Until Page Contains    แสดงข้อมูล : อำเภอ/เขต    50
    #click    xpath=//table[@id='otbBrowserList']/tbody/tr/td[2]
    #click    xpath=//button[@onclick="JCNxConfirmSelected('oBranchAddressDistrictOption')"]
    #click    id=obtBranchAddressBrowseSubDistrict
    #Wait Until Page Contains    แสดงข้อมูล : ตำบล/แขวง    50
    #click    xpath=//table[@id='otbBrowserList']/tbody/tr/td[2]
    #click    xpath=//button[@onclick="JCNxConfirmSelected('oBranchAddressSubDistrictOption')"]
    type    id=oetBranchAddressPostCode    10310
    type    id=oetBranchAddressRmk    Create by Automation
    Execute JavaScript    window.scrollTo(0,0)
    sleep    3s
    click    id=obtBranchAddressSave
    sleep    3s
    click    id=oliBCHTitle
    sleep    3s
    END
    [Teardown]    Close Browser

Warehouse-Create
    [Setup]    Run Keywords    Open Browser    ${URL}    ${BROWSER}
    ...    AND    Set Selenium Speed    ${SELSPEED}
    Maximize Browser Window
    #Execute javascript    document.body.style.zoom="80%"
    type    id=oetUsername    009
    type    id=oetPassword    123456
    click element    id=obtLOGConfirmLogin
    Wait Until Page Contains    AdaSoft    300
    ${response}    Get Text    id=spnCompanyName
    Should Be Equal As Strings    ${response}    AdaSoft
    click element    xpath=//div[@id='wrapper']/div[2]/div[3]/button/img
    click element    xpath=//nav[@id='oNavMenuMAS']/ul/li/ul/li[2]/a/span
    click element    link=คลังสินค้า
    Wait Until Page Contains    คลังสินค้า    300
    sleep    2s
    #click element    xpath=//*[@id="odvBtnWahInfo"]/button[2]
    ${CK}    Get WebElement    xpath=//*[@id="odvBtnWahInfo"]/button[2]
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${CK}
    sleep    3s
    Wait Until Element Is Visible    xpath=//*[@id="odvWahAutoGenCode"]/div/label/span    20
    Wait Until Page Contains    สร้างอัตโนมัติ    300
    ${response}    Get Text    xpath=//*[@id="odvWahAutoGenCode"]/div/label/span
    Should Be Equal As Strings    ${response}    สร้างอัตโนมัติ
    Execute JavaScript    window.scrollTo(0,500)
    click element    id=obtWahBrowseBchCreated
    click element    xpath=//*[@id="otbBrowserList"]/tbody/tr[7]/td[1]
    click element    xpath=//*[@id="odvModalContent2"]/div[1]/div/div[2]/button[1]
    click element    id=oetWahName
    type    id=oetWahName    WHCQA Create by Automaion Tester
    #click element    xpath=//form[@id='ofmAddWarehouse']/div/div/div/div[5]/div/button/div
    Select From List By Label    ocmWahStaType    คลังทั่วไป
    Select From List By Label    ocmWahStaPrcStk    ไม่ตัดสต๊อก
    Select From List By Label    ocmWahStaChkStk    เช็คออนไลน์ (หลังบ้าน)
    Execute JavaScript    window.scrollTo(0,0)
    click Element    xpath=//*[@id="odvBtnCmpEditInfo"]/div/button[1]
    sleep    2s
    click Element    id=obtBarBack
    [Teardown]    Close Browser

POS-Create
    [Setup]    Run Keywords    Open Browser    ${URL}    ${BROWSER}
    ...    AND    Set Selenium Speed    ${SELSPEED}
    Maximize Browser Window
    #Execute javascript    document.body.style.zoom="80%"
    type    id=oetUsername    009
    type    id=oetPassword    123456
    click    id=obtLOGConfirmLogin
    Wait Until Page Contains    AdaSoft    300
    ${response}    Get Text    id=spnCompanyName
    Should Be Equal As Strings    ${response}    AdaSoft    #<<<<<<<<<<<<<<<<<<<<<<
    click element    xpath=//*[@id="wrapper"]/div[2]/div[3]/button/img
    click    xpath=//nav[@id='oNavMenuMAS']/ul/li/ul/li[3]/a/i
    click    link=จุดขาย
    Wait Until Page Contains    เครื่องจุดขาย    300
    ${response}    Get Text    xpath=//*[@id="oliPosTitle"]
    Should Be Equal As Strings    ${response}    เครื่องจุดขาย
    sleep    3s
    click    xpath=//div[@id='odvBtnPosInfo']/button
    Wait Until Page Contains    เพิ่ม    300
    type    id=oetPosName    T-POS
    click    id=oimPosBrowseBch
    Wait Until Page Contains    แสดงข้อมูล : สาขา    300
    ${response}    Get Text    xpath=//*[@id="odvModalContent"]/div[1]/div/div[1]/label
    Should Be Equal As Strings    ${response}    แสดงข้อมูล : สาขา
    click    xpath=//table[@id='otbBrowserList']/tbody/tr/td[2]    #สาขา
    sleep    1s
    click    xpath=//button[@onclick="JCNxConfirmSelected('oSaleMachineBrowseBch')"]
    click    xpath=//button[@id='oimPosBrowseChanel']/img
    ${response}    Get Text    xpath=//*[@id="odvModalContent"]/div[1]/div/div[1]/label
    Should Be Equal As Strings    ${response}    แสดงข้อมูล : ช่องทางขาย
    click    xpath=//div[@id='odvModalContent']/div[2]/div[3]/div[2]/div/button[4]
    sleep    1s
    click    xpath=//table[@id='otbBrowserList']/tbody/tr[5]/td[2]    #ช่องทางการขาย
    click    xpath=//*[@id="odvModalContent"]/div[1]/div/div[2]/button[1]
    sleep    1s
    Execute JavaScript    window.scrollTo(0,500)
    type    id=oetPosRegNo    TESTER-01 Automation
    Select From List By Label    ocmPosType    จุดขาย
    #click    xpath=//form[@id='ofmAddSaleMachine']/div/div/div[7]/div/button/div/div/div    #ประเภทจุดขาย
    #click    xpath=//form[@id='ofmAddSaleMachine']/div/div/div[7]/div/div/div[2]/ul/li/a    #เลือกประเภทจุดขาย
    Execute JavaScript    window.scrollTo(0,500)
    click    id=obtBchBrowseWah    #เปิดคลังสินค้า
    ${response}    Get Text    xpath=//*[@id="odvModalContent"]/div[1]/div/div[1]/label
    Should Be Equal As Strings    ${response}    แสดงข้อมูล : คลังสินค้า
    ${pNameChk}    Set Variable    ไม่พบข้อมูล    #----ค่า Default ที่ต้องการเปรียบเทียบ
    ${pName}    Get Text    xpath=//*[@id="otbBrowserList"]/tbody/tr/td
    IF    "${pName}" == "${pNameChk}"    #ถ้าไม่พบข้อมูลให้เพิ่ม
    click    xpath=//*[@id="odvModalContent"]/div[2]/div[1]/div[2]/button
    Wait Until Page Contains    เพิ่มคลังสินค้า    300
    type    id=oetWahName    TESTER WAREHOUSE
    #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> เริ่มหน้าเพิ่มจุดขายย่อย
    #click    id=oimBrowsePOS    #เครื่องจุดขาย
    sleep    1s
    Select From List By Label    ocmWahStaPrcStk    ตัดสต๊อก
    sleep    1s
    Select From List By Label    ocmWahStaChkStk    เช็คออนไลน์ (หลังบ้าน)
    sleep    1s
    #click    id=odvBchBtnGroup
    ${CK}    Get WebElement    xpath=//*[@id="odvBchBtnGroup"]/button
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${CK}
    #Execute JavaScript    document.getElementById('${obtSubmitWah}').click()
    ELSE
    click    xpath=//*[@id="odvModalContent"]/div[1]/div/div[2]/button[2]
    END
    #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> จบหน้าเพิ่มจุดขายย่อย
    #click    xpath=//img[contains(@src,'http://sit.ada-soft.com:8899/application/modules/common/assets/images/icons/find-24.png')]
    sleep    1s
    click    xpath=//table[@id='otbBrowserList']/tbody/tr/td[2]
    sleep    1s
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBrowsePosOption')"]
    sleep    1s
    click    xpath=//button[@id='obtSlipmessage']/img
    sleep    1s
    ${response}    Get Text    xpath=//*[@id="odvModalContent"]/div[1]/div/div[1]/label
    Should Be Equal As Strings    ${response}    แสดงข้อมูล : หัวท้ายใบเสร็จ
    click    xpath=//div[@id='odvModalContent']/div[2]/div[3]/div[2]/div/button[3]
    sleep    1s
    click    xpath=//table[@id='otbBrowserList']/tbody/tr[5]/td[2]
    sleep    1s
    click    xpath=//button[@onclick="JCNxConfirmSelected('oSlipMessage')"]
    sleep    1s
    Execute JavaScript    window.scrollTo(0,0)
    ${CK}    Get WebElement    xpath=//*[@id="odvBtnAddEdit"]/div/div/button[1]
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${CK}
    sleep    1s
    ${CK}    Get WebElement    xpath=//*[@id="odvBtnAddEdit"]/div/button
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${CK}    #Branch-Del    #    [Setup]    Run Keywords    Open Browser    http://sit.ada-soft.com:8899/login    ${BROWSER}    #    ...    # AND    Set Selenium Speed    ${SELSPEED}    #
    ...    # Maximize Browser Window    #    # Execute javascript    document.body.style.zoom="80%"    #    type    id=oetUsername    009    #    type    id=oetPassword    123456    #    click    id=obtLOGConfirmLogin    #
    ...    # open    http://sit.ada-soft.com:8899/    #    Wait Until Page Contains    AdaSoft    300    #    ${response}    Get Text    id=spnCompanyName    #    Should Be Equal As Strings    ${response}    AdaSoft    #<<<<<<<<<<<<<<<<<<<<<<    #
    ...    # click    xpath=//div[@id='wrapper']/div[2]/div[3]/button/img    #    click    xpath=//nav[@id='oNavMenuMAS']/ul/li/ul/li[2]/a/span    #    click    link=สาขา    #    Wait Until Page Contains    ข้อมูลสาขา    300    #    click    xpath=//*[@id="otrBranch0"]/td[9]/img    #
    ...    # Wait Until Element Is Visible    xpath=//*[@id="ospConfirmDelete"]    # 300    #    ${pNameChk}    Set Variable    ยืนยันการลบข้อมูล :TEST2 (TESTER - Create by Automation) ใช่หรือไม่?    #----ค่า Default ที่ต้องการเปรียบเทียบ    #    ${pName}    Get Text    xpath=//*[@id="ospConfirmDelete"]    #    IF    "${pName}" == "${pNameChk}"    #
    ...    # click    xpath=//*[@id="osmConfirm"]    #    sleep    3s    #    # ELSE
    #    click    xpath=//*[@id="odvmodaldeleteBranch"]/div/div/div[3]/button[2]
    #    sleep    3s
    #    END
    #    [Teardown]    Close Browser
    [Teardown]    Close Browser

*** Keywords ***
selectAndWait
    [Arguments]    ${element}    ${value}
    Select All From List    ${element}    ${value}

select
    [Arguments]    ${element}    ${value}
    Select All From List    ${element}    ${value}

TextEQ
    click    xpath=//*[@id="osmConfirm"]

TextNEQ
    click    xpath=//*[@id="odvModalDelSetprinter"]/div/div/div[3]/button[2]

open
    [Arguments]    ${element}
    Go To    ${element}

clickAndWait
    [Arguments]    ${element}
    Click Element    ${element}

click
    [Arguments]    ${element}
    Click Element    ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys    ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text    ${element}    ${value}

verifyValue
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

verifyText
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

verifyElementPresent
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

verifyVisible
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

verifyTitle
    [Arguments]    ${title}
    Title Should Be    ${title}

verifyTable
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

assertConfirmation
    [Arguments]    ${value}
    Alert Should Be Present    ${value}

assertText
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

assertValue
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

assertElementPresent
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

assertVisible
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

assertTitle
    [Arguments]    ${title}
    Title Should Be    ${title}

assertTable
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

waitForText
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

waitForValue
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

waitForElementPresent
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

waitForVisible
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

waitForTitle
    [Arguments]    ${title}
    Title Should Be    ${title}

waitForTable
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

doubleClick
    [Arguments]    ${element}
    Double Click Element    ${element}

doubleClickAndWait
    [Arguments]    ${element}
    Double Click Element    ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]    ${code}
    Execute Javascript    ${code}

runScriptAndWait
    [Arguments]    ${code}
    Execute Javascript    ${code}

setSpeed
    [Arguments]    ${value}
    Set Selenium Timeout    ${value}

setSpeedAndWait
    [Arguments]    ${value}
    Set Selenium Timeout    ${value}

verifyAlert
    [Arguments]    ${value}
    Alert Should Be Present    ${value}
