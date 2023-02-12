import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tugas/pages/OnboardScreen2.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

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
                'assets/images/Onboard1.png',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 110.0, bottom: 70.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Cari Teman\n Bermain Mu',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFA5075)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        'carilah teman bermain yang\n asik dan menyenangkan di sini',
                        style: TextStyle(fontSize: 14, color: Colors.white),
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
                      MaterialPageRoute(builder: (context) => OnboardScreen2()),
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
