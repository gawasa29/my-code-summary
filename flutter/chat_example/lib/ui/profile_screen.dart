import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/User.dart';
import '../utils/FirebaseHelper.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(userModelProvider);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('プロフィール'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 150, child: Text("名前")),
                  Expanded(child: TextField(
                    onChanged: (String? value) {
                      currentUser.name = value!;
                    },
                  ))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  child: const Text('編集'),
                  onPressed: () async {
                    await FireStoreUtils.updateCurrentUser(currentUser);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
