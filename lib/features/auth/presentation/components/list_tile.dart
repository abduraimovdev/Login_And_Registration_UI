import 'package:flutter/material.dart';

import '../../../../service._locator.dart';

class ListTilee extends StatefulWidget {
  const ListTilee({super.key});

  @override
  State<ListTilee> createState() => _ListTileeState();
}

class _ListTileeState extends State<ListTilee> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: readData(),
    );
  }

  List<Widget> readData() {
    List<Widget> result = [];
    Map<String, Map<String, Object?>> datas = authController.viewAllData();
    if (datas.isEmpty) {
      return [
        const Text(
          "Not Found User",
        ),
      ];
    }
    for (var item in datas.values) {
      result.add(
        ListTile(
          leading: const Icon(
            Icons.perm_identity,
            color: Colors.grey,
            size: 40,
          ),
          title: Text(
            item["name"] as String,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            item["email"] as String,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          trailing: TextButton(
            onPressed: () {
              authController.deleteAccount(item["email"] as String);
              setState(() {});
            },
            child: const Icon(
              Icons.delete_outline,
              color: Colors.grey,
              size: 35,
            ),
          ),
        ),
      );
    }
    return result;
  }
}
