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
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFDD4),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 5),
            color: Color(0x88000000),
          )
        ],
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
              child: Center(
                child: FloatingActionButton.extended(
                  backgroundColor: const Color(0xFF9800F4),
                  onPressed: () async {
                    await MapLauncher.showMarker(
                      mapType: MapType.google,
                      coords: Coords(double.parse(person.locationLatitude),
                          double.parse(person.locationLongitude)),
                      title: (person.locationStreet +
                          ', ${person.locationNumber}'),
                    );
                  },
                  icon: const Icon(MdiIcons.mapSearch),
                  label: const Text('OPEN ON MAP'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
