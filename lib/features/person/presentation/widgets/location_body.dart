import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../domain/entities/person.dart';
import 'widgets.dart';

class LocationBody extends StatelessWidget {
  final Person person;
  const LocationBody({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFFDD4),
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'ADRESS:',
              style: fieldNameStyle,
            ),
            Text(
              (person.locationStreet +
                      ', Nº ${person.locationNumber}, ' +
                      person.locationCity)
                  .toUpperCase(),
              style: fieldContentStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size.infinite,
                    primary: const Color(0xFF9800F4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () async {
                  await MapLauncher.showMarker(
                    mapType: MapType.google,
                    coords: Coords(double.parse(person.locationLatitude),
                        double.parse(person.locationLongitude)),
                    title:
                        (person.locationStreet + ', ${person.locationNumber}'),
                  );
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(MdiIcons.mapSearch),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text('OPEN ON MAP'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
