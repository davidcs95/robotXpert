***Settings***
Documentation       Remoção de Planos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenario: Remover plano cadastrado

    &{plan}     Create Dictionary       title=Plano para excluir       duration=6     price=29.99

    Insert Plan                 ${plan}
    Go To Plans
    Search Plan By Title        ${plan.title}
    Request Removal By Title    ${plan.title}
    Confirm Removal
    Toaster Text Should Be      Plano removido com sucesso
    Plan Should Not Visible     ${plan.title}

    [Teardown]      Thinking and Take Screenshot  2

Cenario: Desistir da exclusão do plano

    &{plan}     Create Dictionary       title=Plano desistir excluir       duration=6     price=29.99

    Insert Plan                 ${plan}
    Go To Plans
    Search Plan By Title        ${plan.title}
    Request Removal By Title    ${plan.title}
    Cancel Removal
    Plan Should Be Visible      ${plan.title}

    [Teardown]      Thinking and Take Screenshot  2