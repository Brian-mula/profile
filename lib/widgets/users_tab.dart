import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersTab extends ConsumerStatefulWidget {
  const UsersTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsersTabState();
}

class _UsersTabState extends ConsumerState<UsersTab> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/employee-details');
                  },
                  child: Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2018/08/24/20/21/cat-3628801__340.jpg"),
                        backgroundColor: Colors.blue,
                      ),
                      title: Text(
                        "Mulati Brian",
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: Colors.black87),
                      ),
                      subtitle: Text(
                        "Chief Executive Officer",
                        style: theme.textTheme.bodySmall,
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black54,
                            size: 30,
                          )),
                    ),
                  ),
                ),
              )),
    );
  }
}
