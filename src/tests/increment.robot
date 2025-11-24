*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Reset Counter

*** Test Cases ***
At start the counter is zero
    Go To  ${HOME_URL}
    Title Should Be  Laskuri
    Page Should Contain  nappia painettu 0 kertaa

When button pressed twice the counter is two
    Go To  ${HOME_URL}
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa

When counter is reset the value is zero
    Go To  ${HOME_URL}
    Click Button  Paina
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 3 kertaa
    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa

When counter is set to specific value it shows that value
    Go To  ${HOME_URL}
    Input Text  value  10
    Click Button  Aseta
    Page Should Contain  nappia painettu 10 kertaa

When counter is set and then incremented it works correctly
    Go To  ${HOME_URL}
    Input Text  value  5
    Click Button  Aseta
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 7 kertaa