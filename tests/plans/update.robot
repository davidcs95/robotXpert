***Settings***
Documentation       Atualizar Planos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

Library     Collections

***Test Cases***
Cenario: Atualizar plano cadastrado
    [tags]      temp
    
    ${fixture}          Get JSON            plans-update.json
    ${summer}           Set Variable        ${fixture['before']}
    ${quarentine}       Set Variable        ${fixture['after']}

    Remove Plan By Title    ${summer['title']}
    Remove Plan By Title    ${quarentine['title']}

    Insert Plan     ${summer}
    Go To Plans
    Search Plan By Title        ${summer['title']}
    Go To Plan Update Form      ${summer['title']}
    Update A Plan               ${quarentine}
    Toaster Text Should Be      Plano Atualizado com sucesso

    [Teardown]      Thinking and Take Screenshot    2