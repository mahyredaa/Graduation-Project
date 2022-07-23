import "package:flutter/material.dart";
import 'package:d_chart/d_chart.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cardBox(
    String id, IconData icon, String txt, Color clr, var func, BuildContext ctx) {
  return GestureDetector(
    onTap: () {
      // startNewTransactionModal(ctx,id, us);
      print("Gesture Clicked Outsider");
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          // startNewTransactionModal(ctx,id, us);
          print("Gesture Clicked Inside One");
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Text(
              txt,
              style: GoogleFonts.charm(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ]),
        ),
      ),
    ),
  );
  //End Box One;
}

class AnalysisWidget extends StatelessWidget {
  const AnalysisWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(margin: const EdgeInsets.all(10), child: Column(
      children: [
        const Text(
          "Emotions Analysis",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20,),
        Center(
        child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: DChartBar(
                      data: const [
                        {
                          'id': 'Bar 1',
                          'data': [
                            {'domain': 'Sat', 'measure': 32},
                            {'domain': 'Sun', 'measure': 43},
                            {'domain': 'Mon', 'measure': 29},
                            {'domain': 'Tue', 'measure': 16},
                            {'domain': 'Wed', 'measure': 16},
                            {'domain': 'Thu', 'measure': 16},
                          ],
                        },
                      ],
                      minimumPaddingBetweenLabel: 1,
                      domainLabelPaddingToAxisLine: 16,
                      axisLineTick: 2,
                      axisLinePointTick: 2,
                      axisLinePointWidth: 10,
                      axisLineColor: Colors.pink,
                      measureLabelPaddingToAxisLine: 16,
                      barColor: (barData, index, id) => id == 'Bar 1'
                          ? const Color.fromARGB(255, 253, 117, 128)
                          : id == 'Bar 2'
                          ? Colors.green.shade600
                          : Colors.green.shade900,
                      // barValue: (barData, index) =>
                      // '${barData['measure']}',
                      // // showBarValue: true,
                      // barValueFontSize: 12,
                      // barValuePosition: BarValuePosition.outside,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Previous Emotions',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),),
        Container(
          margin: const EdgeInsets.all(20),
          child: Column (children: const [Text(
          "Emotions Informartion",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ), SizedBox(height: 50,),
            Text(
              "You used the application now for: \n23 days",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 50,),
            Text(
              "Your most repeated mood is:\nHappy",
              style: TextStyle(
                fontSize: 18,
              ),
            ),

          ],
          ),)

      ]),),
    );
  }
}
