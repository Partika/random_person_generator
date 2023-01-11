# Gerador de Pessoas Aleatórias

Um projeto Flutter desenvolvido com objetivo de aprendizado em TDD e Clean Architecture.

## O que esse aplicativo faz?

No geral, ele pega a resposta da [API](https://randomuser.me) e apresenta alguns campos do resultado para o usuário.

Utilização de bibliotecas e funções:

- [BLoC Test](https://pub.dev/packages/bloc_test),
para realizar testes com os BLoC's.
- [Build Runner](https://pub.dev/packages/build_runner),
para criação rápida de Mocks null safe.
- [Dartz](https://pub.dev/packages/dartz),
para tratar falhas com utilização de Either para tipos.
- [Dio](https://pub.dev/packages/dio),
para fazer requisições a API.
- [Equatable](https://pub.dev/packages/equatable),
para poder saber o grau de igualdade de classes,
sem se basear em igualdade de instância, mas em
igualdade de atributos.
- [Flutter BLoC](https://pub.dev/packages/flutter_bloc),
para utilizar o modelo de design BLoC.
- [Get It](https://pub.dev/packages/get_it),
para armazendar instancias do que será
- [Internet Connection Checker](https://pub.dev/packages/internet_connection_checker),
para verificar conexão com a rede.
- [Map Launcher](https://pub.dev/packages/map_launcher),
para abrir um aplicativo de mapa ao invéz de
manter um mini mapa interno ao aplicativo.
- [Material Design Icons Flutter](https://pub.dev/packages/material_design_icons_flutter),
que disponibiliza ícones do Material Design
que não estão imbutidos no Flutter Icons.
- [Mockito](https://pub.dev/packages/mockito),
para fazer Mocks para utilizar nos testes.
- [Rive](https://pub.dev/packages/rive),
para inserir fundos animados.
- [Shared Preferences](https://pub.dev/packages/shared_preferences),
para armazenar os resultados na cache.
utilizado na execução do aplicativo.
