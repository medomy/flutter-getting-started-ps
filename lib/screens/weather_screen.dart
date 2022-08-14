import 'package:flutter/material.dart';
import '../data/weather.dart';
import '../data/weatherapi.dart';
import '../shared/bottom_menu.dart';
import '../shared/menu_drawer.dart';
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({ Key? key }) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather data = Weather('', "", 0, 0, 0, 0);
  final TextEditingController location = TextEditingController();
  Future<void> getWetherData() async {
    WeatherApi inst = new WeatherApi();
    Weather weather = await inst.getTime(location.text !="" ? location.text : "london");
    setState(() {
      data = weather;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomMenu(),
      appBar: AppBar(
        title: Text("Weather page"),
      ),
      body: ListView(
        children:[
          Container(
            padding: EdgeInsets.all(12),
            child: TextField(
              controller: location,
              decoration: InputDecoration(
                hintText: "Please enter the city",
                suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: getWetherData,)
              ),
            ),
          ),
          InfoRow("place", data.name),
          InfoRow("description", data.description),
          InfoRow("temp", data.temp.toStringAsFixed(2)),
          InfoRow("feels Like", data.precieved.toStringAsFixed(2)),
          InfoRow("humidity", data.humdity.toStringAsFixed(2)),
          InfoRow("pressure", data.pressure.toStringAsFixed(2)),
        ]
      ),
      
    );
  }
  Widget InfoRow(String label , String val){
    Widget row = Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(label , style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20
          ),)),
          Expanded(
            flex: 4,
            child: Text(val , style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20
          ),))
        ],
      ),);
    return row;
  }
}
