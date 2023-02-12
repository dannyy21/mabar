import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugas/pages/OnboardScreen2.dart';
import 'package:tugas/pages/RegisterScreen.dart';

class OnboardScreen3 extends StatelessWidget {
  const OnboardScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff2A0D2E),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 164),
              child: Image.asset(
                'assets/images/Onboard3.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 110.0, bottom: 70.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Cari Dan Raihlah\n Kemenangan Mu',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFA5075)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 65,
              width: 350,
              padding: EdgeInsets.only(right: 70, left: 70),
              child: ElevatedButton(
                  style: raisedButtonStyle,
                  child: Text(
                    "Mulai",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  }),
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
