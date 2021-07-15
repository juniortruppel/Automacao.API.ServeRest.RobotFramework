***Settings***
Documentation       Implementação das Keywords da rota /usuarios

***Variables***


***Keywords***
Listar usuarios
    ${resp}                                         GET                     ${baseURL}/usuarios
    
    ${1}        Get Dictionary Items                ${resp.json()}      usuarios
    ${11}       Get From Dictionary                 ${1}                nome
    Log         ${11}
    Log         ${1}
    ${2}        Get Dictionary Keys                 ${resp.json()}      usuarios
    Log         ${2}
    ${3}        Get Dictionary Values               ${resp.json()}      usuarios
    Log         ${3}

    #${teste}=                                       Get From Dictionary     ${resp.json()}      usuarios
    #${teste2}=                                      Get From List           ${teste}            1
    
    Confere status code e reason                    ${resp}
    Confere a quantidade de usuários cadastrados    ${resp}

Buscar ${nome}
    ${resp}                             GET     ${baseURL}/usuarios/{${id}}
    Confere status code e reason        ${resp}

Confere a quantidade de usuários cadastrados
    [Arguments]                         ${resp}
    Length Should Be                    ${resp.json()["usuarios"]}              6