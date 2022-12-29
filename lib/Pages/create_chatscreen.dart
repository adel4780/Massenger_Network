import 'package:flutter/material.dart';
import 'package:massenger/massenger_home.dart';

class CreateChatScreen extends StatelessWidget {
  const CreateChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Chat"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Create Chat",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // یک پیج بساز
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MassengerHome()));
                  },
                  child: const Text("Second Page"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
