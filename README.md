# Gerador de Pessoas Aleatórias

Um projeto Flutter desenvolvido com objetivo de aprendizado em TDD e Clean Architecture.

## O que esse aplicativo faz?

No geral, ele pega a resposta da [API](https://randomuser.me) e apresenta alguns campos do resultado para o usuário.

Utilização de bibliotecas e funções:

- [Dio](https://pub.dev/packages/dio),
para fazer requisições a API.
- [Internet Connection Checker](https://pub.dev/packages/internet_connection_checker),
para verificar conexão com a rede.
- [Shared Preferences](https://pub.dev/packages/shared_preferences),
para armazenar os resultados na cache.
- [Flutter BLoC](https://pub.dev/packages/flutter_bloc),
para utilizar o modelo de design BLoC.
- [Get It](https://pub.dev/packages/get_it),
para armazendar instancias do que será
utilizado na execução do aplicativo.
- [Mockito](https://pub.dev/packages/mockito),
para fazer Mocks para utilizar nos testes.
- [Build Runner](https://pub.dev/packages/build_runner),
para criação rápida de Mocks null safe.
- [BLoC Test](https://pub.dev/packages/bloc_test),
para realizar testes com os BLoC's.
- [Dartz](https://pub.dev/packages/dartz),
para tratar falhas com utilização de Either para tipos.
- [Equatable](https://pub.dev/packages/equatable),
para poder saber o grau de igualdade de classes
sem se basear se são a mesma instância. Para
comparar seus atributos.


