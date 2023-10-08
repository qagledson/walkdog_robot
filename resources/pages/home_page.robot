*** Settings ***
Resource    ../main.robot

*** Variables ***
&{home}
...     botao_cadastre_se=xpath://a[contains(.,'Quero ser Dog Walker')]

*** Keywords ***
DADO QUE acesso o walkdog
    Open Browser    ${geral.url}       ${geral.browser}
    
E que desejo me tornar Dog Walker
    Click Element    ${home.botao_cadastre_se}
    