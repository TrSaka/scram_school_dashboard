import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../riverpod/firebase_riverpod.dart';

class StudentCard extends ConsumerWidget {
  const StudentCard({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final userData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        leading: FutureBuilder(
          future: ref.read(authProvider).storage.fetchDefaultProfilePic(),
          builder: (context, AsyncSnapshot snapshot) {
            return CircleAvatar(
              backgroundColor: Colors.transparent,
              child: snapshot.data == null
                  ? Text(userData['name'][0].toString().toUpperCase())
                  : CachedNetworkImage(
                      fit: BoxFit.cover,
                      useOldImageOnUrlChange: true,
                      imageUrl: snapshot.data,
                    ),
            );
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${userData['name'].toString().toUpperCase()} ${userData['lastName'].toString().toUpperCase()}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(userData['userNumber'] ?? 0),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  )),
              InkWell(
                  onTap: (() {}),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

CircleAvatar circle(int index, userData) {
  return CircleAvatar(
    backgroundColor: index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
    foregroundColor: Colors.white,
    child: Text(
      userData['name'][0].toString().toUpperCase(), //takes first
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
