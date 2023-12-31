import 'package:flutter/material.dart';
import 'package:flutter_local_auth/services/local_auth_service.dart';

class HomeScreen extends StatefulWidget {


  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool authenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Auth example"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(!authenticated)
            ElevatedButton(onPressed: () async {
              final authenticate = await LocalAuth.authenticate();
              setState(() {
                authenticated = authenticate;
              });
            }, child: const Text("Authenticate")),
            if(authenticated)
              const Text("You are authenticated"),
            if(authenticated)
              ElevatedButton(onPressed: () async {
                setState(() {
                  authenticated = false;
                });
              }, child: const Text("Log out")),
          ],
        ),
      ),
    );
  }
}