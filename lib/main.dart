import 'package:flutter/material.dart';

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

void main() => runApp(
  MaterialApp(
    title: 'Navigation Example',
    home: First(),
    routes: {
      '/second': (context) => Second(),
    },
  )
);

class First extends StatefulWidget {

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {

  int _count = 0;

  _navigateToSecondRoute(BuildContext context) async {
    final result = await Navigator.pushNamed(
                    context, 
                    '/second',
                    arguments: ScreenArguments(
                      'SoBack',
                      'This message is extracted in the build method.',
                    ),
                  );
      setState(() {
        print(result);
        // _count = int.parse(result);
        _count = result;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('$_count'),
          onPressed: (){
            _navigateToSecondRoute(context);
          },
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(args.title),
          onPressed: (){
            Navigator.pop(context,100);
          },
        ),
      ),
    );
  }
}

