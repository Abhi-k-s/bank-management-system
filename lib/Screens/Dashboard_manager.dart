import 'package:bank_management/Screens/retrieve_manager.dart';
import 'package:flutter/material.dart';

import 'Animate.dart';
import 'login.dart';

class Dashboardman extends StatefulWidget {
  Dashboardman({Key key, this.id}) : super(key: key);
  final String id;
  @override
  _DashboardmanState createState() => _DashboardmanState();
}

class _DashboardmanState extends State<Dashboardman> {

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromRGBO(255, 200, 50, 1);
    //final String id='CID00075';
    final b=TextEditingController();
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        leading: IconButton(
        onPressed: () {Navigator.push(context,
            MaterialPageRoute(builder: (context) =>Login()));
    },
          icon: Icon(Icons.logout, size: 20, color: Colors.black,),)

      ),
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


                    child:Text('Welcome\nto\nBank management\nManager',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color:Colors.white),),

                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 200.0, right: 25.0, left: 25.0),
                    child: Container(
                      width: double.infinity,
                      height: 395.0,
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
                                              MaterialPageRoute(builder: (context) =>bank()));
                                          //Navigator.push(context,
                                          //   MaterialPageRoute(builder: (context) =>MyCustomForm()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Banks and loan',
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
                                        icon:Icon(Icons.account_balance),
                                        color: Colors.blue,
                                        iconSize: 80.0,
                                        onPressed: () {
                                          Navigator.push(context, ease(widget:acc()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Number of accounts \nin each banks',
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
                                          Navigator.push(context, ease(widget:risk()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('High risk loans',
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
                                        icon:Icon(Icons.account_balance_outlined) ,
                                        color: Colors.purpleAccent,
                                        iconSize: 80.0,
                                        onPressed: () {
                                          Navigator.push(context, ease(widget:branch()));
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text('Branches of \neach bank',
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
        Padding(
          padding: EdgeInsets.only(left: 25.0, bottom: 25.0,top: 622,),
          child: Container(
            height:105.0,
            width: 350,
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
                        horizontal: 20.0, vertical: 20.0),
                    child: Row(
                   children:<Widget>[
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children:<Widget>[

                        Text('Get \ncustomer \nloans:',style: TextStyle(fontWeight: FontWeight.bold),),
                       Container(
                         padding: EdgeInsets.only(left:15),
                         width: 150,
                         child: TextField(
                           controller: b,
                           decoration: InputDecoration(
                             labelText: 'Enter Cust-ID',
                              // hintText: 'Enter CUST-ID'
                           ),
                         ),
                       ),
                  ]
                     ),
                     Row(
                      children:<Widget>[

]),
                     Row(
                         children:<Widget>[
                     MaterialButton(

                 color: Colors.pink,
                      minWidth: 60,
                       height: 35,
                    padding: EdgeInsets.all(20),
                   child: Text(
                    'search',
                    style: TextStyle(color: Colors.yellow),
                      ),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(55.0)),
                  onPressed: (){
                    Navigator.push(context, ease(widget:indivi(id:b.text)));

                  }
                   )
                      ]
                     )
                   ]
                )
                )
              ]
            )

          )
        )

                ],
              ),



            ],
          ),
          )
      ),
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

