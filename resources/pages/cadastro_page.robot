*** Settings ***
Resource    ../main.robot
Library    Collections

*** Variables ***
&{cadastro}
...     campo_nome=xpath://input[@name='name']
...     campo_cpf=xpath://input[@name='cpf']
...     campo_email=xpath://input[@name='email']
...     campo_whatsapp=xpath://input[@name='whatsapp']
...     campo_cep=xpath://input[@name='postalcode']
...     campo_numero=xpath://input[@name='address-number']
...     campo_complemento=xpath://input[@name='address-details']
...     campo_rua=xpath://input[@name='address']
...     campo_bairro=xpath://input[@name='district']
...     campo_cidade_uf=xpath://input[@name='city-uf']
...     botao_voltar_home=xpath://a[contains(.,'Voltar para home')]
...     botao_buscar_cep=xpath://input[@value='Buscar CEP']
...     botao_anexar_cnh=xpath://p[contains(.,'Foto da sua CNH')]
...     botao_cadastrar=xpath://button[@class='button-success']
...     link_entrega_moto=xpath://li[contains(.,'Moto')]
...     link_entrega_bicicleta=xpath://li[contains(.,'Bicicleta')]
...     link_entrega_carro=xpath://li[contains(.,'Van/Carro')]

*** Keywords ***
QUANDO preencho os campos do cadastro
    Wait Until Element Is Visible         ${cadastro.campo_nome}
    Input Text                            ${cadastro.campo_nome}            ${registro.nome_completo}
    Wait Until Element Is Visible         ${cadastro.campo_cpf}
    Input Text                            ${cadastro.campo_cpf}             ${registro.cpf}
    Wait Until Element Is Visible         ${cadastro.campo_cpf}
    Input Text                            ${cadastro.campo_email}           ${registro.email}
    Wait Until Element Is Visible         ${cadastro.campo_whatsapp}
    Input Text                            ${cadastro.campo_whatsapp}        ${registro.whatsapp}
    Wait Until Element Is Visible         ${cadastro.campo_cep}
    Input Text                            ${cadastro.campo_cep}             ${registro.cep}
    Wait Until Element Is Visible         ${cadastro.botao_buscar_cep}
    Click Element                         ${cadastro.botao_buscar_cep}
    Sleep                                 5s
    Wait Until Element Is Visible         ${cadastro.campo_rua}
    ${nome_rua}=     Get Value            ${cadastro.campo_rua}             
    Should Contain                        ${nome_rua}                        ${registro.rua}
    Wait Until Element Is Visible         ${cadastro.campo_numero}
    Input Text                            ${cadastro.campo_numero}           ${registro.numero}
    Wait Until Element Is Visible         ${cadastro.campo_complemento}
    Input Text                            ${cadastro.campo_complemento}      ${registro.complemento}
    Wait Until Element Is Visible         ${cadastro.campo_bairro}
    ${nome_bairro}=     Get Value         ${cadastro.campo_bairro}             
    Should Contain                        ${nome_bairro}                     ${registro.bairro}
    Wait Until Element Is Visible         ${cadastro.campo_cidade_uf}
    ${nome_cidade_uf}=     Get Value      ${cadastro.campo_cidade_uf}             
    Should Contain                        ${nome_cidade_uf}                  ${registro.cidade_uf}
    Sleep    3
    