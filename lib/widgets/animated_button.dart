import 'package:emi_calculator/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class RxSwitchButton extends StatefulWidget {
  @override
  _RxSwitchButtonState createState() => _RxSwitchButtonState();
}

class _RxSwitchButtonState extends State<RxSwitchButton> {
  HomeController c = Get.put(HomeController());
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 2000),
        height: 40,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: toggle ? Colors.grey[200] : Colors.black12,
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
                child: InkWell(
                  onTap: toggleSwitch,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 1000),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(child: child, scale: animation);
                    },
                    child: toggle
                        ? Icon(
                            Ionicons.sunny,
                            color: Colors.amberAccent,
                            size: 35.0,
                            key: UniqueKey(),
                          )
                        : Icon(
                            Ionicons.moon,
                            color: Colors.white,
                            size: 35.0,
                            key: UniqueKey(),
                          ),
                  ),
                ),
                curve: Curves.easeIn,
                left: toggle ? 00.0 : 60.0,
                right: toggle ? 40.0 : 0.0,
                duration: Duration(milliseconds: 500))
          ],
        ),
      ),
    );
  }

  toggleSwitch() {
    setState(() {
      toggle = !toggle;
      c.isDarkModeEnabled.value = toggle;
      c.setDarkMode();
    });
  }
}
