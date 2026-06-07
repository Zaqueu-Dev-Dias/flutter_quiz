# flutter_quiz
  Aplicativo de quiz desenvolvido com Flutter, no qual o usuário pode personalizar a partida escolhendo a dificuldade, a quantidade de perguntas e a categoria das questões.

O funcionamento do aplicativo depende de conexão com a internet, pois as perguntas são obtidas em tempo real através da API Open Trivia Database (OpenTDB): https://opentdb.com. A API permite realizar requisições dinâmicas e filtradas de acordo com as preferências selecionadas pelo usuário.

O projeto foi estruturado seguindo a arquitetura MVVM (Model-View-ViewModel), promovendo a separação de responsabilidades entre a camada de interface e a camada de dados, tornando o código mais organizado, escalável e de fácil manutenção.

Para a comunicação entre as camadas, foi utilizada Injeção de Dependência com o pacote Provider, responsável também pelo gerenciamento de estado da aplicação. Além disso, o padrão de projeto Singleton foi aplicado para garantir instâncias únicas em partes estratégicas do sistema.

Aqui tem algumas imagens mostrando o layout e funcionamento do app.

<img width="200" height="400" alt="e1163068-e629-4dd1-b9e3-2852ffb9cea3" src="https://github.com/user-attachments/assets/b983ee49-0158-4270-811d-5f41b7e1170f" />


<img width="200" height="400" alt="3218fcca-9259-492f-b81d-ecb194debb3d" src="https://github.com/user-attachments/assets/e3843e18-88a3-4885-b33c-5bd040e5397e" />

<img width="200" height="400" alt="8563f9fe-9429-46b1-8349-198008457425" src="https://github.com/user-attachments/assets/9c05955f-1ce5-4474-ad86-2f6afb2edc33" />

<img width="200" height="400" alt="01e02385-b10b-4699-a998-51b76ae40a8a" src="https://github.com/user-attachments/assets/032aa003-fcef-4d93-89aa-63bedcdf5f95" />

<img width="200" height="400" alt="2dd39233-5501-4a7d-9123-849f62c0f6c6" src="https://github.com/user-attachments/assets/698e0fb2-fe5f-4737-a0b0-53b837d3d23c" />

<img width="200" height="400" alt="7c1c83af-b195-45c0-9994-57a91f7305e4" src="https://github.com/user-attachments/assets/b94ba5ad-da3a-457c-93b0-8fcd1864a6f1" />

<img width="200" height="400" alt="8d095b3d-3608-4644-9878-9cef736d8375" src="https://github.com/user-attachments/assets/3cb5e31c-9eb1-4223-b199-9a788231d9f9" />

A API utilizada para obter as questões só traz perguntas no idioma Inglês, mas com a assistência da inteligência artificial conseguir traduzir as perguntas para o Português. 





