import 'package:flutter/material.dart';

/* ---UNIVERSALLY SHARED--- */

//text input field
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPass;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.isPass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      obscureText: isPass,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}

//button with rounded edges
ButtonStyle roundButtonStyling(Color theColour) {
  return ButtonStyle(
    padding: MaterialStateProperty.all(
        const EdgeInsets.fromLTRB(35.0, 15.0, 35.0, 15.0)),
    backgroundColor: MaterialStateProperty.all(theColour),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.0) ),
    ),
  );
}

//checkboxes for selecting multiple of something
class SelectMatesBox extends StatefulWidget {
  final List<String> matesNames;

  const SelectMatesBox({Key? key, required this.matesNames}) : super(key: key);

  @override
  SelectMatesBoxState createState() => SelectMatesBoxState();
}

class SelectMatesBoxState extends State<SelectMatesBox> {
  late Map<String, bool> matesInvited;

  @override
  void initState() {
    super.initState();
    matesInvited = {for (var item in widget.matesNames) item: false};
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: matesInvited.keys.map((String key) {
        return CheckboxListTile(
          title: Text(key, style: Theme.of(context).textTheme.headlineSmall),
          value: matesInvited[key],
          onChanged: (bool? value) {
            setState(() {
              matesInvited[key] = value!;
            });
          },
        );
      }).toList(),
    );
  }
}

/* ---SHARED BY LOGIN FOLDER--- */

class TopSection extends StatelessWidget {
  final String title;
  const TopSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      //Page Title and Logo
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset('assets/TPLogo.png', fit: BoxFit.cover),
          ),
        ),
      ]),
    ]);
  }
}


