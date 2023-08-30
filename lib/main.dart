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
      var jsonResponse =
          convert.utf8.decode(response.bodyBytes);
      // print('response is:' + jsonResponse.toString());
      // print('response is:' + jsonResponse.toString());
    } else {
      print('code ${response.statusCode.toString()}');
    }
  }
}