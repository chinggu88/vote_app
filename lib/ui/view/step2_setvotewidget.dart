/*
*  투포명widget.dart
*  Vote_ui
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:voteapp/ui/view/step3_setnamewidget.dart';
import 'package:voteapp/values/colors.dart';
import 'package:voteapp/values/commominfo.dart';
import 'package:voteapp/values/radii.dart';
import 'package:voteapp/values/shadows.dart';

class Setvotewidget extends StatelessWidget {
  TextEditingController subject = new TextEditingController();
  final info = Get.put(Commoninfo());
  @override
  Widget build(BuildContext context) {
    // info.init();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 24, 38, 155),
          ),
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.015,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "  Step 1\n  무엇을 정하는 투표인가요?",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    controller: subject,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                          gapPadding: 8.0),
                      labelText: '투표 주제를 입력해주세요',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                      fillColor: Colors.amberAccent,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.07,
                left: MediaQuery.of(context).size.height * 0.035,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBackground,
                    boxShadow: [
                      Shadows.primaryShadow,
                    ],
                    borderRadius: Radii.k30pxRadius,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(left: 91),
                    child: FlatButton(
                      onPressed: () {
                        if (subject.text.length <= 0) {
                          Get.snackbar(
                            "주의",
                            "투표명을 입력해주세요",
                            colorText: Colors.white,
                          );
                        } else {
                          info.subject = subject.text;
                          Get.to(Setnamewidget());
                        }
                      },
                      child: Text(
                        "다음 단계로 넘어가기",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.92,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 15,
                    margin: EdgeInsets.only(bottom: 107),
                    child: Image.asset(
                      "assets/images/group-5.png",
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
