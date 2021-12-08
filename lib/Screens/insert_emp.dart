import 'package:bank_management/Screens/Dashboard_employee.dart';
import 'package:flutter/material.dart';
import 'Retrieving_cust.dart';
import 'package:postgres/postgres.dart';


// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final myController2= TextEditingController();
  final myController3= TextEditingController();
  final myController4= TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert into table'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20),
        child: Column(
            children: <Widget>[
            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey[300])
                ),
                child:
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    hintText: "Enter Name here",
                    contentPadding: EdgeInsets.only(left: 30,bottom: 10,top: 40),
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize:15,color: Colors.blue,),

                  ),
                ),
              ),


            ]
        ),
              SizedBox(height: 5,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.grey[300])
                      ),
                      child:
                      TextField(
                        controller: myController2,
                        decoration: InputDecoration(
                          hintText: "Enter Address here",
                          contentPadding: EdgeInsets.only(left: 30,bottom: 10,top: 40),
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize:15,color: Colors.blue,),

                        ),
                      ),
                    ),


                  ]
              ),
              SizedBox(height: 5,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.grey[300])
                      ),
                      child:
                      TextField(
                        controller: myController3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter phone number here",
                          contentPadding: EdgeInsets.only(left: 30,bottom: 10,top: 40),
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize:15,color: Colors.blue,),

                        ),
                      ),
                    ),


                  ]
              ),
              SizedBox(height: 5,),

          ],

        )
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              var myInt = int.parse(myController3.text);
              assert(myInt is int);
              insertion(name:myController.text,ad:myController2.text,pno:myInt);
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text('Inserted,Your Cust-ID is ${cust_id.last}'),

              );
            },
          );

        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.add),
      ),
    );
  }
}




class insertion extends StatefulWidget {
  const insertion({Key key,this.name,this.ad,this.pno}) : super(key: key);
  final String name;
  final String ad;
  final int pno;
  @override
  _insertionState createState() => _insertionState();
}
class _insertionState extends State<insertion> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboardemp(id:''),));

        },
        child: Scaffold(

          appBar: AppBar(
          ),

          body: FutureBuilder(
              future: inser(widget.name,widget.ad,widget.pno),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: Text(snapshot.data[0][0].toString(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ];
                }
              else{
                  children =<Widget>[
                    const SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Loading...'),
                    ),
                  ];

                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                  ),
                );
              }
          ),
        )
    );

  }
}





List<String> cust_id=['CID8675','ICS1234','AXS2321'];


Future inser(String name,String add,var pno) async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );
  await conn.open();
  String a='Success';
  await conn
      .query('''
     insert into customer values('${cust_id[0]}',300,'${add}','${name}','${pno}';
      ''');
  print(cust_id.last);
  cust_id.removeLast();
  print(a);
  print('works');
  await conn.close();
  return a;
}


class goodcred extends StatefulWidget {
  const goodcred({Key key,this.name,this.ad,this.pno}) : super(key: key);
  final String name;
  final String ad;
  final int pno;
  @override
  _goodcredState createState() => _goodcredState();
}
class _goodcredState extends State<insertion> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboardemp(id:''),));

        },
        child: Scaffold(

          appBar: AppBar(
          ),

          body: FutureBuilder(
              future: inser(widget.name,widget.ad,widget.pno),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<Widget> children;
                if(snapshot.data==Null){
                  children =<Widget>[
                    const SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Loading...'),
                    ),
                  ];

                }
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: Text(snapshot.data[0][0].toString(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ];
                }
              }
          ),
        )
    );

  }
}