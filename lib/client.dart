import 'package:flutter/material.dart';
import 'editprofilescreen.dart';
import 'interface.dart';

class Client {
  int id;
  String firstName;
  String lastName;
  String email;
  int age;
  String phoneNumber;
  DateTime dateOfBirth;
  String address;
  List<InsuranceRequest> insuranceRequests;
  List<InsuranceContract> insuranceContracts;
  bool isClientAuthenticated = false;
  late EditProfileScreen ed;

  Client({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.address,
    required this.insuranceRequests,
    required this.insuranceContracts,
    required this.isClientAuthenticated,
  });


void authentication() {
  
  print(isClientAuthenticated);


}



void viewProfile(BuildContext context, Client client) async {
  Client? editedClient = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditProfileScreen(
        client: client,
        onProfileUpdated: (editedClient) {
          ed.onProfileUpdated(editedClient); // вызываем метод в классе Client
        },
      ),
    ),
  );
}



void updateProfile(Client editedClient) {
    firstName = editedClient.firstName;
    lastName = editedClient.lastName;
    email = editedClient.email;
    age = editedClient.age;
    phoneNumber = editedClient.phoneNumber;
    dateOfBirth = editedClient.dateOfBirth;
    address = editedClient.address;
  }


  // Подача заявки на страховку
  void submitInsuranceRequest(InsuranceRequest request) {
    // Добавить заявку в список заявок клиента
    insuranceRequests.add(request);
    // Отправить заявку на обработку в страховую компанию
  }

  // Изменение данных профиля
  void updateProfileData({
    String? firstName,
    String? lastName,
    String? email,
    int? age,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? address,
  }) {
    if (firstName != null) {
      this.firstName = firstName;
    }
    if (lastName != null) {
      this.lastName = lastName;
    }
    if (email != null) {
      this.email = email;
    }
    if (age != null) {
      this.age = age;
    }
    if (phoneNumber != null) {
      this.phoneNumber = phoneNumber;
    }
    if (dateOfBirth != null) {
      this.dateOfBirth = dateOfBirth;
    }
    if (address != null) {
      this.address = address;
    }
  }

  // Просмотр договоров страхования
  void viewInsuranceContracts() {
    // Вывести список заключенных договоров страхования клиента
  }
  
  void setState(Null Function() param0) {}
}

class InsuranceRequest {
  // Заявка на страховку
}

class InsuranceContract {
  // Договор страхования
}
