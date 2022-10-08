*** Settings ***
Documentation        Login tests

Resource    ../resources/main.resource

Test Setup       Start Test
Test Teardown    Finish Test


*** Test Cases ***
Deve logar com sucesso
    Go To Login Page
    Submit Credentials    papito@gmail.com    vaibrasil
    User Logged In

Não deve logar com senha incorreta
    Go To Login Page
    Submit Credentials        papito@gmail.com    abc123
    Toast Message Should Be   Credenciais inválidas, tente novamente!

Deve informar a senha secreta
    [Tags]    password
    Go To Login Page
    Submit Without Password    papito@gmail.com
    Toaster Without Password   Por favor, informe a sua senha secreta!


Deve informar e-mail
    [Tags]    email
    Go To Login Page
    Submit Without Email    vaibrasil
    Toaster Without Email   Por favor, informe o seu email!


Deve informar as credenciais de acesso
    [Tags]    notcred
    Go To Login Page
    Submit Without Credentials
    Toaster Without Credentials    Por favor, informe suas credenciais!