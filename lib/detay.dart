import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Detay extends StatelessWidget {
  Detay({this.data});
  final data;
  var bitti_mi = false;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
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
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              child: WebView(
                initialUrl:
                    'https://apps.furkansandal.com/youtuber_app_v1/show_json_sevval_oku.php?renk=white&id=' +
                        this.data["id"].toString(),
                // onPageFinished: (finish) {
                //   setSate(() {
                //     bitti_mi = false;
                //   });
                // },
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                  // onPageFinished: (String finish) {
                  //   onTap:
                  //   () {
                  //     bitti_mi = false;
                  //   };
                  // },
                },
              ),
            ),
            bitti_mi
                ? Container(
                    child: Center(
                      //CircularProgressIndicator(),
                      child: SpinKitWave(
                        color: Colors.red,
                        type: SpinKitWaveType.start,
                      ),
                    ),
                  )
                : Stack(),
          ],
        ),
      ),
    );
  }
}
