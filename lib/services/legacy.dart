/* 

Legacy in Login:

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.color,
      required this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      width: 250,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: color,
        ),
        onPressed: () => loginMethod(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.5,
              ),
            ),
            const SizedBox(width: 10), //space between icon & text
            Icon(icon, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}

//Continue As Guest Button
LoginButton(
  icon: FontAwesomeIcons.userAstronaut,
  text: 'Continue as Guest',
  loginMethod: AuthService().anonLogin,
  color: Colors.deepPurple,
),

//google sign in
LoginButton(
  icon: FontAwesomeIcons.google,
  text: 'Log in with Google',
  loginMethod: AuthService().anonLogin,
  color: const Color.fromARGB(255, 191, 58, 6),
),

//apple sign in
LoginButton(
  icon: FontAwesomeIcons.apple,
  text: 'Log in with Apple',
  loginMethod: AuthService().anonLogin,
  color: const Color.fromARGB(255, 0, 0, 0),
), 






*/

