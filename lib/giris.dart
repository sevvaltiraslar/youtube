import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:film/liste.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Giris extends StatefulWidget {
  @override
  _GirisState createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Liste()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WavyAnimatedTextKit(
                        textStyle: TextStyle(
                          fontFamily: "Alata",
                          fontSize: 20,
                          color: Colors.red,
                        ),
                        text: ["YouTube\'dan Para Kazanma"],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Şevval Tıraşlar",
                        style: TextStyle(
                          fontFamily: "Alata",
                          color: Colors.red,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
