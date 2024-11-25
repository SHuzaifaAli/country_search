import 'package:flutter/material.dart';
import '../../model/country.dart';

class CountryTile extends StatelessWidget {
  final Country country;

  const CountryTile({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(country.flagUrl, width: 50, height: 50),
        title: Text(country.name),
        subtitle: Text('${country.region} | Population: ${country.population}'),
        );
    }
}
