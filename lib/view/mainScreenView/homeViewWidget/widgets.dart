import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task2/constant/constant.dart';
import 'package:task2/constant/reuseableWidget.dart';
import 'package:task2/model/barbershopModel.dart';
import 'package:task2/shared/providerHelper.dart';
import 'package:provider/provider.dart';
import 'package:task2/view/mainScreenView/barbershopViewWidget/barbershopView.dart';

class HomeViewFirstSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
            fontSize: 35.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: firstFont),
        children: <TextSpan>[
          const TextSpan(text: 'Get your self a '),
          TextSpan(text: ' \nHairCut \n', style: TextStyle(color: firstColor)),
          const TextSpan(text: 'where ever you were.')
        ],
      ),
    );
  }
}

class ThirdSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<BarbershopModel> data = context.read<ProviderHelper>().dataModel;
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.4,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: data.map(
        (obj) {
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  context.read<ProviderHelper>().selectedBarberShopModel = obj;
                  Navigator.pushNamed(context, BarbershopView.id);
                },
                child: SliderWidget(obj),
              );
            },
          );
        },
      ).toList(),
    );
  }
}

class SliderWidget extends StatelessWidget {
  SliderWidget(this.obj);

  final BarbershopModel obj;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage('assets/images/${obj.image}'), fit: BoxFit.cover),
      ),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ShadowText(
                      obj.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ShadowText(
                          '${obj.open} am',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        ShadowText(
                          ' - ${obj.close} pm',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.lock_clock_outlined,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
