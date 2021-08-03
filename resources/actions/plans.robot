***Settings***
Documentation       Ações da feature de gestão de planos

***Variables***
${TITLE_FIELD}          id=title
${DURATION_FIELD}       id=duration
${PRICE_FIELD}          css=input[name=price]
${TOTAL_FIELD}          css=input[name=total]


***Keywords***
## Forms
Submit Plan Form
    Click           xpath=//button[contains(text(), "Salvar")]

Fill Plan Form
    [Arguments]     ${plan}

    Fill Text       ${TITLE_FIELD}          ${plan.title}
    Fill Text       ${DURATION_FIELD}       ${plan.duration}
    Fill Text       ${PRICE_FIELD}          ${plan.price}

New Plan
    [Arguments]         ${plan}

    Fill Plan Form      ${plan}
    Submit Plan Form

Update A Plan
    [Arguments]     ${plan}

    Fill Text       ${TITLE_FIELD}          ${plan['title']}
    Fill Text       ${DURATION_FIELD}       ${plan['duration']}
    Fill Text       ${PRICE_FIELD}          ${plan['price']}

    Submit Plan Form

Search Plan By Title
    [Arguments]     ${title}

    Fill Text       css=input[placeholder='Buscar plano']       ${title}

## Links & Buttons
Go To Form Plan
    Click                       css=a[href$='planos/new']
    Wait For Elements State     css=h1 >> text=Novo plano           visible     5

Request Removal By Title
    [Arguments]     ${title}
    
    Click           xpath=//td[contains(text(), "${title}")]/../td//button[@id="trash"]

Go To Plan Update Form
    [Arguments]     ${title}

    Click           xpath=//td[contains(text(), "${title}")]/..//a[@class='edit']

## Validations
Total Plan Should Be
    [Arguments]     ${total}

    Get Attribute       ${TOTAL_FIELD}      value       should be      ${total}

Plan Should Not Visible
    [Arguments]     ${title}

    Wait For Elements State      xpath=//td[contains(text(), "${title}")]    detached    5

Plan Should Be Visible
    [Arguments]     ${title}

    Wait For Elements State      xpath=//td[contains(text(), "${title}")]    visible    5

Plan Title Should Be Visible
    [Arguments]    ${name}

    Wait For Elements State    css=table tbody tr >> text=${name}       visible     5