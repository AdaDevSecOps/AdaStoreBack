*** Settings ***
Documentation     SKC AUTOMATION TEST
Library           Selenium2Library    implicit_wait=50

*** Variables ***
${URL}            http://sit.ada-soft.com:8999/login
${BROWSER}        chrome
${SELSPEED}       0.5s
${USERNAME}       009
${PASSWORD}       123456
${NPASS}          123456789

*** Test Cases ***
POS-Create
    [Setup]    Run Keywords    Open Browser    http://sit.ada-soft.com:8999/login    ${BROWSER}
    ...    AND    Set Selenium Speed    ${SELSPEED}
    Maximize Browser Window
    type    id=oetUsername    009
    type    id=oetPassword    123456
    click    id=obtLOGConfirmLogin
    open    http://sit.ada-soft.com:8999/
    Wait Until Page Contains    AdaSoft    50
    ${response}    Get Text    id=spnCompanyName
    Should Be Equal As Strings    ${response}    AdaSoft    #<<<<<<<<<<<<<<<<<<<<<<
    click element    xpath=//*[@id="wrapper"]/div[2]/div[3]/button/img
    click    xpath=//nav[@id='oNavMenuMAS']/ul/li/ul/li[3]/a/i
    click    link=จุดขาย
    Wait Until Page Contains    เครื่องจุดขาย    50
    ${response}    Get Text    xpath=//*[@id="oliPosTitle"]
    Should Be Equal As Strings    ${response}    เครื่องจุดขาย
    sleep    3s
    click    xpath=//div[@id='odvBtnPosInfo']/button
    Wait Until Page Contains    เพิ่ม    50
    type    id=oetPosName    T-POS
    click    xpath=//img[contains(@src,'http://sit.ada-soft.com:8999//application/modules/common/assets/images/icons/find-24.png')]
    Wait Until Page Contains    แสดงข้อมูล : สาขา    50
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
    click    xpath=//button[@onclick="JCNxConfirmSelected('oBrowsePosOption')"]
    sleep    1s
    type    id=oetPosRegNo    TESTER-01 Automation
    Execute JavaScript    window.scrollTo(0,500)
    click    xpath=//form[@id='ofmAddSaleMachine']/div/div/div[7]/div/button/div/div/div
    click    xpath=//form[@id='ofmAddSaleMachine']/div/div/div[7]/div/div/div[2]/ul/li/a
    click    xpath=//img[contains(@src,'http://sit.ada-soft.com:8999/application/modules/common/assets/images/icons/find-24.png')]
    sleep    1s
    ${response}    Get Text    xpath=//*[@id="odvModalContent"]/div[1]/div/div[1]/label
    Should Be Equal As Strings    ${response}    แสดงข้อมูล : คลังสินค้า
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
    click    xpath=//*[@id="odvBtnAddEdit"]/div/div/button[1]
    sleep    1s
    click    xpath=//*[@id="odvBtnAddEdit"]/div/button
    [Teardown]    Close Browser

*** Keywords ***
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

selectAndWait
    [Arguments]    ${element}    ${value}
    Select From List    ${element}    ${value}

select
    [Arguments]    ${element}    ${value}
    Select From List    ${element}    ${value}

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
