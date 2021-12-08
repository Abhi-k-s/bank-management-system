import 'package:flutter/material.dart';

import 'Animate.dart';
import 'Retrieving_cust.dart';
import 'insert_emp.dart';

class Dashboardemp extends StatefulWidget {
  Dashboardemp({Key key, this.id}) : super(key: key);
  final String id;
  @override
  _DashboardempState createState() => _DashboardempState();
}

class _DashboardempState extends State<Dashboardemp> {

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromRGBO(255, 200, 50, 1);
    //final String id='CID00075';
    return Scaffold(
      body: SingleChildScrollView(
          child:
          Container(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      height: 350.0,
                      decoration: BoxDecoration(color: primaryColor),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 30, 10, 30),


                    child:Text('Welcome\nto\nBank management\nEmployee',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color:Colors.white),),

                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 225.0, right: 25.0, left: 25.0),
                    child: Container(
                      width: double.infinity,
                      height: 375.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0.0, 3.0),
                                blurRadius: 15.0)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon: Icon(Icons.account_balance_wallet),
                                        color: Colors.purple,
                                        iconSize: 80.0,
                                        onPressed: () {
                                          Navigator.push(context,
                                                 MaterialPageRoute(builder: (context) =>listview(id: '',)));
                                          //Navigator.push(context,
                                           //   MaterialPageRoute(builder: (context) =>MyCustomForm()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Query1',
                                        style: TextStyle(
                                            color: Colors.black54,fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon:Icon(Icons.ten_mp),
                                        color: Colors.blue,
                                        iconSize: 80.0,
                                        onPressed: () {
                                          Navigator.push(context, ease(widget:Container()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Query2',
                                        style: TextStyle(
                                            color: Colors.black54,fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),

                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon:Icon(Icons.ac_unit),
                                        color: Colors.pink,
                                        iconSize: 80.0,
                                        onPressed: () {
                                          Navigator.push(context, ease(widget:Container()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Query3',
                                        style: TextStyle(
                                            color: Colors.black54,fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Material(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                      child: IconButton(
                                        padding: EdgeInsets.all(15.0),
                                        icon:Icon(Icons.account_balance_wallet) ,
                                        color: Colors.purpleAccent,
                                        iconSize: 80.0,
                                        onPressed: () {
                                          Navigator.push(context, ease(widget:Container()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Balance',
                                        style: TextStyle(
                                            color: Colors.black54,fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 15.0),



                        ],
                      ),
                    ),
                  ),
                ],
              ),



            ],
          ),
          )


      ),
      floatingActionButton:FloatingActionButton(
        child:IconButton(
          icon: Icon(Icons.add)
        ) ,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>MyCustomForm()));

        },),
    );

  }
}


class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 220);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 220.0 );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

