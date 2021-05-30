// import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:football/models/person_model.dart';
import 'dart:async';
import 'dart:io';
// import 'package:toast/toast.dart';
import 'dart:convert';

//import 'dart:convert' show json;
import 'package:http/http.dart' as http show Response, get;

class RankScreen extends StatefulWidget {
  @override
  _RankScreenState createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> {
  List _data = [];
  @override
  Widget build(BuildContext context) {
    // List httpRes = [];
    // List<Widget> x = [];
    var mq = MediaQuery.of(context).size;
    // var heght = mq.height;
    var width = mq.width;
    var pwidth = width / 100;
    // var uri = Uri(
    //   scheme: 'https',
    //   host: 'raw.githubusercontent.com',
    //   path: '/b3hzadsh/json/master/football.json',
    // );

    var url = Uri.https('raw.githubusercontent.com',
        '/b3hzadsh/json/master/football.json', {'q': '{http}'});

    // void showToast(
    //   String msg, {
    //   required int duration,
    //   required int gravity,
    // }) {
    //   Toast.show(msg, context, duration: duration, gravity: gravity);
    // }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () async {
          //var connectivityResult = await (Connectivity().checkConnectivity());
          try {
            final result = await InternetAddress.lookup('google.com');
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
              print('connected');
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //new CircularProgressIndicator(),
                            SpinKitPouringHourglass(
                              color: Colors.white,
                              size: width / 3, //50.0
                            )
                          ],
                        ),
                      ),
                    );
                  });
              try {
                http.Response res = await http.get(url);
                String jsonsDataString = res.body.toString();
                _data = jsonDecode(jsonsDataString);
                setState(() {});
                print(_data.toString());
                //
                // httpRes = json.decode(res.body);
                print(_data[1]["NameString"]);
              } // Uri.parse('https://example.org:8080/foo/bar#frag');
              catch (e) {
                print(e);
              }

              Future.delayed(Duration(seconds: 2)).then((_) {
                Navigator.pop(context);
              });
            }
          } catch (e) {
            print("اتصال اینترنت برقرار نیست");
          }

          // showToast(
          //   "اتصال اینترنت برقرار نیست ",
          //   gravity: Toast.CENTER,
          //   duration: Toast.LENGTH_LONG,
          // );
        },
      ),
      body: SafeArea(
        child: (_data != [])
            ?
            //httpRes = json.decode(s);
            Padding(
                padding:
                    EdgeInsets.fromLTRB(3 * pwidth, 20 * pwidth, 3 * pwidth, 0),
                child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, i) {
                    Person x = Person.fromMap(_data[i]);
                    return Padding(
                      padding: EdgeInsets.only(bottom: width * 6 / 100),
                      child: rankWidget(p: x, context: context),
                    );
                  },
                ),
              )
            : Container(),
      ), //
    );
  }
}

Widget rankWidget({
  required Person p,
  required BuildContext context,
}) {
  var mq = MediaQuery.of(context).size;
  var width = mq.width;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(
              width * 2 / 10,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/${p.ID}.jpg",
                ),
              ),
              Text(
                "${p.Namestring}",
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 3 / 100),
                child: Text(
                  "${p.Scoreint}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
      SizedBox(
        width: width * 3 / 100,
      ),
      CircleAvatar(
        child: Text("${p.Rankingint}"),
      ),
    ],
  );
}
/*
 {
                    "NameString": "بهزاد",
                    "ScoreInt": 0,
                    "RankingInt": 5,
                    "ID": 5
          },
*/