/*
*  투표시작하기widget.dart
*  Vote_ui
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voteapp/ui/view/step8_votemenu.dart';
import 'package:voteapp/values/borders.dart';
import 'package:voteapp/values/colors.dart';
import 'package:voteapp/values/commominfo.dart';
import 'package:voteapp/values/radii.dart';
import 'package:voteapp/values/shadows.dart';

class Startvotewidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 24, 38, 155),
      ),
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: AppColors.ternaryBackground,
                border: Border.fromBorderSide(Borders.primaryBorder),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(41, 4, 4, 4),
                    offset: Offset(0, 20),
                    blurRadius: 5,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(158.5)),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Image.asset(
                  "assets/images/free-icon-manual-voting-3179299.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.02,
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
                    child: FlatButton(
                      onPressed: () {
                        Get.to(Votemenuwidget());
                      },
                      child: Text(
                        "투표시작하기!",
                        textAlign: TextAlign.left,
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
        ],
      ),
    ));
  }
}
