import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          height: size.height,
          width: size.width,
          child: const RiveAnimation.asset(
            'assets/background.riv',
            fit: BoxFit.fill,
          ),
        ),
        //RESTO DO BODY
      ],
    );
  }
}
