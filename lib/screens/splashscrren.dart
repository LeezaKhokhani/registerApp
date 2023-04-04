import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:glass_kit/glass_kit.dart';

class Splesh_screen extends StatefulWidget {
  const Splesh_screen({Key? key}) : super(key: key);

  @override
  State<Splesh_screen> createState() => _Splesh_screenState();
}

class _Splesh_screenState extends State<Splesh_screen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: GlassContainer(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.60),
                  Colors.black.withOpacity(0.30),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.60),
                  Colors.white.withOpacity(0.10),
                  Colors.white.withOpacity(0.05),
                  Colors.purpleAccent.withOpacity(0.60),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.39, 0.40, 1.0],
              ),
              blur: 10,
              borderRadius: BorderRadius.circular(24.0),
              borderWidth: 1.0,
              shadowColor: Colors.purple.withOpacity(0.20),
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "WELCome",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        padding: EdgeInsets.all(2),
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black,width: 2),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: ElevatedButton(
                          onPressed: ()  async {
                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            prefs.setBool("isIntroVisited", true);

                            Navigator.pushNamed(context,'register');
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}