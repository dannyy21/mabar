import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugas/pages/OnboardScreen3.dart';

class OnboardScreen2 extends StatelessWidget {
  const OnboardScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff2A0D2E),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 80, top: 164),
              child: Image.asset(
                'assets/images/Onboard2.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 110.0, bottom: 100.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Bermain bersama\n Dengan Teman\n Baru mu',
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
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardScreen3()),
                    );
                  },
                  child: Text(
                    'Selanjutnya',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFA5075),
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
