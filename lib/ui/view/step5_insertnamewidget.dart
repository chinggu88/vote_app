/*
*  투표자이름widget.dart
*  Vote_ui
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:random_color/random_color.dart';
import 'package:voteapp/ui/view/step6_statevotewidget.dart';
import 'package:voteapp/values/colors.dart';
import 'package:voteapp/values/commominfo.dart';
import 'package:voteapp/values/radii.dart';
import 'package:voteapp/values/shadows.dart';

class Insertnamewidget extends StatelessWidget {
  TextEditingController namelist = new TextEditingController();
  final info = Get.put(Commoninfo());
  RandomColor _randomColor = RandomColor();
  //기권 chk
  bool chk = false;
  @override
  Widget build(BuildContext context) {
    // _randomColor.randomColor(colorBrightness: ColorBrightness.dark)
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
                    "  Step 4\n  후보자 이름은 무엇인가요?",
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
                left: MediaQuery.of(context).size.width * 0.37,
                child: GetBuilder<Commoninfo>(
                  builder: (_) {
                    return Text(
                      '${_.tempvotecnt.toString()}/${_.candidatenum.toString()}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w400,
                        fontSize: 55,
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: namelist,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        gapPadding: 8.0),
                    labelText: '후보자이름을 등록하세요',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                    fillColor: Colors.amberAccent,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.53,
                left: MediaQuery.of(context).size.width * 0.1,
                child: Align(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 86, 212, 226),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlatButton(
                          onPressed: () {
                            Color rcolor = info.selectcolor(_randomColor);

                            if (namelist.text.length == 0) {
                              Get.snackbar(
                                "주의",
                                "이름을 입력해주세요",
                                colorText: Colors.white,
                              );
                            } else if (info.candidatelist.length ==
                                info.candidatenum) {
                              Get.snackbar(
                                "주의",
                                "후보자 이름등록이 완료되었습니다.",
                                colorText: Colors.white,
                              );
                            } else {
                              info.addcandidatelist(Candidateinfo(
                                  info.tempvotecnt,
                                  namelist.text,
                                  rcolor,
                                  0,
                                  0.0));
                              info.tempvoteincrement();
                              namelist.text = "";
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "등록하기",
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
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.53,
                right: MediaQuery.of(context).size.width * 0.1,
                child: Align(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 86, 212, 226),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlatButton(
                          onPressed: () {
                            Get.snackbar(
                              "알림",
                              "다시 후보자 이름을 등록해주세요.",
                              colorText: Colors.white,
                            );
                            info.resettempvoteincrement();
                            namelist.text = "";
                            info.resetcandidatelist();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "재입력",
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
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.61,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
              GetBuilder<Commoninfo>(builder: (_) {
                return Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.17,
                  left: MediaQuery.of(context).size.width * 0.35,
                  child: Row(
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                        ),
                        child: Checkbox(
                          value: _.chk,
                          onChanged: (value) {
                            info.checklisttrue(value);
                            // print(value);
                          },
                        ),
                      ),
                      Text(
                        "기권",
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                );
              }),
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
                            if (info.candidatelist.length ==
                                info.candidatenum) {
                              if (info.chk == true) {
                                Color rcolor = info.selectcolor(_randomColor);
                                info.addcandidatelist(Candidateinfo(
                                    info.candidatenum, "기권", rcolor, 0, 0.0));
                              }
                              info.tempvotecnt = 0;

                              Get.to(Statevotewidget());
                            } else {
                              Get.snackbar('주의', '투표자를 입력해주세요');
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
                      "assets/images/group-8.png",
                      fit: BoxFit.none,
                    ),
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
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Positioned(
//               left: 19,
//               top: 61,
//               right: 18,
//               bottom: 80,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       margin: EdgeInsets.only(left: 1),
//                       child: Text(
//                         "Step 4\n후보자 이름을 무엇인가요?",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: AppColors.primaryText,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 22,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       margin: EdgeInsets.only(left: 128, top: 101),
//                       child: Text(
//                         "1/3",
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           fontWeight: FontWeight.w400,
//                           fontSize: 50,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       width: 108,
//                       height: 18,
//                       margin: EdgeInsets.only(left: 10, top: 103),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Positioned(
//                             left: 0,
//                             top: 0,
//                             child: Text(
//                               "이름을 입력하세요",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 151, 140, 140),
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             left: 0,
//                             top: 0,
//                             child: Text(
//                               "이름을 입력하세요",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 151, 140, 140),
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
//                   Container(
//                     height: 61,
//                     margin: EdgeInsets.only(bottom: 29),
//                     decoration: BoxDecoration(
//                       color: AppColors.primaryBackground,
//                       boxShadow: [
//                         Shadows.primaryShadow,
//                       ],
//                       borderRadius: Radii.k30pxRadius,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(left: 93),
//                           child: FlatButton(
//                             onPressed: () => Navigator.pushNamed(
//                                 context, "/statevotewidget"),
//                             child: Text(
//                               "투표시작하기",
//                               textAlign: TextAlign.left,
//                               style: TextStyle(
//                                 color: AppColors.primaryText,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 22,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       width: 91,
//                       height: 15,
//                       margin: EdgeInsets.only(bottom: 24),
//                       child: Image.asset(
//                         "assets/images/group-8.png",
//                         fit: BoxFit.none,
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: Container(
//                       width: 4,
//                       height: 1,
//                       margin: EdgeInsets.only(right: 102),
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryElement,
//                         border: Border.fromBorderSide(Borders.primaryBorder),
//                         boxShadow: [
//                           Shadows.secondaryShadow,
//                         ],
//                       ),
//                       child: Container(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               left: 20,
//               right: 18,
//               child: Container(
//                 height: 1,
//                 decoration: BoxDecoration(
//                   color: AppColors.secondaryElement,
//                 ),
//                 child: Container(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
