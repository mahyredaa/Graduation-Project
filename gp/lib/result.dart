
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:url_launcher/url_launcher.dart';

import 'user.dart';

//Welcome User
Widget welcomingUser(String userName) {
  return FittedBox(
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: 60,
        height: 60,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xffE6E6E6),
          child: Icon(
            Icons.person,
            color: Colors.grey[600],
          ),
        ),
      ),
      const SizedBox(width: 20),
      Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(children: [
          FittedBox(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                userName,
                style: GoogleFonts.lato(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ]),
      ),
    ]),
  );
}
//End Welcome User

//Top Box
Widget firstBox(Color clr, String emotion) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: clr,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Column(
        children: [
          Text(
            "Last Time You Were Here\nYou Were:",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white70,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            emotion,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 34,
            ),
          ),
        ],
      ),
    ),
  );
}
// End Top Box

//Middle Texts
Widget texts() {
  return Column(children: [
    const SizedBox(height: 30),
    Text(
      "Read More about your mood in the \"Analytics\" Page",
      textAlign: TextAlign.left,
      style: GoogleFonts.lato(
        color: Colors.black54,
        fontWeight: FontWeight.w900,
        fontSize: 18,
      ),
    ),
    const SizedBox(height: 20),
    Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Recommendations:",
        style: GoogleFonts.lato(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontSize: 22,
        ),
      ),
    ),
    const SizedBox(height: 15),
  ]);
}

class ResultWidget extends StatelessWidget {
  var titleList;
  var subtitleList;
  var buttonLinks;
  user? us;
  ResultWidget(this.us);
  // {0: 'anger', 1: 'disgust', 2: 'fear', 3: 'happy', 4: 'neutral', 5: 'Sad', 6: 'surprise'}

  // const ResultWidget({Key? key}) : super(key: key);
  var colorsList = [
    const Color(0xfff9d9e2),
    const Color.fromARGB(255, 132, 193, 243),
    const Color.fromARGB(255, 255, 80, 95),
    const Color.fromARGB(255, 208, 133, 231)
  ];

  @override
  Widget build(BuildContext context) {
    // {0: 'anger', 1: 'disgust', 2: 'fear', 3: 'happy', 4: 'neutral', 5: 'Sad', 6: 'surprise'}
    if(us!.last_mood == 'anger'){
      titleList = [
        "Some Humorous Picture for You ",
        "Get Some Exercises",
        "Some Info About Anger",
        "Listen to Some Songs"
      ];
      subtitleList = [
        "We collected for you some memes that will brighten your mood.",
        "We have a list of exercises you can do to relief the anger",
        "Anger is an emotion characterized by antagonism toward someone or something you feel has deliberately done you wrong",
        "Give a Compliment\nSmile\nExcercise\nBe Grateful\nBreathe Deeply"
      ];
      buttonLinks = [
        "",
        "https://www.youtube.com/watch?v=IJH_8jsyrlA",
        "https://www.apa.org/topics/anger#:~:text=Anger%20is%20an%20emotion%20characterized,excessive%20anger%20can%20cause%20problems.",
        "https://open.spotify.com/playlist/37i9dQZF1DXdPec7aLTmlC?si=05acfff03cf246a2"
      ];
    }
    else if(us!.last_mood == 'disgust'){
      titleList = [
        "Take a Deep Breath",
        "",
        "Info About Your Mood",
        "Things You Can Do"
      ];
      subtitleList = [
        "You Can Play This Playlist Of Songs You May Like",
        "We Recommend You To Try\n1 - Dance\n2 - Play Songs\n3 - Jump Around\n4 - Call Your Best Friend",
        "Happiness is a mental state that includes positive or pleasant emotions ranging from contentment to intense joy. It is also used in the context of life satisfaction, subjective well-being, eudaimonia, flourishing and well-being",
        "Give a Compliment\nSmile\nExcercise\nBe Grateful\nBreathe Deeply"
      ];
      buttonLinks = [

      ];
    }
    else if(us!.last_mood == 'fear'){
      titleList = [
        "Take a Deep Breath",
        "",
        "Info About Your Mood",
        "Things You Can Do"
      ];
      subtitleList = [
        "Breathe through panic a few dep breathes could help you ",
        "We Recommend You To Try\n1 - Dance\n2 - Play Songs\n3 - Jump Around\n4 - Call Your Best Friend",
        "Happiness is a mental state that includes positive or pleasant emotions ranging from contentment to intense joy. It is also used in the context of life satisfaction, subjective well-being, eudaimonia, flourishing and well-being",
        "Give a Compliment\nSmile\nExcercise\nBe Grateful\nBreathe Deeply"
      ];
      buttonLinks = [

      ];
    }
    else if(us!.last_mood == 'happy'){
      titleList = [
        "Songs For You",
        "Support your friends",
        "Info About Your Mood",
        "Share the positive energy"
      ];
      subtitleList = [
        "You Can Play This Playlist Of Songs You May Like",
        "Talk to your friends and be nice towards them if they're going throught tough time",
        "Happiness is a mental state that includes positive or pleasant emotions ranging from contentment to intense joy. It is also used in the context of life satisfaction, subjective well-being, eudaimonia, flourishing and well-being",
        "Give a Compliment\nSmile\nExcercise\nBe Grateful\nBreathe Deeply"
      ];
      buttonLinks = [
        "https://open.spotify.com/playlist/37i9dQZF1DX3rxVfibe1L0?si=525612664a7741e7",
        "",
        "https://www.britannica.com/topic/happiness#:~:text=happiness%2C%20in%20psychology%2C%20a%20state,is%2C%20subjective%20well%2Dbeing.",
        "https://www.nhs.uk/mental-health/self-help/tips-and-support/how-to-be-happier/",
      ];
    }
    else if(us!.last_mood == 'neutral'){
      titleList = [
        "Songs For You",
        "Recommendatins",
        "Info About Your Mood",
        "Things You Can Do"
      ];
      subtitleList = [
        "You Can Play This Playlist Of Songs You May Like",
        "We Recommend You To Try\n1 - Dance\n2 - Play Songs\n3 - Jump Around\n4 - Call Your Best Friend",
        "Happiness is a mental state that includes positive or pleasant emotions ranging from contentment to intense joy. It is also used in the context of life satisfaction, subjective well-being, eudaimonia, flourishing and well-being",
        "Give a Compliment\nSmile\nExcercise\nBe Grateful\nBreathe Deeply"
      ];
      buttonLinks = [

      ];
    }
    else if(us!.last_mood == 'Sad'){
      titleList = [
        "Songs For You",
        "Recommendatins",
        "Info About Your Mood",
        "Things You Can Do"
      ];
      subtitleList = [
        "You Can Play This Playlist Of Songs You May Like",
        "We Recommend You To Try\n1 - Dance\n2 - Play Songs\n3 - Jump Around\n4 - Call Your Best Friend",
        "Happiness is a mental state that includes positive or pleasant emotions ranging from contentment to intense joy. It is also used in the context of life satisfaction, subjective well-being, eudaimonia, flourishing and well-being",
        "Give a Compliment\nSmile\nExcercise\nBe Grateful\nBreathe Deeply"
      ];
      buttonLinks = [

      ];
    }
    else if(us!.last_mood == 'surprise'){
      titleList = [
        "Songs For You",
        "Recommendatins",
        "Info About Your Mood",
        "Things You Can Do"
      ];
      subtitleList = [
        "You Can Play This Playlist Of Songs You May Like",
        "We Recommend You To Try\n1 - Dance\n2 - Play Songs\n3 - Jump Around\n4 - Call Your Best Friend",
        "Happiness is a mental state that includes positive or pleasant emotions ranging from contentment to intense joy. It is also used in the context of life satisfaction, subjective well-being, eudaimonia, flourishing and well-being",
        "Give a Compliment\nSmile\nExcercise\nBe Grateful\nBreathe Deeply"
      ];
      buttonLinks = [

      ];
    }
    else if(us!.last_mood == 'Not recorded yet'){
      titleList = [
        "Try Now",
        "Try Now",
        "Try Now",
        "Try Now"
      ];
      subtitleList = [
        "Start uploading a video or taking a video with your camera to check your emotion",
        "Start uploading a video or taking a video with your camera to check your emotion",
        "Start uploading a video or taking a video with your camera to check your emotion",
        "Start uploading a video or taking a video with your camera to check your emotion"
      ];
      buttonLinks = [

      ];
    }

  String fullName = "${us!.first_name}${us!.last_name}";
  print(us!.last_mood);
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              welcomingUser(fullName),
              firstBox(const Color.fromARGB(255, 255, 80, 95), us!.last_mood),
              texts(),

              //cards
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return SizedBox(
                      height: 200,
                      width: 200,
                      child: Card(
                        elevation: 7,
                        color: colorsList[index],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              FittedBox(
                                child: Text(titleList[index],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    )),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 70,
                                child: SingleChildScrollView(
                                  child: Text(subtitleList[index],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato(
                                        color: Colors.black87,
                                        fontSize: 14,
                                      )),
                                ),
                              ),
                              const SizedBox(height: 7),
                              SizedBox(
                                height: 40,
                                child: OutlinedButton(
                                  onPressed: () => launch(buttonLinks[index]),
                                  child: const Text("Click Here",
                                      style: TextStyle(color: Colors.black)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
