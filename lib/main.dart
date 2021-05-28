import 'package:flutter/material.dart';
import 'giris.dart';

void main() {
  runApp(Uygulama());
}

class Uygulama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Giris(),
    );
  }
}
