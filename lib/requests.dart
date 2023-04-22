import 'package:flutter/material.dart';
import 'package:animated_radial_menu/animated_radial_menu.dart';
class InsuranceRequest {
  int id;
  String firstName;
  String lastName;
  String email;
  String type;
  int salary;
  String phone;

  InsuranceRequest(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.type,
      required this.salary,
      required this.phone});
}

class Agent {
  String firstName = "Gustavo Fring";
  String email = "losspollos@gmail.com";
  String avatarUrl =
      "https://media.vanityfair.com/photos/587ad80e2a677fe11973b503/master/w_2560%2Cc_limit/giancarlo-espositoo.jpg";
}

class MySearchDelegate extends SearchDelegate{
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  );

  @override
  List <Widget>? buildActions(BuildContext context) => [
    IconButton(
    icon: const Icon(Icons.clear),
    onPressed: () {
      if(query.isEmpty){
        close(context, null);
      }else{
      query = '';
      }
    }
  ),

  ];

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}


class InsuranceRequestsList extends StatefulWidget {
  @override
  _InsuranceRequestsListState createState() => _InsuranceRequestsListState();
}

class _InsuranceRequestsListState extends State<InsuranceRequestsList> {
  

  List<InsuranceRequest> requests = [
    InsuranceRequest(
        id: 1,
        firstName: "Jessy",
        lastName: "Pinkman",
        email: "luv4twenty@gmail.com",
        type: "Заявка на автострахование",
        salary: 50000,
        phone: "+444534565312"),
    InsuranceRequest(
      id: 2,
      firstName: "Jane",
      lastName: "Margolis",
      email: "jane&jessy@gmail.com",
      type: "Заявка на страхование здоровья и жизни",
      salary: 75000,
      phone: "+44567653432",
    ),
    InsuranceRequest(
        id: 3,
        firstName: "Mike",
        lastName: "Ehrmantraut",
        email: "waltuh@gmail.com",
        type: "Заявка на страхование путешествия",
        salary: 40000,
        phone: "+4466542345"),
  ];

Agent agent = Agent();

List<InsuranceRequest> filteredRequests = [];
String _searchQuery = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список заявок'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
           showSearch(context: context, delegate: MySearchDelegate(),);
          },
          
        ),
       
      ],
       
      ),
      
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {setState(() {
      requests.shuffle();
    });},
        
        child: Icon(Icons.shuffle),
        
      ),

      
      
      drawer: Drawer(
        child: Column(
          children: [
         
            UserAccountsDrawerHeader(
              accountName: Text(
                agent.firstName,
              ),
              accountEmail: Text(agent.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(agent.avatarUrl),
              ),
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
      body: requests.isEmpty
          ? Center(
              child: Text('Заявок нет.'),
            )
          : ListView.builder(
              itemCount: requests.length,
              itemBuilder: (BuildContext context, int index) {
                InsuranceRequest request = requests[index];
                return Card(
                    child: ListTile(
                  title: Text(
                      '${request.type} от ${request.firstName} ${request.lastName}'),
                  subtitle: Text('Зарплата клиента: ${request.salary}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        color: Colors.green,
                        onPressed: () {
                          // Обработчик нажатия на кнопку "Одобрить"
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Заявка одобрена. Свяжитесь с клиентом.'),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          setState(() {
                            requests.removeAt(index);
                          });
                        },
                      ),
                      
                      IconButton(
                        icon: Icon(Icons.thumb_down),
                        color: Colors.red,
                        onPressed: () {
                          // Обработчик нажатия на кнопку "Отклонить"
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Заявка отклонена.'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          setState(() {
                            requests.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ClientInfoScreen(request: request),
                      ),
                    );
                  },
                ));
              },
            ),
    );
  }
}

class ClientInfoScreen extends StatelessWidget {
  final InsuranceRequest request;

  const ClientInfoScreen({Key? key, required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о клиенте'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Контактная информация',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Table(
              columnWidths: {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(5),
              },
              children: [
                TableRow(
                  children: [
                    Text('Имя'),
                    Text(request.firstName),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Фамилия'),
                    Text(request.lastName),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Email'),
                    Text(request.email),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Номер телефона'),
                    Text(request.phone),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Страхование',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Тип страхования'),
                subtitle: Text(request.type),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Зарплата'),
                subtitle: Text(request.salary.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
