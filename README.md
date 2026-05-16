# flutter_quiz
  Um jogo de perguntas desenvolvido em Flutter, onde o usuario pode escolher a dificuldade, a quantidade e a categoria das questões.
Para o app funcionar, deve esta conectado a internet para conseguir cosumir os dados atravez da api. A API ultilizada dou os crédito a https://opentdb.com, podendo fazer uma requisição dinâmica e filtrada dos dados.
  O app foi construido de acordo com a arquitetura mvvm, separando a responsabilidade do app em camada de interface e camada de dados.
  Para a comunicação entre camadas foi através da injeção de dependência. Utilizei Provider para fazer injeção de dependencia, padrão de projeto Singleton e gerenciamento de estado.

