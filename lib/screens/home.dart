import 'package:flutter/material.dart';
import '../shared/menu_drawer.dart';
import '../shared/bottom_menu.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomMenu(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/beach.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            child: Text(
              "Yalla bena \n hhhhhhhh",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
      )
      
    );
  }
}