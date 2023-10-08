*** Settings ***
Resource    ../main.robot

*** Variables ***
&{registro}
...     nome_completo=João dos Testes
...     email=joao_teste@gmail.com
...     cpf=99900099988
...     cep=63900217
...     numero=012
...     complemento=Apartamento
...     rua=Rua Doutor Eudásio Barroso
...     bairro=Centro
...     cidade_uf=Quixadá/CE
...     doc_identificacao=cnh-teste
...     caminho_doc=${EXECDIR}/cnh-teste.jpg

#O diretório ${EXECDIR} retorna diretório de execução do projeto

*** Keywords ***
