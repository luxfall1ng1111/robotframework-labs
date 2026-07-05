*** Settings ***
Library     SeleniumLibrary
Resource    login_page.resource
Suite Setup       Open Browser    https://www.saucedemo.com    chrome
Suite Teardown    Close Browser
Test Template     Validar Intento De Login

*** Test Cases ***           USUARIO              CLAVE            RESULTADO_ESPERADO
Usuario estandar             standard_user        secret_sauce     exito
Usuario bloqueado            locked_out_user      secret_sauce     error
Clave incorrecta             standard_user        clave_invalida   error
Usuario vacio                ${EMPTY}             secret_sauce     error

*** Test Cases ***
Agregar Producto Al Carrito
    [Template]    NONE
    Go To         https://www.saucedemo.com
    Ingresar Credenciales    standard_user    secret_sauce
    Click Button    id:add-to-cart-sauce-labs-backpack
    Element Text Should Be    class:shopping_cart_badge    1

*** Keywords ***
Validar Intento De Login
    [Arguments]    ${usuario}    ${clave}    ${resultado}
    Go To          https://www.saucedemo.com
    Ingresar Credenciales    ${usuario}    ${clave}
    Run Keyword If    '${resultado}' == 'exito'
    ...    Wait Until Page Contains    Products    timeout=5s
    ...    ELSE
    ...    Wait Until Element Is Visible    ${MSG_ERROR}    timeout=10s