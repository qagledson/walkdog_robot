*** Settings ***
Resource    ../main.robot

*** Variables ***
&{home}
...     botao_cadastre_se=xpath://a[contains(.,'Cadastre-se para fazer entregas')]

*** Keywords ***
DADO QUE acesso o buger eats
    Open Browser    ${geral.url}       ${geral.browser}
    
E clico no botao de cadastro
    Click Element    ${home.botao_cadastre_se}
    