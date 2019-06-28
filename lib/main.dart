import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:notifications/CustomDialog.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: MyApp(),
      ),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _showSnackbar() {
    final snackbar = SnackBar(
      content: Text(
        'Snackbar message',
        style: TextStyle(fontSize: 16.0),
      ),
      action: SnackBarAction(
        label: 'Done',
        textColor: Colors.black,
        onPressed: () {},
      ),
      backgroundColor: Colors.deepPurple,
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void _showModal() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 100.0,
            color: Colors.deepPurple,
            child: Center(
              child: Text(
                'Modal Bottom message',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          );
        });
  }

  Future<Null> _showSimpleDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Simple dialog',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
              'This is a message',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Done'),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
            backgroundColor: Colors.deepPurple,
          );
        });
  }

  _showCustomDialog() {
    return showDialog(
        context: context,
        builder: (context) => CustomDialog(
              title: 'Custom dialog',
              description: 'This is a message',
              buttonText: 'Done',
              image: Image.asset(
                'lib/icon.png',
                color: Colors.white,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 20.0,
          direction: Axis.vertical,
          runAlignment: WrapAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                child: Text(
                  'Snackbar',
                  style: TextStyle(fontSize: 18.0),
                ),
                color: Colors.white,
                textColor: Colors.purple,
                minWidth: 150.0,
                onPressed: () => _showSnackbar(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                child: Text(
                  'Modal bottom',
                  style: TextStyle(fontSize: 18.0),
                ),
                color: Colors.white,
                textColor: Colors.purple,
                minWidth: 150.0,
                onPressed: () => _showModal(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                child: Text(
                  'Simple dialog',
                  style: TextStyle(fontSize: 18.0),
                ),
                color: Colors.white,
                textColor: Colors.purple,
                minWidth: 150.0,
                onPressed: () => _showSimpleDialog(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                child: Text(
                  'Custom dialog',
                  style: TextStyle(fontSize: 18.0),
                ),
                color: Colors.white,
                textColor: Colors.purple,
                minWidth: 150.0,
                onPressed: () => _showCustomDialog(),
              ),
            )
          ],
        ));
  }
}
