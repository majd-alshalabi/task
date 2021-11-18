import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task2/constant/constant.dart';
import 'package:task2/constant/reuseableWidget.dart';
import 'package:task2/controller/barberShopControler.dart';
import 'package:task2/model/barbershopModel.dart';
import 'package:task2/shared/providerHelper.dart';
import 'package:provider/provider.dart';

import 'barbershopViewWidget/barbershopView.dart';

class ShopsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List li =
        BarbershopController.getBarbershop(context.read<ProviderHelper>().data);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        child: Column(
          children: [
            JustClickSearchSection(
              margin: 10,
            ),
            Expanded(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Container(
                  child: ListView.builder(
                      itemCount: li.length,
                      itemBuilder: (context, idx) {
                        return BarbershopListItem(
                            barbershopModel: li[idx], index: idx);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BarbershopListItem extends StatelessWidget {
  final BarbershopModel barbershopModel;
  final int index;
  const BarbershopListItem(
      {Key? key, required this.barbershopModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ProviderHelper>().selectedBarberShopModel =
            barbershopModel;
        Navigator.pushNamed(context, BarbershopView.id);
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage("assets/images/${barbershopModel.image}"),
            fit: BoxFit.cover,
          ),
        ),
        child: BarbershopWidgetFooter(
          barbershopModel: barbershopModel,
        ),
      ),
    );
  }
}

class BarbershopWidgetFooter extends StatelessWidget {
  final BarbershopModel barbershopModel;

  const BarbershopWidgetFooter({Key? key, required this.barbershopModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.6)),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                child: Image(
                  image: AssetImage('assets/images/scissors2.png'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShadowText(
                    barbershopModel.name,
                    style: TextStyle(color: firstColor, fontSize: 20),
                  ),
                  ShadowText(
                    'Delevery price : ${barbershopModel.delevery}',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    barbershopModel.connected
                        ? Row(
                            children: [
                              ShadowText(
                                'Connected',
                                style: TextStyle(color: Colors.lightGreen),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidCircle,
                                size: 12,
                                color: Colors.lightGreen,
                              )
                            ],
                          )
                        : Row(
                            children: [
                              ShadowText(
                                'Not connected',
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              FaIcon(
                                FontAwesomeIcons.circle,
                                size: 12,
                                color: Colors.red[300],
                              ),
                            ],
                          ),
                    Row(
                      children: [
                        ShadowText(
                          '${barbershopModel.open} am ${barbershopModel.close} pm',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
