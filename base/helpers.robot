***Settings***
Documentation       Keywords e variáveis de utilidade comum

***Variables***
${baseURL}              https://serverest.dev
&{mensagensRetorno}     loginSucesso=Login realizado com sucesso
...                     dadosInvalidosLogin=Email e/ou senha inválidos
...                     cadastroSucesso=Cadastro realizado com sucesso
...                     alteracaoSucesso=Registro alterado com sucesso
...                     exclusaoSucesso=Registro excluído com sucesso
...                     usuarioExclusaoSucesso=Registro excluído com sucesso
...                     produtoExclusaoSucesso=Registro excluído com sucesso | Nenhum registro excluído
...                     emailJaUtilizado=Este email já está sendo usado
...                     nomeJaUtilizado=Já existe produto com esse nome

***Keywords***
Confere status code e reason
    [Arguments]                     ${resp}
    Should Be True                  '${resp.status_code}' == '200' or '${resp.status_code}' == '201'
    Should Be True                  '${resp.reason}' == 'OK' or '${resp.reason}' == 'Created'