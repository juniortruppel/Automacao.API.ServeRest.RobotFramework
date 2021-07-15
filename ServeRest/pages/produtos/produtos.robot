***Settings***
Documentation       Implementação das Keywords da rota /produtos

***Keywords***
Gerador de dados de produtos
    ${randomName}                           FakerLibrary.Word
    ${randomProduto}                        Create Dictionary               nome=${randomName}
    Set Suite Variable                      ${randomProduto}

Cadastrar produto sem arquivo JSON
    Login com sucesso e obter token
    Gerador de dados de produtos
    ${headers}      Create Dictionary       Authorization=${token}
    ${body}         Create Dictionary       nome=${randomProduto.nome}      preco=10        descricao=Testando       quantidade=10
    ${resp}         POST                    ${baseURL}/produtos             json=${body}    headers=${headers}
    Confere status code e reason            ${resp}
    Dictionary Should Contain Item          ${resp.json()}                  message         ${mensagensRetorno.cadastroSucesso}

Cadastrar produto com arquivo JSON
    Login com sucesso e obter token
    Gerador de dados de produtos
    &{headers}      Create Dictionary       Content-Type=application/json   Authorization=${token}
    ${body}         Format String           ${CURDIR}/produtos.json
    ...             nome=${randomProduto.nome}
    ${resp}         POST                    ${baseURL}/produtos             data=${body}    headers=${headers}
    Confere status code e reason            ${resp}
    Dictionary Should Contain Item          ${resp.json()}                  message         ${mensagensRetorno.cadastroSucesso}
    ${idProdutoCadastrado}                  Get From Dictionary             ${resp.json()}  _id
    Set Suite Variable                      ${idProdutoCadastrado}

Cadastrar produto com um nome que já foi utilizado
    &{headers}      Create Dictionary       Content-Type=application/json
    ${body}         Format String           ${CURDIR}/produtos.json
    ${resp}         POST                    ${baseURL}/produtos             data=${body}    headers=${headers}
    Dictionary Should Contain Item          ${resp.json()}                  message         ${mensagensRetorno.nomeJaUtilizado}

Listar todos os produtos
    ${resp}         GET                     ${baseURL}/produtos
    Confere status code e reason            ${resp}

Buscar produto "idProduto"
    ${resp}         GET                     ${baseURL}/produtos/${idProdutoCadastrado}
    Confere status code e reason            ${resp}
    Dictionary Should Contain Item          ${resp.json()}                  _id             ${idProdutoCadastrado}
    Dictionary Should Contain Item          ${resp.json()}                  preco           15
    Dictionary Should Contain Item          ${resp.json()}                  descricao       QualquerDescricao
    Dictionary Should Contain Item          ${resp.json()}                  quantidade      10

Buscar produto com uma descricao específica
    ${params}       Create Dictionary       descricao=Qualquer
    ${resp}         GET                     ${baseURL}/produtos             params=${params}

Editar produto "idProduto"
    Gerador de dados de produtos
    ${headers}      Create Dictionary       Authorization=${token}
    ${body}         Create Dictionary       nome=${randomProduto.nome}      preco=15        descricao=Alterando         quantidade=20
    ${resp}         PUT                     ${baseURL}/produtos/${idProdutoCadastrado}      json=${body}                headers=${headers}
    Confere status code e reason            ${resp}
    Dictionary Should Contain Item          ${resp.json()}                  message         ${mensagensRetorno.alteracaoSucesso}

Deletar produto "idProduto"
    ${headers}      Create Dictionary       Authorization=${token}
    ${resp}         DELETE                  ${baseURL}/produtos/${idProdutoCadastrado}      headers=${headers}
    Dictionary Should Contain Item          ${resp.json()}                  message         ${mensagensRetorno.exclusaoSucesso}