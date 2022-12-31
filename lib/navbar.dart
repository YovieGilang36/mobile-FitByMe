import 'package:fitbyme/program/home_page.dart';
import 'package:fitbyme/laporan.dart';
import 'package:fitbyme/profile/profile.dart';
import 'package:fitbyme/program/article/artikel_list.dart';
import 'package:fitbyme/program/resep/resep_list.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List pages = [
    HomePage(),
    Lihat(),
    Display(),
    Laporan(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,

        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.indigo[900],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Program',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cookie),
            label: 'Meals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Article',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Report',
          ),
        ],
      ),
    );
  }
}
