import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homepage_flutter/cubit/home_cubit.dart';
import 'package:homepage_flutter/repository/home_state.dart';
import 'package:homepage_flutter/widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const HomeProvider();
  }
}

class HomeProvider extends StatelessWidget {
  const HomeProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(HomeRepository()),
          child: HomeScreen(),
        ),
      ],
      child:LandingWidget()
    );
  }

}