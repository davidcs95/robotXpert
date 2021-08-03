***Settings***
Documentation       Busca de alunos

Resource    ${EXECDIR}/resources/base.robot

Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

Library     Collections

***Test Cases***
Cenario: Busca exata

    &{student}    Create Dictionary    name=Steve Jobs    email=jobs@apple.com    age=45    weight=80    feet_tall=1.80

    Remove Student By Name          ${student.name}
    Insert Student                  ${student}
    Go To Students
    Search Student By Name          ${student.name}
    Student Name Should Be Visible  ${student.name}
    Total Items Should Be           1

    [Teardown]      Thinking and Take Screenshot    2

Cenario: Registro não encontrado

    ${name}         Set Variable    Barão Zemo

    Remove Student By Name          ${name}
    Go To Students
    Search Student By Name          ${name}
    Register Should Not Be Found

    [Teardown]      Thinking and Take Screenshot    2

Cenario: Busca alunos por um único termo
    [tags]  json

    ${fixture}      Get JSON    students-search.json
    ${students}     Set Variable    ${fixture['students']}

    ${word}         Set Variable    ${fixture['word']}
    ${total}        Set Variable    ${fixture['total']}

    Remove Student By Name      ${word}    

    FOR     ${item}     IN      @{students}
        Insert Student      ${item}
    END

    Go To Students
    Search Student By Name      ${word}

    FOR     ${item}     IN      @{students}
        Student Name Should Be Visible      ${item['name']}
    END

    Total Items Should Be    ${total}
    
    [Teardown]      Thinking and Take Screenshot    2