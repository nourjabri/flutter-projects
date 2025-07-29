import 'package:flutter/widgets.dart';

class Appcolor {
  Color firstcolor = Color(0xffFBCB8F);

  Color secondcolor = Color(0xffFBCB8F);
  Color thirdcolor = Color(0xffE9894D);
  Color forthcolor = Color(0xffF1AE63);
  Color fivstcolor = Color(0xff9D6A63);
  Color sixcolor = Color(0xff372527);
  Color sevencolor = Color(0xffFFF8C7);
}

LinearGradient maindecoration() {
  return LinearGradient(
    colors: [
      Appcolor().firstcolor,
      Appcolor().secondcolor,
      Appcolor().thirdcolor,
      Appcolor().forthcolor,
      Appcolor().fivstcolor,
      Appcolor().sixcolor,
    ],
  );
}
