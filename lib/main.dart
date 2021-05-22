import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>MyApp(),
      '/second':(context)=>SecondScreen(),
      ExtractArgumentsScreen.routeName:(context)=>ExtractArgumentsScreen(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator & Routes'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            'Launch Screen'
          ),
          onPressed: (){
            //Navigator.pushNamed(context, '/second');
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
            Navigator.pushNamed(context, ExtractArgumentsScreen.routeName,
              arguments: ScreenArguments('ExtractScreenArgs', 'This message is extracted in the build method.')

            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen'
        ),
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


class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName= '/extractArguments';
  const ExtractArgumentsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}



