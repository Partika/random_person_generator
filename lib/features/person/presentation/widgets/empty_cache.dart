import 'package:flutter/material.dart';

class EmptyCache extends StatelessWidget {
  const EmptyCache({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
