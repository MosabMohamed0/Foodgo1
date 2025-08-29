import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodgo/features/login/loginVeiw.dart';

class SplachVeiw extends StatefulWidget {
  const SplachVeiw({super.key});

  @override
  State<SplachVeiw> createState() => _SplachVeiwState();
}

class _SplachVeiwState extends State<SplachVeiw>
    with SingleTickerProviderStateMixin {
  // void initState() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  //   // Navigate after 3 seconds
  //   Future.delayed(const Duration(seconds: 2),(){
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (_)=> const LoginVeiw()),
  //     );
  //   });
  // }
  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return LoginVeiw();
        }));
      },
      child: Scaffold(
        // backgroundColor: Color(0xffFF939B),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFF939B),
                Color(0xFFEF2A39),
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                child: Text(
                  'Foodgo',
                  style: TextStyle(
                      color: Colors.white, fontSize: 96, fontFamily: 'Lobster'),
                ),
              ),
              Positioned(
                bottom: -30,
                left: -30,
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    'assets/images/burger6.png',
                    height: 230,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 110,
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    'assets/images/burger2.png',
                    height: 150,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
