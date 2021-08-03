***Settings***
Documentation       Cadastro de Planos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenario: Calcular preço total do plano

    &{plan}     Create Dictionary       title=David Teste       duration=12     price=19,99     total=R$ 239,88

    Go To Plans
    Go To Form Plan
    Fill Plan Form          ${plan}
    Total Plan Should Be    ${plan.total}

Cenario: Cadastro de plano com sucesso

    &{plan}     Create Dictionary       title=Plano novo       duration=6     price=20,00

    Go To Plans
    Go To Form Plan
    New Plan        ${plan}
    Toaster Text Should Be      Plano cadastrado com sucesso

    [Teardown]      Thinking and Take Screenshot  2

Cenario: Plano sem título

    &{plan}     Create Dictionary       title=${EMPTY}       duration=5     price=70,00
    Go To Plans
    Go To Form Plan
    New Plan                    ${plan}
    Alert Text Should Be        Informe o título do plano

    [Teardown]      Thinking and Take Screenshot  2

Cenario: Plano sem duração

    &{plan}     Create Dictionary       title=Sem duração       duration=${EMPTY}     price=70,00
    Go To Plans
    Go To Form Plan
    New Plan                    ${plan}
    Alert Text Should Be        Informe a duração do plano em meses

    [Teardown]      Thinking and Take Screenshot  2

Cenario: Plano com duração zero

    &{plan}     Create Dictionary       title=Sem duração       duration=0    price=70,00
    Go To Plans
    Go To Form Plan
    New Plan                    ${plan}
    Alert Text Should Be        A duração dever ser no mínimo 1 mês

    [Teardown]      Thinking and Take Screenshot  2

Cenario: Plano com preço mensal zero
    [tags]      temp

    &{plan}     Create Dictionary       title=Preço zero       duration=10    price=0,00
    Go To Plans
    Go To Form Plan
    New Plan                    ${plan}
    Toaster Text Should Be      O valor do plano deve ser maior que zero!

    [Teardown]      Thinking and Take Screenshot  2