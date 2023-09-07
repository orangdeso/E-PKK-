import 'package:e_pkk/utils/constants.dart';
import 'package:e_pkk/views/Home/home_page.dart';
import 'package:e_pkk/views/Riwayat/riwayat2.dart';
import 'package:e_pkk/views/SettingAkun/setting_akun_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class navbarView extends StatefulWidget {
  static String route = '/navbarr';

  const navbarView({super.key});

  @override
  State<navbarView> createState() => _navbarViewState();
}

class _navbarViewState extends State<navbarView> {
  int _currentIndex = 0;
  List<Widget> _children = [HomePage(), PageRiwayat2(), SettingAkun()];

  void _onItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        color: ktextColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            gap: 20,
            backgroundColor: ktextColor,
            color: whiteColor,
            activeColor: whiteColor,
            tabBackgroundColor: color3,
            padding: EdgeInsets.all(15),
            tabs: const [
              GButton(
                icon: Icons.home_filled,
                text: 'Beranda',
                iconSize: 25,
              ),
              GButton(
                icon: Icons.library_books,
                text: 'Riwayat',
                iconSize: 25,
              ),
              GButton(
                icon: Icons.person,
                text: 'Akun',
                iconSize: 25,
              ),
            ],
            onTabChange: _onItemTap,
          ),
        ),
      ),
    );
  }
}
