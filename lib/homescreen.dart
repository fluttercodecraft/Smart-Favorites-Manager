import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Multi Provider"))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
              min: 0,
              max: 1,
              value: value, onChanged: (val) {
                print(val);
                value=val;
            setState(() {

            });
          }),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(color: Colors.green.withOpacity(value)),
                  child: Center(child: Text("container 1")),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(color: Colors.yellow.withOpacity(value)),
                  child: Center(child: Text("container 2")),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
