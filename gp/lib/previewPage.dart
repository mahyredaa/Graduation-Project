import 'dart:io';
import 'functions.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import "package:video_player/video_player.dart";
import "package:google_fonts/google_fonts.dart";
import 'Home.dart';
import 'user.dart';

class previewPage extends StatefulWidget {
  XFile? file;
  String? id;
  user? us;
  // const PreviewPage({Key? key}) : super(key: key);
  previewPage(this.file, this.id, this.us);

  @override
  _previewPageState createState() => _previewPageState(id, us);
}

class _previewPageState extends State<previewPage> {
  user? us;
  bool notTapped = true;
  VideoPlayerController? _controller;
  String?id;
  _previewPageState(this.id, this.us);
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.file!.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  String url = '';
  var data;

  @override
  Widget build(BuildContext context) {
    print("Hello");
    // el path hena " widget.file!.path "
    print("The file path inside the Preview Page Widget: ${widget.file!.path}");
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                children: [
                  //Text at Top
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Preview: ",
                      style: GoogleFonts.lato(
                        color: Colors.black87,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  //End Text at top
                  Card(
                    elevation: 10,
                    color: Colors.transparent,
                    child: _controller!.value.isInitialized
                        ? Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              height: MediaQuery.of(context).size.height * .55,
                              child: AspectRatio(
                                // aspectRatio: 16 / 22,
                                aspectRatio: _controller!.value.aspectRatio,
                                child: VideoPlayer(_controller!),
                              ),
                            ),
                          )
                        : Container(),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("Play/Pause",
                            style: GoogleFonts.lato(
                              color: Colors.black87,
                              fontSize: 12,
                            )),
                      ),
                      const SizedBox(width: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _controller!.value.isPlaying
                                  ? _controller!.pause()
                                  : _controller!.play();
                            });
                          },
                          child: Center(
                            child: Icon(
                              _controller!.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // const Text("Submit This Video?",
            //     style: GoogleFonts.lato(
            //       fontSize: 28,
            //     )),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .1,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: InkWell(
                  onTap: () async {

                    setState(() {
                      notTapped = !notTapped;

                    });
                    var decoded;
                    if(id=='video&audio'){
                      decoded = await upload_file(widget.file!.path, widget.file!.name,'api-video?query=');
                    }else if(id =='video'){
                      decoded = await upload_file(widget.file!.path, widget.file!.name,'api-image?query=');
                    }else{
                      decoded = await upload_file(widget.file!.path, widget.file!.name,'api-audio?query=');
                    }

                    print("finished");
                    print(decoded['output']);
                    Widget continueButton = FlatButton(
                      child: const Text("Continue"),
                      onPressed:  () {
                        us!.last_mood = decoded['output'];
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(us: widget.us)));
                      },
                    );

                    // set up the AlertDialog
                    AlertDialog alert = AlertDialog(
                      title: const Text("Results"),
                      content: Text("Your mood now is: " + decoded['output']),
                      actions: [
                        continueButton,
                      ],
                    );

                    // show the dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );



                  },
                  child: notTapped == true
                      ? Center(
                          child: Text("Submit",
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontSize: 24)))
                      : Center(
                          child: Text("Submitting...",
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontSize: 24))),

                  // color: Colors.white,
                ),
              ),
            ),

            //Submit Text Widget
          ],
        ),
      ),
    );
  }
}
