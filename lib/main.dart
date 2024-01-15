import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _prelim = TextEditingController();
  TextEditingController _midterm = TextEditingController();
  TextEditingController _finals = TextEditingController();
  double ave = 0;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(
                  controller: _prelim,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Prelim'
                  ),
                )),
                SizedBox(width: 20,),
                Expanded(child: TextField(
                  controller: _midterm,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Midterm'
                  ),
                )),
                SizedBox(width: 20,),
                Expanded(child: TextField(
                  controller: _finals,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    labelText: "Finals"
                  ),
                )),
                SizedBox(width: 20,),
              Text("${ave}"),
                SizedBox(width: 20,),
                Text((ave >= 75)? "PASSED" : "FAILED", style: TextStyle(color: (ave >= 75)? Colors.green : Colors.red),),
              ],
            ),

            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              double prelim = double.parse(_prelim.text) * .30;
              double midterm = double.parse(_midterm.text) * .30;
              double finals = double.parse(_finals.text) * .40;

              setState(() {
                ave = prelim + midterm + finals;
              });
            }, child: Text("Compute"))
          ],
        ),
      ),
    );
  }
}
