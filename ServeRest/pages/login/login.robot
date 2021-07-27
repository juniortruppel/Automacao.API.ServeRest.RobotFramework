***Settings***
Documentation       Implementação das Keywords da rota /login

***Variables***
&{dados}        emailIncorreto=a@qa.com.br
...             emailCorreto=fulano@qa.com
...             password=teste

***Keywords***
Logar com sucesso e resgatar bearer token
    &{data}                         Create Dictionary           email=${dados.emailCorreto}                 password=${dados.password}
    ${resp}                         POST                        ${baseURL}/login                            json=${data}
    Confere status code e reason    ${resp}
    Dictionary Should Contain Item  ${resp.json()}              message          ${mensagensRetorno.loginSucesso}
    ${token}                        Get From Dictionary         ${resp.json()}   authorization
    Set Global Variable             ${token}

Login sem sucesso
    ${data}                         Create Dictionary           email=${dados.emailIncorreto}               password=${dados.password}
    ${resp}                         POST                        ${baseURL}/login                            json=${data}
    Dictionary Should Contain Item  ${resp.json()}              message          ${mensagensRetorno.dadosInvalidosLogin}