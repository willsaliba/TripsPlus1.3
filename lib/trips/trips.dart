import 'package:flutter/material.dart';
import 'package:trips_plus/shared/shared.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trips+", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TripBlock(
              theColor: Color.fromARGB(255, 255, 0, 0),
              tripName: "RKM",
            ),
            TripBlock(
              theColor: Color.fromARGB(255, 0, 0, 255),
              tripName: "Modern RKM",
            ),
            TripBlock(
              theColor: Color.fromARGB(255, 118, 142, 0),
              tripName: "GC24",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        selectedItemColor: const Color.fromARGB(255, 200, 200, 200),
        unselectedItemColor: const Color.fromARGB(255, 200, 200, 200),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        //nav options
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Mates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Trip',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (newIndex) {
          switch (newIndex) {
            case 0:
              Navigator.pushNamed(context, '/mates');
              break;
            case 1:
              Navigator.pushNamed(context, '/add_trip');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}

class TripBlock extends StatelessWidget {
  final Color theColor;
  final String tripName;

  const TripBlock({
    Key? key,
    required this.theColor,
    required this.tripName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.only(bottom: 15.0), // Margin only at the bottom
      child: ElevatedButton(
        style: roundButtonStyling(theColor),
        onPressed: () {
          //FIGURE OUT HOW TO ALSO GET THE TRIPS NAME
          Navigator.pushNamed(context, '/a_trip');
        },
        child: Text(tripName, style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}
