import 'package:bank_management/Screens/Dashboard_employee.dart';
import 'package:flutter/material.dart';
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
        title: const Text('Create a new Account'),
        backgroundColor:  Colors.amberAccent,
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
              return insertion(name:myController.text,ad:myController2.text,pno:myInt);
              // return AlertDialog(
              //   // Retrieve the text the that user has entered by using the
              //   // TextEditingController.
              //   content: Text('Inserted,Your Cust-ID is ${cust_id.last}'),
              //
              // );
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
                            child: Text(snapshot.data[0].toString(),
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





List<String> cust_id=['CID24046','CID05061','CID25055','CID68796','CID76534'];


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
     insert into customer values('${cust_id[0]}',300,'${add}','${name}','${pno}');
      ''');
  print(cust_id[0]);
  cust_id.removeAt(0);
  print(a);
  print(cust_id);
  print('works');
  await conn.close();
  return a;
}


class listview extends StatefulWidget {
  const listview({Key key, this.id}) : super(key: key);
  final String id;
  @override
  _listviewState createState() => _listviewState();
}
class _listviewState extends State<listview> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboardemp(),));

        },
        child: Scaffold(

            appBar: AppBar(
              backgroundColor:  Colors.amberAccent,
            ),

            body:Container(
              child: FutureBuilder(
                  future: listvu(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List<Widget> children;
                    if(snapshot.hasData) {
                      return ListView.builder(itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Text('${snapshot.data[index][0]}\t\t\t\t\t${snapshot.data[index][1]}\t\t\t\t\t${snapshot.data[index][2]}')
                            );
                          }
                      );
                    }else{
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
        ));

  }
}

Future listvu() async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );

  await conn.open();
  var results = await conn.query('''
    Select name,cust_id,phone from customer where credit_score>670;
  ''');
  //print(results);
  await conn.close();
  return results;

}

class kyc extends StatefulWidget {
  const kyc({Key key, this.id}) : super(key: key);
  final String id;
  @override
  _kycState createState() => _kycState();
}
class _kycState extends State<kyc> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboardemp(),));

        },
        child: Scaffold(

            appBar: AppBar(
              backgroundColor:  Colors.amberAccent,
            ),

            body:Container(
              child: FutureBuilder(
                  future: getkyc(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List<Widget> children;
                    if(snapshot.hasData) {
                      return ListView.builder(itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Text('${snapshot.data[index][0]}\t\t\t\t\t${snapshot.data[index][1]}\t\t\t\t\t${snapshot.data[index][2]}')
                            );
                          }
                      );
                    }else{
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
        ));

  }
}

Future getkyc() async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );

  await conn.open();
  var results = await conn.query('''
    Select Name,cust_id,phone from customer where cust_id not in(select customer_id from Kyc);
  ''');
  //print(results);
  await conn.close();
  return results;

}




class MyCustomForm2 extends StatefulWidget {
  const MyCustomForm2({Key key}) : super(key: key);

  @override
  _MyCustomForm2State createState() => _MyCustomForm2State();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomForm2State extends State<MyCustomForm2> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2= TextEditingController();
  final myController3= TextEditingController();
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
        title: const Text('Insert into transaction table'),
        backgroundColor:  Colors.amberAccent,
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
                          hintText: "Enter Account-No here",
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
                          hintText: "Enter Debit here",
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
                        decoration: InputDecoration(
                          hintText: "Enter Credit here",
                          contentPadding: EdgeInsets.only(left: 30,bottom: 10,top: 40),
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize:15,color: Colors.blue,),

                        ),
                      ),
                    ),




                  ]
              ),
              SizedBox(height: 5,),
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
                        controller: myController1,
                        decoration: InputDecoration(
                          hintText: "Enter Date here(YYYY-MM-DD)",
                          contentPadding: EdgeInsets.only(left: 30,bottom: 10,top: 40),
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize:15,color: Colors.blue,),

                        ),
                      ),
                    ),
                  ]
              )
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
              var deb = int.parse(myController2.text);
              assert(deb is int);
              var cred = int.parse(myController3.text);
              assert(cred is int);
              return insertiontran(date:myController1.text,acc_no:myController.text,Debit:deb,Credit:cred);
              // return AlertDialog(
              //   // Retrieve the text the that user has entered by using the
              //   // TextEditingController.
              //   content: Text('Inserted,Your Cust-ID is ${cust_id.last}'),
              //
              // );
            },
          );

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class insertiontran extends StatefulWidget {
  const insertiontran({Key key,this.date,this.acc_no,this.Debit,this.Credit}) : super(key: key);
  final String date;
  final String acc_no;
  final int  Debit;
  final int Credit;
  @override
  _insertiontranState createState() => _insertiontranState();
}
class _insertiontranState extends State<insertiontran> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboardemp(id:''),));

        },
        child: Scaffold(

          appBar: AppBar(
            backgroundColor:  Colors.amberAccent,
          ),

          body: FutureBuilder(
              future: inserttran(widget.date,widget.acc_no,widget.Debit,widget.Credit),
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


Future inserttran(String date,String acc_no,var Debit,var Credit) async {
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
     insert into transactions values('${date}','${Credit}','${Debit}','${acc_no}');
      ''');

  print('works');
  await conn.close();
  return a;
}