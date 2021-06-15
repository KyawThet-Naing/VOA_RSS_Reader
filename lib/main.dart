import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

void main() => runApp(VOARss());

class VOARss extends StatelessWidget {
  const VOARss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VOA News',
      home: Home(),
    );
  }
}
