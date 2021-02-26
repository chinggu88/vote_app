import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:random_color/random_color.dart';
import 'package:voteapp/ui/view/step11_resultwidget.dart';
import 'package:voteapp/ui/view/step1_startvote.dart';
import 'package:voteapp/ui/view/step8_votemenu.dart';
import 'package:voteapp/values/audio.dart';

class Commoninfo extends GetxController {
  final auidoinfo = Get.put(VoteAudio());
  //투표주제
  String subject = "";
  int candidatenum = 0;
  int finalvote = 0;
  int votecnt = 0;
  int tempvotecnt = 0;
  //후보
  List<Candidateinfo> candidatelist = [];
  //결과표
  List<Candidateinfo> finallist = [];
  List<bool> checklist = [];
  int counttimer = 3;

  Timer timer;
  //그래프넓이
  double votewidth = 0;
  //그래프높이
  double voteheight = 0;
  //실시간투표수
  List<double> realvote = [];
  //실시간투표바
  List<double> realvoterate = [];
  //기권chk
  bool chk = false;
  //결과chk
  bool resultchk = false;

  init() {
    subject = "";
    candidatenum = 0;
    finalvote = 0;
    votecnt = 0;
    tempvotecnt = 0;
    //후보
    candidatelist.clear();
    //결과표
    finallist.clear();
    checklist.clear();
    counttimer = 3;

    //그래프넓이
    votewidth = 0;
    //그래프높이
    voteheight = 0;
    //실시간투표수
    realvote.clear();
    //실시간투표바
    realvoterate.clear();
    //기권chk
    chk = false;
    //결과chk
    resultchk = false;
  }

  //그래프 넓이 계산
  double setvotegraphwidth(BuildContext context) {
    votewidth = ((MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width * 0.1)) /
        (candidatelist.length));
    return votewidth;
  }

  //이름폰트사이즈
  double setnamefontsize(BuildContext context) {
    return votewidth = ((MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width * 0.4)) /
            (candidatelist.length)) *
        0.3;
  }

  //표수 폰트 사이즈
  double setvotefontsize(BuildContext context) {
    return votewidth = ((MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width * 0.5)) /
            (candidatelist.length)) *
        0.2;
  }

  //결과 화면 셋팅
  setrealvote() {
    realvote.clear();
    realvoterate.clear();
    candidatelist.forEach((element) {
      realvote.add(0.0);
      realvoterate.add(0.0);
    });
  }

  //투표애니매이션
  bool setvoteani(BuildContext context) {
    List<int> templist = [];
    int e = 0;
    double ratetemp = 0;

    //bgm

    candidatelist.forEach((element) {
      element.rate = (element.vote / finalvote);
      if (ratetemp < element.rate) {
        ratetemp = element.rate;
      }
    });

    candidatelist.forEach((element) {
      templist.add(element.vote);
    });

    //투표 최대값

    int maxvote = setmaxvote(templist);
    Timer.periodic(Duration(milliseconds: 900), (Timer t) {
      auidoinfo.playsound();
      templist.forEach((element) {
        if (element != realvote[e]) {
          // realvote[e] = realvote[e] + 1;
          realvote[e] += 1;
          realvoterate[e] = realvoterate[e] +
              (((MediaQuery.of(context).size.height * 0.45) / maxvote));
          update();
        }
        e++;
      });
      e = 0;

      if (listEquals(realvote, templist)) {
        //결과집계
        resultvote(templist);
        auidoinfo.playresultsound();
        t.cancel();
        //popup
        //동점일경우 아닐경우
        if (finallist.length == 1) {
          showDialog(
            context: context,
            builder: (_) => AssetGiffyDialog(
              image: Image.asset('assets/images/finalresult.gif'),
              title: Text(
                '최다득표\n${finallist[0].name} \n\n ${finallist[0].vote}표',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              onlyCancelButton: true,
              buttonCancelText: Text("결과보기"),
              onCancelButtonPressed: () {
                // Get.off(Resultwidget());
                Get.back();
              },
            ),
          );
        } else if (finallist.length > 1) {
          showDialog(
            context: context,
            builder: (_) => AssetGiffyDialog(
              image: Image.asset('assets/images/finalresult.gif'),
              title: Text(
                '동점입니다.',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              onlyOkButton: true,
              buttonCancelText: Text("다시"),
              buttonOkText: Text("결과보기"),
              onOkButtonPressed: () {
                Get.back();
              },
            ),
          );
        }
      }

      auidoinfo.stopsound();
    });
    resultchk = true;
    update();
    return true;
  }

  resultvote(List<int> list) {
    bool chk = false;
    list.sort((a, b) => chk ? a.compareTo(b) : b.compareTo(a));
    chk = !chk;
    candidatelist.forEach((element) {
      if (element.vote == list[0]) {
        finallist.add(element);
      }
    });
  }

  int setmaxvote(List<int> list) {
    List<int> test = [];
    list.forEach((element) {
      test.add(element);
    });
    test.sort();
    return test[test.length - 1];
  }

  int discountvote(int votechk) {
    votecnt--;
    update();
    candidatelist[votechk].vote++;
    update();
    tempvotecnt++;
    update();
    return votecnt;
  }

  int endvotetimer() {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      counttimer--;
      update();
      if (counttimer == 0) {
        counttimer = 3;
        int i = 0;
        checklist.forEach((e) {
          checklist[i] = false;
          i++;
        });

        t.cancel();
        Get.off(Votemenuwidget());
        update();
      }
    });

    return votecnt;
  }

  checklisttrue(bool inputchk) {
    if (inputchk == false) {
      chk = false;
    } else {
      chk = true;
    }
    update();
  }

  setsubject(String insubject) {
    subject = insubject;
    update();
  }

  String getsubject() {
    return subject;
  }

  setcandidatenum(int count) {
    candidatenum = count;
    update();
  }

  int getcandidatenum() {
    return candidatenum;
  }

  voteincrement() {
    votecnt++;
    finalvote++;
    update();
  }

  votedecrement() {
    votecnt--;
    finalvote--;
    if (votecnt < 0) {
      votecnt = 0;
    }
    update();
  }

  tempvoteincrement() {
    tempvotecnt++;
    update();
  }

  resettempvoteincrement() {
    tempvotecnt = 0;
    update();
  }

  addcandidatelist(Candidateinfo tempcadidate) {
    candidatelist.add(tempcadidate);
    update();
    checklist.add(false);
    update();
  }

  resetcandidatelist() {
    candidatelist.clear();
    update();
  }

  Color selectcolor(randomColor) {
    int i = 0;
    Color colors =
        randomColor.randomColor(colorBrightness: ColorBrightness.dark);
    candidatelist.forEach((element) {
      if (colors == candidatelist[i].color) {
        colors = randomColor.randomColor(colorBrightness: ColorBrightness.dark);
      }
      i++;
    });
    return colors;
  }

  aaaaa() {
    subject = "테스트투표입니다.";
    RandomColor _randomColor = RandomColor();
    candidatelist
        .add(Candidateinfo(0, '유재석', selectcolor(_randomColor), 14, 0.0));
    candidatelist
        .add(Candidateinfo(1, '정주나', selectcolor(_randomColor), 10, 0.0));
    candidatelist
        .add(Candidateinfo(2, '노홍철', selectcolor(_randomColor), 12, 0.0));
    candidatelist
        .add(Candidateinfo(3, '정형돈', selectcolor(_randomColor), 14, 0.0));
    candidatelist
        .add(Candidateinfo(4, '박명수', selectcolor(_randomColor), 7, 0.0));
    votecnt = (20 + 5 + 12 + 15 + 7);
    finalvote = (20 + 5 + 12 + 15 + 7);
  }
}

class Candidateinfo {
  int number = 0;
  String name = "";
  Color color = Colors.black;
  int vote = 0;
  double rate = 0.0;

  Candidateinfo(int n, String nn, Color c, int v, double r) {
    number = n;
    name = nn;
    color = c;
    vote = v;
    rate = r;
  }
}
