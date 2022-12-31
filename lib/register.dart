import 'dart:convert';

import 'package:fitbyme/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _usia = TextEditingController();
  TextEditingController _tinggi = TextEditingController();
  TextEditingController _berat = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    child: Image.asset(
                      "image/login-vektor.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: TextFormField(
                      controller: _name,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        errorBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        labelText: 'Full Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter name";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        errorBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter  email";
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return "Please enter valid email";
                        }
                        return null;
                      },
                      onSaved: (email) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      controller: _password,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        errorBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      controller: _confirmpassword,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        errorBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        labelText: 'Confirm Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter re-password";
                        }
                        if (_password.text != _confirmpassword.text) {
                          return "Password Do not match";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      controller: _gender,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        errorBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        labelText: 'Gender : Male, Female',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your gender";
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      controller: _usia,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        errorBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        labelText: 'Age',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your age";
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      controller: _tinggi,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        errorBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        labelText: 'Height',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your height";
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      controller: _berat,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        errorBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(84, 87, 90, 0.5),
                            style: BorderStyle.solid,
                          ),
                        ),
                        labelText: 'Weight',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your weight";
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.indigo),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)))),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          RegistrationUser();
                        } else {
                          print("Unsuccessfull");
                        }
                      },
                      child: Text("Sign Up",
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                      child: RichText(
                    text: TextSpan(
                      text: "Have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                          text: "Sign In",
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future RegistrationUser() async {
    // url to registration php script
    var APIURL = "http://192.168.18.5/Web-fitbyme/API/register.php";
    var response = await http.post(Uri.parse(APIURL), body: {
      'name': _name.text,
      'email': _email.text,
      'password': _password.text,
      'jenis_kelamin': _gender.text,
      'usia': _usia.text,
      'tinggi_badan': _tinggi.text,
      'berat_badan': _berat.text,
    });

    //json maping user entered details
    // Map mapeddate = {
    //   'name': _name.text,
    //   'email': _email.text,
    //   'password': _password.text
    // };
    //send  data using http post to our php code
    // http.Response reponse = await http.post(Uri.parse(APIURL), body: mapeddate);

    //getting response from php code, here
    var data = jsonDecode(response.body);
    if (data["success"] = true) {
      Fluttertoast.showToast(
          msg: "Register Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      Fluttertoast.showToast(
          msg: "This User Already Exit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

InputDecoration buildInputDecoration(IconData icons, String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
  );
}
