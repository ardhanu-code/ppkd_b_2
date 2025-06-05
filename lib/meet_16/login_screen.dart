import 'package:flutter/material.dart';
import 'package:ppkd_b_2/meet_16/database/db_helper.dart';
import 'package:ppkd_b_2/meet_16/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static const String id = "/login_screen_app";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Login to access your account',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 31),
              Text('Username', style: TextStyle(fontSize: 12)),
              SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextFormField(
                  controller: _usernameController,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    focusColor: Colors.grey,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 35,
                      horizontal: 14,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text('Password', style: TextStyle(fontSize: 12)),
              SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextFormField(
                  controller: _passwordController,
                  style: TextStyle(fontSize: 14),
                  obscureText: !isVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    focusColor: Colors.grey,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 35,
                      horizontal: 14,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final userData = await DBHelper.loginUser(
                    _usernameController.text,
                    _passwordController.text,
                  );
                  if (userData != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Berhasil login!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Username dan Password tidak terdaftar atau salah!',
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                  // PreferenceHandler.saveLogin(true);
                  // Navigator.pushNamedAndRemoveUntil(
                  //   context,
                  //   '/home_screen',
                  //   (route) => false,
                  // );
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 13, 84, 90),
                  elevation: 0,
                  minimumSize: Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              SizedBox(height: 18),
              Row(
                children: <Widget>[
                  Expanded(child: Divider(color: Colors.grey, thickness: 0)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or Sign In With',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey, thickness: 0)),
                ],
              ),
              SizedBox(height: 24),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/google_icon.png',
                                height: 14,
                                width: 14,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Google',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xffF5F5F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            minimumSize: Size(155, 48),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/facebook_icon.png',
                                height: 36,
                                width: 36,
                              ),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xffF5F5F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            minimumSize: Size(155, 48),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 12, color: Color(0xff21BDCA)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
