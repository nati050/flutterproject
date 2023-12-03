import 'package:flutter/material.dart';
//import 'package:projectfluttar/models/countrymodel.dart';
import 'package:projectfluttar/models/countrymodel1.dart';
import 'package:projectfluttar/pages/page3.dart';
import 'package:projectfluttar/services/apiservice.dart';

// ignore: camel_case_types
class countrieslist extends StatefulWidget {
  const countrieslist({super.key});

  @override
  State<countrieslist> createState() => _MyWidgetState();
}

bool chek = false;

class _MyWidgetState extends State<countrieslist> {
  @override
  void initState() {
    super.initState();
    // Call your function here
    gettt();
  }

  gettt() async {
    await CountryService()
        .getCountris()
        .then((value) => countriesmodel = value);
    setState(() {
      chek = true;
    });
  }
  // final List<String> countriesnobellist = ["text", "blq", "sdskdf"];

  late countrysModel countriesmodel;

  @override
  Widget build(BuildContext context) {
    if (!chek) {
      return const CircularProgressIndicator();
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: countriesmodel.countries?.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  print('לחצת על ${countriesmodel.countries?[index].name}');
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullDetails(country: countriesmodel.countries?[index].name ?? ""),
                  ),
                );
                },
                child: Container(
                  width: double.infinity, // Takes the full width of the screen
                  height: 80, // Set your preferred height
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(countriesmodel.countries?[index].name ?? "ריק",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 59, 255, 154))),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
