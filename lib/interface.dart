import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'client.dart';

class InsuranceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
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
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CupertinoButton.filled(
                    onPressed: () {
                      Client client = Client(
                        id: 1,
                        firstName: "Saul",
                        lastName: "Goodman",
                        email: "saulgoodman@gmail.com",
                        age: 60,
                        phoneNumber: "+44797865314",
                        dateOfBirth: DateTime(1963, 11, 2),
                        address: "160 Juan Tabo Boulevard NE, Albuquerque",
                        insuranceRequests: [],
                        insuranceContracts: [],
                      );
                      client.authentication();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DefaultTabController(
                                  length: 3,
                                  child: Scaffold(
                                    appBar: AppBar(
                                      title: Text('Ф И Р М А'),
                                      centerTitle: true,
                                      backgroundColor: Colors.blue[900],
                                    ),
                                    body: Column(
                                      children: [
                                        TabBar(
                                          tabs: [
                                            Tab(
                                              icon: Icon(
                                                Icons.document_scanner,
                                                color: Colors.blue[900],
                                              ),
                                            ),
                                            Tab(
                                              icon: Icon(
                                                Icons.send,
                                                color: Colors.blue[900],
                                              ),
                                            ),
                                            Tab(
                                              icon: Icon(
                                                Icons.filter_frames_sharp,
                                                color: Colors.blue[900],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            children: [
                                              // Add your first tab's content here
                                              Container(),
                                              // Add your second tab's content here
                                              Container(),
                                              // Add your third tab's content here
                                              Container(),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
              
                        ),
                      );
                    },
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

