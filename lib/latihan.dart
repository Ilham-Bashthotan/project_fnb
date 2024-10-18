import 'package:flutter/material.dart';
import 'package:project_fnb/login.dart';

class Latihan extends StatelessWidget {
  const Latihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: InkWell(
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: AlignmentDirectional.center,
                  color: Colors.amber,
                  child: Text(
                    "kembali",
                    style: TextStyle(color: Color(0xFF6C946F)),
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ),
            Text("halo"),
            Image(image: AssetImage('images/lol.png'))
          ],
        ),
      ),
    );
  }
}
