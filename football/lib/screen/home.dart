import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    var heght = mq.height;
    var width = mq.width;
    var pwidth = width / 100;

    return SafeArea(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: pwidth * 25,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                child: Center(
                  child: Text(
                    "نمایش رتبه بندی",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                height: pwidth * 7,
                width: pwidth * 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
