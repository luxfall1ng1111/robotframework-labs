*** Settings ***
Library    RequestsLibrary
Library    Browser
Suite Setup       Log    Iniciando suite de regresión completa
Suite Teardown    Close Browser
Test Tags         regresion

*** Test Cases ***
Validar API - Lista de Usuarios
    [Documentation]    Caso API 1
    ${resp}=    GET    https://jsonplaceholder.typicode.com/users/1
    Status Should Be    200    ${resp}

Validar API - Crear Recurso
    [Documentation]    Caso API 2
    &{data}=    Create Dictionary    title=foo    body=bar    userId=1
    ${resp}=    POST    https://jsonplaceholder.typicode.com/posts    json=${data}
    Status Should Be    201    ${resp}

Validar UI - Pagina de Inicio
    [Documentation]    Caso UI 1
    New Browser    headless=True
    New Page       https://www.google.com
    ${title}=      Get Title
    Should Contain    ${title}    Google