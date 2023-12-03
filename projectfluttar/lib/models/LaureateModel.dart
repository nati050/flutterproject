class LaureateList {
  final List<Laureate?>? laureates;

  LaureateList({
    this.laureates,
  });
  factory LaureateList.fromJson(Map<String, dynamic> json) {
    List<dynamic>? laureatesJson = json['laureates'];
    // ignore: prefer_null_aware_operators
    List<Laureate?>? laureates = laureatesJson != null
        ? laureatesJson
            .map((laureateJson) => Laureate.fromJson(laureateJson))
            .toList()
        : null;

    return LaureateList(
      laureates: laureates,
    );
  }
}

class Laureate {
  final String? id;
  final String? firstname;
  final String? surname;
  final String? born;
  final String? died;
  final String? bornCountry;
  final String? bornCountryCode;
  final String? bornCity;
  final String? diedCountry;
  final String? diedCountryCode;
  final String? diedCity;
  final String? gender;
  final List<Prize?>? prizes;

  Laureate({
    this.id,
    this.firstname,
    this.surname,
    this.born,
    this.died,
    this.bornCountry,
    this.bornCountryCode,
    this.bornCity,
    this.diedCountry,
    this.diedCountryCode,
    this.diedCity,
    this.gender,
    this.prizes,
  });

  factory Laureate.fromJson(Map<String, dynamic> json) {
    return Laureate(
      id: json['id'],
      firstname: json['firstname'],
      surname: json['surname'],
      born: json['born'],
      died: json['died'],
      bornCountry: json['bornCountry'],
      bornCountryCode: json['bornCountryCode'],
      bornCity: json['bornCity'],
      diedCountry: json['diedCountry'],
      diedCountryCode: json['diedCountryCode'],
      diedCity: json['diedCity'],
      gender: json['gender'],
      prizes: (json['prizes'] as List<dynamic>?)
          ?.map((prizeJson) => Prize?.fromJson(prizeJson))
          .toList(),
    );
  }
}

class Prize {
  final String? year;
  final String? category;
  final String? share;
  final String? motivation;
  final List<Affiliation?>? affiliations;

  Prize({
    this.year,
    this.category,
    this.share,
    this.motivation,
    this.affiliations,
  });

  factory Prize.fromJson(Map<String, dynamic> json) {
      //   List<dynamic>? affiliations1 = json['affiliations'];
      //  List<Affiliation>? affiliations=affiliations1 != null && affiliations1.isNotEmpty ? (json['affiliations'] as List<dynamic>?)
      //     ?.map((affiliationJson) => Affiliation?.fromJson(affiliationJson))
      //     .toList() : null;
    return Prize(
      year: json['year'],
      category: json['category'],
      share: json['share'],
      motivation: json['motivation'],
      // affiliations:affiliations,
    );
  }
}

class Affiliation {
  final String? name;
  final String? city;
  final String? country;

  Affiliation({
    this.name,
    this.city,
    this.country,
  });

  factory Affiliation.fromJson(Map<String, dynamic> json) {
    return Affiliation(
      name: json['name'],
      city: json['city'],
      country: json['country'],
    );
  }
}
