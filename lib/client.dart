import 'package:flutter/material.dart';
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
  bool _isClientAuthenticated = false;

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
  });

  get isClientAuthenticated => null;

void authentication() {
  _isClientAuthenticated = true;
  print(_isClientAuthenticated);
  
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
