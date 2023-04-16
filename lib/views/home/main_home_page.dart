import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/views/home/homepage.dart';

class MainHomePage extends ConsumerStatefulWidget {
  const MainHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainHomePageState();
}

class _MainHomePageState extends ConsumerState<MainHomePage> {
  List pages = [
    const HomePage(),
    const Text("Accounts"),
    const Text("Settings")
  ];

  int selectedItem = 0;
  void _onTappedItem(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(color: Colors.black87),
        unselectedLabelStyle: const TextStyle(color: Colors.black45),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Employees"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
        ],
        currentIndex: selectedItem,
        onTap: _onTappedItem,
      ),
    );
  }
}
