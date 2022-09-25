import 'package:flutter/material.dart';
import 'package:modul6_vazifalar3_1/PrefsAccount.dart';
import 'package:modul6_vazifalar3_1/account.dart';

class SecondPage extends StatefulWidget {
  String? emailTemp;

  SecondPage({this.emailTemp});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController? textEditingControllername;
  TextEditingController? textEditingControlleremail;
  TextEditingController? textEditingControllerphone;
  TextEditingController? textEditingControllerpassword;
  TextEditingController? textEditingControllerconfirmpassword;

  @override
  void initState() {
    textEditingControllername = TextEditingController();
    textEditingControlleremail = TextEditingController();
    textEditingControllerphone = TextEditingController();
    textEditingControllerpassword = TextEditingController();
    textEditingControllerconfirmpassword = TextEditingController();
    super.initState();
  }

  Future<void> doAccount() async {
    setState(() {
      String name = textEditingControllername!.text.toString();
      String email = textEditingControlleremail!.text.toString();
      String phone = textEditingControllerphone!.text.toString();
      String password = textEditingControllerpassword!.text.toString();
      String confirmpassword =
          textEditingControllerconfirmpassword!.text.toString();
      Account account = Account(
          name: name,
          email: email,
          phone: phone,
          password: password,
          confirmpassword: confirmpassword);
      PrefsAccount.storedAccount(account);
      PrefsAccount.storedAccountload().then(
          (value) => {print('email email eamil : ${value!.email.toString()}')});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //                Color(0xFFF6F6F6),
        backgroundColor: Color(0xFFFAFAFA),
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image(
                        image: AssetImage('images/img_2.png'),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              "Let`s Get Started",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text(
              'Create an account to Q Allure to get all features',
              style: TextStyle(color: Color(0xFFA5A5A7), fontSize: 15),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                style: TextStyle(color: Colors.blue),
                controller: textEditingControllername,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hoverColor: Colors.blue,
                  hintText: "Person",
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: TextField(
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hoverColor: Colors.blue,
                    hintText: "Email",
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: TextField(
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hoverColor: Colors.blue,
                    hintText: "Phone",
                    prefixIcon: const Icon(
                      Icons.phone_iphone,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: TextField(
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hoverColor: Colors.blue,
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock_open,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    )),
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: TextField(
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hoverColor: Colors.blue,
                  hintText: "Confirm Password",
                  prefixIcon: const Icon(
                    Icons.lock_open,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () {
                  doAccount();
                },
                child: Text(
                  "Create",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account ? ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Login Here',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
