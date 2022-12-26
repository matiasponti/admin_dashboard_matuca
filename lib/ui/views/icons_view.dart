import 'package:flutter/material.dart';

import 'package:admin_dashboard_matuca/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

import '../cards/white_card.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Icons',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                  width: 180,
                  title: 'ac_unit_outlined',
                  child: Center(
                    child: Icon(Icons.ac_unit_outlined),
                  )),
              WhiteCard(
                  width: 180,
                  title: 'museum',
                  child: Center(
                    child: Icon(Icons.museum_outlined),
                  )),
              WhiteCard(
                  width: 180,
                  title: 'child care',
                  child: Center(
                    child: Icon(Icons.child_care),
                  )),
              WhiteCard(
                  width: 180,
                  title: 'foddy',
                  child: Center(
                    child: Icon(Icons.foggy),
                  )),
              WhiteCard(
                  width: 180,
                  title: 'football',
                  child: Center(
                    child: Icon(Icons.sports_football),
                  )),
              WhiteCard(
                  width: 180,
                  title: 'blue note',
                  child: Center(
                    child: Icon(Icons.music_note),
                  )),
              WhiteCard(
                  width: 180,
                  title: 'night',
                  child: Center(
                    child: Icon(Icons.nightlife),
                  )),
              WhiteCard(
                  width: 180,
                  title: 'good bites',
                  child: Center(
                    child: Icon(Icons.food_bank_outlined),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
