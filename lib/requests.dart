import 'package:flutter/material.dart';


class InsuranceRequest {
  int id;
  String firstName;
  String lastName;
  String email;
  String type;
  int salary;
  String phone;

  InsuranceRequest({required this.id, required this.firstName, required this.lastName, required this.email,required this.type, required this.salary, required this.phone});
}

class InsuranceRequestsList extends StatefulWidget {
  @override
  _InsuranceRequestsListState createState() => _InsuranceRequestsListState();
}

class _InsuranceRequestsListState extends State<InsuranceRequestsList> {
  List<InsuranceRequest> requests = [
    InsuranceRequest(
      id: 1,
      firstName: "John",
      lastName: "Doe",
      email: "johndoe@gmail.com",
      type: "Заявка на автострахование",
      salary: 50000,
      phone: "+444534565312"
    ),
    InsuranceRequest(
      id: 2,
      firstName: "Jane",
      lastName: "Doe",
      email: "janedoe@gmail.com",
      type: "Заявка на страхование здоровья и жизни",
      salary: 75000,
      phone: "+44567653432",
    ),
    InsuranceRequest(
      id: 3,
      firstName: "Bob",
      lastName: "Smith",
      email: "bobsmith@gmail.com",
      type: "Заявка на страхование путешествия",
      salary: 40000,
      phone: "+4466542345"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список заявок'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (BuildContext context, int index) {
          InsuranceRequest request = requests[index];
          return Card(
           child: ListTile(
  title: Text('${request.type} от ${request.firstName} ${request.lastName}'),
  subtitle: Text('Зарплата клиента: ${request.salary}'),
  trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        icon: Icon(Icons.thumb_up),
        color: Colors.green,
        onPressed: () {
          // Обработчик нажатия на кнопку "Одобрить"
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
        builder: (context) => ClientInfoScreen(request: request),
      ),
    );
  },
)

          );
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
            Text('Имя: ${request.firstName}'),
            Text('Фамилия: ${request.lastName}'),
            Text('Email: ${request.email}'),
            Text('Тип страхования: ${request.type}'),
            Text('Зарплата: ${request.salary}'),
            Text('Номер телефона: ${request.phone}'),
            // Другие поля, если есть
          ],
        ),
      ),
    );
  }
}
