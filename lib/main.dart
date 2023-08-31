import 'package:flutter/material.dart';
import 'package:k_p_i_d_r_i_v_e_t_z/modelview/indicator_viewmodel.dart';
import 'package:k_p_i_d_r_i_v_e_t_z/view/indicator_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final IndicatorViewModel requests = IndicatorViewModel();

  @override
  Widget build(BuildContext context) {
    final viewModel = IndicatorViewModel();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: IndicatorsList(
            indicators: viewModel.indicators,
          ),
        ),
      ),
    );
  }
}
