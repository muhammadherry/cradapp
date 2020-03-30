import 'package:cradapp/editdata.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget{
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState()=> new _DetailState();
}

class _DetailState extends State<Detail>{
  @override
Widget build(BuildContext context){
return new Scaffold(
  appBar: new AppBar(title: new Text("${widget.list[widget.index]['item_name']}")),
  body: new Container(
    height: 270,
    padding: const EdgeInsets.all(20.0),
    child: new Card(
      child: new Center(
        child: new Column(
          children: <Widget>[
            new Text(widget.list[widget.index]['item_name'],style: new TextStyle(fontSize:20.0),),
            new Text("Code:${widget.list[widget.index]['item_code']}", style: new TextStyle(fontSize: 20.0),),
            new Text("Price:${widget.list[widget.index]['price']}", style: new TextStyle(fontSize: 20.0),),
            new Text("Status:${widget.list[widget.index]['status']}", style: new TextStyle(fontSize: 20.0),),
            new Padding(padding: const EdgeInsets.only(top: 30.0),),

            new Row(
              mainAxisSize: MainAxisSize.min,
              children:<Widget>[
                new RaisedButton(
                  child: new Text("Edit"),
                  color: Colors.green,
                    onPressed:()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context)=> new EditPage(list: widget.list,index: widget.index,))
      ),
                ),
                new RaisedButton(
                    child: new Text("Delete"),
                    color: Colors.red,
                    onPressed:(){},
              ),
              ]
            )
          ],
        ),
      )
    ),
  )
);
}
}