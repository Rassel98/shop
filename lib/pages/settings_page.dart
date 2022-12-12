import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(child: Text('Settings',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.logout,color: Colors.black,))
        ],
      ),
    );
  }
}
