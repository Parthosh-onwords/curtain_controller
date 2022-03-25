import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool openValue = false;
  bool closeValue = false;
  bool pauseValue = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  Color(0xffECF0f9),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: Container(
                height: height * 0.095,
                width: width * 0.16,
                decoration: BoxDecoration(
                  color: Color(0xffECF0F3),
                  borderRadius: BorderRadius.circular(300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(8.0, 8.0),
                      blurRadius: 9.0,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 7.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("Open",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height*0.011,
                        color: Colors.grey.shade700
                    ),),
                  ],
                )),
              ),
              onTap: () {
                setState(() {
                  // print("hey iam working value:$closeValue");
                  // closeValue = !closeValue;
                  http.put(
                    Uri.parse('http://192.168.1.18/sensor/2/'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, bool>{
                      "Door_Open": true,
                    }),
                  );
                });
              },
            ),

            GestureDetector(
              child: Container(
                height: height * 0.13,
                width: width * 0.22,
                decoration: BoxDecoration(
                  color: Color(0xffECF0F3),
                  borderRadius: BorderRadius.circular(300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(8.0, 8.0),
                      blurRadius: 9.0,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 7.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.pause,size: height*0.060,),
                        Text("pause",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height*0.011,
                          color: Colors.grey.shade700
                        ),),
                      ],
                    )),
              ),
              onTap: () {
                setState(() {
                  // print("hey iam working value:$closeValue");
                  pauseValue = !pauseValue;
                  http.put(
                    Uri.parse('http://192.168.1.18/sensor/2/'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, bool>{
                      "Door_Pause": true,
                    }),
                  );
                });
              },
            ),
            GestureDetector(
              child: Container(
                height: height * 0.095,
                width: width * 0.16,
                decoration: BoxDecoration(
                  color: Color(0xffECF0F3),
                  borderRadius: BorderRadius.circular(300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(8.0, 8.0),
                      blurRadius: 9.0,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 7.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Close",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height*0.011,
                            color: Colors.grey.shade700
                        ),),
                      ],
                    )),
              ),
              onTap: () {
                setState(() {
                  // print("hey iam working value:$closeValue");
                  // closeValue = !closeValue;
                  http.put(
                    Uri.parse('http://192.168.1.18/sensor/2/'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, bool>{
                      "Door_Close": true,
                    }),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
