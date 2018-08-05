import 'package:cherry/classes/capsule_info.dart';
import 'package:cherry/colors.dart';
import 'package:cherry/widgets/card_page.dart';
import 'package:cherry/widgets/head_card_page.dart';
import 'package:cherry/widgets/hero_image.dart';
import 'package:cherry/widgets/row_item.dart';
import 'package:flutter/material.dart';

class CapsulePage extends StatelessWidget {
  final CapsuleInfo capsule;

  CapsulePage(this.capsule);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Capsule details')),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            _capsuleCard(context),
            const SizedBox(height: 8.0),
            _specsCard(),
            const SizedBox(height: 8.0),
            _thrustersCard(),
          ]),
        ),
      ]),
    );
  }

  Widget _capsuleCard(BuildContext context) {
    return HeadCardPage(
      image: HeroImage().buildHero(
        context: context,
        size: 116.0,
        url: capsule.getImageUrl,
        tag: capsule.id,
        title: capsule.name,
      ),
      head: <Widget>[
        Text(
          capsule.name,
          style: Theme
              .of(context)
              .textTheme
              .headline
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12.0),
        Text(
          capsule.getSubtitle,
          style: Theme
              .of(context)
              .textTheme
              .subhead
              .copyWith(color: secondaryText),
        ),
        const SizedBox(height: 12.0),
        Text(
          capsule.status,
          style: Theme
              .of(context)
              .textTheme
              .subhead
              .copyWith(color: secondaryText),
        ),
      ],
      details: capsule.description,
    );
  }

  Widget _specsCard() {
    return CardPage(title: 'SPECIFICATIONS', body: <Widget>[
      RowItem.textRow('Crew', capsule.getCrew),
      const SizedBox(height: 12.0),
      RowItem.textRow('Launch mass', capsule.getLaunchMass),
      const SizedBox(height: 12.0),
      RowItem.textRow('Return mass', capsule.getReturnMass),
      const SizedBox(height: 12.0),
      RowItem.textRow('Height', capsule.getHeight),
      const SizedBox(height: 12.0),
      RowItem.textRow('Diameter', capsule.getDiameter),
    ]);
  }

  Widget _thrustersCard() {
    return CardPage(
      title: 'THRUSTERS',
      body: <Widget>[
        RowItem.textRow('Number of thrusters', capsule.getThrusters),
        Column(
          children: capsule.thrusters
              .map((thruster) => _getThruster(thruster))
              .toList(),
        )
      ],
    );
  }

  Widget _getThruster(Thruster thruster) {
    return Column(children: <Widget>[
      const Divider(height: 24.0),
      RowItem.textRow('Name', thruster.name),
      const SizedBox(height: 12.0),
      RowItem.textRow('Amount', thruster.getAmount),
      const SizedBox(height: 12.0),
      RowItem.textRow('Pods', thruster.getPods),
      const SizedBox(height: 12.0),
      RowItem.textRow('Primary fuel', thruster.primaryFuel),
      const SizedBox(height: 12.0),
      RowItem.textRow('Secondary fuel', thruster.secondaryFuel),
      const SizedBox(height: 12.0),
      RowItem.textRow('Thrust', thruster.getThrust),
    ]);
  }
}