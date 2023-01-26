import 'package:portfolio/extra_skills/builder_design_pattern/ingredients/ingredien_class.dart';
import 'package:portfolio/extra_skills/builder_design_pattern/sushi/sushi_all.dart';
import 'package:portfolio/extra_skills/builder_design_pattern/sushi/sushi_class.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const BuilderApp());
}

class BuilderApp extends StatelessWidget {
  const BuilderApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Design Pattern Practice: Builder',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: BuilderAppHomePage(),
        );
      },
    );
  }
}

class BuilderAppHomePage extends StatefulWidget {
  const BuilderAppHomePage({super.key});

  @override
  State<BuilderAppHomePage> createState() => _BuilderAppHomePageState();
}

class _BuilderAppHomePageState extends State<BuilderAppHomePage> {

  List<Sushi> listOfSushies = [
    CookedTunaAndAvocadoHRoll(),
    SalmonAndAvocadoHRoll(),
    VegetarianHRoll(),
    CrispyChickenHRoll()
  ];

  late Sushi dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = listOfSushies.first;
  }

  List<IngredientClass> additionalIngredients = [];

  Container infoBuilder() {
    return Container(
      padding: EdgeInsets.all(20),
          child: Column(children: [
            Text(
              "INFO:",
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 8.w,
             ),
            ),
            Divider(),
            Text(
              "Price",
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 3.w,),
            ),
            Text(dropdownValue.getPrice().toString()+"\n",
            style:TextStyle(
            fontSize: 2.w,)),
            Text(
              "Ingredients",
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 3.w,),
            ),
            Text(dropdownValue.getIngredients()+"\n",
                style:TextStyle(
                  fontSize: 2.w,)),
            Text(
              "Allergens",
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 3.w,),
            ),
            Text(dropdownValue.getAllergens(),
                style:TextStyle(
                  fontSize: 2.w,)),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: const Color.fromARGB(255, 147, 149, 211),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<Sushi>(
              value: dropdownValue,
              items: listOfSushies.map<DropdownMenuItem<Sushi>>((Sushi value) {
                return DropdownMenuItem<Sushi>(
                  value: value,
                  child: Text(value.name ?? ''),
                );
              }).toList(),
              onChanged: (Sushi? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
            infoBuilder(),
          ],
        ),
      ),
    );
  }
}
