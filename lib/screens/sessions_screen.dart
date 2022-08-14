import 'package:flutter/material.dart';
import '../data/session.dart';
import '../data/spHelper.dart';
import '../shared/bottom_menu.dart';
import '../shared/menu_drawer.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SpHelper helper = SpHelper();
  @override
  void initState() {
    helper.init().then((value) => updateSessions());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomMenu(),
      appBar: AppBar(
        title: Text("training sessions"),
        centerTitle: true,
      ),
      body: ListView(
        children: tiles(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlert(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> showAlert(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("session register"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: TextField(
                      controller: txtDescription,
                      decoration:
                          InputDecoration(hintText: "write a description"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: TextField(
                      controller: txtDuration,
                      decoration: InputDecoration(hintText: "duration"),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    txtDescription.text = "";
                    txtDuration.text = "";
                  },
                  child: Text("cancel")),
              ElevatedButton(onPressed: saveSession, child: Text("save"))
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime date = DateTime.now();
    String day = "${date.year} - ${date.month} - ${date.day}";
    int id = helper.getCounter() + 1;
    Session session = Session(
        id, txtDescription.text, int.tryParse(txtDuration.text) ?? 0, day);
    await helper.setShared(session).then((value) {
      updateSessions();
      helper.setCounter();});
    txtDescription.text = "";
    txtDuration.text = "";
    Navigator.pop(context);
  }
  List<Widget> tiles(){
    List<Widget> tiles = [];
    sessions.forEach((Session session) { 
      tiles.add(
        Dismissible(
          key: UniqueKey(),
          onDismissed: (_){
            helper.deleteSession(session.id).then((value) => updateSessions());
          },
          child: ListTile(
            title: Text(session.description),
            subtitle: Text("${session.date} - duration ${session.duration} min(s)"),
          ),
        )
      );
    });
    return tiles;
  }
  void updateSessions(){
    setState(() {
      sessions = helper.getSessions();
    });
  }
}
