import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:k_p_i_d_r_i_v_e_t_z/model/indicator.dart';

class IndicatorViewModel {
  List<Indicator> indicators = [];

  IndicatorViewModel() {
    fetchData();
  }
  fetchData() async {
    const token = '5eb4d9d065cada207d646c0046c019a2';
    const url =
        'https://new-kpi2.kpi-drive.ru/_api/indicators/get_mo_indicators';

    final body = {
      'period_start': '2023-08-01',
      'period_end': '2023-08-31',
      'period_key': 'month',
      'requested_mo_id': '97',
      'behaviour_key': 'task',
      'with_result': 'false',
      'response_fields': 'name,indicator_to_mo_id,parent_id,order',
      'auth_user_id': '1',
    };

    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final responseBody = convert.utf8.decode(response.bodyBytes);
      final jsonResponse =
      convert.jsonDecode(responseBody) as Map<String, dynamic>;
      final data = jsonResponse['DATA'];
      final rows = data['rows'] as List;

      indicators = rows.map((json) => Indicator.fromJson(json)).toList();
      print(indicators.first.name);
    } else {
      print('Response code:${response.statusCode}');
    }
  }
}
