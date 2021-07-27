***Settings***
Documentation       Implementação das Keywords da rota /usuarios

***Keywords***
Gerador de dados usuários
    ${randomName}                       FakerLibrary.Name
    ${randomEmail}                      FakerLibrary.Email
    ${randomPassword}                   FakerLibrary.Password
    ${randomUsuario}                    Create Dictionary    nome=${randomName}  email=${randomEmail}  senha=${randomPassword}
    Set Suite Variable                  ${randomUsuario}

Cadastrar usuário sem arquivo JSON
    Gerador de dados usuários
    ${body}                             Create Dictionary           nome=${randomUsuario.nome}            email=${randomUsuario.email}              password=${randomUsuario.senha}       administrador=true
    ${resp}                             POST                        ${baseURL}/usuarios                                             json=${body}
    
    Confere status code e reason        ${resp}
    Dictionary Should Contain Item      ${resp.json()}              message                         ${mensagensRetorno.cadastroSucesso}

Cadastrar usuário com arquivo JSON
    Gerador de dados usuários
    
    &{headers}                          Create Dictionary           Content-Type=application/json
    
    ${body}                             Format String               ${CURDIR}/usuarios.json
    ...                                 email=${randomUsuario.email}
    
    ${resp}                             POST                        ${baseURL}/usuarios                                             data=${body}                    headers=${headers}
    
    Confere status code e reason        ${resp}
    
    Dictionary Should Contain Item      ${resp.json()}              message                         ${mensagensRetorno.cadastroSucesso}
    ${idUsuarioCadastrado}              Get From Dictionary         ${resp.json()}                  _id
    Set Suite Variable                  ${idUsuarioCadastrado}

Cadastrar usuário com um e-mail que já foi utilizado
    &{headers}      Create Dictionary   Content-Type=application/json
    ${body}         Format String       ${CURDIR}/usuarios.json
    ${resp}         POST                ${baseURL}/usuarios         data=${body}                    headers=${headers}
    
    Dictionary Should Contain Item      ${resp.json()}              message                         ${mensagensRetorno.emailJaUtilizado}

Listar todos os usuarios
    ${resp}                             GET                         ${baseURL}/usuarios
    
    Confere status code e reason        ${resp}

Buscar ${idUsuario}
    ${resp}         GET                 ${baseURL}/usuarios/${idUsuarioCadastrado}
    
    Confere status code e reason        ${resp}
    
    Dictionary Should Contain Item      ${resp.json()}              _id                             ${idUsuarioCadastrado}
    Dictionary Should Contain Item      ${resp.json()}              nome                            Teste
    Dictionary Should Contain Item      ${resp.json()}              password                        123

Editar usuário ${idUsuario}
    Gerador de dados usuários
    
    ${body}                             Create Dictionary           nome=${randomUsuario.nome}            email=${randomUsuario.email}              password=${randomUsuario.senha}       administrador=true
    ${resp}                             PUT                         ${baseURL}/usuarios/${idUsuarioCadastrado}                          json=${body}
    
    Confere status code e reason        ${resp}
    Dictionary Should Contain Item      ${resp.json()}              message                         ${mensagensRetorno.alteracaoSucesso}

Deletar usuário ${idUsuario}
    ${resp}                             Delete                      ${baseURL}/usuarios/${idUsuarioCadastrado}
    
    Dictionary Should Contain Item      ${resp.json()}              message                         ${mensagensRetorno.usuarioExclusaoSucesso}