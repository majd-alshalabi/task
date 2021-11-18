import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/constant/constant.dart';
import 'package:task2/model/barbersModel.dart';
import 'package:task2/model/barbershopBookModel.dart';
import 'package:task2/model/barbershopModel.dart';
import 'package:task2/shared/providerHelper.dart';

class BookView extends StatefulWidget {
  @override
  _BookViewState createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  List<BarbershopBookModel> data = [];
  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        itemBuilder: (context, idx) {
          return Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/barber/${data[idx].image}'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data[idx].barbershopName,
                        style: TextStyle(
                            color: firstColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(data[idx].barberName),
                    ],
                  ),
                  Text(setTime(data[idx].idxForTime)),
                ],
              ));
        },
        itemCount: data.length,
      ),
    );
  }

  String setTime(int idx) {
    int x = ((idx * 30) ~/ 60);
    int m = (idx * 30) % 60;
    int h = (9 + x) % 12;
    if (h == 0) h = 12;
    String ret = '';
    if (h <= 9) {
      ret += '0';
      ret += h.toString();
    } else
      ret += h.toString();
    ret += ' : ';
    if (m <= 9) {
      ret += '0';
      ret += m.toString();
    } else
      ret += m.toString();
    return ret;
  }

  void initData() {
    for (int i = 0; i < context.read<ProviderHelper>().dataModel.length; i++) {
      BarbershopModel barbershop = context.read<ProviderHelper>().dataModel[i];
      for (int j = 0; j < barbershop.barbers.length; j++) {
        BarberModel barber = barbershop.barbers[j];
        for (int k = 0; k < barber.book.length; k++) {
          var element = barber.book[k];
          if (element['book'] == true &&
              element['name'] ==
                  context.read<ProviderHelper>().userModel.email) {
            data.add(BarbershopBookModel(
                barberName: barber.name,
                image: barber.image,
                barberindex: j,
                barbershopName: barbershop.name,
                barbershopidx: i,
                idxForTime: k));
          }
        }
      }
    }
  }
}
