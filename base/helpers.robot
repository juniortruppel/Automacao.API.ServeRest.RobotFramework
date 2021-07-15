***Settings***
Documentation       Keywords e variáveis de utilidade comum

***Variables***
${baseURL}          https://serverest.dev

***Keywords***
Confere status code e reason
    [Arguments]                     ${resp}
    Should Be True                  '${resp.status_code}'=='200'
    Should Be Equal As Strings      ${resp.reason}      OK