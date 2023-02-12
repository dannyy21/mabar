import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugas/pages/TeamScreen.dart';

class Join extends StatelessWidget {
  const Join({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff2A0D2E),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/Success.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 70),
              child: Text(
                "Berhasil Di Posting",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              height: 75,
              width: 350,
              padding: EdgeInsets.only(right: 70, left: 70, top: 20),
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () => {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => (TeamScreen())))
                },
                child: Text(
                  'Team',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.grey[300],
  primary: Color(0xFFFA5075),
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(40),
  ),
);
