***Settings***
Documentation       Casos de teste do Projeto ServeRest
...                 O ServeRest é um servidor REST que simula uma loja virtual com intuito de servir de material de estudos de testes de API.
...                 https://serverest.dev/#/

Resource            ../../base/base.robot

***Test Cases***
#Login
Realizar login com sucesso
    Login com sucesso

#Usuarios
Listar todos os usuarios
    [Tags]      teste
    Listar usuarios

Buscar usuário específico
    Buscar "Fulano da Silva"
