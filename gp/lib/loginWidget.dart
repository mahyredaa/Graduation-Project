import 'package:flutter/material.dart';
import "package:flutter_form_builder/flutter_form_builder.dart";
import 'Home.dart';
import "user.dart";

class loginWidget extends StatefulWidget {
  // const loginWidget({Key? key}) : super(key: key);

  @override
  _loginWidgetState createState() => _loginWidgetState();
}

class _loginWidgetState extends State<loginWidget> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();
  bool isLogin = true;
  List<user> users = [
    user("Ahmed", "Reda", "ahmed@gmail.com", "ahmed", "happy"),
    user("Mazen", "Mohamed", "mazen@gmail.com", "mazen", ""),
  ];
  String username = '';
  String password = '';
  String fname = '';
  String lname = '';
  String confirmPassword = "";
  String val1 = "";
  String val2 = "";
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Container(
            margin: const EdgeInsets.all(15),
            width: double.infinity,
            height: double.infinity,
            child: Align(
              alignment: Alignment.center,
              child: Center(
                  child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Text and Logo

                      //Card with login/Signup
                      SingleChildScrollView(
                        child: Card(
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 40,
                              horizontal: 20,
                            ),
                            child: Column(children: [
                              //Sign Up / Log In
                              Text(
                                isLogin ? "Log In" : "Sign Up",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(
                                height: 35,
                              ),
                              if (!isLogin)
                                FormBuilderTextField(
                                  name: "fname",
                                  style: const TextStyle(color: Colors.black87),
                                  decoration: InputDecoration(
                                    hintText: "First Name",
                                    hintStyle: const TextStyle(color: Colors.black),
                                    focusColor: Colors.black,
                                    filled: true,
                                    fillColor: Colors.grey.shade100,
                                    contentPadding: const EdgeInsets.all(15),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                  onChanged: (value){
                                    fname = value.toString();
                                  },
                                ),
                              if (!isLogin) const SizedBox(height: 15),
                              if (!isLogin)
                                FormBuilderTextField(
                                  name: "lname",
                                  style: const TextStyle(color: Colors.black87),
                                  decoration: InputDecoration(
                                    hintText: "Last name",
                                    hintStyle: const TextStyle(color: Colors.black),
                                    focusColor: Colors.black,
                                    filled: true,
                                    fillColor: Colors.grey.shade100,
                                    contentPadding: const EdgeInsets.all(15),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                  onChanged: (value){
                                    lname = value.toString();
                                  },
                                ),
                              // ]),
                              if (!isLogin) const SizedBox(height: 15),
                              // ]),

                              FormBuilderTextField(
                                name: "mail",
                                style: const TextStyle(color: Colors.black87),
                                decoration: InputDecoration(
                                  hintText: "E-Mail",
                                  hintStyle: const TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  contentPadding: const EdgeInsets.all(15),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                onChanged: (value){
                                  username = value.toString();
                                },
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              FormBuilderTextField(
                                name: "password",
                                style: const TextStyle(color: Colors.black87),
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: const TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                  contentPadding: const EdgeInsets.all(15),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                onChanged: (value){
                                  password = value.toString();
                                },
                                obscureText: true,
                              ),

                              if (!isLogin)
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    FormBuilderTextField(
                                      name: "confirmpassword",
                                      style: const TextStyle(color: Colors.black87),
                                      decoration: InputDecoration(
                                        hintText: "Confirm Password",
                                        hintStyle: const TextStyle(color: Colors.black),
                                        focusColor: Colors.black,
                                        filled: true,
                                        fillColor: Colors.grey.shade100,
                                        contentPadding: const EdgeInsets.all(15),
                                        border: const OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                        ),
                                      ),
                                      onChanged: (value){
                                        confirmPassword = value.toString();
                                      },
                                      obscureText: true,
                                    ),
                                  ],
                                ),

                              const SizedBox(
                                height: 25,
                              ),

                              if(isLogin)
                              RaisedButton(
                                onPressed: () {
                                  if (username == '' || password == '')
                                  {
                                    var alertDialog = const AlertDialog(
                                      title: Text("Error"),
                                      content: Text("Please fill in required fields"),
                                    );

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alertDialog;
                                        }
                                    );
                                  }
                                  else {
                                      bool found = false;
                                      var idx;
                                      for(var i = 0; i < users.length; i++){
                                        if(users[i].email == username && users[i].password == password)
                                          {

                                            found = true;
                                            idx = i;
                                            break;
                                          }
                                      }

                                      if (found)
                                        {
                                          Widget continueButton = FlatButton(
                                            child: const Text("Continue"),
                                            onPressed:  () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(us: users[idx])));
                                            },
                                          );

                                          // set up the AlertDialog
                                          AlertDialog alert = AlertDialog(
                                            title: const Text("Successful"),
                                            content: Text("welcome back, ${users[idx].first_name}"),
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
                                        }
                                      else{
                                        var alertDialog = const AlertDialog(
                                          title: Text("Error"),
                                          content: Text("Wrong username or password"),
                                        );

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return alertDialog;
                                            }
                                        );
                                      }
                                    }
                                },
                                color: Colors.black87,
                                splashColor: Colors.white54,
                                elevation: 5,
                                textColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),

                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: Text("Log In")
                                ),
                              ),

                            if(!isLogin)
                              RaisedButton(
                                onPressed: () {
                                  if (username == '' || password == '' || password != confirmPassword || fname == '' || lname == '')
                                  {
                                    var alertDialog = const AlertDialog(
                                      title: Text("Error"),
                                      content: Text("Please fill in required fields"),
                                    );

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alertDialog;
                                        }
                                    );
                                  }
                                  else {
                                    bool found = false;
                                    int idx;
                                    for(var i = 0; i < users.length; i++){
                                      if(users[i].email == username)
                                      {

                                        found = true;
                                        idx = i;
                                        break;
                                      }
                                    }

                                    if (!found)
                                    {
                                      if (password != confirmPassword)
                                        {
                                          var alertDialog2 = const AlertDialog(
                                            title: Text("Error"),
                                            content: Text("Password is not matching"),
                                          );


                                          // print(users);


                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return alertDialog2;
                                              }
                                          );
                                        }
                                      users.add(user(fname, lname, username, password, ""));
                                      var idx2 = users.length - 1;
                                      Widget continueButton = FlatButton(
                                        child: const Text("Continue"),
                                        onPressed:  () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(us: users[idx2])));
                                        },
                                      );

                                      // set up the AlertDialog
                                      AlertDialog alert = AlertDialog(
                                        title: const Text("Successful"),
                                        content: Text("welcome back, ${users[idx2].first_name}"),
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
                                    }
                                    else{
                                      var alertDialog = const AlertDialog(
                                        title: Text("Error"),
                                        content: Text("Username already taken"),
                                      );

                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alertDialog;
                                          }
                                      );
                                    }
                                  }
                                },
                                color: Colors.black87,
                                splashColor: Colors.white54,
                                elevation: 5,
                                textColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),

                                child: const Padding(
                                    padding: EdgeInsets.only(
                                      left: 25,
                                      right: 25,
                                    ),
                                    child: Text("Sign Up")
                                ),
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      isLogin
                                          ? "Create a User"
                                          : "Already A User",
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        setState(() {

                                          isLogin = !isLogin;
                                        });
                                      },
                                      color: Colors.black87,
                                      splashColor: Colors.white54,
                                      elevation: 5,
                                      textColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 25,
                                          right: 25,
                                        ),
                                        child: isLogin
                                            ? const Text("Sign Up")
                                            : const Text("Log In"),
                                      ),
                                    ),
                                  ])
                            ]),
                          ),
                        ),
                      ),

                      //Maybe text with copyright or whatevs in small fontSize
                    ]),
              )),
            ),
          )),
    );
  }
}
