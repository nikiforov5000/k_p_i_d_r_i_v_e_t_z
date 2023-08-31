import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Requests requests = Requests();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              print('button pressed');
              requests.fetchData();
            },
            child: Text('Fetch Data'),
          ),
        ),
      ),
    );
  }
}

class Requests {
  fetchData() async {

    const token = '5eb4d9d065cada207d646c0046c019a2';
    final url = 'https://new-kpi2.kpi-drive.ru/_api/indicators/get_mo_indicators';

    final body = {
      'period_start':'2023-08-01',
      'period_end':'2023-08-31',
      'period_key':'month',
      'requested_mo_id':'97',
      'behaviour_key':'task',
      'with_result':'false',
      'response_fields':'name,indicator_to_mo_id,parent_id,order',
      'auth_user_id':'1',
    };


    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print('response');

    if (response.statusCode == 200) {
      print('code 200');
      final responseBody = convert.utf8.decode(response.bodyBytes);
      final jsonResponse = convert.jsonDecode(responseBody) as Map<String, dynamic>;
      final data = jsonResponse['DATA'];
      final rows = data['rows'] as List;

      final indicators = rows.map((json) => Indicator.fromJson(json)).toList();


      print('response is:' + indicators.toString());
    } else {
      print('code ${response.statusCode.toString()}');
    }
  }
}

class Indicator {
  final String name;
  final int indicatorToMoId;
  final int parentId;
  final int order;

  Indicator({
    required this.name,
    required this.indicatorToMoId,
    required this.parentId,
    required this.order,
  });

  factory Indicator.fromJson(Map<String, dynamic> json) {
    return Indicator(
      name: json['name'],
      indicatorToMoId: json['indicator_to_mo_id'],
      parentId: json['parent_id'],
      order: json['order'],
    );
  }
}
























