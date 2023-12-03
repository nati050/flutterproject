// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class countries extends StatefulWidget {
  const countries({super.key});
  @override
  State<countries> createState() => _CountriesState();
}

class _CountriesState extends State<countries> {
  final text = TextEditingController();

  onchenges(){
    print('chenge');
  }
@override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            // maxHeight: 400,
          ),
          child: Column(
            children: [
              Text(
                "פרסי נובל",
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 10,
                ),
              ),
              Text("טקסט 2"),
              Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              // controller: _searchController,
              onChanged: onchenges(),
              decoration: const InputDecoration(
                labelText: 'Search Country',
                hintText: 'Enter country name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: filteredCountries.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text(filteredCountries[index]),
          //         // You can add more onTap functionality as needed
          //         onTap: () {
          //           // Handle item tap
          //           print('Tapped: ${filteredCountries[index]}');
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
            ],
          ),
        )
    );
  }
}

