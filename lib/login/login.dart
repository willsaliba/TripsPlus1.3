import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trips_plus/services/auth.dart';
import 'package:trips_plus/shared/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String feedback = "";

  void invalidLogin() {
    setState(() { feedback = "Invalid Email or Password"; });
    //resetting after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      setState(() { feedback = ""; });
    });
  }

  @override
  Widget build(BuildContext context) {
    final custom = Theme.of(context);
    return Scaffold( 
      resizeToAvoidBottomInset: false,
      body: Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Page Title & Logo
          const TopSection(title: 'Log In'),

          //Email & Pass Inputs, ForgotPass Button
          Column(children: [
            //Email
            CustomTextFormField(
              controller: emailController,
              hintText: 'Email',
              isPass: false,
            ),
            const SizedBox(height: 30),
            //Password
            CustomTextFormField(
              controller: passwordController,
              hintText: 'Password',
              isPass: true,
            ),
            //Forgot Password
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => ForgotPassAlert(),
                );
              },
              child:Text("Forgot Password?", style: custom.textTheme.bodySmall),
            ),
          ]),

          //Feedback for Invalid Create Account Request
          Text(feedback, style: custom.textTheme.titleSmall),

          //Sign In Options
          Column(children: [
            //Email & Pass Log In Button
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: 250,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: const Color.fromARGB(255, 0, 42, 179),
                ),
                //Firebase method for email & pass login
                onPressed: () async {
                  bool loginResult = await AuthService().emailPassLogin(
                    emailController.text,
                    passwordController.text,
                  );
                  if (loginResult == false) { invalidLogin(); }
                },
                //button elements
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Log In", style: custom.textTheme.bodyMedium),
                    const SizedBox(width: 10), //space between icon & text
                    const Icon(FontAwesomeIcons.arrowRight,
                        color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),

            //Anonomous Log In Button
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              width: 250,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () => AuthService().anonLogin(),
                //button elements
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Continue as Guest",style: custom.textTheme.bodyMedium),
                    const SizedBox(width: 10),
                    const Icon(FontAwesomeIcons.userAstronaut,
                      color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
          ]),

          //Help Text & Sign Up Button
          Column(children: [
            Text("Don't have an account?", style: custom.textTheme.bodySmall),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: Text("Sign Up", style: custom.textTheme.bodyLarge),
            ),
          ]),
        ],
      ),
    ));
  }
}

//pop up to use Firebase to reset user password
class ForgotPassAlert extends StatelessWidget {
  ForgotPassAlert({super.key});
  final TextEditingController resetInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final custom = Theme.of(context);
    return AlertDialog(
      title: Text("Reset Password", style: custom.textTheme.headlineMedium),
      content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        //email input
        CustomTextFormField(
          controller: resetInput,
          hintText: "Enter your email",
          isPass: false,
        ),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //cancel button
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Cancel", style: custom.textTheme.bodySmall),
          ),
          const SizedBox(width: 25),
          //confirm button
          ElevatedButton(
            onPressed: () async {
              if (resetInput.text.isNotEmpty) {
                final navigator = Navigator.of(context);
                await AuthService().resetPassword(resetInput.text);
                navigator.pop();
              }
            },
            child: Text("Confirm", style: custom.textTheme.bodySmall),
          ),
        ]),
      ]),
    );
  }
}
