import 'package:flutter/material.dart';
import 'package:modul6_vazifalar3_1/Prefs.dart';
import 'package:modul6_vazifalar3_1/second_page.dart';
import 'package:modul6_vazifalar3_1/user.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController? textEditingControlleremail;
  TextEditingController? textEditingControllerpassword;
  @override
  void initState(){
    textEditingControlleremail = TextEditingController();
    textEditingControllerpassword = TextEditingController();
    super.initState();
  }
  Future<void> doLogin() async {
    setState(() {
      String email = textEditingControlleremail!.text;
      String password  = textEditingControllerpassword!.text;
      User user = User(email: email, password: password);
      Pref.storedUser(user);
      Pref.storedUserload();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
                Color(0xFFF6F6F6),
                Color(0xFFF6F6F6),
                Color(0xFFF6F6F6),
                Color(0xFFF6F6F6),
              ]
            )
          ),
          child: Column(
            children: [
              Image(
                image: AssetImage('images/img.png'),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome back!',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Log in to your existant account of Q Allure',
                style: TextStyle(color: Color(0xFF979899)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  style: TextStyle(color: Colors.blue),
                  controller: textEditingControlleremail,
                  cursorColor: Colors.blue,
                  decoration:   InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none
                    ),
                    hintText: 'Email',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  style: TextStyle(color: Colors.blue),
                  controller: textEditingControllerpassword,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hoverColor: Colors.blue,
                    iconColor: Colors.blue,
                    prefixIcon: Icon(Icons.lock),
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 15, color: Color(0xFF28465B)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                      onPressed: () {
                        doLogin();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ))),
              const SizedBox(
                height: 30,
              ),
             const  Text(
                'Or connect using',
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  SizedBox(width: 30,),
                  Expanded(
                    child: Container(
                        padding: const  EdgeInsets.only(left: 20, right: 10),
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                            onPressed: () {
                            },
                            child: const  Text(
                              'f     Facebook',
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                        padding: const  EdgeInsets.only(left: 20, right: 10),
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                            onPressed: () {
                            },
                            child: const  Text(
                              'G     Google',
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  SizedBox(width: 30,),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(color: Colors.black),),
                  TextButton(
                      onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_){
                      return SecondPage();
                    }));
                  }, child: const Text('Sign up', style: TextStyle(color: Colors.blue),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
