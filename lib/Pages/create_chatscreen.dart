import 'package:flutter/material.dart';
import 'package:massenger/massenger_home.dart';
class CreateChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Chat"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create Chat", style: TextStyle(fontSize: 20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () { // یک پیج بساز
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MassengerHome()));
                    },
                    child: Text("Second Page"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Back"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
