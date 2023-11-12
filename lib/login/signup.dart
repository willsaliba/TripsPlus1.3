import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trips_plus/services/auth.dart';
import 'package:trips_plus/shared/shared.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  String feedback = "";

  void invalidLogin(String msg) {
    setState(() {
      feedback = msg;
    });
    //resetting after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        feedback = "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final styl = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const TopSection(title: 'Sign Up'),
            //Email, Pass & Confirm Inputs,
            Column(children: [
              //Email Input Box
              CustomTextFormField(
                controller: emailController,
                hintText: 'Email',
                isPass: false,
              ),
              const SizedBox(height: 20),
              //Create Password Input Box
              CustomTextFormField(
                controller: passController,
                hintText: 'Create Password',
                isPass: true,
              ),
              const SizedBox(height: 20),
              //Confirm Password Input Box
              CustomTextFormField(
                controller: confirmPassController,
                hintText: 'Confirm Password',
                isPass: true,
              ),
              const SizedBox(height: 30),
            ]),

            //Feedback for Invalid Create Account Request
            Text(feedback, style: styl.textTheme.titleSmall),

            //Create Account Button
            SizedBox(
              width: 250,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: const Color.fromARGB(255, 0, 42, 179),
                ),
                onPressed: () async {
                  //checking inputs are valid
                  bool validReq = true;
                  if (passController.text != confirmPassController.text) {
                    invalidLogin("Passwords Do Not Match");
                    validReq = false;
                  } 
                  if (emailController.text.isEmpty || 
                      passController.text.isEmpty ||
                      confirmPassController.text.isEmpty) {
                    invalidLogin("All Input Fields Not Filled");
                    validReq = false;
                  }
                  //if request are valid enough let firebase handle rest
                  if (validReq == true) {
                    final navigator = Navigator.of(context);
                    feedback = await AuthService().emailPassSignUp(
                      emailController.text,
                      passController.text,
                    );
                    bool result = feedback == "User Created!";
                    result ? navigator.pop() : invalidLogin(feedback);
                  }
                },
                //button elements
                child: Row(mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    Text("Create Account", style: styl.textTheme.bodyMedium),
                    const SizedBox(width: 10),
                    const Icon(FontAwesomeIcons.arrowRight,
                        color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
            //Log In Button & Help Text
            Column(children: [
              const SizedBox(height: 40),
              Text("Already have an account?", style: styl.textTheme.bodySmall),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Log In", style: styl.textTheme.bodyLarge),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
