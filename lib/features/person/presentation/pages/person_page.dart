import 'package:flutter/material.dart';
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
    return Scaffold(
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
          selectedItemColor: const Color(0xFF8200D1),
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          currentIndex: currentPageIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: 'INFO',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_sharp),
              label: 'LOCATION',
            ),
          ],
        ),
        body: const <Widget>[
          PersonInfo(),
          PersonLocation(),
        ][currentPageIndex]);
  }
}
