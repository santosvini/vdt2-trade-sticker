*** Settings ***
Documentation    Login tests

Library          Browser

*** Keywords ***
Go To Login Page
    New Page           https://trade-sticker-dev.vercel.app/

Submit Credentials
    [Arguments]        ${email}    ${password}
    Fill Text          css=input[name=email]         ${email}
    Fill Text          css=input[name=password]      ${password}
    Click              css=button >> text=Entrar

Toast Message Should Be
    [Arguments]         ${message}
    ${locator}          Set Variable          css=.Toastify__toast-body div >> text=${message}

    Wait For Elements State    ${locator}    visible    3

Submit Without Password
    [Arguments]        ${email}
    Fill Text          css=input[name=email]         ${email}
    Click              css=button >> text=Entrar

Toaster Without Password
    [Arguments]        ${message}
    ${locator}         Set Variable            css=.Toastify__toast-body div >> text=${message}

Submit Without Email
    [Arguments]        ${password}
    Fill Text          css=input[name=password]         ${password}
    Click              css=button >> text=Entrar

Toaster Without Email
    [Arguments]        ${message}
    ${locator}         Set Variable            css=.Toastify__toast-body div >> text=${message}

Submit Without Credentials
    Click              css=button >> text=Entrar

Toaster Without Credentials
    [Arguments]        ${message}
    ${locator}         Set Variable            css=.Toastify__toast-body div >> text=${message}