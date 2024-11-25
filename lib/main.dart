import 'package:country_search/repo/country_repository.dart';
import 'package:country_search/ui/country_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/country_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CountryRepository repository = CountryRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CountryBloc(repository),
        child: const MaterialApp(
            home: CountrySearchScreen(),
            ),
        );
    }
}
