import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voteapp/ui/view/step1_startvote.dart';
import 'package:voteapp/values/commominfo.dart';

class Resultwidget extends StatefulWidget {
  @override
  _ResultwidgetState createState() => _ResultwidgetState();
}

class _ResultwidgetState extends State<Resultwidget> {
  int touchedIndex;
  final info = Get.put(Commoninfo());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 24, 38, 155),
      constraints: BoxConstraints.expand(),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Card(
          color: Color.fromARGB(255, 24, 38, 155),
          child: Row(
            children: <Widget>[
              const SizedBox(
                height: 18,
              ),
              Column(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: PieChart(
                        PieChartData(
                          pieTouchData:
                              PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              if (pieTouchResponse.touchInput
                                      is FlLongPressEnd ||
                                  pieTouchResponse.touchInput is FlPanEnd) {
                                touchedIndex = -1;
                              } else {
                                touchedIndex =
                                    pieTouchResponse.touchedSectionIndex;
                              }
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 80,
                          sections: showingSections(info.candidatelist),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            offset: Offset(3, 3),
                            blurRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: FlatButton(
                      onPressed: () {
                        Get.offAll(Startwidget());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "다시투표",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  )
                ],
              ),
              const SizedBox(
                width: 80,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: showcategory(info.candidatelist),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> showcategory(List<Candidateinfo> candidatelist) {
    List<Widget> list = [];
    int i = 0;
    //투표제목
    list.add(Text(info.subject.toString(),
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        )));
    candidatelist.forEach((element) {
      list.add(
        Indicator(
          // color: Color(0xff0293ee),
          color: candidatelist[i].color,
          text: candidatelist[i].name.toString(),
          isSquare: true,
        ),
      );
      list.add(SizedBox(
        height: 4,
      ));
      i++;
    });
    return list;
  }

  List<PieChartSectionData> showingSections(List<Candidateinfo> candidatelist) {
    print(candidatelist.length);
    List<PieChartSectionData> list = [];
    int i = 0;
    candidatelist.forEach((element) {
      list.add(PieChartSectionData(
        color: candidatelist[i].color,
        value: candidatelist[i].vote.toDouble(),
        title: '${candidatelist[i].name} \n ${candidatelist[i].vote}표',
        radius: 60,
        titleStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff)),
      ));
      i++;
    });

    return list;
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}
