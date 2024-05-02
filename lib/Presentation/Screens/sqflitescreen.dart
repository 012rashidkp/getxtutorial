
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SqFlitScreen extends StatelessWidget {
  const SqFlitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth=MediaQuery.of(context).size.width;
    final mheight=MediaQuery.of(context).size.height;
    return Container(
      width: mwidth,
      height: mheight,
      color: Colors.white,
    );

  }
}
