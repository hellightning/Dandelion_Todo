import 'dart:typed_data';

import 'package:dandelion_todo/models/index.dart';
import 'package:dandelion_todo/utils/Global.dart';
import 'package:flutter/widgets.dart';

class ProfileState extends ChangeNotifier {
  // ProfileState() {
  //   userid = Global.getUser();
  //   nickname = Global.getNickname();
  //   password = Global.getPassword();
  //   watchList = Global.getWatchlist();
  // }
  int get userid {
    return Global.getUser();
  }

  String get nickname {
    return Global.getNickname();
  }

  String get password {
    return Global.getPassword();
  }

  List<int> get watchList {
    return Global.WATCHLIST_DYNAMIC;
  }

  void updateWatchlistByUserid(int userid) {
    Global.updateWatchlistByUserid(userid).then((_) {
      notifyListeners();
    });
  }

  void updateWatchlistByNickname(String nickname) {
    Global.updateWatchlistByNickname(nickname).then((_) {
      notifyListeners();
    });
  }

  Uint8List get avatar {
    return Global.AVATAR_DYNAMIC;
  }

  Future updateUser() async {
    notifyListeners();
  }
}
