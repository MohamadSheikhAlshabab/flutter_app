import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

enum SingingCharacter {
  lafayette,
  jefferson,
  sss,
  ddd,
  frrr,
  ggg,
  ddadas,
  cccc
}

enum Answers { YES, NO, MAYBE }

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> with TickerProviderStateMixin {
  String value88 = '';
  void _setValue(String value) => setState(() => value88 = value);
  Future _askUser() async {
    switch(
      await showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text("sadsa"),
          children: [
            new SimpleDialogOption(
              child: new Text('asdasd'),
              onPressed: () {
                Navigator.pop(context, Answers.YES);
              },
            ),
          ],
        ),
      )
    ){
      case Answers.YES:
        _setValue('Yes');
        break;
    }
  }

  Future _showAlert(BuildContext context, String message) {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text(message),
        actions: [
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: new Text("ok"),
          ),
          new RaisedButton(
            onPressed: () => Navigator.pop(context),
            child: new Text('Hello'),
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();
  void _showbar() {
    _scaffoldstate.currentState.showSnackBar(
      new SnackBar(
        content: new Text(
          "hello",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.fixed,
        action: SnackBarAction(
          label: 'Click',
          onPressed: () {
            print('Action is clicked');
          },
          textColor: Colors.white,
          disabledTextColor: Colors.yellow,
        ),
        onVisible: () {
          print('Snackbar is visible');
        },
      ),
    );
  }

  void _showButton() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  'Some info',
                  style: new TextStyle(
                      color: Colors.red,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                new RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Text('Close'),
                ),
              ],
            ),
          );
        });
  }

  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  double _value5 = 0.0;
  String _value6 = '';
  String _value7 = '';

  String _value8 = '';
  int _index = 0;

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime(2021),
    );
    if (picked != null) setState(() => _value6 = picked.toString());
  }

  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);
  void _value3Changed(bool value) => setState(() => _value3 = value);
  void _value4Changed(bool value) => setState(() => _value4 = value);
  void _value5Changed(double value) => setState(() => _value5 = value);
  void _onClick(String value) => setState(() => _value7 = value);
  bool newValue = false;
  SingingCharacter _character = SingingCharacter.lafayette;
  Widget makeRadios() {
    List<Widget> list = [];

    for (int i = 0; i <= 7; i++) {
      list.add(
        new ListTile(
          title: Text(
            '${SingingCharacter.values[i]}',
            style: TextStyle(
                color: Colors.black54,
                backgroundColor: Color.fromARGB(150, 200, 250, 200)),
          ),
          tileColor: Colors.indigo.withOpacity(0.2),
          leading: Radio(
            value: SingingCharacter.values[i],
            groupValue: _character,
            activeColor: Colors.purple,
            focusColor: Colors.yellow,
            onChanged: (SingingCharacter value) {
              setState(
                () {
                  _character = value;
                },
              );
            },
          ),
        ),
      );
    }

    Column f = new Column(
      children: list,
    );
    return f;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldstate,
      persistentFooterButtons: [
        new IconButton(
          icon: new Icon(Icons.wb_sunny),
          onPressed: () => _onClick('Button1'),
          alignment:
              Alignment.lerp(Alignment.bottomCenter, Alignment.bottomLeft, 2.0),
          padding: new EdgeInsets.all(16.0),
          color: Colors.green,
          focusColor: Colors.red,
        ),
        new IconButton(
          icon: new Icon(Icons.receipt),
          onPressed: () => _onClick('Button2'),
        ),
        new IconButton(
          icon: new Icon(Icons.add),
          onPressed: () => _onClick('Button3'),
        ),
      ],
      endDrawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: [
              new Text('Drawer'),
              new RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('close'),
              ),
            ],
          ),
        ),
      ),
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              makeRadios(),
              new Text('Add Widgets Here'),
              new CheckboxListTile(
                value: _value3,
                onChanged: _value3Changed,
                activeColor: Colors.lightGreenAccent,
                checkColor: Colors.red,
                tileColor: Colors.yellow,
                title: new Row(
                  children: [
                    TabBar(
                      isScrollable: true,
                      tabs: [Text('dsas'), Text('sss')],
                      controller: TabController(length: 2, vsync: this),
                    ),
                    Text(
                      'hello',
                      style: TextStyle(
                        color: Colors.purple,
                        // backgroundColor: Colors.pink,
                        background: new Paint()..color = Colors.amber,
                      ),
                    ),
                  ],
                ),
                subtitle: new Text('hi'),
                selectedTileColor: Colors.black.withOpacity(0.4),
                controlAffinity: ListTileControlAffinity.platform,
              ),
              new Checkbox(
                value: _value1,
                onChanged: _value1Changed,
                activeColor: Colors.yellow,
                checkColor: Colors.red,
                focusColor: Colors.pink,
                hoverColor: Colors.pink,
              ),
              new Checkbox(value: _value2, onChanged: _value2Changed),
              new Switch(
                value: _value4,
                onChanged: _value4Changed,
                activeColor: Colors.red,
                activeTrackColor: Colors.purple,
                inactiveThumbColor: Colors.black,
                inactiveTrackColor: Colors.lightGreen,
                focusColor: Colors.green,
                hoverColor: Colors.deepOrange,
              ),
              new Text(_value7),
              new Text('value : ${(_value5 * 100).round()}'),
              new Slider(
                value: _value5,
                onChanged: _value5Changed,
              ),
              new Text(_value6),
              new RaisedButton(
                onPressed: _selectDate,
                child: new Text('Birth Day'),
              ),
              new RaisedButton(
                onPressed: () => _showAlert(context, "Mohamad"),
                child: new Text('Alert message'),
              ),
              new Text(_value8),
              new RaisedButton(
                onPressed: _showButton,
                child: new Text("Click me"),
              ),
              new RaisedButton(
                onPressed: _askUser,
                child: new Text("Click me"),
              ),
              new RaisedButton(
                onPressed: _showbar,
                child: new Text("Click me"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.people),
            label: 'people',
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.phone),
            label: 'phone',
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.people_alt),
            label: 'people_alt',
          ),
        ],
        currentIndex: _index,
        fixedColor: Colors.deepOrange,
        onTap: (int item) {
          setState(() {
            _index = item;
            _value8 = "Current item : ${_index.toString()}";
          });
        },
      ),
    );
  }
}
