import 'package:flutter/material.dart';

import '../data.dart';
import 'loginhome.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //هعمل 2 متغير علشان اتاكد انه الباسورد والكارنت باسورد بياسوو بعض ولا لا
  String? password;
  String? curpassword;

  bool _showpassword = true;

  //هعمل كاي للفورم
  GlobalKey<FormState> _keystat = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BackTheme(),
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Image.asset(
                "assets/images/logo.png",
                width: 72,
                height: 72,
              ),
            ),
            //Text at the bottom of the logo
            Text(
              "Let's Get Started",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            //Text at the bottom of the logo
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 50),
              child: Text(
                "Create an new account",
                style: TextStyle(color: Colors.blueGrey[600]),
              ),
            ),
            //textfield for register info
            Form(
                key: _keystat,
                child: Column(
                  children: [
                    //full name box
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Full Name",
                          prefixIcon: Icon(Icons.account_box_outlined)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "الحقل فارغ";
                        }
                      },
                    ),
                    SizedBox(height: 8),
                    //email text field
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Your E-mail",
                          prefixIcon: Icon(Icons.mail_outline)),
                      validator: (value) {
                        //هنا هبدأ اديله الاحتمالات بتاعتي والرسايل اللي هتظهر لليوزر
                        if (value!.isEmpty) {
                          return "الحقل فارغ";
                        } else if (!value.contains("@") ||
                            !value.contains(".")) {
                          return "اميل خاطئ  Example: *****@gamil.com";
                        }
                      },
                    ),
                    SizedBox(height: 8),
                    //password text field
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      onSaved: (newValue) => password = newValue,
                      maxLength: 15,
                      obscureText: _showpassword,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Your Password",
                        prefixIcon: Icon(Icons.lock_outline),
                        //هعمل اظهار واخفائ للباسورد عند الضغط علي الايقون الخاصة باخفاء الباسورد
                        suffixIcon: IconButton(
                          icon: _showpassword
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _showpassword = !_showpassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "الحقل فارغ";
                        }else if(value!.length <=8){
                           return "يجب ان لا تقل كلمة السر عن 8 احرف";
                        }
                      },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      onSaved: (newValue) => curpassword = newValue,
                      obscureText: _showpassword,
                      decoration:  InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password again",
                          prefixIcon: Icon(Icons.lock_outline),
                          //هعمل اظهار واخفائ للباسورد عند الضغط علي الايقون الخاصة باخفاء الباسورد
                        suffixIcon: IconButton(
                          icon: _showpassword
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _showpassword = !_showpassword;
                            });
                          },
                        ),
                          ),
                      //onChanged هنا استخدمت
                      onChanged: (value) {
                        curpassword = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "الحقل فارغ";
                        }
                        if (password != curpassword) {
                          return "كلمة السر غير متطابقة";
                        }
                      },
                    ),
                  ],
                )),
            SizedBox(height: 15),
            MaterialButton(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                if (!_keystat.currentState!.validate()) {
                } else {
                  Navigator.of(context).pushNamed("homepage");
                }
              },
              minWidth: 500,
              height: 60,
              padding: EdgeInsets.all(5),
              color: buttoncolor,
              child: Text(
                "sign in",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "have a account?  ",
                  style: TextStyle(color: Colors.black54),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).popAndPushNamed("loginhome"),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: buttoncolor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ]),
        )
      ]),
    ));
  }
}


