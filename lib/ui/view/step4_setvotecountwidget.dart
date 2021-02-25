/*
*  투표인원widget.dart
*  Vote_ui
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voteapp/ui/view/step5_insertnamewidget.dart';
import 'package:voteapp/values/colors.dart';
import 'package:voteapp/values/commominfo.dart';
import 'package:voteapp/values/radii.dart';
import 'package:voteapp/values/shadows.dart';
import 'package:get/get.dart';

class Setvotecountwidget extends StatelessWidget {
  TextEditingController subject = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final info = Get.put(Commoninfo());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 24, 38, 155),
            ),
            child: Stack(children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width * 0.015,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "  Step 3\n  후보자는 몇 명인가요?",
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
                top: MediaQuery.of(context).size.height * 0.15,
                left: MediaQuery.of(context).size.width * 0.15,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.7,
                    margin: EdgeInsets.only(top: 81),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 24, 38, 155),
                                  offset: Offset(0, 20),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "assets/images/path-1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          child: GetBuilder<Commoninfo>(
                            builder: (_) {
                              return Container(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: TextField(
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter(
                                        RegExp('[0-9]')),
                                  ],
                                  controller: subject,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.teal),
                                        gapPadding: 8.0),
                                    labelText: '후보자 수를 입력하세요',
                                    labelStyle: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    fillColor: Colors.amberAccent,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 60),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        // margin: EdgeInsets.only(left: 91),
                        child: FlatButton(
                          onPressed: () {
                            if (subject.text.length != 0) {
                              Get.to(Insertnamewidget());
                              info.candidatenum = int.parse(subject.text);
                            } else {
                              Get.snackbar(
                                "주의",
                                "후보자 숫자를 입력해주세요",
                                colorText: Colors.white,
                              );
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
                    ],
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
                      "assets/images/group-7.png",
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
            ])));
  }
}
