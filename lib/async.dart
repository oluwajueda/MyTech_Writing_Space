import 'package:flutter/material.dart';

class CountryNamesScreen extends StatefulWidget {
  const CountryNamesScreen({Key? key}) : super(key: key);

  @override
  State<CountryNamesScreen> createState() => _CountryNamesScreenState();
}

class _CountryNamesScreenState extends State<CountryNamesScreen> {
  @override
  initState() {
    super.initState();
    getCountryNames();
  }

  // here is a function that returns an Interable<String>
// The list of names are returned after 5 seconds delay
  Future<Iterable<String>> getCountryNames() => Future.delayed(
      const Duration(seconds: 5),
      () => ["USA", "China", "Belgium", "Algeria", "Germany"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Names'),
      ),
      body: FutureBuilder<Iterable<String>>(
        // pass the function that returns a Future
        // to the future property
        future: getCountryNames(),

        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final countryName = snapshot.data;

            return ListView.builder(
              itemCount: countryName!.length,
              itemBuilder: (context, index) {
                final country = countryName.elementAt(index);
                return ListTile(
                  title: Text(country),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
