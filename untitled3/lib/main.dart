import 'package:flutter/material.dart';
import 'package:untitled3/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled3/pages/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled3/pages/questions.dart';
import 'package:untitled3/screens/signin_screen.dart';
import 'package:untitled3/pages/habitsPage.dart';
import 'package:untitled3/pages/profilePage.dart';
import 'package:untitled3/pages/progressPage.dart';

import 'pages/homePage.dart';
import 'constants.dart';
import 'screen/home_screen.dart';

void main() async {
  await Hive.initFlutter();


  await Hive.openBox("Habit_Database");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: SignInScreen(),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  NavigationScreen({required this.currentIndex});
  int currentIndex;
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

const List<Widget> screens = [
  HomePage(),
  ProgressPage(),
  Habitspage(),
  ProfilePage()
];

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: widget.currentIndex,
        onTap: (index) {
          setState(() {
            widget.currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "Habits"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}
