



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

import 'Dashboard_manager.dart';


class bank extends StatefulWidget {
  const bank({Key key}) : super(key: key);
  @override
  _bankState createState() => _bankState();
}
class _bankState extends State<bank> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboardman(),));

        },
        child: Scaffold(

            appBar: AppBar(
              title:Text('Bank and their respective loans'),
              backgroundColor:  Colors.amberAccent,
            ),

            body:Container(
              child: FutureBuilder(
                  future: bankloan(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List<Widget> children;
                    if(snapshot.hasData) {
                      return ListView.builder(itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Text('${snapshot.data[index][0]}\t\t\t\t\t${snapshot.data[index][1]}')
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

Future bankloan() async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );

  await conn.open();
  var results = await conn.query('''
    Select Name,Sum from banks as b,(Select t.code_B,sum(amount) from (select * from branches as b,loan as l where b.branch_id=l.branches_id) as t  group by t.code_B) as a where b.code=a.code_B;
  ''');
  //print(results);
  await conn.close();
  return results;

}


class acc extends StatefulWidget {
  const acc({Key key}) : super(key: key);
  @override
  _accState createState() => _accState();
}
class _accState extends State<acc> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboardman(),));

        },
        child: Scaffold(

            appBar: AppBar(
              backgroundColor:  Colors.amberAccent,
              title:Text('Bank and accounts'),
            ),

            body:Container(
              child: FutureBuilder(
                  future: bankacc(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List<Widget> children;
                    if(snapshot.hasData) {
                      return ListView.builder(itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Text('${snapshot.data[index][0]}\t\t\t\t\t${snapshot.data[index][1]}')
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

Future bankacc() async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );

  await conn.open();
  var results = await conn.query('''
    Select Name,count from banks as b,(Select t.code_B,count(account_no) from (select * from branches as b,account as ac where b.branch_id=ac.branches_id) as t  group by t.code_B) as a where b.code=a.code_B;
  ''');
  //print(results);
  await conn.close();
  return results;

}



class risk extends StatefulWidget {
  const risk({Key key}) : super(key: key);
  @override
  _riskState createState() => _riskState();
}
class _riskState extends State<risk> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboardman(),));

        },
        child: Scaffold(

            appBar: AppBar(
              backgroundColor:  Colors.amberAccent,
              title:Text('Loans with risk'),
            ),

            body:Container(
              child: FutureBuilder(
                  future: bankrisk(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List<Widget> children;
                    if(snapshot.hasData) {
                      return ListView.builder(itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Text('Name:${snapshot.data[index][0]}\t\t\t\t\tAmount:${snapshot.data[index][1]}')
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

Future bankrisk() async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );

  await conn.open();
  var results = await conn.query('''
     select name,sum(amount) from customer,loan where (cust_id in (select distinct customer_id from loan) and credit_score<500) group by cust_id;
  ''');
  //print(results);
  await conn.close();
  return results;

}



class indivi extends StatefulWidget {
  const indivi({Key key,this.id}) : super(key: key);
  final String id;
  @override
  _indiviState createState() => _indiviState();
}
class _indiviState extends State<indivi> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboardman(),));

        },
        child: Scaffold(

            appBar: AppBar(
              backgroundColor:  Colors.amberAccent,
              title:Text('Individual loan'),
            ),

            body:Container(
              child: FutureBuilder(
                  future: getde(widget.id),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List<Widget> children;
                    if(snapshot.hasData) {
                      return ListView.builder(itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Text('${snapshot.data[index][0]}\t\t\t\t\t${snapshot.data[index][1]}')
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

Future getde(String id) async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );

  await conn.open();

  var results = await conn.query('''
  Select Name,Sum from banks as b,(Select t.code_B,sum(amount) from (select * from branches as b,loan as l where b.branch_id=l.branches_id And l.customer_id='${id}' ) as t group by t.code_B) as a where b.code=a.code_B;

  ''');
  //print(results);
  await conn.close();
  return results;

}



class branch extends StatefulWidget {
  const branch({Key key}) : super(key: key);
  @override
  _branchState createState() => _branchState();
}
class _branchState extends State<branch> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboardman(),));

        },
        child: Scaffold(

            appBar: AppBar(
              backgroundColor:  Colors.amberAccent,
              title:Text('Number of Branches of each bank'),
            ),

            body:Container(
              child: FutureBuilder(
                  future: bran(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List<Widget> children;
                    if(snapshot.hasData) {
                      return ListView.builder(itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Text('${snapshot.data[index][0]}\t\t\t\t\t${snapshot.data[index][1]}')
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

Future bran() async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );

  await conn.open();
  var results = await conn.query('''
  Select Name,count from banks as b,(Select t.code_B,count(t.branch_id) from (select * from branches as b,account as ac where b.branch_id=ac.branches_id) as t group by t.code_B) as a where b.code=a.code_B;
  ''');
  //print(results);
  await conn.close();
  return results;

}
