import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  CustomDialog({this.title, this.description, this.buttonText, this.image});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _dialogContent(context),
    );
  }

  _dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 2.4,
          padding:
              EdgeInsets.only(top: 110.0, bottom: 3.0, left: 25.0, right: 25.0),
          margin: EdgeInsets.only(top: 60.0),
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runSpacing: 15.0,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18.0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          buttonText,
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 50.0,
          right: 50.0,
          child: CircleAvatar(
            backgroundColor: Colors.deepPurpleAccent,
            radius: 70.0,
            child: image,
          ),
        )
      ],
    );
  }
}
