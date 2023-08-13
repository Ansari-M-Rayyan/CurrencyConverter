import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'currency_converter_cupertino_type.dart';
import 'currency_converter_material_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // build function is use to render stuffs on the screen
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CCP(),
    );
  }
}

class MyCupertino extends StatelessWidget {
  const MyCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: Cupertino(),
    );
  }
}
