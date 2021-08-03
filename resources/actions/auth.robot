***Settings***
Documentation       Ações de autorização

***Keywords***
Go To Login Page
    #necessário inserir timeout de 20 segundos devido demora no carregamento da página no Chromium
    Go To           https://bodytest-web-david.herokuapp.com/       20

Login With
    [Arguments]     ${email}    ${pass}

    Fill Text       css=input[name=email]           ${email}
    Fill Text       css=input[name=password]   ${pass}
    Click           text=Entrar