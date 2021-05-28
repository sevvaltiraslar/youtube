import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detay.dart';
import 'package:share/share.dart';
import 'package:launch_review/launch_review.dart';

class Liste extends StatefulWidget {
  @override
  _ListeState createState() => _ListeState();
}

const color = Color(0x80FFFFFF);

class _ListeState extends State<Liste> {
  @override
  String url =
      'https://apps.furkansandal.com/youtuber_app_v1/show_json_sevval.php';
  List data;
  String text =
      'https://play.google.com/store/apps/details?id=com.sevvaltiraslar.youtube';
  String subject = 'Follow me';

  Future<String> istekAlma() async {
    var istek = await http.get(Uri.encodeFull(url), headers: {
      "Accept": "application/json",
    });

    setState(() {
      var ayiklama = json.decode(istek.body);
      data = ayiklama["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    this.istekAlma();
  }

  Widget build(BuildContext context) {
    if (data == null) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: AppBar(
            backgroundColor: Colors.black,
            title: Center(
              child: Container(
                width: 70.0,
                height: 70.0,
                child: Image.asset(
                  'images/youtube.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            //child: CircularProgressIndicator(),
            child: SpinKitWave(
              color: Colors.red,
              type: SpinKitWaveType.start,
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  child: Image.asset(
                    'images/youtube.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      size: 30.0,
                    ),
                    color: Colors.red,
                    onPressed: () {
                      {
                        final RenderBox box = context.findRenderObject();
                        Share.share(text,
                            subject: subject,
                            sharePositionOrigin:
                                box.localToGlobal(Offset.zero) & box.size);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.star,
                      size: 30.0,
                    ),
                    color: Colors.red,
                    onPressed: () {
                      LaunchReview.launch();
                    },
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, i) {
                    return Container(
                      height: 120,
                      color: Colors.black,
                      child: Center(
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Center(
                            child: ListTile(
                              title: Text(
                                data[i]["baslik"],
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: "Alata",
                                ),
                              ),
                              leading: Image(
                                image: NetworkImage(data[i]["resim_linki"]),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Detay(data: data[i])));
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
