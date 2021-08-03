***Settings***
Documentation   Suite de testes de Login do Administrador

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Browser Session

Test Teardown   Take Screenshot

***Test Cases***
Cenário: Login do Administrador

    [tags]          admin
    Go To Login Page
    Login With                  admin@bodytest.com      pwd123
    User Should Be Logged In    Administrador

    # Executa um teardown somente para este cenário
    [Teardown]      Clear LS And Take Screenshot

Cenário: Senha incorreta

    [tags]          temp
    Go To Login Page
    Login With                  admin@bodytest.com      abc123
    Toaster Text Should Be      Usuário e/ou senha inválidos.

    # Simula o usuário pensando
    [Teardown]      Thinking and Take Screenshot  2

Cenário: Email não cadastrado

    [tags]          temp
    Go To Login Page
    Login With                  david@gmail.com      abc123
    Toaster Text Should Be      Usuário e/ou senha inválidos.

    # Simula o usuário pensando
    [Teardown]      Thinking and Take Screenshot  2

Cenário: Email incorreto

    [tags]          temp
    Go To Login Page
    Login With              admin&bodytest.com      pwd123
    Alert Text Should Be    Informe um e-mail válido

Cenário: Senha não informada

    [tags]          temp
    Go To Login Page
    Login With              admin@bodytest.com      ${EMPTY}
    Alert Text Should Be    A senha é obrigatória

Cenário: Email não informado

    [tags]          temp
    Go To Login Page
    Login With              ${EMPTY}      pwd123
    Alert Text Should Be    O e-mail é obrigatório

Cenário: Email e Senha não informados

    [tags]          temp
    Go To Login Page
    Login With              ${EMPTY}      ${EMPTY}
    Alert Text Should Be    O e-mail é obrigatório
    Alert Text Should Be    A senha é obrigatória