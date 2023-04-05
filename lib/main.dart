import 'package:e_pkk/views/LupaPassword/lupa_password_screen.dart';
import 'package:e_pkk/views/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_pkk/utils/constants.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e_pkk',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      // routes: {
      //   'lupa_password_screen': (context) => const lupaPassword(),
      //   'welcome_screen': (context) => const WelcomeScreen(),
      // },
    );
  }
}

// class MainApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           padding: EdgeInsets.all(20.0),
//           child: ListView(
//             children: <Widget>[
//               Center(
//                 child: Column(
//                   children: <Widget>[
//                     _gambarLogin(),
//                     _titleDescription(),
//                     _textField()
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget _gambarLogin() {
//   return Image.asset(
//     "assets/images/login1.png",
//     height: 150.0,
//     width: 150.0,
//   );
// }

// Widget _titleDescription() {
//   return Column(
//     children: <Widget>[
//       Padding(padding: EdgeInsets.only(top: 16.0)),
//       Text(
//         "Selamat Datang Di E-PKK",
//         style: TextStyle(color: textColor, fontSize: 32.0, fontWeight: bold),
//         textAlign: TextAlign.left,
//       ),
//     ],
//   );
// }

// Widget _textField() {
//   return Column(
//     children: <Widget>[
//       Column(
//         children: [
//           Text(
//             "Nomor WhatsApp",
//             style:
//                 TextStyle(color: textColor2, fontSize: 15.0, fontWeight: bold),
//           )
//         ],
//       ),
//     ],
//   );
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }
