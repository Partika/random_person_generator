import 'dart:io';

abstract class NetworkInfo {
  Future<bool> get isConected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConected async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } on SocketException catch (_) {
      return Future.value(false);
    }
  }
}
