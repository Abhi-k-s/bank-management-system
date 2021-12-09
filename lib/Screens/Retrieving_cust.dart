import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

import 'Dashboard_cust.dart';

class balance extends StatefulWidget {
  const balance({Key key, this.id}) : super(key: key);
  final String id;
  @override
  _balanceState createState() => _balanceState();
}
class _balanceState extends State<balance> {
  @override
  Widget build(BuildContext context) {
    var sum=0;
    return WillPopScope(
      onWillPop: ()async{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard_cust(id:widget.id),));

      },

      child: Scaffold(

      appBar: AppBar(
        title:Text('Account balance'),
        backgroundColor: Colors.amberAccent,
    ),

      body: FutureBuilder(
          future: getbal(widget.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {

              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {

                    return ListTile(
                        title: Text("Account:${snapshot.data[index][0].toString()}\t\tRs:${snapshot.data[index][1]}\n"),

                    );

                  }
              );


              // return SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(15.0),
              //         child: Center(
              //           child: Text("Balance available:\n${snapshot.data[0][0]}",
              //               textAlign: TextAlign.center,
              //               style: TextStyle(
              //                   fontSize: 30, fontWeight: FontWeight.bold,)),
              //
              //         ),
              //       ),
              //     ],
              //   ),
              // );
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




Future getbal(String id) async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );
  await conn.open();
  var a = await conn
      .query('''
     select Account_no,balance from account where customer_id ='${id}';
;
      ''');
  print(a);
  print('works');
  await conn.close();
  return a;
}





class loandet extends StatefulWidget {
  const loandet({Key key, this.id}) : super(key: key);
  final String id;
  @override
  _loandetState createState() => _loandetState();
}
class _loandetState extends State<loandet> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard_cust(id:widget.id),));

        },
        child: Scaffold(

            appBar: AppBar(
              title: Text('Loan details'),
              backgroundColor: Colors.amberAccent,
            ),

            body:Container(
              child: FutureBuilder(
                  future: loan(widget.id),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List<Widget> children;
                    if(snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Text("Loan id:${snapshot.data[index][0].toString()}\nType:${snapshot.data[index][1]}\nAmount:${snapshot.data[index][2]}\n")
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



Future loan(String id) async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );

  await conn.open();
  var results = await conn.query('''
  Select * from loan where customer_id='${id}';
  ''');
  print(results);
  await conn.close();
  return results;

}


class trans extends StatefulWidget {
  const trans({Key key, this.id}) : super(key: key);
  final String id;
  @override
  _transState createState() => _transState();
}
class _transState extends State<trans> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard_cust(id:widget.id),));

        },
        child: Scaffold(

            appBar: AppBar(
              title: Text('Transaction details'),
              backgroundColor: Colors.amberAccent,
            ),

            body:Container(
              child: FutureBuilder(
                  future: tran(widget.id),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List<Widget> children;
                    if(snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title:Text("Date:${snapshot.data[index][0]}\nDebit:${snapshot.data[index][2].toString()}\t\t\tCredit:${snapshot.data[index][1]}\n\n\n")
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


Future tran(String id) async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );
  //String id1='CID00986';
  await conn.open();
  var results = await conn.query('''
  select * from Transactions where Account_No in (select Account_No from Account where customer_id='${id}')
  ''');
  print(results);
  await conn.close();
  return results;

}





class cred_Score extends StatefulWidget {
  const cred_Score({Key key, this.id}) : super(key: key);
  final String id;
  @override
  _cred_ScoreState createState() => _cred_ScoreState();
}
class _cred_ScoreState extends State<cred_Score> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard_cust(id:widget.id),));

        },
        child: Scaffold(

          appBar: AppBar(
            title:Text('Credit Score'),
            backgroundColor: Colors.amberAccent,
          ),

          body: FutureBuilder(
              future: getcredscore(widget.id),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: Text("Credit score is:\n${snapshot.data[0][0]}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold,)),

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

Future getcredscore(String id) async {
  final conn = PostgreSQLConnection(
      "ec2-52-204-72-14.compute-1.amazonaws.com", 5432, "d3ot3065sh5a0i",
      // databaseName
      username: "zlxsujsuhqfzgn",
      password: "01f3e85191018a0b0c8ffa5de7ee33641a3bbf063cc6d5f30f737b86451374c4",
      useSSL: true
  );
  await conn.open();
  var a = await conn
      .query('''
     select credit_score from customer where cust_id='${id}'
;
      ''');
  print(a);
  print('works');
  await conn.close();
  return a;
}
