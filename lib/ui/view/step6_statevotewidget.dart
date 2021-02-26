/*
*  투표화면widget.dart
*  Vote_ui
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voteapp/ui/view/step2_setvotewidget.dart';
import 'package:voteapp/ui/view/step7_startvotewidget.dart';
import 'package:voteapp/values/colors.dart';
import 'package:voteapp/values/commominfo.dart';
import 'package:voteapp/values/radii.dart';
import 'package:voteapp/values/shadows.dart';

class Statevotewidget extends StatelessWidget {
  final info = Get.put(Commoninfo());
  @override
  Widget build(BuildContext context) {
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
                      "  Step 5\n  확인",
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
                  top: MediaQuery.of(context).size.height * 0.25,
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: GetBuilder<Commoninfo>(
                    builder: (_) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(41, 0, 0, 0),
                              offset: Offset(3, 3),
                              blurRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "투표이름",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              _.subject,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.38,
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: GetBuilder<Commoninfo>(
                    builder: (_) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(41, 0, 0, 0),
                              offset: Offset(3, 3),
                              blurRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            Text(
                              "후보자 수",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                            ),
                            Text(
                              _.candidatelist.length.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.38,
                  left: MediaQuery.of(context).size.width * 0.55,
                  child: GetBuilder<Commoninfo>(
                    builder: (_) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(41, 0, 0, 0),
                              offset: Offset(3, 3),
                              blurRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                            ),
                            Text(
                              "투표인원",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                            ),
                            Text(
                              _.votecnt.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.58,
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: GetBuilder<Commoninfo>(
                    builder: (_) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(41, 0, 0, 0),
                              offset: Offset(3, 3),
                              blurRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "후보자 이름",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.62,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: GetBuilder<Commoninfo>(
                      builder: (_) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _.candidatelist.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Container(
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: _.candidatelist[index].color,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(41, 0, 0, 0),
                                        offset: Offset(3, 3),
                                        blurRadius: 0,
                                      ),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          _.candidatelist[index].name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.06,
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
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("이대로 투표를 진행하시겠습니까?"),
                                    actions: [
                                      FlatButton(
                                        child: Text("진행"),
                                        onPressed: () {
                                          Get.offAll(Startvotewidget());
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("취소"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("재설정"),
                                        onPressed: () {
                                          info.resettempvoteincrement();
                                          info.resetcandidatelist();
                                          info.checklisttrue(true);
                                          info.init();
                                          Get.offAll(Setvotewidget());
                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              "투표 시작하기",
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
                        "assets/images/group-9.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),
              ],
            )));
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
//                 margin: EdgeInsets.only(left: 20, top: 61),
//                 child: Text(
//                   "Step 5\n확인",
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     color: AppColors.primaryText,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 22,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               height: 10,
//               margin: EdgeInsets.only(left: 20, top: 82, right: 19),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Positioned(
//                     left: 0,
//                     top: 0,
//                     right: 0,
//                     child: Container(
//                       height: 64,
//                       decoration: BoxDecoration(
//                         color: AppColors.secondaryBackground,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color.fromARGB(41, 0, 0, 0),
//                             offset: Offset(3, 3),
//                             blurRadius: 0,
//                           ),
//                         ],
//                         borderRadius: BorderRadius.all(Radius.circular(16)),
//                       ),
//                       child: Container(),
//                     ),
//                   ),
//                   Positioned(
//                     left: 27,
//                     top: 14,
//                     child: Text(
//                       "투표이름\n3-1반 반장 투표",
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 149, 149, 149),
//                         fontWeight: FontWeight.w400,
//                         fontSize: 10,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 50,
//               margin: EdgeInsets.only(left: 20, top: 15, right: 20),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Positioned(
//                     left: 0,
//                     top: 0,
//                     right: 0,
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 149,
//                           height: 123,
//                           decoration: BoxDecoration(
//                             color: AppColors.secondaryBackground,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Color.fromARGB(41, 0, 0, 0),
//                                 offset: Offset(5, 5),
//                                 blurRadius: 0,
//                               ),
//                             ],
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                           ),
//                           child: Container(),
//                         ),
//                         Spacer(),
//                         Container(
//                           width: 149,
//                           height: 123,
//                           decoration: BoxDecoration(
//                             color: AppColors.secondaryBackground,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Color.fromARGB(41, 0, 0, 0),
//                                 offset: Offset(5, 5),
//                                 blurRadius: 0,
//                               ),
//                             ],
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                           ),
//                           child: Container(),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     left: 51,
//                     top: 13,
//                     right: 52,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Container(
//                           height: 11,
//                           margin: EdgeInsets.only(right: 4),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "후보자수",
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: AppColors.accentText,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 10,
//                                   ),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "투표인원",
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: AppColors.accentText,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 10,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 71,
//                           margin: EdgeInsets.only(left: 3, top: 4),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "5",
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: Color.fromARGB(255, 77, 70, 70),
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 60,
//                                   ),
//                                 ),
//                               ),
//                               Spacer(),
//                               Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   "5",
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                     color: Color.fromARGB(255, 77, 70, 70),
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 60,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 47,
//               margin: EdgeInsets.only(left: 20, top: 21, right: 20),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Positioned(
//                     left: 0,
//                     top: 0,
//                     right: 0,
//                     child: Container(
//                       height: 47,
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryElement,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color.fromARGB(41, 0, 0, 0),
//                             offset: Offset(3, 3),
//                             blurRadius: 0,
//                           ),
//                         ],
//                         borderRadius: BorderRadius.all(Radius.circular(16)),
//                       ),
//                       child: Container(),
//                     ),
//                   ),
//                   Positioned(
//                     left: 27,
//                     top: 3,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Container(
//                             width: 44,
//                             height: 44,
//                             child: Image.asset(
//                               "assets/images/free-icon-candidate-2683533.png",
//                               fit: BoxFit.none,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.topLeft,
//                           child: Container(
//                             margin: EdgeInsets.only(left: 10, top: 13),
//                             child: Text(
//                               "후보자 이르",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                 color: AppColors.accentText,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 47,
//               margin: EdgeInsets.only(left: 20, top: 15, right: 96),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       width: 122,
//                       height: 47,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 30, 222, 202),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color.fromARGB(41, 0, 0, 0),
//                             offset: Offset(3, 3),
//                             blurRadius: 0,
//                           ),
//                         ],
//                         borderRadius: BorderRadius.all(Radius.circular(16)),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(left: 39),
//                             child: Text(
//                               "이강훈",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 7, 7, 7),
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       width: 122,
//                       height: 47,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 119, 222, 30),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color.fromARGB(41, 0, 0, 0),
//                             offset: Offset(3, 3),
//                             blurRadius: 0,
//                           ),
//                         ],
//                         borderRadius: BorderRadius.all(Radius.circular(16)),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(left: 39),
//                             child: Text(
//                               "김유진",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 7, 7, 7),
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Align(
//               alignment: Alignment.topLeft,
//               child: Container(
//                 width: 122,
//                 height: 20,
//                 margin: EdgeInsets.only(left: 66, top: 13),
//                 decoration: BoxDecoration(
//                   color: AppColors.accentElement,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Color.fromARGB(41, 0, 0, 0),
//                       offset: Offset(3, 3),
//                       blurRadius: 0,
//                     ),
//                   ],
//                   borderRadius: BorderRadius.all(Radius.circular(16)),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 39),
//                       child: Text(
//                         "하정은",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 7, 7, 7),
//                           fontWeight: FontWeight.w400,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Spacer(),
//             Container(
//               height: 61,
//               margin: EdgeInsets.only(left: 20, right: 20, bottom: 28),
//               decoration: BoxDecoration(
//                 color: AppColors.primaryBackground,
//                 boxShadow: [
//                   Shadows.primaryShadow,
//                 ],
//                 borderRadius: Radii.k30pxRadius,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 92),
//                     child: FlatButton(
//                       onPressed: () => Navigator.pushNamedAndRemoveUntil(
//                           context, "/startvotewidget", (route) => false),
//                       child: Text(
//                         "투표시작하기",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: AppColors.primaryText,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 22,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 width: 91,
//                 height: 15,
//                 margin: EdgeInsets.only(bottom: 106),
//                 child: Image.asset(
//                   "assets/images/group-9.png",
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
