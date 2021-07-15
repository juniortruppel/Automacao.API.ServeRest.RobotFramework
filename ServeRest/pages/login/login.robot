***Settings***
Documentation       Implementação das Keywords da rota /login

***Variables***
&{dados}        email=fulano@qa.com     password=teste

***Keywords***
Autenticar na API
    Create Session                  ServeRest                   ${baseURL}
    ${resp}                         Get On Session              ServeRest       ${baseURL}
    Confere status code e reason     ${resp}

Login com sucesso
    &{data}                         Create Dictionary           email=${dados.email}                password=${dados.password}
    ${resp}                         POST                        ${baseURL}/login                    json=${data}
    ${token}                        Get From Dictionary         ${resp.json()}                      authorization
    Confere status code e reason    ${resp}
    Confere mensagem de retorno     ${resp}

Confere mensagem de retorno
    [Arguments]                     ${resp}
    ${mensagemRetorno}              Get From Dictionary         ${resp.json()}      message
    Should Be Equal As Strings      ${mensagemRetorno}          Login realizado com sucesso