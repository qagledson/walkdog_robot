*** Settings ***
Resource    ../../resources/main.robot
Resource    ../../resources/pages/cadastro_page.robot

*** Test Cases ***
Acessar o sistema
    DADO QUE acesso o buger eats
    E clico no botao de cadastro
    QUANDO preencho os campos do cadastro
    Sleep        2

