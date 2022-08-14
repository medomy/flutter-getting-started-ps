import 'package:flutter/material.dart';
import '../shared/menu_drawer.dart';
import '../shared/bottom_menu.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isMetric = true;
  bool isImperial = false;
  double fontSize = 18;
  late List<bool> isSelectedList;
  String hintHeight = "";
  String hintWeight = "";
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  String result = "";

  @override
  void initState() {
    setState(() {
      isSelectedList = [isMetric, isImperial];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    hintHeight = "Enter your height in ${isMetric ? "meters" : "inches"}";
    hintWeight = "Enter your weight in ${isMetric ? "kilos" : "pounds"}";
    return Scaffold(
      appBar: AppBar(title: Text("BMI")),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Center(
                child: ToggleButtons(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Metric",
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Imperial",
                        style: TextStyle(fontSize: fontSize),
                      ),
                    )
                  ],
                  isSelected: isSelectedList,
                  onPressed: tabsPressed,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: txtHeight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: hintHeight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: txtWeight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: hintWeight,
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: getBmi, child: Text("Calculate")),
                  Text(result)
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }

  void tabsPressed(int val) {
    setState(() {
      isSelectedList = [false , false];
    });
    print(val);
    isSelectedList[val] = true;
    print(isSelectedList);
    switch (val) {
      case 0:
        isMetric = true;
        isImperial = false;
        break;
      case 1:
        isImperial = true;
        isMetric = false;
        break;
    }
  }
  void getBmi() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if(isMetric) {
      bmi = weight / (height* height);
    }
    else{
      bmi = weight * 703 /(height * height);
    }
    setState(() {
      result = "Your body weight is ${bmi.toStringAsFixed(2)}";
    });
  }
}
