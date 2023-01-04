import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConected async {
    // TODO: utilizar connectivity_plus
    final bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }
}
