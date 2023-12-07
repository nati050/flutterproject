import 'package:flutter/material.dart';



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
late countrysModel countriesmodel;
  // country? selectedCountry;


  @override
  void initState() {
    super.initState();

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

 


  // country? getMatchingCountry(String searchText) {
  //   if (searchText.isEmpty) {
  //     return null;
  //   }
  //   return (countriesmodel.countries ?? []).firstWhere(
  //     (country) => country.name?.toLowerCase() == searchText.toLowerCase(),
  //     orElse: () =>null,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    if (!chek) {
      return const CircularProgressIndicator();
    }



    return Scaffold(
      appBar: AppBar(
          title: const Text('חתני פרס נובל'),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48.0), // Set the preferred height
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: TextField(
                  //     decoration: InputDecoration(
                  //   hintText: 'הכנס מדינה',
                    
                  //   border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //      borderSide: const BorderSide(
                  //      color: Colors.black
                  //      // Border color
                  //      )
                //   //   ),
                //    )
                //  )
                )
               )
              ),
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
                      builder: (context) => FullDetails(
                          country: countriesmodel.countries?[index].name ?? ""),
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
                        style: const TextStyle(color: Colors.yellow)),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
