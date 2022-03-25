import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexapp/constants/constants.dart';
import 'package:pokedexapp/constants/uiHelper.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = "assets/pokeball.png";
    return Container(
      height: UIHelper.getAppTitleWidgetHeight(),
      color: Colors.red,
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
              pokeballImageUrl,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sm,
              height: 100.w,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
