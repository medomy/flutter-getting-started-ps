import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/bmi_screen.dart';
import '../screens/weather_screen.dart';
import '../screens/sessions_screen.dart';
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:menuItems(context),
      ),
    );
  }
  List<Widget>menuItems(BuildContext context){
    final List<String> itemsNames = [
      "Home",
      "Calculator",
      "Weather",
      "training sessions"
    ];
    List<Widget>menuLists = [];
    menuLists.add(
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue
        ),
        child: Text(
        "Drawer title",
        style: TextStyle(
          fontSize: 26,
          color: Colors.white60
        ),))
    );
    itemsNames.forEach((element) {
      Widget screen = Container();
      menuLists.add(ListTile(
        title: Text(element),
        onTap: (){
          switch(element) {
            case 'Home':
              screen = HomeScreen();
              break;
            case "Calculator":
              screen = BMI();
              break;
            case "Weather":
              screen = WeatherScreen();
              break;
            case "training sessions":
              screen = SessionsScreen();
              break;
          }
          //to eliminate the drawer from navigation
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen)
          );

        },
      ));
     });
     return menuLists;
  }
}