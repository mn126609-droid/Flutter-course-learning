import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key, this.category, this.value});
  final dynamic category;
  final dynamic value;

  Widget Information(dynamic category, dynamic value) {
    return Row(
      spacing: 16,
      children: [
        SizedBox(width: 10),
        Text(
          '$category: ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: .bold,
            fontSize: 30,
          ),
        ),
        Text(value, style: TextStyle(color: Colors.white, fontSize: 20)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(
          'Personal Informaion',
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              mainAxisAlignment: .center,
              spacing: 16,
              children: [
                Information("Name", 'Mohamed Nasser'),
                Information("ID", '20251700000'),
                Information("Age", '18'),
                Information("Gender", 'Male'),
                Information("City", 'Cairo'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
