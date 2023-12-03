import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projectfluttar/models/LaureateModel.dart';
import 'package:projectfluttar/services/apiservice.dart';

class FullDetails extends StatefulWidget {
  final String country;

  const FullDetails({Key? key, required this.country}) : super(key: key);

  @override
  State<FullDetails> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FullDetails> {
  late List<Laureate?> laureates;
  bool check = false;

  @override
  void initState() {
    super.initState();
    getFullDetails();
  }

  getFullDetails() async {
    var response = await CountryService().getLaureate(widget.country);
    setState(() {
      laureates = response.laureates ?? [];
      check = true;
    });
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    if (!check) {
      return const CircularProgressIndicator();
    }
    if(laureates.isEmpty){
      return Center(
        child: Lottie.asset(
            '111.json',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: laureates.length,
          itemBuilder: (context, index) {
            return LaureateItem(laureate: laureates[index]);
          },
        ),
      ),
    );
  }
}

class LaureateItem extends StatelessWidget {
  final Laureate? laureate;

  LaureateItem({required this.laureate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ID: ${laureate?.id ?? "N/A"}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text('Name: ${laureate?.firstname ?? "N/A"} ${laureate?.surname ?? "N/A"}'),
          const SizedBox(height: 8.0),
          Text('Born: ${laureate?.born ?? "N/A"}, ${laureate?.bornCity ?? "N/A"}, ${laureate?.bornCountry ?? "N/A"}'),
          const SizedBox(height: 8.0),
          Text('Died: ${laureate?.died ?? "N/A"}, ${laureate?.diedCity ?? "N/A"}, ${laureate?.diedCountry ?? "N/A"}'),
          const SizedBox(height: 8.0),
          Text('Gender: ${laureate?.gender ?? "N/A"}'),
          const SizedBox(height: 8.0),
          const Text('Prizes:'),
          ..._buildPrizesList(laureate?.prizes),
        ],
      ),
    );
  }

  List<Widget> _buildPrizesList(List<Prize?>? prizes) {
    if (prizes == null || prizes.isEmpty) {
      return [Text('No prizes')];
    }

    return prizes.map((prize) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Year: ${prize?.year ?? "N/A"}'),
            const SizedBox(height: 4.0),
            Text('Category: ${prize?.category ?? "N/A"}'),
            const SizedBox(height: 4.0),
            Text('Share: ${prize?.share ?? "N/A"}'),
            const SizedBox(height: 4.0),
            Text('Motivation: ${prize?.motivation ?? "N/A"}'),
            const SizedBox(height: 4.0),
            Text('Affiliations:'),
            ..._buildAffiliationsList(prize?.affiliations),
          ],
        ),
      );
    }).toList();
  }

  List<Widget> _buildAffiliationsList(List<Affiliation?>? affiliations) {
    if (affiliations == null || affiliations.isEmpty) {
      return [Text('No affiliations')];
    }

    return affiliations.map((affiliation) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text('Name: ${affiliation?.name ?? "N/A"}, City: ${affiliation?.city ?? "N/A"}, Country: ${affiliation?.country ?? "N/A"}'),
      );
    }).toList();
  }
}
