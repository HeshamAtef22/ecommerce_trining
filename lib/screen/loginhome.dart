import 'package:flutter/material.dart';

import '../data.dart';

//botton color Default
Color buttoncolor = const Color.fromRGBO(64, 191, 255, 1);

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}



class _LoginHomeState extends State<LoginHome> {
  //هعمل متغير  خاص بالفورم علشان امرر منه الداتا للكاي وهيبقي من نفس النوع اللي بيحمله الكاي الخاص بالفورم
  GlobalKey<FormState> _keystat = GlobalKey();

  //متغيرلاظهار الباسورد او اخفاءه
  bool _showpassword = true;


  //هعمل متغيرين احفظ فيهم الميل والباسورد
  String? email;
  String? password;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Background Color and theme
      body: Container(
        decoration: BackTheme(),
        //باستخدام الميديا كويري هخلي الكونتينر ياخد طول  وعرض الجهاز بالكامل
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //logo image
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 72,
                      height: 72,
                    ),
                  ),
                  //Text at the bottom of the logo
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Wellcome To mega",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  //Text at the bottom of the logo
                  Text(
                    "Sign in to continue",
                    style: TextStyle(color: Colors.blueGrey[600]),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _keystat,
                    //autovalidateMode ضيفته في الفورم الاساسي علشان لو عندي اكتر من تيكستفيلد يعمل تشيك عليهم كلهم اوتوماتيك
                    //autovalidateMode: AutovalidateMode.always,
                    //TextFormField for Email and Password
                    child: Column(
                      children: [
                        //E-mail TextFormField
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          //Email TextFormField
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            //onSaved هخزت او هسيف الميل داخل المتغير الللي عرفته
                            onSaved: (newValue) => email = newValue,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "E-mail",
                                hintText: "Your E-mail",
                                prefixIcon: Icon(Icons.email_outlined)),

                            //validator بيخزن التكست او الداتا اليي بيدخلها المستخدم في المتغير فاليو اللي هو المتغير الخاص بالفانكشن بتاعته
                            //ليه مزايا كتير منها انه لو المستخدم مدخلش داتا في البورد يقدر يظهرله رسالة ان الحقل فارغ
                            //او مثلا حددتله نوع داتا ودخل عكسها او عدد حروف اكبر هنا الفاليديتور بيظهر رسالة للمستخدم بالخطأ اللي بيعمله
                            //تابع الكود علشان تعرف الاستخدام
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
                        ),
                        //Password TextFormField
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          //onSaved هعمل تخزين للباسورد داخل المتغير باسورد اللي عرفته
                          onSaved: (newValue) => password = newValue,
                          //obscureText لاخفاء الداتا المكتوبة زي الباسورد
                          obscureText: _showpassword,

                          decoration: InputDecoration(
                              //هعمل اظهار واخفائ للباسورد عند الضغط علي الايقون الخاصة باخفاء الباسورد
                              suffixIcon: IconButton(
                                icon: _showpassword? Icon(Icons.visibility_off) :Icon(Icons.visibility) ,
                                onPressed: () {
                                  setState(() {
                                    _showpassword = !_showpassword;
                                    
                                  });
                                },
                              ),
                              border: OutlineInputBorder(),
                              hintText: "Your Password",
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "الحقل فارغ";
                            }
                          },
                        ),
                        //MaterialButton for sign in
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 15),
                          child: MaterialButton(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              //هعمل شرط لو شروط الفالديت الخاصة بالتيكست فيلد اتحققت  النافيجيتور يشتغل ويتم تسجيل الدخول
                              //غير كدا لا
                              if (_keystat.currentState!.validate()) {
                                Navigator.of(context)
                                    .popAndPushNamed("homepage");
                              }
                            },
                            minWidth: double.maxFinite,
                            height: 60,
                            padding: const EdgeInsets.all(5),
                            color: buttoncolor,
                            child: const Text(
                              "sign in",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 2,
                          ),
                        ),
                        const Text("OR"),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //login Button Google and Facebook
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                    color: const Color.fromRGBO(235, 240, 255, 1),
                    child: Row(
                      children: [
                        Image.asset("assets/images/google.png", height: 25),
                        const SizedBox(width: 60, height: 70),
                        const Text("Login With Google",
                            style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                    color: const Color.fromRGBO(235, 240, 255, 1),
                    child: Row(
                      children: [
                        Icon(
                          Icons.facebook,
                          size: 30,
                        ),
                        const SizedBox(width: 60, height: 70),
                        const Text(
                          "Login With Facebook",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 15),
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: Color.fromRGBO(64, 191, 255, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have a account?  ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      //Navigator to register screan
                      InkWell(
                        onTap: () {
                          Navigator.of(context).popAndPushNamed("register");
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Color.fromRGBO(64, 191, 255, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
