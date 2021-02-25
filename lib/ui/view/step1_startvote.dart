/*
*  시작페이지widget.dart
*  Vote_ui
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get.dart';
import 'package:voteapp/ui/view/step2_setvotewidget.dart';
import 'package:voteapp/values/admob.dart';
import 'package:voteapp/values/borders.dart';
import 'package:voteapp/values/colors.dart';
import 'package:voteapp/values/radii.dart';
import 'package:voteapp/values/shadows.dart';

class Startwidget extends StatelessWidget {
  final ad = Get.put(Admob_vote());
  @override
  Widget build(BuildContext context) {
    ad.init();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
                child: Image.asset(
                  "assets/images/free-icon-manual-voting-3179299.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Positioned(
            child: GetBuilder<Admob_vote>(
              builder: (_) {
                return AdmobBanner(
                  adUnitId: _.getBannerAdUnitId(),
                  adSize: _.bannerSize,
                  listener: (AdmobAdEvent event, Map<String, dynamic> args) {
                    _.handleEvent(event, args, 'Banner');
                  },
                );
              },
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
                        Get.to(Setvotewidget(),
                            transition: Transition.leftToRightWithFade);
                      },
                      child: Text(
                        "투표설정시작하기",
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
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       constraints: BoxConstraints.expand(),
  //       decoration: BoxDecoration(
  //         color: Color.fromARGB(255, 24, 38, 155),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: [
  //           Align(
  //             alignment: Alignment.topCenter,
  //             child: Container(
  //               width: 317,
  //               height: 317,
  //               margin: EdgeInsets.only(top: 140),
  //               child: Stack(
  //                 alignment: Alignment.center,
  //                 children: [
  //                   Positioned(
  //                     top: 0,
  //                     child: Container(
  //                       width: 317,
  //                       height: 317,
  //                       decoration: BoxDecoration(
  //                         color: AppColors.ternaryBackground,
  //                         border: Border.fromBorderSide(Borders.primaryBorder),
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: Color.fromARGB(41, 4, 4, 4),
  //                             offset: Offset(0, 20),
  //                             blurRadius: 5,
  //                           ),
  //                         ],
  //                         borderRadius:
  //                             BorderRadius.all(Radius.circular(158.5)),
  //                       ),
  //                       child: Container(),
  //                     ),
  //                   ),
  //                   Positioned(
  //                     top: 60,
  //                     child: Image.asset(
  //                       "assets/images/free-icon-manual-voting-3179299.png",
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Container(
  //             height: 50,
  //           ),
  //           Container(
  //             width: 334,
  //             margin: EdgeInsets.all(20),
  //             decoration: BoxDecoration(
  //               color: AppColors.primaryBackground,
  //               boxShadow: [
  //                 Shadows.primaryShadow,
  //               ],
  //               borderRadius: Radii.k30pxRadius,
  //             ),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   margin: EdgeInsets.only(left: 91),
  //                   child: FlatButton(
  //                     onPressed: () {
  //                       Navigator.pushNamed(context, "/setvotewidget");
  //                     },
  //                     child: Text(
  //                       "투표시작하기",
  //                       textAlign: TextAlign.left,
  //                       style: TextStyle(
  //                         color: AppColors.primaryText,
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 22,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
