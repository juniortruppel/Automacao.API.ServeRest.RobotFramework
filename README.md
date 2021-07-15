**# Repositório para fins de estudo.**

**Utilizando o Robot Framework, foi realizado a automação de testes de API, onde foi automatizado todas as rotas do servidor REST "ServeRest".**

O ServeRest é um servidor REST que simula uma loja virtual com intuito de servir de material de estudos de testes de API (mais informações https://serverest.dev/).

________________________________________

**Estrutura do Projeto:**

Utilizado o padrão Page Object.
Utilizado o método de desenvolvimento TDD, mas pode ser facilmente transcrevido para BDD.
No diretório da pasta "ServeRest", existe a pasta "tests" que contém o arquivo tests.robot, é nele que temos os casos de teste, e ele é o arquivo que deve ser executado ao rodar os testes.
No diretório da pasta "ServeRest", temos a pasta "pages", dentro dela temos as pastas que correspondem as rotas da nossa API, e dentro de cada uma destas pastas, temos a implementação das Keywords que são chamadas no arquivo tests.robot.
Os arquivos faturamento.robot e conferenciasXML.robot possuem as implementações das Keywords que foram criadas para automação.

________________________________________

**Requisitos**

Python Instalado e configurado
- https://www.python.org/downloads/

Instalação do Robot Framework e das libraries externas:
  - pip install robotframework
  - pip install robotframework-requests (Testes de API)
  - pip install robotframework-faker (Geração de dados fakes)

Necessário baixar o driver do navegador que será executado os testes, e informado tal .exe na pasta Scripts que fica dentro da pasta do Python

**Instruções para execução**

Linha de comando: robot -d ./results -i login serverest/tests/tests.robot

-d seguido do diretório da pasta aonde será registrado os logs
-i seguido do nome da tag presente no arquivo tests.robot, com isso será executado apenas os testes correspondentes a esta tag

OBS: -d e -i não são obrigatórios
