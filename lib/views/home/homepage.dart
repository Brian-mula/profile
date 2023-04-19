import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
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
                Navigator.pushNamed(context, '/employees');
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
                Navigator.pushNamed(context, '/departments');
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
      body: const Center(
        child: Text("Junior"),
      ),
    );
  }
}
