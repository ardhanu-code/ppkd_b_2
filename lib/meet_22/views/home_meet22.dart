import 'package:flutter/material.dart';
import 'package:ppkd_b_2/meet_22/api/func.dart';
import 'package:ppkd_b_2/meet_22/models/user_model.dart';

class MeetDuaDua extends StatefulWidget {
  const MeetDuaDua({super.key});

  @override
  State<MeetDuaDua> createState() => _MeetDuaDuaState();
}

class _MeetDuaDuaState extends State<MeetDuaDua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Programming Interface'),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder<List<UserData>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(user.email),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
