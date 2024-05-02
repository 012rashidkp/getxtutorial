
import 'package:flutter/cupertino.dart';

class ResponsiveSize extends StatelessWidget {
  Widget mobile;
  Widget tablet;
  Widget desktop;


  ResponsiveSize({required this.mobile, required this.tablet, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth<768){
        return mobile;
      }
      else if(constraints.maxWidth>768){
        return desktop;
      }
      else{
        return tablet;
      }
    });
  }
}
