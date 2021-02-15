/*
*  투표widget.dart
*  Vote_ui
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voteapp/ui/view/step10_voteinfowidget.dart';
import 'package:voteapp/ui/view/step9_endvotewidget.dart';
import 'package:voteapp/values/colors.dart';
import 'package:voteapp/values/commominfo.dart';
import 'package:voteapp/values/radii.dart';
import 'package:voteapp/values/shadows.dart';

class Votemenuwidget extends StatelessWidget {
  final info = Get.put(Commoninfo());
  int votechk;
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
                  child: Positioned(
                    left: 20,
                    top: 61,
                    right: 19,
                    bottom: 80,
                    child: Text(
                      "  마음에 드는 \n  친구에게 투표하세요.",
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
                top: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: GetBuilder<Commoninfo>(
                    builder: (_) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _.candidatelist.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 50,
                                margin: EdgeInsets.only(top: 10),
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
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      value: _.checklist[index],
                                      onChanged: (value) {
                                        votechk = index;
                                        info.checklisttrue(index);
                                      },
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        _.candidatelist[index].name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
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
                bottom: MediaQuery.of(context).size.height * 0.15,
                child: GetBuilder<Commoninfo>(
                  builder: (_) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Text(
                        '투표 현황 : ${_.tempvotecnt}/${_.finalvote.toString()}',
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                      ),
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
                            int chk = 0;
                            info.checklist.forEach((element) {
                              if (element == true) chk++;
                            });
                            if (chk == 0) {
                              Get.snackbar(
                                "경고",
                                '투표할 친구를 선택해주세요',
                                colorText: Colors.white,
                              );
                            } else {
                              int temp = info.discountvote(votechk);
                              if (temp == 0) {
                                info.setrealvote();
                                Get.to(Voteresultwidget());
                              } else {
                                Get.to(Endvotewidget());
                              }
                              // Get.to(Voteresultwidget());
                            }
                          },
                          child: Text(
                            "투표하기",
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
//     return Scaffold(
//       body: Container(
//         constraints: BoxConstraints.expand(),
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 24, 38, 155),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 61),
//               child: Text(
//                 "맘에 드는 친구한테 투표하세요",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: AppColors.primaryText,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 22,
//                 ),
//               ),
//             ),
//             Container(
//               width: 335,
//               height: 325,
//               margin: EdgeInsets.only(left: 19, top: 122),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Container(
//                     height: 64,
//                     decoration: BoxDecoration(
//                       color: AppColors.secondaryBackground,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(41, 0, 0, 0),
//                           offset: Offset(3, 3),
//                           blurRadius: 0,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "이강훈",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: AppColors.secondaryText,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 32,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 64,
//                     margin: EdgeInsets.only(top: 23),
//                     decoration: BoxDecoration(
//                       color: AppColors.secondaryBackground,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(41, 0, 0, 0),
//                           offset: Offset(3, 3),
//                           blurRadius: 0,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "김유진",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: AppColors.secondaryText,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 32,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 64,
//                     margin: EdgeInsets.only(top: 23),
//                     decoration: BoxDecoration(
//                       color: AppColors.secondaryBackground,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(41, 0, 0, 0),
//                           offset: Offset(3, 3),
//                           blurRadius: 0,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "하정은",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: AppColors.secondaryText,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 32,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Spacer(),
//                   Container(
//                     height: 64,
//                     decoration: BoxDecoration(
//                       color: AppColors.secondaryBackground,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color.fromARGB(41, 0, 0, 0),
//                           offset: Offset(3, 3),
//                           blurRadius: 0,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "이강훈",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: AppColors.secondaryText,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 32,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             Align(
//               alignment: Alignment.topRight,
//               child: Container(
//                 width: 334,
//                 height: 61,
//                 margin: EdgeInsets.only(right: 20, bottom: 108),
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
//                       margin: EdgeInsets.only(left: 91),
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
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
