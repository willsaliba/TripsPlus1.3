import 'package:flutter/material.dart';
import 'package:trips_plus/shared/shared.dart';

List<String> myMates = [
  'Lachie Skeates',
  'Simon Pottharst',
  'Josh Angus',
  'Wayno',
  'Jay Goodies',
  'The Mickster',
  'Cool Guy Danny',
];

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});

  @override
  State<AddTripScreen> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  //member variables
  TextEditingController tripNameCTLR = TextEditingController();
  TextEditingController startCTLR = TextEditingController();
  TextEditingController endCTLR = TextEditingController();
  Color selectedColour = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        title:Text("Add Trip", style:Theme.of(context).textTheme.headlineSmall),
      ),

      //Body
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Trip Name Input
            CustomTextFormField(
              controller: tripNameCTLR,
              hintText: 'Trip Name',
              isPass: false,
            ),
            //Start & End Date Input
            Row(children: [
              Expanded(
                child: CustomTextFormField(
                  controller: startCTLR,
                  hintText: 'Start Date',
                  isPass: false,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextFormField(
                  controller: endCTLR,
                  hintText: 'End Date',
                  isPass: false,
                ),
              ),
            ]),
            //Invite Mates Box
            Container(
              height: 310,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(30, 30, 60, 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SelectMatesBox(matesNames: myMates),
            ),

            //Selecting Group Colour
            TextButton(
              style: roundButtonStyling(const Color.fromRGBO(0, 0, 0, 0)),
              onPressed: () {
                //POP UP WITH 5 COLOURS
                //SAVE BUTTON
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Group Colour",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(width: 15),
                  Container(height: 40, width: 40,
                    decoration: BoxDecoration(
                      color: selectedColour,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ],
              ),
            ),

            //Create Trip Button
            ElevatedButton(
              style: roundButtonStyling(Colors.black),
              onPressed: () {
                //RETRIEVE ALL INPUTS AND CREATE CLASS
                //ADD CLASS TO USERS TRIPS 
                Navigator.pop(context);
              },
              child: Text("Create Trip",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
          ],
        ),
      ),
    );
  }
}

//TO DO
//SORT OUT SAVING SYSTEM
//CREATE TRIP BUTTON
//GROUP COLOUR BUTTON

class Trip {
  final String groupName;
  final String startDate;
  final String endDate;
  final List<String> groupMembers;
  final Color theColour;

  // Constructor
  Trip({
    required this.groupName,
    required this.startDate,
    required this.endDate,
    required this.groupMembers,
    required this.theColour,
  });

  String getTripName() {
    return groupName;
  }

  String getTripStart() {
    return startDate;
  }

  String getTripEnd() {
    return endDate;
  }

  List<String> getTripMembers() {
    return groupMembers;
  }

  Color getTripColour() {
    return theColour;
  }
}
