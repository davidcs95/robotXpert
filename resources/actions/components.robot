***Settings***
Documentation       Ações de componentes genéricos

***Keywords***
## Validations
Field Should Be Type
    [Arguments]     ${element}      ${type}

    ${attr}     Get Attribute       ${element}     type
    Should Be Equal     ${attr}     ${type}

Register Should Not Be Found
    Wait For Elements State         css=div >> text=Nenhum registro encontrado.     visible     5
    Wait For Elements State         css=table       detached        5

Total Items Should Be
    [Arguments]     ${number}

    ${element}      Set Variable       css=#pagination .total

    Wait For Elements State     ${element}      visible     5
    Get Text                    ${element}      ==          Total: ${number}

Toaster Text Should Be
    [Arguments]     ${expect_text}

    # Wait For Elements State      css=.Toastify__toast-body   visible         5
    # Get Text                    css=.Toastify__toast-body   should be       Usuário ou senha inválido

    # combinação de estratégia de busca, utiliza dois sinais de maior (>>)
    Wait For Elements State      css=.Toastify__toast-body >> text=${expect_text}     visible     5

Alert Text Should Be
    [Arguments]     ${expect_text}

    Wait For Elements State      css=form span >> text=${expect_text}     visible     5


## Return Elements & Texts
Get Required Alerts
    [Arguments]     ${index}
    ${span}     Get Text        xpath=(//form//span)[${index}]

    [return]    ${span}