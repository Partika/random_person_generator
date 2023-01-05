import 'package:flutter/material.dart';
import 'package:tarefa_2/features/person/presentation/pages/person_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Person App',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const PersonPage(),
    );
  }
}
