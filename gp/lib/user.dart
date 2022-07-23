
class user {
  String first_name = "";
  String last_name = "";
  String email = "";
  String password = "";
  String last_mood = "Not recorded yet";

  user(String first_name, String last_name, String email, String password, String last_mood){
    this.first_name = first_name;
    this.last_name = last_name;
    this.email = email;
    this.password = password;
    if (last_mood != "") {
      this.last_mood = last_mood;
    }
  }


}