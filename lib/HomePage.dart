import 'package:flutter/material.dart';

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(child: Text("Quote App",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),

        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/first',arguments: 1);
              },style: ElevatedButton.styleFrom(primary: Colors.amberAccent), child: Text("Motivation Qutoes",style: TextStyle(color: Colors.black),),),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/first',arguments: 2);

              },style: ElevatedButton.styleFrom(primary: Colors.amberAccent), child: Text("Animal Qutoes",style: TextStyle(color: Colors.black),)),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/first',arguments: 3);

              },style: ElevatedButton.styleFrom(primary: Colors.amberAccent), child: Text("Love Qutoes",style: TextStyle(color: Colors.black),)),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/first',arguments: 4);

              },style: ElevatedButton.styleFrom(primary: Colors.amberAccent), child: Text("Sad Qutoes",style: TextStyle(color: Colors.black),)),
            ],
          ),
        ),
      ),
    );
  }


}
