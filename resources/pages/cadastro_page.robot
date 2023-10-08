*** Settings ***
Resource    ../main.robot
Library    Collections
Library    OperatingSystem

*** Variables ***
&{cadastro}
...     campo_nome=xpath://input[@name='name']
...     campo_email=xpath://input[@name='email']
...     campo_cpf=xpath://input[@name='cpf']
...     campo_cep=xpath://input[@name='cep']
...     campo_numero=xpath://input[@name='addressNumber']
...     campo_complemento=xpath://input[@name='addressDetails']
...     campo_rua=xpath://input[@name='addressStreet']
...     campo_bairro=xpath://input[@name='addressDistrict']
...     campo_cidade_uf=xpath://input[@name='addressCityUf']
...     botao_voltar_home=xpath://a[contains(.,'Voltar para home')]
...     botao_buscar_cep=xpath://input[@value='Buscar CEP']
...     botao_anexar=css:input[type="file"]
...     botao_cadastrar=xpath://button[@class='button-register']
...     link_cuidar=xpath://li[contains(.,'Cuidar')]
...     link_adestrar=xpath://li[contains(.,'Adestrar')]
...     caminho_doc=C:\\Users\\Gledson Nascimento\\Documents\\projetos\\robot-framework\\walkdog_robot\\cnh-teste.jpg
...     campo_mensagem=xpath://div[@class="swal2-html-container"]

*** Keywords ***
QUANDO submeto o formulário de cadastro com os meus dados pessoais
    Wait Until Element Is Visible         ${cadastro.campo_nome}
    Input Text                            ${cadastro.campo_nome}            ${registro.nome_completo}

    Wait Until Element Is Visible         ${cadastro.campo_email}
    Input Text                            ${cadastro.campo_email}           ${registro.email}

    Wait Until Element Is Visible         ${cadastro.campo_cpf}
    Input Text                            ${cadastro.campo_cpf}             ${registro.cpf}

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
    
    Wait Until Element Is Visible         ${cadastro.link_cuidar}
    Click Element                         ${cadastro.link_cuidar}
    
    #Anexar imagem com caminho setado na variável
    Choose File                           ${cadastro.botao_anexar}                  ${cadastro.caminho_doc}
    
    Wait Until Element Is Visible         ${cadastro.botao_cadastrar}
    Click Element                         ${cadastro.botao_cadastrar}
    Sleep                                 2s        
    
ENTÃO devo ver uma mensagem de sucesso informando Recebemos o seu cadastro e em breve retornaremos o contato
    Element Should Be Visible             ${cadastro.campo_mensagem}                
    Page Should Contain                   Recebemos o seu cadastro e em breve retornaremos o contato
    Capture Page Screenshot               cadastro_dog_walker_success.png
    Close Browser