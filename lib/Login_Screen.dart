import 'package:flutter/material.dart';

import 'shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPasswordVis = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const Image(
                          image: AssetImage('assets/images/LoginHeader.png'),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome back !',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Text(
                              'login to help more people',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              print('Container clicked');
                              // Navigate to sign up screen or perform any action you want
                            },
                            child: Container(
                              width: 146,
                              height: 36,
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    blurRadius: 10,
                                    offset: Offset(0, 0),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Swipe to sign up',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 0.72,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      label: 'Email Address',
                      prefix: Icons.email_outlined,
                      onSubmit: (value) {
                        print(value);
                      },
                      onChange: (value) {
                        print(value);
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Email Address must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      label: 'Password',
                      prefix: Icons.lock_outline,
                      onSubmit: (value) {
                        print(value);
                      },
                      onChange: (value) {
                        print(value);
                      },
                      suffix: isPasswordVis
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      suffixPressed: () {
                        setState(() {
                          isPasswordVis = !isPasswordVis;
                        });
                      },
                      isPassword: isPasswordVis,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        const Text('Remember me'),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Forget Password ?'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                      text: 'login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      },
                      buttonColor: const Color.fromRGBO(21, 101, 192, 1),
                      textColor: Colors.white,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle, color: Colors.red),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            print('Google login clicked');
                            // Perform Google login here
                          },
                          child: const Text(
                            'Login with Google',
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}