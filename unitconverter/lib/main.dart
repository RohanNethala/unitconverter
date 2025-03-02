import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Unit Converter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    double unit = 12;
    String unitName = "Length in ft";
    String newUnit = "inches";
    switch (selectedIndex) {
      case 0:
        unit = 12;
        unitName = "length in ft to convert to inches";
        newUnit = "Inches";
        break;
      case 1:
        unit = 2.2;
        unitName = "weight in lbs to convert to kg";
        newUnit = "Kilograms";
        break;
      case 2:
        unit = 33.8;
        unitName = "temperature in Celsius to convert to Fahrenheit";
        newUnit = "Degrees Fahrenheit";
        break;
      case 3:
        unit = 1.6;
        unitName = "speed in mph to convert to km/h";
        newUnit = "Kilometers per hour";
        break;
      default:
        throw UnimplementedError("No widget for $selectedIndex");
    }
    return Scaffold(
      body: Row(children: [
        SafeArea(child: NavigationRail(extended: true, destinations: [
          NavigationRailDestination(icon: Icon(Icons.social_distance), label: Text("Length")),
          NavigationRailDestination(icon: Icon(Icons.scale), label: Text("Weight/mass")),
          NavigationRailDestination(icon: Icon(Icons.thermostat), label: Text("Temperature")),
          NavigationRailDestination(icon: Icon(Icons.speed), label: Text("Speed")),
        ],indicatorColor: Color.fromARGB(12, 12, 12, 12),
        selectedIndex: selectedIndex, onDestinationSelected: (value){
          setState(() {
            selectedIndex = value;
          });
        },)),
        Expanded(child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Enter in $unitName:"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter in a number",
              fillColor: Color.fromARGB(11, 232, 10, 10)
            ),
            controller: myController,
          ),
                  ElevatedButton(onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Conversion"),
              content: Text("The conversion is ${int.parse(myController.text) * unit} $newUnit"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Close"))
              ],
            );
          });
        }, child: Text("Convert")),

        ]))),
        ],
        
      )
      );
  }
}