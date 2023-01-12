import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:random_person_generator/features/person/presentation/bloc/person/person_bloc.dart';
import '../widgets/widgets.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.adaptive.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: const Color(0xFF8200D1),
          unselectedItemColor: Colors.black,
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          currentIndex: currentPageIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.cardAccountDetailsOutline),
              label: 'INFO',
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.mapSearch),
              label: 'LOCATION',
            ),
          ],
        ),
        body: _bodyBuilder(),
      ),
    );
  }

  Widget _bodyBuilder() {
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        if (state is LoadedState) {
          return Column(
            children: <Widget>[
              PersonHeader(
                person: state.person,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              <Widget>[
                PersonBody(person: state.person),
                LocationBody(person: state.person),
              ][currentPageIndex],
              const Spacer(),
              const PersonControls(),
            ],
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
