import 'package:flutter/material.dart';
import 'package:task2/constant/reuseableWidget.dart';
import 'package:task2/controller/userController.dart';
import 'package:task2/model/userModel.dart';
import 'package:task2/shared/providerHelper.dart';
import 'package:task2/shared/sharedPreHelper.dart';
import 'package:task2/view/mainView.dart';
import 'package:task2/view/rigestrView.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  static final String id = 'LoginView';
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String erorrMassage = '';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              LoginHeader(),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    InputContainer(
                      controller: emailController,
                      placeHolderText: 'email',
                      newWidth: size.width * 0.8,
                      obscureTextValue: false,
                      keyboardType: TextInputType.emailAddress,
                      valid: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputContainer(
                      controller: passwordController,
                      placeHolderText: 'password',
                      newWidth: size.width * 0.8,
                      obscureTextValue: false,
                      keyboardType: TextInputType.emailAddress,
                      valid: (value) {
                        if (value.length <= 5)
                          return 'password must be more than 5 Letter';
                        else
                          return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      erorrMassage,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  MyButton(
                    buttonText: 'Login',
                    onTap: () async {
                      setState(() {
                        erorrMassage = '';
                      });
                      if (formKey.currentState!.validate()) {
                        UserModel userModel =
                            await UserController.userAndPasswordAreInDatabase(
                                UserModel(
                          id: -1,
                          email: emailController.text,
                          password: passwordController.text,
                        ));
                        if (userModel.id == -1) {
                          setState(() {
                            erorrMassage = 'Enter valid Data';
                          });
                        } else {
                          context.read<ProviderHelper>().userModel = userModel;

                          await SharedPre.setUserID(userModel.id);
                          Navigator.pushNamedAndRemoveUntil(
                              context, MainView.id, (route) => false);
                        }
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('new user!'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RigesterView.id);
                        },
                        child: Text(
                          'registr?',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
