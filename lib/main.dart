//import 'client_screen.dart';
//import 'agent_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InsuranceApp(),
    ));

class InsuranceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Страховая фирма'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  SizedBox(height: 20),
                  CupertinoButton.filled(
                    onPressed: () {},
                    child: Text('Войти как клиент'),
                  ),
                  SizedBox(height: 10),
                  CupertinoButton(
                    onPressed: () {},
                    child: Text('Войти как агент'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

