import 'package:flutter/material.dart';
import 'package:task2/constant/reuseableWidget.dart';
import 'package:task2/controller/userController.dart';
import 'package:task2/model/userModel.dart';
import 'package:task2/shared/providerHelper.dart';
import 'package:task2/shared/sharedPreHelper.dart';
import 'package:task2/view/mainView.dart';
import 'package:provider/provider.dart';

class RigesterView extends StatefulWidget {
  static final String id = 'RigestrView';

  @override
  _RigesterViewState createState() => _RigesterViewState();
}

class _RigesterViewState extends State<RigesterView> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  String errorMassage = '';

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                        obscureTextValue: true,
                        keyboardType: TextInputType.visiblePassword,
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
                      InputContainer(
                        controller: confirmPasswordController,
                        placeHolderText: 'confirm password',
                        newWidth: size.width * 0.8,
                        obscureTextValue: true,
                        keyboardType: TextInputType.visiblePassword,
                        valid: (value) {
                          if (value != passwordController.text)
                            return 'both password must be equal';
                          else
                            return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        errorMassage,
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                MyButton(
                  buttonText: 'Rigestr',
                  onTap: () async {
                    setState(() {
                      errorMassage = '';
                    });
                    if (formKey.currentState!.validate()) {
                      UserModel userModel =
                          await UserController.userAreInDatabase(UserModel(
                        id: -1,
                        email: emailController.text,
                        password: emailController.text,
                      ));
                      if (userModel.id == -1) {
                        await UserController.addToDatabase(
                          UserModel(
                            id: -1,
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                        userModel =
                            await UserController.userAreInDatabase(UserModel(
                          id: -1,
                          email: emailController.text,
                          password: 'password',
                        ));
                        context.read<ProviderHelper>().userModel = userModel;

                        await SharedPre.setUserID(userModel.id);
                        Navigator.pushNamedAndRemoveUntil(
                            context, MainView.id, (route) => false);
                      } else {
                        setState(() {
                          errorMassage = 'this user is already in use';
                        });
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
