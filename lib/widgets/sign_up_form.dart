import 'package:flutter/material.dart';
import 'package:insta/constants/common_size.dart';

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
    return Padding(
      padding: const EdgeInsets.all(common_gap),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: common_l_gap),
            Image.asset('assets/images/insta_text_logo.png'),
            TextFormField(
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
              controller: _emailController,
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
              controller: _emailController,
              decoration: _inputDeco("Confirm Password"),
              validator: (text) {
                if (text!.isNotEmpty && _cpwController.text == text) {
                  return null;
                } else {
                  return '비밀번호가 일치하지 않습니다..';
                }
              },
            ),
            FlatButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              color: Colors.blue,
              child: Text(
                'join',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDeco(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(common_s_gap)),
      filled: true,
      fillColor: Colors.grey[300],
    );
  }
}
