import 'dart:convert';

import 'package:first_app/api/api.dart';
import 'package:first_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Set Login Data
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  //Set Visibility Password
  bool _setSecureVisible = true;

  void _toggle() {
    setState(() {
      _setSecureVisible = !_setSecureVisible;
    });
  }

  _login() async {
    EasyLoading.show(
        status: 'Loading....', maskType: EasyLoadingMaskType.black);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {
      'email': emailCont.text,
      'password': passCont.text,
    };

    var res = await ApiService().postData(data, '/login');
    var body = jsonDecode(res.body);
    if (body['respon']) {
      localStorage.setString('user', json.encode(body['user']));

      var sessUser = localStorage.getString("user");
      var dat = jsonDecode(sessUser.toString());
      User user = User.fromJson(dat[0]);

      localStorage.setString('id', user.siswa_id.toString());
      // localStorage.setString('id', emailCont.text);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/homepage', (Route<dynamic> route) => false);
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(body['msg'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 180,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset('assets/images/murid.png')],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    'Login Murid')
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 300,
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                )
              ], borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: TextField(
                controller: emailCont,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 300,
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                )
              ], borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: TextField(
                controller: passCont,
                obscureText: _setSecureVisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility_outlined),
                    onPressed: _toggle,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/homepage');
                _login();
              },
              style: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent)),
              child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                          'Login'),
                    ],
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                      'Lupa Password ?'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
