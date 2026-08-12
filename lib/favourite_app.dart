import 'package:flutter/material.dart';

class favouiteapp extends StatefulWidget {
  const favouiteapp({super.key});

  @override
  State<favouiteapp> createState() => _favouiteappState();
}

class _favouiteappState extends State<favouiteapp> {
List<int> selecteditems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Favourite App")),
        
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                      selecteditems.add(index);
                  setState(() {

                  });
                },
                title: Text(" APP "+"   "+index.toString()),
                trailing: Icon(
                    selecteditems.contains(index)? Icons.favorite:Icons.favorite_border),
              );
            }),
          )
        ],
      ) ,
    );
  }
}
