import 'package:flutter/material.dart';
import 'package:k_p_i_d_r_i_v_e_t_z/model/indicator.dart';

class IndicatorsList extends StatelessWidget {
  final List<Indicator> indicators;

  IndicatorsList({required this.indicators});

  @override
  Widget build(BuildContext context) {
    print(indicators.first.name);
    return Scaffold(
      body: ListView.builder(
        itemCount: indicators.length,
        itemBuilder: (BuildContext context, index) {
          final indicator = indicators[index];
          return Card(
            child: Column(
              children: [
                Text('name: ${indicator.name}'),
                Text('indicatorToMoId: ${indicator.indicatorToMoId}'),
                Text('order: ${indicator.order}'),
                Text('parentId: ${indicator.parentId}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
