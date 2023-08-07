import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: JsonExampleProvider(
          coder: JsonExampleCoder(),
          child: const ButtonWidget(),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => JsonExampleProvider.read(context)?.coder.encode(),
            child: const Text("Code"),
          ),
          ElevatedButton(
            onPressed: () => JsonExampleProvider.read(context)?.coder.decode(),
            child: const Text("Decode"),
          ),
        ],
      ),
    );
  }
}

class JsonExampleProvider extends InheritedWidget {
  final JsonExampleCoder coder;

  const JsonExampleProvider({
    super.key,
    required this.coder,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static JsonExampleProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
  }

  static JsonExampleProvider? read(BuildContext context) {
    final Widget? widget = context
        .getElementForInheritedWidgetOfExactType<JsonExampleProvider>()
        ?.widget;

    return widget is JsonExampleProvider ? widget : null;
  }
}

class JsonExampleCoder {
  void encode() {
    final List<Map<String, dynamic>> objects =
        humans.map((e) => e.toJson()).toList();
    final String jsonString = jsonEncode(objects);
    log(jsonString);
  }

  void decode() {
    final List<dynamic> json = jsonDecode(jsonString) as List<dynamic>;
    final List<Human> humans = json
        .map((dynamic humanObject) =>
            Human.fromJson(humanObject as Map<String, dynamic>))
        .toList();
    log(humans.toString());
  }
}

class Human {
  final String name;
  final String surname;
  final int age;
  final List<Address> addresses;

  Human({
    required this.name,
    required this.surname,
    required this.age,
    required this.addresses,
  });

  factory Human.fromJson(Map<String, dynamic> json) {
    return Human(
      name: json["name"] as String,
      surname: json["surname"] as String,
      age: json["age"] as int,
      addresses: (json["addresses"] as List<dynamic>)
          .map((dynamic addressObject) =>
              Address.fromJson(addressObject as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": name,
      "surname": surname,
      "age": age,
      "addresses": addresses.map((Address adress) => adress.toJson()).toList(),
    };
  }
}

class Address {
  final String city;
  final String street;
  final String house;
  final int flat;

  Address({
    required this.city,
    required this.street,
    required this.house,
    required this.flat,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json["city"] as String,
      street: json["street"] as String,
      house: json["house"] as String,
      flat: json["flat"] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "city": city,
      "street": street,
      "house": house,
      "flat": flat,
    };
  }
}

final List<Human> humans = [
  Human(
    name: "Ivan",
    surname: "Ivanov",
    age: 17,
    addresses: [
      Address(
        city: "Almaty",
        street: "Tole bi",
        house: "56",
        flat: 1,
      ),
      Address(
        city: "Shymkent",
        street: "Konaev",
        house: "12",
        flat: 2,
      ),
    ],
  ),
  Human(
    name: "Aslan",
    surname: "Aslanbai",
    age: 21,
    addresses: [
      Address(
        city: "Almaty",
        street: "Kazybek bi",
        house: "90",
        flat: 2,
      ),
    ],
  ),
];

const String jsonString = '''
[
    {
      "name": "Ivan",
      "surname": "Ivanov",
      "age": 17,
      "addresses": [
        {
          "city": "Almaty",
          "street": "Tole bi",
          "house": "56",
          "flat": 1
        },
        {
          "city": "Shymkent",
          "street": "Konaev",
          "house": "12",
          "flat": 2
        }
      ]
    },
    {
      "name": "Aslan",
      "surname": "Aslanbai",
      "age": 21,
      "addresses": [
        {
          "city": "Almaty",
          "street": "Kazybek bi",
          "house": "90",
          "flat": 2
        }
      ]
    }
]
''';
