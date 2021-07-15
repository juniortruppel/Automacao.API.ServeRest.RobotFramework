***Settings***
Documentation       Arquivo de base do projeto

Library             Collections
Library             String
Library             RequestsLibrary
Library             FakerLibrary    locale=pt_BR

Resource            helpers.robot

#Login
Resource            ../ServeRest/pages/login/login.robot

#Usuarios
Resource            ../ServeRest/pages/usuarios/usuarios.robot

#Produtos
Resource            ../ServeRest/pages/produtos/produtos.robot
#Resource            ../ServeRest/pages/produtos/variaveis.robot

#Carrinhos
#Resource            ../ServeRest/pages/carrinhos/carrinhos.robot
#Resource            ../ServeRest/pages/carrinhos/variaveis.robot