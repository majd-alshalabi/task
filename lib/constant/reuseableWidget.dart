import 'dart:ui';

import 'package:flutter/material.dart';

import 'constant.dart';

class InputContainer extends StatefulWidget {
  final String placeHolderText;
  final double newWidth;
  final TextEditingController? controller;
  final bool obscureTextValue;
  final TextInputType keyboardType;
  final Function valid;

  InputContainer({
    required this.placeHolderText,
    required this.newWidth,
    this.controller,
    required this.obscureTextValue,
    required this.keyboardType,
    required this.valid,
  });
  @override
  _InputContainerState createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.newWidth,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(6),
      child: TextFormField(
        validator: (value) {
          return widget.valid(value);
        },
        textInputAction: TextInputAction.next,
        obscureText: widget.obscureTextValue,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: widget.placeHolderText,
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;

  const MyButton({Key? key, required this.buttonText, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      child: MaterialButton(
        height: 45,
        minWidth: size.width / 3,
        color: firstColor,
        onPressed: () {
          onTap();
        },
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Hero(
          tag: 'Header',
          child: Image(
            width: size.width / 4,
            image: iconImage,
          ),
        ),
        Text(
          '.  NSWANY SHOP  .',
          style: TextStyle(
              fontFamily: firstFont, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          'get your self a haircut',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: firstFont,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}

class ShadowText extends StatelessWidget {
  ShadowText(this.data, {this.style});

  final String data;
  final TextStyle? style;

  Widget build(BuildContext context) {
    return new ClipRect(
      child: new Stack(
        children: [
          new Positioned(
            top: 2.0,
            left: 2.0,
            child: new Text(
              data,
              style: style != null
                  ? style!.copyWith(color: Colors.black.withOpacity(0.5))
                  : TextStyle(color: Colors.black),
            ),
          ),
          new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: new Text(data, style: style),
          ),
        ],
      ),
    );
  }
}

class JustClickSearchSection extends StatelessWidget {
  final double margin;

  const JustClickSearchSection({Key? key, required this.margin})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search for barbershop ...',
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.search,
                color: firstColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
