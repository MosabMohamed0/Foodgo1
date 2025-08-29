import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:foodgo/models/account.dart';

class AccountsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stored Accounts')),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Account>('accounts').listenable(),
        builder: (context, Box<Account> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('No accounts stored.'));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final acc = box.getAt(index);
              return ListTile(
                title: Text(acc?.password ?? ''),
                subtitle: Text(acc?.email ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
