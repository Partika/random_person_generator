import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Pessoa Aleatoria'),
      // ),
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }

  Widget buildBody(BuildContext context) {
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
                fontFamily: 'Inter',
              ),
            ),
          ),
        ),
        Positioned(
          top: 120,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xFFFFFDD5)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(60),
                      child: const Image(
                        image: AssetImage('assets/images/local_image.png'),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  Column(
                    children: const <Widget>[
                      Text(
                        'GENERATE NEW',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'USER',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
