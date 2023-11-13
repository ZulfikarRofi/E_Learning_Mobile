import 'package:first_app/Beranda/components/app_bar_beranda.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Beranda/beranda_page.dart';
import 'package:first_app/Chatbot/list_chatbot.dart';
import 'package:first_app/Jadwal/jadwal_page.dart';
import 'package:first_app/Kuis/quiz_list.dart';

// void main() => runApp(const BerandaPage());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    const BerandaPage(),
    const QuizList(),
    const JadwalPage(),
    const ListChatbot(),
  ];

  final appbars = [
    const BerandaNavWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: screens[currentIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Container(
            margin: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor:
                    Colors.black, // Set the background color to black
                selectedItemColor: Colors.white, // Set the selected item color
                unselectedItemColor:
                    Colors.grey, // Set the unselected item color
                currentIndex: currentIndex,
                onTap: (int val) => setState(() => currentIndex = val),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.assignment_outlined),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_outline),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        )
        // FloatingNavbar(
        //   margin: const EdgeInsets.only(bottom: 20),
        //   onTap: (int val) => setState(() => currentIndex = val),
        //   currentIndex: currentIndex,
        //   items: [
        //     FloatingNavbarItem(
        //       icon: Icons.home,
        //     ),
        //     FloatingNavbarItem(
        //       icon: Icons.assignment,
        //     ),
        //     FloatingNavbarItem(
        //       icon: Icons.calendar_month,
        //     ),
        //     FloatingNavbarItem(
        //       icon: Icons.chat_bubble,
        //     ),
        //   ],
        // ),
        );
  }
}
