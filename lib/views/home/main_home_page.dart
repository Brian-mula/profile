import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/views/home/accounts_page.dart';
import 'package:payroll/views/home/employees.dart';
import 'package:payroll/views/home/homepage.dart';

class MainHomePage extends ConsumerStatefulWidget {
  const MainHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainHomePageState();
}

class _MainHomePageState extends ConsumerState<MainHomePage> {
  List pages = [const HomePage(), const Employees(), const AccounstView()];

  int selectedItem = 0;
  void _onTappedItem(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey.shade300,
        width: 200,
        elevation: 0.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              backgroundImage: const NetworkImage(
                  'https://cdn.pixabay.com/photo/2018/08/24/20/21/cat-3628801__340.jpg'),
              radius: 40,
            )),
            const SizedBox(
              height: 60,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.home_outlined, color: Colors.orange.shade600),
              title: Text(
                "Dashboard",
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: Colors.orange.shade600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.add, color: Colors.orange.shade600),
              title: Text(
                "New Employee",
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: Colors.orange.shade600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.people, color: Colors.orange.shade600),
              title: Text(
                "All Employees",
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: Colors.orange.shade600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.card_travel, color: Colors.orange.shade600),
              title: Text(
                "Departments",
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: Colors.orange.shade600),
              ),
            ),
          ],
        ),
      ),
      body: pages[selectedItem],
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
