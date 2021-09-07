import 'package:flutter/material.dart';
import 'package:insta/constants/common_size.dart';
import 'package:insta/home_page.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
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
                  decoration: _inputDeco("Email"),
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
                  decoration: _inputDeco("Password"),
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
                TextFormField(
                  obscureText: true,
                  cursorColor: Colors.black54,
                  controller: _cpwController,
                  decoration: _inputDeco("Confirm Password"),
                  validator: (text) {
                    if (_cpwController.text == _pwController.text &&
                        text!.isNotEmpty) {
                      return null;
                    } else {
                      return '비밀번호가 일치하지 않습니다..';
                    }
                  },
                ),
                SizedBox(height: common_s_gap),
                _submitButton(context),
                SizedBox(height: common_s_gap),
                _orDivider(),
                TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(primary: Colors.blue),
                    icon: ImageIcon(AssetImage('assets/images/facebook.png')),
                    label: Text(
                      "Login with facebook",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
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
        primary: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Text(
        'join',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Stack _orDivider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          right: 0,
          height: 1,
          child: Container(
            color: Colors.grey[500],
            height: 1,
            width: 60,
          ),
        ),
        Container(
          color: Colors.grey[50],
          height: 3,
          width: 60,
        ),
        Text(
          'OR',
          style: TextStyle(
            color: Colors.grey[500],
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  InputDecoration _inputDeco(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: _activeInputBorder(),
      focusedBorder: _activeInputBorder(),
      errorBorder: _errorInputBorder(),
      focusedErrorBorder: _errorInputBorder(),
      filled: true,
      fillColor: Colors.grey[300],
    );
  }

  OutlineInputBorder _errorInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.redAccent,
        ),
        borderRadius: BorderRadius.circular(common_l_gap));
  }

  OutlineInputBorder _activeInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(common_l_gap));
  }
}
