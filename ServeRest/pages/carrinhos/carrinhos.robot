***Settings***
Documentation       Implementação das Keywords da rota /carrinhos

***Variables***
${idCarrinhoCadastrado}     1E1sl6JzjspZ0Sko

***Keywords***
Listar todos os carrinhos
    ${resp}     GET     ${baseURL}/carrinhos
    Confere status code e reason            ${resp}

Listar carrinho "idCarrinho"
    ${resp}     GET     ${baseURL}/carrinhos/${idCarrinhoCadastrado}
    Confere status code e reason            ${resp}
    Dictionary Should Contain Item          ${resp.json()}          _id                 ${idCarrinhoCadastrado}
    Dictionary Should Contain Item          ${resp.json()}          quantidadeTotal     1
    Dictionary Should Contain Item          ${resp.json()}          precoTotal          470
    
    ${teste}    Get value from JSON         ${resp}                 $.produtos[0].idProduto[0]
    Log     ${teste}

Cadastrar um carrinho

Excluir carrinho sem retornar o estoque dos produtos

Excluir carrinho sem retornando o estoque dos produtos