import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';

class Const extends ChangeNotifier {
  //Constants
  final String _appName = 'Chamting';
  final int _navigationPaneIndex = 0;

  final _appId = "8391234f9deb4f87a5f0028c4a775944";

  final _token =
      "0068391234f9deb4f87a5f0028c4a775944IAA2b8j28JzLwOtKmIlByEFzg+fGH1+MNJo0MHZi+qrglqVGIoMAAAAAEABJ0h4OgzUBYgEAAQCDNQFi";

  final String _remoteUid = "";
  //Getters
  String get appName {
    return _appName;
  }

  int get navigationPaneIndex {
    return _navigationPaneIndex;
    notifyListeners();
  }

  String get appId {
    return _appId;
    notifyListeners();
  }

  String get token {
    return _token;
    notifyListeners();
  }

  String get remoteUid {
    return _remoteUid;
    notifyListeners();
  }
}
