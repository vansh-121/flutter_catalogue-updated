import 'package:flutter/material.dart';
import 'package:flutter_catalogue/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changebutton = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.theme.cardColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name!",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 28),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter your username",
                              labelText: "Username"),
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your username";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Enter your password",
                              labelText: "Password"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your password.";
                            } else if (value.length < 6) {
                              return "Password length must be greater than 6.";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 202, 27, 15),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // ElevatedButton(
                      //     child: const Text("Login"),
                      //     onPressed: () {
                      //       // ignore: avoid_print
                      //       Navigator.pushNamed(context, Routes.HomeRoute);
                      //     },
                      //     style: TextButton.styleFrom(
                      //         minimumSize: const Size(100, 50))),
                    ],
                  ),
                ),
                Material(
                  color: const Color.fromARGB(255, 68, 61, 209),
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          changebutton = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        await Navigator.pushNamed(context, Routes.HomeRoute);
                        setState(() {
                          changebutton = false;
                        });
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: changebutton ? 50 : 100,
                      height: 40,
                      alignment: Alignment.center,
                      child: changebutton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
