import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/model/barbershopModel.dart';
import 'package:task2/shared/fileHelper.dart';
import 'package:task2/shared/providerHelper.dart';
import 'package:task2/shared/sharedPreHelper.dart';
import 'package:task2/shared/sqfliteHelper.dart';
import 'package:task2/view/loginView.dart';
import 'package:task2/view/mainScreenView/barbershopViewWidget/barbershopView.dart';
import 'package:task2/view/mainView.dart';
import 'package:task2/view/rigestrView.dart';
import 'constant/constant.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ProviderHelper>(
      create: (context) => ProviderHelper(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loading = true;
  bool whichScreen = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    FileHelper fileHelper = FileHelper();
    List<dynamic> z = await fileHelper.getData();
    if (z.isNotEmpty) context.read<ProviderHelper>().data = z;

    List<BarbershopModel> li = [];
    context.read<ProviderHelper>().data.forEach((element) {
      li.add(BarbershopModel.fromJson(element));
    });
    context.read<ProviderHelper>().dataModel = li;
    int x = await SharedPre.getUserId();
    if (x == -1)
      whichScreen = false;
    else {
      context.read<ProviderHelper>().userModel =
          await DatabaseHelper.getDataById(x);
      whichScreen = true;
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MainView.id: (BuildContext context) => MainView(),
        LoginView.id: (BuildContext context) => LoginView(),
        RigesterView.id: (BuildContext context) => RigesterView(),
        BarbershopView.id: (BuildContext context) => BarbershopView(),
      },
      home: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : whichScreen
              ? MainView()
              : LoginView(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey[100],
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: firstColor),
        ),
      ),
    );
  }
}
