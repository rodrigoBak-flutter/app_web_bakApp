import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_porfolio_bakapp/widgets/custom_icon_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: Container(
              height: 2,
              width: screenWidth * 0.9,
              color: Colors.white,
            )),
        Container(
          height: screenHeight * 0.05,
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CustomIconButton(
                      iconData: FontAwesomeIcons.youtube,
                      url: 'https://youtube.com',
                      color: Colors.red,
                    ),
                    SizedBox(width: screenWidth * 0.021),
                    const CustomIconButton(
                      iconData: FontAwesomeIcons.github,
                      url: 'https://github.com/rodrigoBak-flutter',
                      color: Colors.white,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    const CustomIconButton(
                      iconData: FontAwesomeIcons.linkedin,
                      url: 'https://www.linkedin.com/in/rodrigo-bak-flutter/',
                      color: Colors.blue,
                    )
                  ],
                ),
                const Text('Hecho con Flutter Web \u00a9 2022',
                    style: TextStyle(color: Colors.white, fontFamily: 'Barlow'))
              ],
            ),
          ),
        )
      ],
    );
  }
}
