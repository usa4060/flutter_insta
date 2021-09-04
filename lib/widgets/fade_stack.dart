import 'package:flutter/material.dart';
import 'package:insta/screens/profile_screens.dart';
import 'package:insta/widgets/sign_in_form.dart';
import 'package:insta/widgets/sign_up_form.dart';

class FadeStack extends StatefulWidget {
  const FadeStack({Key? key, required this.selectedForm}) : super(key: key);

  final int selectedForm;

  @override
  _FadeStackState createState() => _FadeStackState();
}

class _FadeStackState extends State<FadeStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationControlor;
  List<Widget> forms = [SignUpForm(), SignInForm()];

  @override
  void initState() {
    _animationControlor =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationControlor.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FadeStack oldWidget) {
    if (widget.selectedForm != oldWidget.selectedForm) {
      _animationControlor.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationControlor,
      child: IndexedStack(
        children: forms,
        index: widget.selectedForm,
      ),
    );
  }
}
