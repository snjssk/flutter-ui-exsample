import 'package:flutter/material.dart';
import 'screens/refresh_swipe_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Example',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Home()
    );
  }
}

class Home extends StatelessWidget {

  static final links = ['RefreshSwipeList'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: links.map((link) => _button(context, link)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _button(BuildContext context, String link) {
    return Container(
      padding: EdgeInsets.all(20),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: Text(link),
        onPressed: () => _handlePress(context, link),
      ),
    );
  }

  void _handlePress(BuildContext context, String link) {
    if (link == 'RefreshSwipeList') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => RefreshSwipeList()));
    }
  }
}

