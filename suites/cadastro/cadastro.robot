*** Settings ***
Resource    ../../resources/main.robot
Resource    ../../resources/pages/cadastro_page.robot

*** Test Cases ***
Efetuar cadastro no sistema
    [Documentation]        Teste de cadastro de usuário
    DADO QUE acesso o walkdog
    E que desejo me tornar Dog Walker
    QUANDO submeto o formulário de cadastro com os meus dados pessoais
    ENTÃO devo ver uma mensagem de sucesso informando Recebemos o seu cadastro e em breve retornaremos o contato

