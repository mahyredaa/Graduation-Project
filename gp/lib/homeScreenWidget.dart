import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:line_icons/line_icons.dart';

import "cameraWidget.dart";
import "modalBottomSheet.dart";
import 'user.dart';

void selectPage(BuildContext ctx) {
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    return VideoCapture();
  }));
}

void startNewTransactionModal(BuildContext ctx,String id, user? us) {
  showModalBottomSheet(
      context: ctx,
      elevation: 7,
      builder: (_) {
        return SizedBox(
            height: MediaQuery.of(ctx).size.height * .25, child: bottomSheet(id, us));
      });
}

Widget cardBox(
    String id, IconData icon, String txt, Color clr, var func, BuildContext ctx, user? us) {
  return GestureDetector(
    onTap: () {
      startNewTransactionModal(ctx,id, us);
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
          startNewTransactionModal(ctx,id, us);
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

class HomeScreenWidget extends StatelessWidget {
  // const HomeScreenWidget({Key? key}) : super(key: key);
  user? us;
  HomeScreenWidget(this.us);
  static const routeName = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Welcome,",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 155, 155, 155),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${us!.first_name} ${us!.last_name}",
              style: GoogleFonts.lato(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 60),
          cardBox("video&audio",LineIcons.video, "Video & Audio",
              const Color.fromARGB(255, 51, 155, 253), null, context, us),
          const SizedBox(height: 30),
          cardBox('video',LineIcons.smilingFace, "Video Only",
              const Color.fromARGB(255, 253, 51, 68), null, context, us),
          const SizedBox(height: 30),
          cardBox('audio',LineIcons.audioFile, "Audio Only",
              const Color.fromARGB(255, 207, 104, 238), null, context, us),
        ]),
      ),
    );
  }
}
