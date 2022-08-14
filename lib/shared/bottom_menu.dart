import "package:flutter/material.dart";
class BottomMenu extends StatefulWidget {
  const BottomMenu({ Key? key }) : super(key: key);

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _selectedIndex = 0;
  void select (int i){
    setState(() {
      _selectedIndex = i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index){
        switch(index){
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/Bmi');
            break;
          case 2:
            Navigator.pushNamed(context, '/weather');
            break;
          case 3:
            Navigator.pushNamed(context, '/training');
            break;  
        }
        select(index);
        print(_selectedIndex);
      },
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[500],
      items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: "Home"),
      BottomNavigationBarItem(
        icon: Icon(Icons.calculate),
        label: "BMI"),
      BottomNavigationBarItem(
        icon: Icon(Icons.cloud),
        label: "weather"),
        BottomNavigationBarItem(
        icon: Icon(Icons.train),
        label: "trainig")
    ]);
  }
}