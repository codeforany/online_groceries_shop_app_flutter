import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/color_extension.dart';
import '../view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  
  final splashVM = Get.put( SplashViewModel() );
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashVM.loadView();
    
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.primary,
      body: Center(
        child:
            Image.asset("assets/img/splash_logo.png", width: media.width * 0.7),
      ),
    );
  }
}
