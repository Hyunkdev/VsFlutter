import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirsty/provider/bottom_nav_provider.dart';
import 'package:thirsty/provider/countprovider.dart';
import 'package:thirsty/widgets/mainscreenwidget.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  late Countprovider _countprovider;
  late BottomNavProvider _bottomNavProvider;

  Widget _navigationBody() {
    switch (_bottomNavProvider.currentPage) {
      case 0:
        return Mainscreenwidget();

      case 1:
        break;
    }
    return Container();
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark_rounded),
            label: 'Collections'),
      ],
      currentIndex: _bottomNavProvider.currentPage,
      selectedItemColor: Colors.blueAccent,
      onTap: (index) {
        _bottomNavProvider.updateCurrentPage(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavProvider = Provider.of<BottomNavProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 155, 255),
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
