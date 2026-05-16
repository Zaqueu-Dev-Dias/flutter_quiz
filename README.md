# flutter_quiz
  Aplicativo de quiz desenvolvido com Flutter, no qual o usuário pode personalizar a partida escolhendo a dificuldade, a quantidade de perguntas e a categoria das questões.

O funcionamento do aplicativo depende de conexão com a internet, pois as perguntas são obtidas em tempo real através da API Open Trivia Database (OpenTDB): https://opentdb.com. A API permite realizar requisições dinâmicas e filtradas de acordo com as preferências selecionadas pelo usuário.

O projeto foi estruturado seguindo a arquitetura MVVM (Model-View-ViewModel), promovendo a separação de responsabilidades entre a camada de interface e a camada de dados, tornando o código mais organizado, escalável e de fácil manutenção.

Para a comunicação entre as camadas, foi utilizada Injeção de Dependência com o pacote Provider, responsável também pelo gerenciamento de estado da aplicação. Além disso, o padrão de projeto Singleton foi aplicado para garantir instâncias únicas em partes estratégicas do sistema.

