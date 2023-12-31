import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_frame/device_frame.dart';
import 'package:homepage_flutter/Utils.dart';
import 'package:homepage_flutter/provider/home_provider.dart';
import 'package:homepage_flutter/styles/text_style.dart';
import 'cubit/device_frame_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => DeviceFrameCubit(
        Utils.LEFTFOLDERS.keys.toList().first,
        0,
      ),
      child: const ExampleApp(),
    ),
  );
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DeviceFrameTheme(
      style: DeviceFrameStyle.dark(),
      child: MaterialApp(
        title: 'Sk_Writes',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            bodyMedium: globalTextStyle
          )
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}




