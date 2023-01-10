import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../bloc/person/person_bloc.dart';
import '../widgets/widgets.dart';
import 'person_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }

  Stack buildBody(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const RiveAnimation.asset(
            'assets/animations/background.riv',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 25,
          child: Container(
            alignment: Alignment.topCenter,
            child: const Text(
              'FAKE PROFILE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
        Positioned(
          top: 120,
          child: BlocBuilder<PersonBloc, PersonState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () => isCacheEmpty(context, state),
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xFFFFFDD5)),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: IsPersonInCache(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void isCacheEmpty(BuildContext context, PersonState state) {
    if (state is EmptyState) {
      addRandom(context);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PersonPage(),
      ),
    );
  }

  void addRandom(BuildContext context) {
    BlocProvider.of<PersonBloc>(context).add(GetRandomPersonEvent());
  }
}

class IsPersonInCache extends StatelessWidget {
  const IsPersonInCache({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        if (state is EmptyState) {
          return const EmptyCache();
        } else if (state is LoadingState) {
          return const LoadingWidget();
        } else if (state is LoadedState) {
          return FullCache(person: state.person);
        } else if (state is ErrorState) {
          return MessageDisplay(message: state.message);
        } else {
          return const Text('Algo deu muito errado!');
        }
      },
    );
  }
}
