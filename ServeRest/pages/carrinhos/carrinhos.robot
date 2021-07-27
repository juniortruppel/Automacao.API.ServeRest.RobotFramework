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

Cadastrar carrinho sem arquivo JSON
    Logar com sucesso e resgatar bearer token
    
    ${headers}  Create Dictionary           Authorization=${token}
    ${resp}     POST    ${baseURL}/carrinhos

Cadastrar carrinho com arquivo JSON
    Logar com sucesso e resgatar bearer token
    
    ${headers}  Create Dictionary           Authorization=${token}

    ${body}     Format String               ${CURDIR}/carrinhos.json
    ...         idProduto=BeeJh5lz3k6kSIzA
    ...         qtd=1

    ${resp}     POST    ${baseURL}/carrinhos        data=${body}    headers=${headers}

Excluir carrinho sem retornar o estoque dos produtos
    Logar com sucesso e resgatar bearer token
    
    ${headers}  Create Dictionary           Authorization=${token}
    ${resp}     DELETE  ${baseURL}/carrinhos/concluir-compra        headers=${headers}
    
    Confere status code e reason            ${resp}
    
    Dictionary Should Contain Item          ${resp.json()}          message         ${mensagensRetorno.carrinhoExcluidoSucesso}

Excluir carrinho sem retornando o estoque dos produtos
    Logar com sucesso e resgatar bearer token
    
    ${headers}  Create Dictionary           Authorization=${token}
    ${resp}     DELETE  ${baseURL}/carrinhos/cancelar-compra        headers=${headers}
    
    Confere status code e reason            ${resp}
    
    Dictionary Should Contain Item          ${resp.json()}          message         ${mensagensRetorno.carrinhoExcluidoSucesso}