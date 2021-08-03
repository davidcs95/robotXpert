***Settings***
Documentation       Cadastro de alunos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenário: Novo aluno

    &{student}         Create Dictionary   name=David Costa Souto    email=david@gmail.com    age=25    weight=85    feet_tall=1.78

    Remove Student      ${student.email}
    Go To Students
    Go To Form Students
    New Student         ${student}
    Toaster Text Should Be      Aluno cadastrado com sucesso.

    [Teardown]      Thinking and Take Screenshot  2

Cenário: Não deve permitir email duplicado
    [tags]      dup

    &{student}         Create Dictionary   name=João Henrique    email=joao@gmail.com    age=20    weight=72    feet_tall=1.75

    Insert Student      ${student}
    Go To Students
    Go To Form Students
    New Student         ${student}
    Toaster Text Should Be      Email já existe no sistema.

    [Teardown]      Thinking and Take Screenshot  2

Cenário: Todos os campos devem ser obrigatórios
    
    @{expected_alerts}      Set Variable    Nome é obrigatório    O e-mail é obrigatório    idade é obrigatória    o peso é obrigatório    a Altura é obrigatória
    @{got_alerts}           Create List

    Go To Students
    Go To Form Students
    Submit Student Form

    # FOR    ${alert}     IN      @{expected_alerts}
    #     Alert Text Should Be  ${alert}
    # END

    FOR     ${index}    IN RANGE    1   6
        ${span}     Get Required Alerts         ${index}
        Append To List      ${got_alerts}       ${span}
    END

    Log     ${expected_alerts}
    Log     ${got_alerts}

    Lists Should Be Equal       ${expected_alerts}      ${got_alerts}

Cenário: Validação dos campos númericos
    [tags]          temp

    # define como template a keyword para executar steps que são parecidos e só mudam uma saída
    [Template]      Check Type Field On Student Form
    ${AGE_FIELD}            number
    ${WEIGHT_FIELD}         number
    ${FEET_TALL_FIELD}      number

Cenário: Validar campo do tipo email
    [tags]          temp

    [Template]      Check Type Field On Student Form
    ${EMAIL_FIELD}          email

Cenário: Menor de 14 anos não pode fazer cadastro
    &{student}         Create Dictionary   name=Livia da Silva    email=livia@yahoo.com    age=13    weight=50    feet_tall=1.65

    Go To Students
    Go To Form Students
    New Student                 ${student}
    Alert Text Should Be        A idade deve ser maior ou igual 14 anos

***Keywords***
# essa keyword é na verdade um template de comportamento, por isto ficará junto dos testes
Check Type Field On Student Form
    [Arguments]     ${element}      ${type}

    Go To Students
    Go To Form Students
    Field Should Be Type          ${element}    ${type}