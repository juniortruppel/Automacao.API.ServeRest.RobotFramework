***Settings***
Documentation       Casos de teste do Projeto ServeRest
...                 O ServeRest é um servidor REST que simula uma loja virtual com intuito de servir de material de estudos de testes de API.
...                 https://serverest.dev/#/

Resource            ../../base/base.robot

***Test Cases***
#Login
Login
    [Tags]      login
    Logar com sucesso e resgatar bearer token
    #Login sem sucesso

#Usuarios
Usuários
    [Tags]      usuarios
    Cadastrar usuário sem arquivo JSON
    Cadastrar usuário com arquivo JSON
    #Cadastrar usuário com um e-mail que já foi utilizado
    Listar todos os usuarios
    Buscar usuário "idUsuario"
    Editar usuário "idUsuario"
    Deletar usuário "idUsuario"

#Produtos
Produtos
    [Tags]      produtos
    Cadastrar produto sem arquivo JSON
    Cadastrar produto com arquivo JSON
    #Cadastrar produto com um nome que já foi utilizado
    Listar todos os produtos
    produtos.Buscar produto "idProduto"
    produtos.Buscar produto com uma descricao específica
    Editar produto "idProduto"
    Deletar produto "idProduto"

Carrinhos
    [Tags]      carrinhos
    #Listar todos os carrinhos
    #Listar carrinho "idCarrinho"
    #Cadastrar carrinho sem arquivo JSON
    Cadastrar carrinho com arquivo JSON
    #Excluir carrinho sem retornar o estoque dos produtos
    #Excluir carrinho sem retornando o estoque dos produtos