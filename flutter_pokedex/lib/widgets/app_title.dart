import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';


class AppTitle extends StatelessWidget {
  const AppTitle({super.key});
  final String pokeballImageurl = "images/pokeball.png";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Constants.title,
                  style: Constants.getTitleTextStyle(),
                )),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                pokeballImageurl,
                width: UIHelper.getAppTitleImagewidth(),
                fit: BoxFit.fitWidth,
              )),
        ],
      ),
    );
  }
}
