import 'dart:convert';

import 'package:firstdesign/Pages/conSignInPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Data/User.dart';
import 'firstPage.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  Future<void> save() async {
    var url = Uri.parse(
        "http://10.0.2.2:8080/signup"); //used 10.0.2.2 because of emulator or else (localhost:8080)

    // Create a Map containing your data
    var data = {
      'name': user.name,
      'password': user.password,
    };

    // Encode the data as a JSON string
    var jsonData = jsonEncode(data);

    var res = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData, // Use the JSON data here
    );

    print(res.body);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const conSignInPage()));
  }

  User user = User("", ""); //initially empty

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CupertinoColors.destructiveRed,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Continue", style: TextStyle(fontSize: 36,
                      fontWeight: FontWeight.w600,)),
                  ),
                ),


                Container(
                  width: 350,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 6,
                          offset: const Offset(0, 4)
                      )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: CupertinoColors.destructiveRed),
                              boxShadow: [BoxShadow(
                                  color: Colors.white70.withOpacity(0.3),
                                  blurRadius: 4,
                                  spreadRadius: 3,
                                  offset: const Offset(0, 3)
                              )
                              ]
                          ),
                          child: Padding(padding: const EdgeInsets.only(
                              left: 10),
                            child: TextField(
                              controller: TextEditingController(
                                  text: user.name),
                              onChanged: (value) {
                                user.name = value;
                              },
                              style: const TextStyle(
                                color: CupertinoColors
                                    .destructiveRed, // Change this color to your desired text color
                              ),
                              decoration: const InputDecoration(
                                hintText: "Enter your Name",
                                hintStyle: TextStyle(
                                    color: Colors.black54
                                ),
                                border: InputBorder.none,

                              ),
                            ),)
                      ),

                      Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: CupertinoColors.destructiveRed),
                              boxShadow: [BoxShadow(
                                  color: Colors.white70.withOpacity(0.3),
                                  blurRadius: 4,
                                  spreadRadius: 3,
                                  offset: const Offset(0, 3)
                              )
                              ]
                          ),
                          child: Padding(padding: EdgeInsets.only(left: 10),
                            child: TextField(
                              obscureText: true,
                              controller: TextEditingController(
                                  text: user.password),
                              onChanged: (value) {
                                user.password = value;
                              },
                              style: const TextStyle(
                                color: CupertinoColors
                                    .destructiveRed, // Change this color to your desired text color
                              ),
                              decoration: const InputDecoration(
                                hintText: "Enter your Password",
                                hintStyle: TextStyle(
                                    color: Colors.black54
                                ),
                                border: InputBorder.none,

                              ),
                            ),)
                      ),

                      GestureDetector(
                        onTap: () {
                          save();
                        },
                        child: Container(
                          height: 45,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: CupertinoColors.destructiveRed,
                              boxShadow: [BoxShadow(
                                  color: CupertinoColors.destructiveRed
                                      .withOpacity(0.3),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  offset: const Offset(0, 2)
                              )
                              ]
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Sign Up", style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(padding: EdgeInsets.only(left: 30),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const firstPage()));
                        },
                        child: Container(
                          height: 45,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black87,
                              boxShadow: [BoxShadow(
                                  color: Colors.black87.withOpacity(0.3),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  offset: const Offset(0, 2)
                              )
                              ]
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Back", style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),),
                          ),
                        ),
                      )

                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
