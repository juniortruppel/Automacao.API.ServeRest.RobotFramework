***Settings***
Documentation       Implementação das Keywords da rota /login

***Variables***
&{dados}        emailCorreto=a@qa.com.br    emailIncorreto=fulano@qa.com.br     password=teste

***Keywords***
Login com sucesso e obter token
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