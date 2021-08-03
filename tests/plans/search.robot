***Settings***
Documentation       Busca de Planos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenario: Busca plano nome exato

    &{plan}     Create Dictionary       title=Plano exato       duration=7     price=50.00

    Insert Plan                     ${plan}
    Go To Plans
    Search Plan By Title            ${plan.title}
    Plan Should Be Visible          ${plan.title}
    Total Items Should Be           1

    [Teardown]      Thinking and Take Screenshot    2

Cenario: Plano não encontrado

    &{plan}     Create Dictionary       title=Plano inexistente       duration=10     price=5.90
    
    Go To Plans
    Search Plan By Title            ${plan.title}
    Plan Should Not Visible         ${plan.title}

    [Teardown]      Thinking and Take Screenshot    2

Cenario: Buscar planos por único termo

    ${fixture}      Get JSON        plans-search.json
    ${plans}        Set Variable    ${fixture['plans']}

    ${word}         Set Variable    ${fixture['word']}
    ${total}        Set Variable    ${fixture['total']}

    Remove Plan By Title            ${word}

    FOR     ${item}     IN      @{plans}
        Insert Plan     ${item}
    END

    Go To Plans
    Search Plan By Title  ${word}

    FOR     ${item}     IN      @{plans}
        Plan Title Should Be Visible    ${item['title']}
    END

    Total Items Should Be       ${total}

    [Teardown]      Thinking and Take Screenshot    2
