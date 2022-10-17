import 'package:flutter/material.dart';
import 'package:app_porfolio_bakapp/utils/theme_selector.dart';
import 'package:app_porfolio_bakapp/utils/view_wrapper.dart';
import 'package:app_porfolio_bakapp/widgets/bullet_list.dart';
import 'package:app_porfolio_bakapp/widgets/navigation_arrow.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView>
    with SingleTickerProviderStateMixin {
  late double screenWidth;
  late double screenHeight;
  String flutter = 'Flutter';
  String dart = 'Dart';
  String node = 'Node.js';
  String fire = 'Fire Base';

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return ViewWrapper(
      desktopView: desktopView(),
      mobileView: mobileView(),
    );
  }

  Widget desktopView() {
    return Stack(
      children: [
        NavigationArrow(isBackArrow: false),
        NavigationArrow(isBackArrow: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Expanded(flex: 3, child: infoSection()),
            Spacer(flex: 1),
            Expanded(
              flex: 3,
              child: BulletList(
                strings: [flutter, dart, node, fire],
              ),
            ),
            Spacer(flex: 1),
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.05),
        infoText(),
        SizedBox(height: screenHeight * 0.05),
        Container(
          height: screenHeight * 0.3,
          child: BulletList(
            strings: [flutter, dart, fire, node],
          ),
        ),
      ],
    );
  }

  Widget infoSection() {
    return Container(
      width: screenWidth * 0.35,
      child: Column(
        children: [
          profilePicture(),
          SizedBox(height: screenHeight * 0.05),
          infoText()
        ],
      ),
    );
  }

  Widget profilePicture() {
    return Container(
      height: getImageSize(),
      width: getImageSize(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getImageSize() / 2),
        child: Container(
          color: Colors.grey,
          child: Center(
            child: Image.asset('assets/programador.png'),
          ),
        ),
      ),
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 350;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 300;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 200;
    } else {
      return 150;
    }
  }

  Widget infoText() {
    return Text(
      'Soy una persona proactiva, habilidosa en resolución de conflictos y trabajo en equipo. Soy muy flexible, por lo que me adapto a cualquier cambio. Me gusta aprender, y me gustan los retos, por lo que no sería inconveniente si tuviera que aprender habilidades nuevas.',
      overflow: TextOverflow.clip,
      style: ThemeSelector.selectBodyText(context),
    );
  }
}
