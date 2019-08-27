import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Navigation Example',
    home: First(),
  )
);

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open Route'),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Second()),
            );
          },
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go Back'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}