

import 'package:bank_management/Screens/Dashboard_employee.dart';
import 'package:bank_management/Screens/Retrieving_cust.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:postgres/postgres.dart';

import 'Dashboard_cust.dart';
class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  var curselected='Customer';
  final Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:SingleChildScrollView(

    child: Padding(
      
      padding: const EdgeInsets.only(left: 100,top: 200),
      child: Column(
        children: [
          Row(
            children: [
              DropdownButton<String>(
                items: <String>['Customer', 'Employee', 'Manager'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String newVal) {
                  setState(() {
                    this.curselected=newVal;
                  });
                },
                value: this.curselected,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: 58,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey[300])
                ),
                child:
                TextField(
                  controller: Controller,
                  decoration: InputDecoration(
                    hintText: "Enter ID",
                    contentPadding: EdgeInsets.only(left: 5,bottom: 10,top:0,right: 0),
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize:15,color: Colors.blue,),

                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              MaterialButton(
                  color: Colors.blue,
                  minWidth: 60,
                  height: 45,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.red),
                  ),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(55.0)),
                  onPressed: (){
                    if(this.curselected=='Customer'){
                      String x=Controller.text;
                      // cusheck(context, x);
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>Dashboard_cust(id:x)));

                    }
                    else if(this.curselected=='Employee')
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>Dashboardemp()));
                  }
              ),
            ],
          ),
        ],
      ),
    ),
      ),
    );

  }
}

// void cusheck(BuildContext context,String id)async{
//   var data =await getbal(id);
//   if(data.data[0]){
//     Navigator.push(context,MaterialPageRoute(builder: (context) =>Dashboard_cust(id:id)));
//
//   }
//   else{
//     AlertDialog(
//       title: Text('Create an account first'),
//     );
//   }
// }
// FutureBuilder(
// future: getbal(x),
// builder:  (BuildContext context, AsyncSnapshot snapshot){
// List<Widget> children;
// if (snapshot.hasError) {
// children = <Widget>[
// const Icon(
// Icons.error_outline,
// color: Colors.red,
// size: 60,
// ),
// Padding(
// padding: const EdgeInsets.only(top: 16),
// child: Text('Error: ${snapshot.error}'),
// )
// ];
// }
// else if (snapshot.hasData) {
//
// Navigator.push(context,MaterialPageRoute(builder: (context) =>Dashboard_cust(id:x)));
// return Text('');
// }
// else {
// children = const <Widget>[
// SizedBox(
// child: CircularProgressIndicator(),
// width: 60,
// height: 60,
// ),
// Padding(
// padding: EdgeInsets.only(top: 16),
// child: Text('Loading...'),
// ),
//
// ];
// }
// return Column(
// children:children
// );
// }
// );




