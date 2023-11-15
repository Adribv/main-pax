import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled3/screen/home_screen.dart';
import '../constants.dart';
import 'package:untitled3/pages/homePage.dart';
import 'package:untitled3/pages/home_page.dart';
import 'package:untitled3/pages/edit_profile.dart';
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 40,vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavItem(
            title: 'Home',
            svgSrc: 'assets/icons/icons8-home.svg',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HhomeScreen(),),
              );
            },
          ),

          BottomNavItem(
            title: 'All Habits',
            svgSrc: 'assets/icons/gym.svg',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage(),),
              );
            },

          ),
          BottomNavItem(
            title: 'Habit Calender',
            svgSrc: 'assets/icons/calendar.svg',
            press: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HommePage(),),
              );
            },
           // isActive: true,
          ),

          BottomNavItem(
            title: 'Settings',
            svgSrc: 'assets/icons/Settings.svg',
    press: (){
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => EditProfilePage(),),
    );},
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String? title;
  final String? svgSrc;
  final Function()? press;
  final bool? isActive;

  BottomNavItem({
    this.title,this.svgSrc,this.press,this.isActive = false,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(svgSrc! , color: isActive! ? kActiveIconColor : kTextColor,),
          Text(title! , style: TextStyle(color: isActive! ? kActiveIconColor : kTextColor),),
        ],
      ),
    );
  }
}

