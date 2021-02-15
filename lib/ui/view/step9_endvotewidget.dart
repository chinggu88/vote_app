/*
*  투표끝widget.dart
*  Vote_ui
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voteapp/values/colors.dart';
import 'package:voteapp/values/commominfo.dart';
import 'package:voteapp/values/radii.dart';
import 'package:voteapp/values/shadows.dart';

class Endvotewidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final info = Get.put(Commoninfo());
    info.endvotetimer();
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 24, 38, 155),
        ),
        child: Column(
          children: [
            Container(
              width: 257,
              height: 257,
              margin: EdgeInsets.only(top: 116),
              child: Image.asset(
                "assets/images/free-icon-hourglass-3595026.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 27),
              child: GetBuilder<Commoninfo>(
                builder: (_) {
                  return Text(
                    _.counttimer.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 249, 249, 249),
                      fontWeight: FontWeight.w400,
                      fontSize: 100,
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 24),
                child: Text(
                  "투표가 종료되었습니다.\n감사합니다.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
