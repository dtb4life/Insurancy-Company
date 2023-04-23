

import 'package:flutter/material.dart';

import '../client.dart';

class SecondTab extends StatelessWidget {
  final List<InsuranceRequest> insuranceRequests;

  SecondTab({required this.insuranceRequests});

  @override
  Widget build(BuildContext context) {
    List<InsuranceRequest> pendingRequests = insuranceRequests.where((request) => request.status == 'На рассмотрении').toList();

    return Scaffold(
      body: ListView.builder(
        itemCount: pendingRequests.length,
        itemBuilder: (BuildContext context, int index) {
          InsuranceRequest request = pendingRequests[index];
          return ListTile(
            title: Text(request.title),
            subtitle: Text(request.description),
            trailing: Text(request.status),
          );
        },
      ),
    );
  }
}
