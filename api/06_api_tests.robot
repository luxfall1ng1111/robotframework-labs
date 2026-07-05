*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Test Cases ***
Obtener Lista De Usuarios
    ${response}=    GET    url=https://jsonplaceholder.typicode.com/users    verify=${False}
    Status Should Be    200    ${response}
    ${nombre}=    Get Value From Json    ${response.json()}    $..name
    Should Not Be Empty    ${nombre}

Crear Nuevo Usuario
    &{payload}=    Create Dictionary    name=Carlos    username=QA_Engineer
    ${response}=    POST    url=https://jsonplaceholder.typicode.com/users    json=${payload}    verify=${False}
    Status Should Be    201    ${response}

Obtener Usuario Inexistente
    ${response}=    GET    url=https://jsonplaceholder.typicode.com/users/999    expected_status=404    verify=${False}
    Status Should Be    404    ${response}