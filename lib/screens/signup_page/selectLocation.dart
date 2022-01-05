import 'package:flutter/material.dart';
import 'package:grocceries/data/data.dart';

class SelecetLocation extends StatefulWidget {
  const SelecetLocation({Key? key}) : super(key: key);

  @override
  _SelecetLocationState createState() => _SelecetLocationState();
}

class _SelecetLocationState extends State<SelecetLocation> {
  String zone = 'Toshkent';
  List zones = ["Farg'ona", "Qashqadaryo", "Samarqand", "Andijon"];
  String area = 'Mirobod';
  List areas = ["Yashnabod", "Chilonzor", "Sergeli", "Yunusobod"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                ),
                Image.asset("assets/images/location.png"),
                const Text(
                  "Select your location",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: const [
                    Text("Switch on your location to stay in tune with what's"),
                    Text("happening in your area"),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                dropdownmenu(labelName: "Zone", places: zones, value: zone),
                dropdownmenu(labelName: "Area", places: areas, value: area),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signUp");
                  },
                  child: const Text("Get Started"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  dropdownmenu({
    required List places,
    required String labelName,
    required String value,
  }) =>
      DropdownButtonFormField(
        isExpanded: true,
        value: value,
        decoration: InputDecoration(
          label: Text(labelName),
        ),
        items: [
          DropdownMenuItem(
            child: Text(value),
            value: value,
          ),
          DropdownMenuItem(
            child: Text(places[0]),
            value: places[0],
          ),
          DropdownMenuItem(
            child: Text(places[1]),
            value: places[1],
          ),
          DropdownMenuItem(
            child: Text(places[2]),
            value: places[2],
          ),
          DropdownMenuItem(
            child: Text(places[3]),
            value: places[3],
          ),
        ],
        onChanged: (v) {
          setState(() {
            if (labelName == "Zone") {
              user["locationZone"] = v;
            } else {
              user["locationArea"] = v;
            }

            value = v.toString();
          });
        },
      );
}
