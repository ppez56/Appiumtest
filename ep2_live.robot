*** Settings ***
Library     AppiumLibrary



*** Test Cases ***
Open Test Application For android
    Open Test Application
    Close Popup When App Start
    Wait Until Page Contains Element    android=UiSelector().className("android.widget.TextView").text("Cards")     30s
    # Tap     android=UiSelector().className("android.widget.TextView").text("Cards")
    Click Search Icon On Topbar
    Input Search Keyword Into Search Box    Icon
    Click Bottom Navigation Icon Menu

*** Variables ***
${appium_server}        http://localhost:4723
${platform_name}        Android
${device_name}          emulator-5554
${app_package}          com.material.components
${app_activity}         com.material.components.activity.MainMenu
${automation_name}      Uiautomator2
${system_port}          8201
${adb_port}             5037
${avd_args}             ${null}


*** Keywords ***
Open Test Application
    AppiumLibrary.Open Application    ${appium_server}    
    ...    platformName=${platform_name}    
    ...    deviceName=${device_name}    
    ...    appPackage=${app_package}    
    ...    appActivity=${app_activity}    
    ...    automationName=${automation_name}        
    ...    newCommandTimeout=630000
    ...    avdArg=${avd_args}
    Sleep    10s
    #AppiumLibrary.Wait Until Element Is Visible    


Close Popup When App Start
    Appiumlibrary.Wait Until Page Contains Element    id=com.material.components:id/bt_close      30s
    Click Element     id=com.material.components:id/bt_close

Click Search Icon On Topbar
    Wait Until Page Contains Element    accessibility_id=Search             30s
    AppiumLibrary.Click Element     accessibility_id=Search

Input Search Keyword Into Search Box
    [Arguments]     ${kw}
    Wait Until Page Contains Element    id=com.material.components:id/search_src_text       30s
    Input Text      id=com.material.components:id/search_src_text       ${kw}

Click Bottom Navigation Icon Menu
    Wait Until Page Contains Element    xpath=//android.widget.LinearLayout[android.widget.TextView[@text='Bottom Navigation'] and android.widget.TextView[@text='Icon']]   30s
    AppiumLibrary.Click Element     xpath=//android.widget.LinearLayout[android.widget.TextView[@text='Bottom Navigation'] and android.widget.TextView[@text='Icon']]





