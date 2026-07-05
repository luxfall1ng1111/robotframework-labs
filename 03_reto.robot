*** Settings ***
Documentation    Reto de cierre: Calculadora Básica

*** Variables ***
${NUM_1}    20
${NUM_2}    4

*** Test Cases ***
Calculadora Basica
    [Documentation]    Realiza operaciones aritméticas básicas y valida resultados
    ${suma}=              Evaluate    ${NUM_1} + ${NUM_2}
    ${resta}=             Evaluate    ${NUM_1} - ${NUM_2}
    ${multiplicacion}=    Evaluate    ${NUM_1} * ${NUM_2}
    ${division}=          Evaluate    ${NUM_1} / ${NUM_2}
    
    Log To Console        \nResultados de la calculadora:
    Log To Console        Suma: ${suma}
    Log To Console        Resta: ${resta}
    Log To Console        Multiplicación: ${multiplicacion}
    Log To Console        División: ${division}
    
    Should Be Equal As Numbers    ${multiplicacion}    80