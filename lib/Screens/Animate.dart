import 'package:flutter/cupertino.dart';

class ease extends PageRouteBuilder{
  final Widget widget;
  ease({this.widget})
      : super(
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder:(BuildContext context,
          Animation<double> animation,
          Animation<double> secAnimation,
          Widget child){
        animation=CurvedAnimation(
            parent: animation,curve: Curves.easeInOut);
        return ScaleTransition(
          alignment: Alignment.center,
          scale: animation,
          child: child,
        );

      },
      pageBuilder:(BuildContext context,Animation<double> animation,Animation<double> secAnimation){
        return widget;
      }
  );
}