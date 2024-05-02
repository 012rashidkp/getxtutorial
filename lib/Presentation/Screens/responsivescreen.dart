
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxexample/Presentation/responsive/responsivesize.dart';
import 'package:getxexample/Utility/colors.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth=MediaQuery.of(context).size.width;
    final mheight=MediaQuery.of(context).size.height;
    return Container(
      color: bodycolor,
      child:  ResponsiveSize(
        mobile:Container() ,
        tablet:Container() ,
        desktop: Container(),
      )


    );
  }
}
