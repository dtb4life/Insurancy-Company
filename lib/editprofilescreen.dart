import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurancyyyy/client.dart';

import 'interface.dart';


class EditProfileScreen extends StatefulWidget {
  final Client client;
  final Function(Client) onProfileUpdated;
  const EditProfileScreen({
    required this.client,
    required this.onProfileUpdated,
    });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late String _firstName;
  late String _lastName;
  late String _email;
  late int _age;
  late String _phoneNumber;
  late DateTime _dateOfBirth;
  late String _address;

 
  @override
  void initState() {
    super.initState();
    _firstName = widget.client.firstName;
    _lastName = widget.client.lastName;
    _email = widget.client.email;
    _age = widget.client.age;
    _phoneNumber = widget.client.phoneNumber;
    _dateOfBirth = widget.client.dateOfBirth;
    _address = widget.client.address;
  }

  void saveChanges() {
  if (_firstName != null &&
      _lastName != null &&
      _email != null &&
      _age != null &&
      _phoneNumber != null &&
      _dateOfBirth != null &&
      _address != null) {
    setState(() {
      widget.client.firstName = _firstName!;
      widget.client.lastName = _lastName!;
      widget.client.email = _email!;
      widget.client.age = _age!;
      widget.client.phoneNumber = _phoneNumber!;
      widget.client.dateOfBirth = _dateOfBirth!;
      widget.client.address = _address!;
    });

  }

}

void _checkChangesAndSave() {
  if (_firstName != widget.client.firstName ||
      _lastName != widget.client.lastName ||
      _email != widget.client.email ||
      _age != widget.client.age ||
      _phoneNumber != widget.client.phoneNumber ||
      _dateOfBirth != widget.client.dateOfBirth ||
      _address != widget.client.address) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Изменения будут рассмотрены'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                saveChanges();
                
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  } else {
    saveChanges();
  }
}



void onProfileUpdated(Client editedClient) {
  setState(() {
    widget.client.updateProfile(editedClient);
  });
  widget.onProfileUpdated(editedClient); // вызываем колбэк функцию
}


   @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Редактировать профиль'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Имя'),
              TextFormField(
                initialValue: widget.client.firstName,
                onChanged: (value) {
                  setState(() {
                    _firstName = value;
                  });
                },
              ),
              
      
              SizedBox(height: 16.0),
               Text('Фамилия'),
              TextFormField(
                initialValue: widget.client.lastName,
                onChanged: (value) {
                  setState(() {
                    _lastName = value;
                  });
                },
              ),
      
              SizedBox(height: 16.0),
               Text('Эл.адрес'),
              TextFormField(
                initialValue: widget.client.email,
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              
              SizedBox(height: 16.0),
              Text('Возраст'),
              TextFormField(
                initialValue: widget.client.age.toString(),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _age = int.parse(value);
                  });
                },
              ),
              
              SizedBox(height: 16.0),
               Text('Номер телефона'),
              TextFormField(
                initialValue: widget.client.phoneNumber,
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
                  });
                },
              ),
      
             SizedBox(height: 16.0),
              Text('Дата рождения'),
              TextFormField(
                initialValue: widget.client.dateOfBirth.toString(),
                onChanged: (value) {
                  setState(() {
                    _dateOfBirth = DateTime.parse(value);
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text('Адрес'),
              TextFormField(
                initialValue: widget.client.address,
                onChanged: (value) {
                  setState(() {
                    _address = value;
                  });
                },
              ),
           
              
      
              SizedBox(height: 16.0,),
             ElevatedButton(
                /* onPressed: () {
                  saveChanges();
                  Navigator.pop(context);
                },*/
                onPressed: _checkChangesAndSave,
                child: Text('Сохранить изменения'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
