*** Settings ***
Library  Selenium2Library   implicit_wait=50
*** Variables ***
${BROWSER}   chrome
${SELSPEED}  0.5s
${URL}  http://sit.ada-soft.com:8899/login  
*** Test Cases ***
Login_FC
    [Setup]    Run Keywords    Open Browser    ${URL}    ${BROWSER}
    ...    AND    Set Selenium Speed    ${SELSPEED}
    Maximize Browser Window
    type    id=oetUsername    009
    type    id=oetPassword    1234567
    click    xpath=//button[@id='obtLOGConfirmLogin']/span
    Wait Until Element Is Visible    xpath=//*[@id="ospUsrOrPwNotCorrect"]    30
    Wait Until Page Contains    ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง    50
    ${response}    Get Text    xpath=//*[@id="ospUsrOrPwNotCorrect"]
    Should Be Equal As Strings    ${response}    ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง    #Login_SC    #[Setup]    Run Keywords    Open Browser    ${URL}    ${BROWSER}    #...    # AND    Set Selenium Speed    ${SELSPEED}
    [Teardown]    Close Browser 

Branch-Create
    [Setup]    Run Keywords    Open Browser    http://sit.ada-soft.com:8899/login    ${BROWSER}
    ...    AND    Set Selenium Speed    ${SELSPEED}
    Maximize Browser Window
    type    id=oetUsername    009
    type    id=oetPassword    123456
    click    id=obtLOGConfirmLogin
    open    http://sit.ada-soft.com:8899/
    Wait Until Page Contains    AdaSoft    50
    ${response}    Get Text    id=spnCompanyName
    click    xpath=//div[@id='wrapper']/div[2]/div[3]/button/img
    click    xpath=//nav[@id='oNavMenuMAS']/ul/li/ul/li[2]/a/span
    click    link=สาขา
    Wait Until Page Contains    ข้อมูลสาขา    50
    ${response}    Get Text    xpath=//*[@id="oliBCHTitle"]
    Should Be Equal As Strings    ${response}   ข้อมูลสาขา
    sleep    5s
    click    xpath=//*[@id="odvBtnBchInfo"]/button
    Wait Until Page Contains    เพิ่มสาขา    50
    ${response}    Get Text    xpath=//*[@id="oliBCHAdd"]/a
    Should Be Equal As Strings    ${response}    เพิ่มสาขา
    click    xpath=//*[@id="odvBchAutoGenCode"]/div/label/span
    type    id=oetBchCode    TEST2Automatio-Test    #ทดสอบความยาวเกิน 5
    ${SAV}    Get WebElement    xpath=//*[@id="odvBtnCmpEditInfo"]/div/button[1]
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${SAV}
    ${pNameChk}    Set Variable    กรุณากรอกชื่อสาขา    #----ค่า Default ที่ต้องการเปรียบเทียบ #เช็คไม่กรอกชื่อ
    ${pName}    Get Text    id=oetBchName-error
    IF    "${pName}" == "${pNameChk}"    #ถ้าไม่พบข้อมูลให้เพิ่ม
    type    id=oetBchName    Create by Automaion
    END
    ${pNameChk}    Set Variable    กรุณากรอกรหัสสาขาที่จดทะเบียนไว้กับสรรพากร    #----ค่า Default ที่ต้องการเปรียบเทียบ #เช็คไม่กรอกรหัสสาขาที่จดทะเบียนไว้กับสรรพากร
    ${pName}    Get Text    id=oetBchRegNo-error
    IF    "${pName}" == "${pNameChk}"    #ถ้าไม่พบข้อมูลให้เพิ่ม
    type    id=oetBchRegNo    0123456
    END
    click    xpath=//button[@id='oimBchBrowseCountry']/img
    Wait Until Page Contains    แสดงข้อมูล : ประเทศ    50
    click    xpath=//table[@id='otbBrowserList']/tbody/tr/td[2]    #เลือกประเทศไทย
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBchBrowseCountry')"]
    click    xpath=//button[@id='oimBchBrowsePpl']/img
    Wait Until Page Contains    แสดงข้อมูล : กลุ่มราคาสินค้า    50
    click    xpath=//table[@id='otbBrowserList']/tbody/tr[3]/td[2]    #เลือกกลุ่มราคาประเทศไทย
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBchBrowsePpl')"]
    sleep    1s
    #click    xpath=//*[@id="odvBtnCmpEditInfo"]/div/button[1]    #ปุ่มบันทึก
    ${SAV}    Get WebElement    xpath=//*[@id="odvBtnCmpEditInfo"]/div/button[1]
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${SAV}
    Wait Until Page Contains    ข้อมูลทั่วไป    50
    click    xpath=//*[@id="oliBCHTitle"]
    Wait Until Page Contains    ค้นหา    50
    sleep   3s
    click    xpath=//*[@id="otrBranch0"]/td[10]/img
    Wait Until Page Contains    ที่อยู่    50
    click    link=ที่อยู่    #คลิกที่อยู่
    Wait Until Page Contains    ชื่อที่อยู่    50
    ${response}    Get Text    xpath=//*[@id="otbBranchAddressTableList"]/thead/tr/th[2]
    Should Be Equal As Strings    ${response}    ชื่อที่อยู่
    ${pNameChk}    Set Variable    ไม่พบข้อมูล    #----ค่า Default ที่ต้องการเปรียบเทียบ
    ${pName}    Get Text    xpath=//*[@id="otbBranchAddressTableList"]/tbody/tr/td
    IF    "${pName}" == "${pNameChk}"    #ถ้าไม่พบข้อมูลให้เพิ่ม
    click    id=obtBranchAddressCallPageAdd
    sleep   3s
    type    id=oetBranchAddressName    Company Create by Automation-01
    type    id=oetBranchAddressTaxNo    212224238248
    type    id=oetBranchAddressWeb    www.google.co.th
    type    id=oetBranchAddressNo    99
    type    id=oetBranchAddressVillage    Sinthanee Create by Automation
    type    id=oetBranchAddressRoad    รอบเวียง
    type    id=oetBranchAddressSoi    ภัคมินฮา 33
    Execute JavaScript    window.scrollTo(0,500)
    click    id=obtBranchAddressBrowseProvince
    Wait Until Page Contains    แสดงข้อมูล : จังหวัด    60
    click    xpath=//table[@id='otbBrowserList']/tbody/tr/td[2]    #เลือกเชียงราย
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBranchAddressProvinceOption')"]
    click    id=obtBranchAddressBrowseDistrict
    Wait Until Page Contains    แสดงข้อมูล : อำเภอ/เขต    50
    click    xpath=//table[@id='otbBrowserList']/tbody/tr/td[2]    #เลือกอำเภอเมือง
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBranchAddressDistrictOption')"]
    click    id=obtBranchAddressBrowseSubDistrict
    Wait Until Page Contains    แสดงข้อมูล : ตำบล/แขวง    50
    click    xpath=//table[@id='otbBrowserList']/tbody/tr/td[2]    #เลือกตำบลรอบเวียง
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBranchAddressSubDistrictOption')"]
    type    id=oetBranchAddressPostCode    57000
    type    id=oetBranchAddressRmk    Create by Automation
    Execute JavaScript    window.scrollTo(0,0)
    sleep    1s
    click    id=obtBranchAddressSave
    sleep    1s
    click    id=oliBCHTitle
    sleep    1s
    ELSE    #ให้ Edit
    click    xpath=//table[@id='otbBranchAddressTableList']/tbody/tr/td[6]/img
    sleep   3s
    type    id=oetBranchAddressName    Company Create by Automation-02
    type    id=oetBranchAddressTaxNo    4144284312
    type    id=oetBranchAddressWeb    www.facebook.co.th
    type    id=oetBranchAddressNo    555
    type    id=oetBranchAddressVillage    Lumpinee vill condo Create by Automation
    type    id=oetBranchAddressRoad    ลาดพร้าว
    type    id=oetBranchAddressSoi    122
    Execute JavaScript    window.scrollTo(0,0)
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
    #type    id=oetBranchAddressPostCode    10310
    #type    id=oetBranchAddressRmk    Create by Automation
    #Execute JavaScript    window.scrollTo(0,0)
    #sleep    1s
    click    id=obtBranchAddressSave
    sleep    1s
    click    id=oliBCHTitle
    sleep    1s
    END
    [Teardown]    Close Browser 


*** Keywords ***
open
    [Arguments]    ${element}
    Go To          ${element}

clickAndWait
    [Arguments]    ${element}
    Click Element  ${element}

click
    [Arguments]    ${element}
    Click Element  ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

selectAndWait
    [Arguments]        ${element}  ${value}
    Select From List   ${element}  ${value}

select
    [Arguments]        ${element}  ${value}
    Select From List   ${element}  ${value}

verifyValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

verifyTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertConfirmation
    [Arguments]                  ${value}
    Alert Should Be Present      ${value}

assertText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

assertTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

waitForTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

doubleClick
    [Arguments]           ${element}
    Double Click Element  ${element}

doubleClickAndWait
    [Arguments]           ${element}
    Double Click Element  ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]         ${code}
    Execute Javascript  ${code}

runScriptAndWait
    [Arguments]         ${code}
    Execute Javascript  ${code}

setSpeed
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

setSpeedAndWait
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

verifyAlert
    [Arguments]              ${value}
    Alert Should Be Present  ${value}
