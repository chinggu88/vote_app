/*
*  후보자수widget.dart
*  Vote_ui
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:voteapp/ui/view/step4_setvotecountwidget.dart';
import 'package:voteapp/values/colors.dart';
import 'package:voteapp/values/commominfo.dart';
import 'package:voteapp/values/radii.dart';
import 'package:voteapp/values/shadows.dart';
import 'package:get/get.dart';

class Setnamewidget extends StatelessWidget {
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
                  child: Positioned(
                    left: 20,
                    top: 61,
                    right: 19,
                    bottom: 80,
                    child: Text(
                      "  Step 2\n  투표하는 사람은 몇 명인가요?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w400,
                        fontSize: 30,
                      ),
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
                          // top: MediaQuery.of(context).size.height * 0.12,
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
                                    labelText: '투표수를 입력하세요',
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
                              Get.to(Setvotecountwidget());
                              info.votecnt = int.parse(subject.text);
                              info.finalvote = int.parse(subject.text);
                            } else {
                              Get.snackbar(
                                "주의",
                                "투표 숫자를 입력해주세요",
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
                      "assets/images/group-6.png",
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
            ])));
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
//             Align(
//               alignment: Alignment.topLeft,
//               child: Container(
//                 margin: EdgeInsets.only(left: 19, top: 61),
//                 child: Text(
//                   "Step 2\n후보자는 몇 명인가요?",
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     color: AppColors.primaryText,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 22,
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 width: 269,
//                 height: 269,
//                 margin: EdgeInsets.only(top: 81),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Positioned(
//                       top: 0,
//                       child: Container(
//                         width: 269,
//                         height: 269,
//                         decoration: BoxDecoration(
//                           border:
//                               Border.fromBorderSide(Borders.secondaryBorder),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color.fromARGB(41, 4, 4, 4),
//                               offset: Offset(0, 20),
//                               blurRadius: 5,
//                             ),
//                           ],
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(134.5)),
//                         ),
//                         child: Container(),
//                       ),
//                     ),
//                     Positioned(
//                       top: 76,
//                       child: Text(
//                         "5",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           fontWeight: FontWeight.w400,
//                           fontSize: 100,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: 50,
//               margin: EdgeInsets.only(left: 92, top: 16, right: 91),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryElement,
//                         border: Border.fromBorderSide(Borders.primaryBorder),
//                         borderRadius: BorderRadius.all(Radius.circular(18)),
//                       ),
//                       child: Container(),
//                     ),
//                   ),
//                   Spacer(),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       width: 50,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryElement,
//                         border: Border.fromBorderSide(Borders.primaryBorder),
//                         borderRadius: BorderRadius.all(Radius.circular(14)),
//                       ),
//                       child: Container(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Container(
//                 width: 331,
//                 height: 61,
//                 margin: EdgeInsets.only(left: 19, bottom: 24),
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryBackground,
//                   boxShadow: [
//                     Shadows.primaryShadow,
//                   ],
//                   borderRadius: Radii.k30pxRadius,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 90),
//                       child: FlatButton(
//                         onPressed: () =>
//                             Navigator.pushNamed(context, "/setvotecountwidget"),
//                         child: Text(
//                           "투표시작하기",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             color: AppColors.primaryText,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 22,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 width: 91,
//                 height: 15,
//                 margin: EdgeInsets.only(bottom: 107),
//                 child: Image.asset(
//                   "assets/images/group-6.png",
//                   fit: BoxFit.none,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
