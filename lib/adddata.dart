import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget{
  @override
  _AddDataState createState()=> new _AddDataState();
}
class _AddDataState extends State<AddData>{
  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStatus = new TextEditingController();
  TextEditingController controllerAn = new TextEditingController();
  TextEditingController controllerDeskripsi = new TextEditingController();

  void addData(){
    var url="http://192.168.1.9/coba/adddata.php";
    http.post(url,body: {
      "item_code": controllerCode.text,
      "item_name": controllerName.text,
      "price": controllerPrice.text,
      "status": controllerStatus.text,
      "an": controllerAn.text,
      "deskripsi": controllerDeskripsi.text,
    });
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Add Data"),),
      body: Padding(
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
                    child: new Text("Add Data"),
                    color: Colors.blue,
                    onPressed:(){addData();
                    Navigator.pop(context);
                    },
                  )
                ],
              )
            ]
          )

      )
      ,
    );
  }
}