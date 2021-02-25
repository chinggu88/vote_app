/*
*  투표끝1_widget.dart
*  Vote_ui
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:voteapp/values/colors.dart';
import 'package:voteapp/values/commominfo.dart';
import 'package:voteapp/values/radii.dart';
import 'package:voteapp/values/shadows.dart';
import 'package:flutter/services.dart';

class Voteresultwidget extends StatelessWidget {
  final info = Get.put(Commoninfo());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    //test
    // info.aaaaa();
    // info.setrealvote();
    return Scaffold(
      body: GetBuilder<Commoninfo>(
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 24, 38, 155),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.015,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: GetBuilder<Commoninfo>(builder: (_) {
                      return Container(
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          _.subject.toString(),
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w400,
                            fontSize: 40,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.28,
                  left: MediaQuery.of(context).size.width * 0.035,
                  child: GetBuilder<Commoninfo>(
                    builder: (_) {
                      return Row(
                        children: votelist(_, context),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.15,
                  left: MediaQuery.of(context).size.width * 0.035,
                  child: GetBuilder<Commoninfo>(
                    builder: (_) {
                      return Row(
                        children: namelist(_, context),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  // left: MediaQuery.of(context).size.height * 0.035,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1),
                    // alignment: Alignment.center,
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
                              info.setvoteani(context);
                            },
                            child: Text(
                              "결과보기",
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
          );
        },
      ),
    );
  }

  //그래프영역
  List<Widget> votelist(var common, context) {
    List<Widget> graphs = [];
    int chk = 0;

    common.candidatelist.forEach((element) {
      graphs.add(
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            //백그라운드 그래프
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: info.setvotegraphwidth(context),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
            ),
            //투표 그래프
            Container(
              alignment: Alignment.topCenter,
              height: info.realvoterate[chk],
              width: info.setvotegraphwidth(context),
              decoration: BoxDecoration(
                color: element.color,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
            ),
          ],
        ),
      );
      graphs.add(Container(
        width: MediaQuery.of(context).size.width * 0.01,
      ));
      chk++;
    });
    return graphs;
  }

  //이름영역
  List<Widget> namelist(var test, context) {
    List<Widget> names = [];
    int chk = 0;
    test.candidatelist.forEach((element) {
      names.add(Container(
          alignment: Alignment.center,
          width: info.setvotegraphwidth(context),
          child: Column(
            children: [
              Text(
                info.realvote[chk].toInt().toString() + "표",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: info.setvotefontsize(context)),
              ),
              Text(
                element.name,
                strutStyle: StrutStyle(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: info.setnamefontsize(context)),
              ),
            ],
          )));
      names.add(Container(
        width: MediaQuery.of(context).size.width * 0.01,
      ));
      chk++;
    });
    return names;
  }
}
//     return Scaffold(
//       body: Container(
//         constraints: BoxConstraints.expand(),
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 24, 38, 155),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               height: 84,
//               margin: EdgeInsets.only(right: 168),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       margin: EdgeInsets.only(top: 61),
//                       child: Text(
//                         "결과",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: AppColors.primaryText,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 22,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       width: 33,
//                       height: 83,
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryElement,
//                         border: Border.fromBorderSide(Borders.primaryBorder),
//                       ),
//                       child: Container(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 20,
//               margin: EdgeInsets.only(top: 257, right: 1),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       width: 20,
//                       height: 20,
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryElement,
//                       ),
//                       child: Container(),
//                     ),
//                   ),
//                   Spacer(),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       width: 20,
//                       height: 20,
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryElement,
//                       ),
//                       child: Container(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
