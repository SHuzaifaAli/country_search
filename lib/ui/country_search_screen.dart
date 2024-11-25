import 'dart:async';

import 'package:country_search/ui/widget/country_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/country_bloc.dart';
import '../bloc/country_event.dart';
import '../bloc/country_state.dart';

class CountrySearchScreen extends StatefulWidget {
  const CountrySearchScreen({super.key});

  @override
  State<CountrySearchScreen> createState() => _CountrySearchScreenState();
}

class _CountrySearchScreenState extends State<CountrySearchScreen> {

  final TextEditingController _controller = TextEditingController();

  //Declaring a timer for debounce
  Timer? _debounce;

  @override
  void dispose() {
    //cancelling timer here if screen is disposed
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // I am cancelling any previous timer if user continues typing
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Bloc event will be triggered here after 500 milliseconds
      if (_controller.text.isNotEmpty) {
        BlocProvider.of<CountryBloc>(context).add(FetchCountries(_controller.text));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Search Countries')),
        body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter country name',
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: (_) => _onSearchChanged(), // Here I am calling debounce to minimize API calling
                ),
              ),
              Expanded(
                child: BlocBuilder<CountryBloc, CountryState>(
                  builder: (context, state) {
                    if (state is CountryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CountryLoaded) {
                      return ListView.builder(
                        itemCount: state.countries.length,
                        itemBuilder: (context, index) {
                          return CountryTile(country: state.countries[index]);
                        },
                      );
                    } else if (state is CountryError) {
                      return Center(child: Text(state.message));
                    }
                    return const Center(child: Text('Search for a country.'));
                  },
                ),
              ),
            ],
            ),
        );
  }

}
