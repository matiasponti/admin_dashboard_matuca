import 'package:admin_dashboard_matuca/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

import '../cards/white_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Dashboard view',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          WhiteCard(title: 'Sales Statistics', child: Text('Hola mundo'))
        ],
      ),
    );
  }
}
