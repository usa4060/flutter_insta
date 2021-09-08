import 'package:flutter/material.dart';
import 'package:insta/constants/common_size.dart';
import 'package:insta/home_page.dart';
import 'package:insta/widgets/or_dibider.dart';
import 'package:insta/constants/input_deco.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(common_gap),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: common_l_gap),
                Image.asset('assets/images/insta_text_logo.png'),
                TextFormField(
                  cursorColor: Colors.black54,
                  controller: _emailController,
                  decoration: inputDeco("Email"),
                  validator: (text) {
                    if (text!.isNotEmpty && text.contains("@")) {
                      return null;
                    } else {
                      return '정확한 이메일 주소를 입력해주세요.';
                    }
                  },
                ),
                SizedBox(
                  height: common_xs_gap,
                ),
                TextFormField(
                  obscureText: true,
                  cursorColor: Colors.black54,
                  controller: _pwController,
                  decoration: inputDeco("Password"),
                  validator: (text) {
                    if (text!.isNotEmpty && (text.length >= 8)) {
                      return null;
                    } else {
                      return '제대로 된 비밀번호를 입력 해 주세요.';
                    }
                  },
                ),
                SizedBox(
                  height: common_xs_gap,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgotten password?",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
                _submitButton(context),
                SizedBox(height: common_s_gap),
                OrDivider(),
                TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(primary: Colors.blue),
                    icon: ImageIcon(AssetImage('assets/images/facebook.png')),
                    label: Text(
                      "Login with facebook",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton _submitButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          print('Validation success!!');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        primary: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Text(
        'J o i n',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
