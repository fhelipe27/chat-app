# ChatApp

ChatApp é um aplicativo simples de mensagens construído com Flutter que permite aos usuários enviar e receber mensagens. Utiliza o Firebase para autenticação e o Firestore para armazenamento de dados em tempo real.

A ideia do projeto surgiu através de um trabalho passado pelo professor Ricardo na faculdade de ADS. O trabalho consistia em criar um aplicativo de mensagens funcional.

## Recursos

- **Autenticação de Usuário:** Os usuários podem fazer login e logout de forma segura usando a Autenticação do Firebase.
- **Mensagens em Tempo Real:** Mensagens são enviadas e recebidas em tempo real usando o Firestore, proporcionando uma experiência de chat contínua.
- **Lista de Usuários:** Os usuários podem visualizar uma lista de outros usuários registrados e iniciar uma conversa com eles.

## Capturas de Tela

![image](https://github.com/fhelipe27/chat-app/assets/68212163/58a5c8d5-7c68-4014-8887-e8cda2fcc5d4)
![image](https://github.com/fhelipe27/chat-app/assets/68212163/ead12134-20a9-43de-a92b-ba8719d83767)
![image](https://github.com/fhelipe27/chat-app/assets/68212163/213d043c-bf56-4710-9ff9-5f4eb3b260b6)
![image](https://github.com/fhelipe27/chat-app/assets/68212163/2640e35a-d00b-4fe4-9095-793cef5e6eca)

## Como Começar

### Pré-requisitos

- Flutter instalado em sua máquina
- Projeto Firebase criado com Firestore e Autenticação ativados
- Clone este repositório

### Configuração

1. Crie um projeto Firebase em [Firebase Console](https://console.firebase.google.com/).
2. Configure a Autenticação e o Firestore para o seu projeto Firebase.
3. Atualize os arquivos `google-services.json` (para Android) e `GoogleService-Info.plist` (para iOS) nos diretórios `android/app` e `ios` com os gerados para o seu projeto Firebase.

### Executando o Aplicativo

1. Abra um terminal e navegue até o diretório do projeto.
2. Execute `flutter pub get` para obter as dependências.
3. Execute `flutter run` para iniciar o aplicativo em um emulador ou dispositivo conectado.

## Estrutura

O projeto está organizado nos seguintes componentes principais:

- **Páginas:** Contém diferentes páginas/telas da aplicação.
  - `LoginPage`: Gerencia o login do usuário.
  - `RegisterPage`: Gerencia o registro do usuário.
  - `HomePage`: Exibe a lista de usuários e gerencia o logout do usuário.
  - `ChatPage`: Facilita a troca de mensagens em tempo real entre os usuários.

- **Componentes:** Componentes de IU reutilizáveis usados em várias páginas.
  - `MyButton`: Widget de botão personalizado.
  - `MyTextField`: Widget de campo de texto personalizado.
  - `ChatBubble`: Widget para exibir balões de chat.

- **Serviços:** Contém a lógica backend da aplicação.
  - `AuthService`: Gerencia a autenticação do usuário.
  - `ChatService`: Manipula funcionalidades de mensagens usando o Firestore.

## Dependências

- `cloud_firestore`: Para interação com o Firestore.
- `firebase_auth`: Para autenticação do Firebase.
- `provider`: Para gerenciamento de estado.
- `flutter/material.dart`: Componentes de design material do Flutter.

## Agradecimentos

Este aplicativo é uma implementação básica e pode ser estendido com recursos adicionais.

Agradeço ao professor Ricardo pela tarefa dada e oportunidade de ter aprendido com esse projeto.
