import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_person_generator/features/person/presentation/bloc/person/person_bloc.dart';
import 'package:random_person_generator/features/person/presentation/pages/dashboard_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await di.sl.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<PersonBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Random Person App',
        theme: ThemeData(
          backgroundColor: const Color(0xFFF6F6F6),
          fontFamily: 'Inter',
        ),
        // home: const PersonPage(),
        home: const DashboardPage(),
      ),
    );
  }
}
