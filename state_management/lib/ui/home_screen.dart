import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/providers/user_provider.dart';

// --------- STATEFUL -------------
// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final users = ref.watch(userProvider);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Users list')),
//       body: GridView.count(
//         crossAxisCount: 4,
//         children: users.map((u) {
//           return Card(
//               child: Column(
//                   children: [Text(u.username)]
//               )
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// ConsumerWidget = StatelessWidget thêm chức năng consumer
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Users list'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children:
          users.map((u) {
            return ListTile(
              title: Text('${u.name} [${u.id}]'),
              subtitle: Text(u.email),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.edit),
            );
          }).toList()
        ,
      ),
    );
  }
}
