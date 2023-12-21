import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast extends StatelessWidget {
  const MyToast({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Toast Package'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.mic),
              ),
              title: const Text("Mic Permission"),
              subtitle: const Text("Click to get access to Mic"),
              onTap: () {},
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () => showToastMessage("This is some message"),
             child: const Text("Show tost message"),),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () => Fluttertoast.cancel(),
             child: const Text("Cancel tost message"),),
          ],
        ),
      );

  // void requestMicPermission() async {
  //   var status = await Permission.microphone.status;
  //   if (status.isGranted) {
  //     showToastMessage("Permission was Granted");
  //   } else if (status.isDenied) {
  //     if (await Permission.microphone.request().isGranted) {
  //       showToastMessage("Permission was Granted");
  //     } else {
  //       showToastMessage("Permission was Granted");
  //     }
  //   }
  // }

  void showToastMessage(String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM_RIGHT,
    timeInSecForIosWeb: 50,
    backgroundColor: Colors.black,
    fontSize: 30.0,
    webShowClose: true,
    );
}
