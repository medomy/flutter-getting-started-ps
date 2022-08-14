import 'package:shared_preferences/shared_preferences.dart';
import './session.dart';
import 'dart:convert';

class SpHelper {
  static late SharedPreferences sp;

  Future init() async {
    sp = await SharedPreferences.getInstance();
  }

  Future setShared(Session session) async {
    await sp.setString(session.id.toString(), json.encode(session.toJson()));
  }

  List<Session> getSessions() {
    List<Session> sessions = [];
    Set<String> keys = sp.getKeys();
    keys.forEach((String key) {
      if (key != "counter") {
        Session session =
            Session.fromJson(json.decode(sp.getString(key) ?? ""));
        sessions.add(session);
      }
    });
    return sessions;
  }

  Future setCounter() async {
    int counter = sp.getInt("counter") ?? 0;
    counter++;
    await sp.setInt("counter", counter);
  }

  int getCounter() {
    return sp.getInt("counter") ?? 0;
  }

  Future deleteSession(int id) async {
    sp.remove(id.toString());
  }
}
