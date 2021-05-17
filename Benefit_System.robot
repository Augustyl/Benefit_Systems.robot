*** Settings ***
Library    AppiumLibrary
Library    Process

*** Variables ***

${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    11
${DEVICE_NAME}    c325662a
${Activity_NAME}    com.opera.android.BrowserActivity
${PACKAGE_NAME}     com.opera.browser
${TEARDOWN_LOGS}   run keyword if test failed   Adb Run Logcat

*** Test Cases ***

{TC_1} - Benefit System "Tester oprogramowania" verification
   Open Opera
   Allow_buttons
   Go to Benefit System website
   Go to "Oferty Pracy"
   Scroll down to "Szukaj"
   Input "Tester Oprogramowania"
   Select Region
   Scroll down
   Press "Szukaj"
   Click Tester Oprogramowania
   Ad blocking - Opera
   Offer "Tester Oprogamowania
   Scroll down to "dołącz do nas!"
   Verify text on website
   [Teardown]  run keyword if test failed   Adb Run Logcat

*** Keywords ***

Open Opera
  Open Application   ${REMOTE_URL}
  ...        platformName=${PLATFORM_NAME}
  ...    platformVersion=${PLATFORM_VERSION}
  ...   deviceName=${DEVICE_NAME}
  ...   automationName=appium
    ...    newCommandTimeout=3000
    ...    appActivity=${Activity_NAME}
    ...    appPackage=${PACKAGE_NAME}
    ...    systemPort=8208
#    ...    language=gb
#    ...    locale=UK
    ...    uiautomator2ServerLaunchTimeout=30000

Adb Run Logcat
    Run Process  ${CURDIR}/logs.bat
    Run process  ${CURDIR}/pull.bat

Allow_buttons
    sleep  2s
    wait until element is visible  id=com.opera.browser:id/continue_button
    Click Element    id=com.opera.browser:id/continue_button
    sleep  2s
    wait until element is visible  id=com.opera.browser:id/allow_button
    Click Element    id=com.opera.browser:id/allow_button
    wait until element is visible  id=com.opera.browser:id/positive_button
    Click Element    id=com.opera.browser:id/positive_button
Go to Benefit System website
    wait until element is visible  id=com.opera.browser:id/url_field
    click element   id=com.opera.browser:id/url_field
    Input Text    id=com.opera.browser:id/url_field    https://www.benefitsystems.pl
    Press keycode   66

Go to "Oferty Pracy"
   wait until element is visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.webkit.WebView/android.view.View[1]/android.view.View/android.view.View/android.widget.Button
   click element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.webkit.WebView/android.view.View[1]/android.view.View/android.view.View/android.widget.Button
   wait until element is visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.webkit.WebView/android.view.View[1]/android.view.View/android.view.View/android.view.View[3]/android.widget.ListView/android.view.View[5]/android.view.View
   Click Element   xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.webkit.WebView/android.view.View[1]/android.view.View/android.view.View/android.view.View[3]/android.widget.ListView/android.view.View[5]/android.view.View
   wait until element is visible  xpath=//android.view.View[@content-desc="KARIERA"]/android.widget.TextView
   Click Element   xpath=//android.view.View[@content-desc="KARIERA"]/android.widget.TextView
   wait until element is visible  xpath=//android.view.View[@content-desc="OFERTY BENEFIT SYSTEMS SA"]/android.widget.TextView
   Click Element    xpath=//android.view.View[@content-desc="OFERTY BENEFIT SYSTEMS SA"]/android.widget.TextView
   wait until element is visible   xpath=//hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.webkit.WebView/android.view.View[5]/android.widget.Button
   Click element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.widget.FrameLayout[2]/android.widget.FrameLayout/android.webkit.WebView/android.view.View[5]/android.widget.Button
   wait until element is visible   xpath=//android.view.View[@content-desc="OFERTY BENEFIT SYSTEMS SA"]/android.widget.TextView
   click element    xpath=//android.view.View[@content-desc="OFERTY BENEFIT SYSTEMS SA"]/android.widget.TextView

Scroll down
    Swipe By Percent    50	50	50	30

Scroll down to "Szukaj"
     FOR    ${i}    IN RANGE    10
       run keyword      Scroll down
       sleep    2s
       ${ALL_DONE}=  Run Keyword And Return Status    Element Should Be Visible    xpath=//android.widget.Button[@text='Szukaj']
       Exit For Loop If    ${ALL_DONE}
     END
Select Region
    wait until element is visible   xpath=//android.view.View[@text='Wybrano: 0']
    click element    xpath=//android.view.View[@text='Wybrano: 0']
    wait until element is visible   xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[8]
    click element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[8]
    wait until element is visible   id=android:id/button1
    Click Element    id=android:id/button1

Input "Tester Oprogramowania"
    wait until element is visible   xpath=//android.widget.EditText
    click element    xpath=//android.widget.EditText
    Input Text    xpath=//android.widget.EditText    Tester Oprogramowania

Press "Szukaj"
    sleep  2s
    wait until element is visible  xpath=//android.widget.Button[@index='4']
    click element  xpath=//android.widget.Button[@index='4']


Click Tester Oprogramowania
    sleep  2s
    wait until element is visible  xpath=//android.view.View[@text='Tester Oprogramowania']
    click element  xpath=//android.view.View[@text='Tester Oprogramowania']

Ad blocking - Opera
    sleep  1s
    go back

Offer "Tester Oprogamowania
    text should be visible   Tester Oprogramowania

Scroll down to "Dołącz do nas!"
     FOR    ${i}    IN RANGE    10
       run keyword      Scroll down
       sleep    2s
       ${ALL_DONE}=  Run Keyword And Return Status    Element Should Be Visible    xpath=//android.view.View[@text='Brzmi dobrze? Dołącz do nas!']
       Exit For Loop If    ${ALL_DONE}
     END

Verify text on website
    text should be visible   Brzmi dobrze? Dołącz do nas!
