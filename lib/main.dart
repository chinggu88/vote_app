import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voteapp/test.dart';
import 'package:voteapp/ui/view/step10_voteinfowidget.dart';
import 'package:voteapp/ui/view/step1_startvote.dart';
import 'package:voteapp/ui/view/step2_setvotewidget.dart';
import 'package:voteapp/ui/view/step3_setnamewidget.dart';
import 'package:voteapp/ui/view/step4_setvotecountwidget.dart';
import 'package:voteapp/ui/view/step5_insertnamewidget.dart';
import 'package:voteapp/ui/view/step6_statevotewidget.dart';
import 'package:voteapp/ui/view/step7_startvotewidget.dart';
import 'package:voteapp/ui/view/step8_votemenu.dart';
import 'package:voteapp/ui/view/step9_endvotewidget.dart';

void main() {
  runApp(GetMaterialApp(
    // home: Voteresultwidget(),
    home: Startwidget(),
    // home: Test(),
    getPages: [
      GetPage(
        name: 'Setvotewidget',
        page: () => Setvotewidget(),
      ),
      GetPage(
        name: 'Setnamewidget',
        page: () => Setnamewidget(),
      ),
      GetPage(
        name: 'Setvotecountwidget',
        page: () => Setvotecountwidget(),
      ),
      GetPage(
        name: 'Insertnamewidget',
        page: () => Insertnamewidget(),
      ),
      GetPage(
        name: 'Statevotewidget',
        page: () => Statevotewidget(),
      ),
      GetPage(
        name: 'Startvotewidget',
        page: () => Startvotewidget(),
      ),
      GetPage(
        name: 'Votemenuwidget',
        page: () => Votemenuwidget(),
      ),
      GetPage(
        name: 'Endvotewidget',
        page: () => Endvotewidget(),
      ),
      GetPage(
        name: 'Voteresultwidget',
        page: () => Voteresultwidget(),
      ),
    ],
  ));
}
