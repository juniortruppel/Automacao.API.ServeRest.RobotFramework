***Settings***
Documentation       Arquivo de base do projeto

Library             Collections
Library             RequestsLibrary
Library             String
Library             FakerLibrary    locale=pt_BR
Library             RPA.JSON

Resource            helpers.robot

#Login
Resource            ../ServeRest/pages/login/login.robot

#Usuarios
Resource            ../ServeRest/pages/usuarios/usuarios.robot

#Produtos
Resource            ../ServeRest/pages/produtos/produtos.robot

#Carrinhos
Resource            ../ServeRest/pages/carrinhos/carrinhos.robot