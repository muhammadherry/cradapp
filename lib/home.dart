
import 'dart:convert';

import 'package:cradapp/adddata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'detail.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  Future<List> getData()async{
    final response = await http.get("http://192.168.1.9/coba/getdata.php");
    return json.decode(response.body);
  }

  /* searchfield(){
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          hintText: 'Filter by',
        ),
        onChanged: (string){},
      )
    );
  }*/

  @override
  Widget build(BuildContext context){

    return new  Scaffold(

      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
          new MaterialPageRoute(
              builder: (BuildContext context)=>new AddData()
          ),
        ),
      ),

      body: new FutureBuilder<List>(
        future: getData(),

        builder:(context,snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data,)
              : new Center( child: new CircularProgressIndicator(),);


        },

      ),
      /*  body: new Center(
        child: new Text("HomePage",style: new TextStyle(fontSize: 35.0),),
      ),*/
    );
  }
}

class ItemList extends StatelessWidget{
  List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context,i){
        return new Container(
          padding: const EdgeInsets.all(5.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder:(BuildContext context)=> new Detail(list: list,index: i,)
                )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['item_name']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Status: ${list[i]['status']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}