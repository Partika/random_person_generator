import 'package:flutter/material.dart';
import 'package:random_person_generator/features/person/presentation/pages/person_page.dart';
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
              ),
            ),
          ),
        ),
        Positioned(
          top: 120,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PersonPage()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xFFFFFDD5)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              // TODO: verificar se te pessoa na cache
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
                  const SizedBox(
                    width: 200,
                    child: Text(
                      'GENERATE NEW USER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
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
