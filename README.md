# quiz_app

Trata-se de uma app de quiz que aborda questões teóricas sobre a Programação Orientada a Objetos. 
Será apresentada a seguir as telas do aplicativo quiz_app.

## Tela Inicial

O app começa com a tela inicial do Sign In, se o usuário já estiver com cadastro, ao inserir seus dados e clicar em Sing In, seguirá para tela de carregamento e logo após entrará no quiz. Se apertar o botão sem preencher os campos, será apresentado mensagem solicitando que o usuário entre com os valores para os devidos campos.
Quem não estiver cadastrado, poderá navegar para tela de cadastro. Na parte inferior da tela de Sign In tem a opção para entrar na tela
de cadastro (clicando em Sign Up).

![tela login](https://user-images.githubusercontent.com/28979812/95824133-2879ca80-0d05-11eb-98c3-c9c3535ca2ca.png)


## Tela Cadastro (Sign Up)

Na tela de cadastro o usuário ao preencher todos os dados (nome, email e senha) será feito seu devido cadastro no firebase. Em seguida o app apresentará,
a tela inicial do app (tela do Sign In). Caso não seja apresentado nenhum nome, email ou senha e o usuário aperte no botão Sign Up, será apresentado mensagem 
solicitando que o usuário entre com os valores para os devidos campos.


![tela cadastro](https://user-images.githubusercontent.com/28979812/95824129-27489d80-0d05-11eb-9e7a-77ec507d2abd.png)

![firebase authentication](https://user-images.githubusercontent.com/28979812/95824137-29126100-0d05-11eb-99f0-830aaf01dfd0.png)


## Tela Carregamento

Tela criada para apresentar uma barra de progresso e as assets/images (backgraund e logo do app quiz).

![tela carregamento 01](https://user-images.githubusercontent.com/28979812/95955231-e323ce80-0dd2-11eb-8da2-b139dd15bb57.png)


## Tela do Quiz (Quiz Page)

Como trata-se de um quiz são questões múltipla escolha com 4 alternativas por pergunta e só uma está correta. Ao todo são 10 perguntas. Como o Flutter trabalha bem o quesito visual foram usadas animações para quando o usuário tivesse êxito em uma pergunta apresentar uma animação verde, caso ele erre será apresentado um outra animação, desta vez vermelha.
Além das animações, cada alternativa possui uma cor dando um visual interessante para o usuário.

![tela pergunta](https://user-images.githubusercontent.com/28979812/95824143-29aaf780-0d05-11eb-9801-c0f13abd74f3.png) 
![tela pergunta quando acerta](https://user-images.githubusercontent.com/28979812/95824140-29aaf780-0d05-11eb-836f-0d2cdf32298f.png) 
![tela pergunta quando erra](https://user-images.githubusercontent.com/28979812/95824142-29aaf780-0d05-11eb-8b91-df50a0c816e2.png)


## Tela da Pontuação (Score Page)
Última tela a tela onde é apresentada a pontuação final que foi atingida pelo usuário do quiz_app. Nesta tela o usuário pode além de ver seus pontos obtidos ter duas
opções: Se ele apertar o icone de refresh ele volta para tela de carregamento e inicializa o quiz novamente (inicializa com a pontuação zerada). Se clicar no Icone de saída
volta para tela de Sign In.

![tela pontuação](https://user-images.githubusercontent.com/28979812/95824139-29126100-0d05-11eb-959d-9e713e49f91f.png)

## Esquema das comunicações entre as telas

![Quiz_app-esquema](https://user-images.githubusercontent.com/28979812/95828836-d5574600-0d0b-11eb-8284-48ddb4eef98f.jpg)


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
