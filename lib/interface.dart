import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:insurancyyyy/tabs/first.dart';
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
                        isClientAuthenticated: true,
                        salary: 100000,
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
                              drawer: Drawer(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  children: [
                                    UserAccountsDrawerHeader(
                                      accountName: Text(
                                          '${client.firstName} ${client.lastName}'),
                                      accountEmail: Text('${client.email}'),
                                      currentAccountPicture: CircleAvatar(
                                       backgroundImage: NetworkImage('https://steamuserimages-a.akamaihd.net/ugc/1811021954136903017/7E1974B61B8D02405DFE3FEBFA7527339B3D83BE/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false'),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[900],
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.edit),
                                      title: Text('Редактировать профиль'),
                                      onTap: () {
                                        client.viewProfile(context, client);
                                       // Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.logout),
                                      title: Text('Выйти из системы'),
                                      onTap: () {
                                        // Разлогинить клиента и вернуться на главную страницу
                                        //client.logout();
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
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
                                        FirstTab(),
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
                          ),
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


class InsuranceContract {
  final String title;
  final String description;

  InsuranceContract({
    required this.title,
    required this.description,
  });
}