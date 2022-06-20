import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mitesh013milansir/HomePage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Myapp(),
        '/first': (context) => FirstPage(),
      },
    ),
  );
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List allstudentData = [];

  void getAllData() async {
    var res = await rootBundle.loadString("assets/Data.json");
    var data = jsonDecode(res);

    setState(() {
      allstudentData = data['quotes'];
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic i = ModalRoute.of(context)!.settings.arguments;

    if (i == 1) {
      getAllData();
    } else if(i==2) {
      inspire();
    }
    else if(i==3){
      getAllData();
    }
    else if (i==4){
      inspire();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(
              child: Text(
            "Quote App",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildBuilderDelegate(
             (context, index) {
               return Card(
                           elevation: 5,
                           shape: RoundedRectangleBorder(
                             side: BorderSide(color: Colors.white,width: 70)
                           ,borderRadius: BorderRadius.circular(20)),

                           child: ListTile(
                             leading: Text("${index+1}"),
                             subtitle: Text("${allstudentData[index]['quote']}"),
                             title: Text("${allstudentData[index]['author']}"),
                           ),
                         );

             },
              childCount: allstudentData.length,
            ))
          ],
        ),
          // child: ListView.builder(
          //     itemCount: allstudentData.length,
          //     itemBuilder: (context, i) {
          //       return Card(
          //         elevation: 3,
          //         shadowColor: Colors.blue,
          //         child: ListTile(
          //           subtitle: Text("${allstudentData[i]['quote']}"),
          //           title: Text("${allstudentData[i]['author']}"),
          //         ),
          //       );
          //     }),

      ),
    );
  }

  void inspire() async {
    var res = await rootBundle.loadString("assets/inspire.json");
    setState(() {
      allstudentData = jsonDecode(res);
    });
  }
}
