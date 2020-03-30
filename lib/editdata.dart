import 'package:cradapp/adddata.dart';
import 'package:cradapp/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class EditPage extends StatefulWidget{
  final List list;
  final int index;

  EditPage({this.list,this.index});
  @override
  _EditPageState createState()=> _EditPageState();
}

class _EditPageState extends State<EditPage>{

  TextEditingController controllerCode;
  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerStatus;
  TextEditingController controllerAn;
  TextEditingController controllerDeskripsi;

  void Edit(){
    var url = "http://192.168.1.9/coba/editdata.php";
    http.post(url,body:{
      "id":widget.list[widget.index]['id'],
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "status": controllerStatus.text,
      "an": controllerAn.text,
      "deskripsi": controllerDeskripsi.text,
    });
  }
  @override
  void initState(){
    controllerCode = new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName = new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice = new TextEditingController(text: widget.list[widget.index]['price']);
    controllerStatus = new TextEditingController(text: widget.list[widget.index]['status']);
    controllerAn = new TextEditingController(text: widget.list[widget.index]['an']);
    controllerDeskripsi = new TextEditingController(text: widget.list[widget.index]['deskripsi']);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Data"),),
      body:Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
              children: <Widget>[
                new Column(
                  children:<Widget>[
                    new TextField(
                      controller: controllerCode,
                      decoration: new InputDecoration(
                          hintText: "Item Code",
                          labelText: "Item Code"
                      ),
                    ),
                    new TextField(
                      controller: controllerName,
                      decoration: new InputDecoration(
                          hintText: "Item Name",
                          labelText: "Item Name"
                      ),
                    ),
                    new TextField(
                      controller: controllerPrice,
                      decoration: new InputDecoration(
                          hintText: "Price",
                          labelText: "Price"
                      ),
                    ),
                    new TextField(
                      controller: controllerStatus,
                      decoration: new InputDecoration(
                          hintText: "Status",
                          labelText: "Status"
                      ),
                    ),
                    new TextField(
                      controller: controllerAn,
                      decoration: new InputDecoration(
                          hintText: "Atas Nama",
                          labelText: "Atas Nama"
                      ),
                    ),
                    new TextField(
                      controller: controllerDeskripsi,
                      decoration: new InputDecoration(
                          hintText: "Deskripsi",
                          labelText: "Deskripsi"
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.all(10.0),),
                    new  RaisedButton(
                      child: new Text("Edit Data"),
                      color: Colors.blue,
                      onPressed:(){Edit();
                      Navigator.of(context).push(
                        new MaterialPageRoute(builder:
                            (BuildContext context)=> new Home())
                      );
                      },
                    )
                  ],
                )
              ]
          )
      ),
    );
  }
}
/*
import 'package:cradapp/adddata.dart';
import 'package:cradapp/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditPage extends StatefulWidget{

  final List list;
  final int index;

EditPage({this.list,this.index});

  @override
  _EditPageState createState()=> _EditPageState();
}

class _EditPageState extends State<EditPage>{

  TextEditingController controllerCode;
  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerStatus;
  TextEditingController controllerAn;
  TextEditingController controllerDeskripsi;

  void EditData(){
    var url="http://192.168.1.9/coba/editdata.php";
    http.post(url,body:{
      "id":widget.list[widget.index]['id'],
      "itemcode":controllerCode.text,
      "itemname":controllerName.text,
      "price":controllerPrice.text,
      "status":controllerStatus.text,
      "an":controllerAn.text,
      "deskripsi":controllerDeskripsi.text,
    });
  }

  @override
  void initState(){
    controllerCode= new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName= new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice= new TextEditingController(text: widget.list[widget.index]['price']);
    controllerStatus= new TextEditingController(text: widget.list[widget.index]['status']);
    controllerAn= new TextEditingController(text: widget.list[widget.index]['an']);
    controllerDeskripsi= new TextEditingController(text: widget.list[widget.index]['deskripsi']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Data"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                    hintText: "Item Code",labelText: "Item Code"
                  ),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "Item Name",labelText: "Item Name"
                  ),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                      hintText: "Price",labelText: "Price"
                  ),
                ),
                new TextField(
                  controller: controllerStatus,
                  decoration: new InputDecoration(
                      hintText: "Status",labelText: "Status"
                  ),
                ),
                new TextField(
                  controller: controllerAn,
                  decoration: new InputDecoration(
                      hintText: "Atas Nama",labelText: "Atas Nama"
                  ),
                ),
                new TextField(
                  controller: controllerDeskripsi,
                  decoration: new InputDecoration(
                      hintText: "Deskripsi",labelText: "Deskripsi"
                  ),
                ),
                new Padding(
                    padding: const EdgeInsets.all(10.0),
                ),
                new  RaisedButton(
                  child: new Text("Add Data"),
                  color: Colors.blue,
                  onPressed:(){EditData();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder:(BuildContext context)=> new Home())
                  );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}*/
