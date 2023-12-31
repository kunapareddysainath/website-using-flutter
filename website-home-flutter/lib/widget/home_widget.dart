import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homepage_flutter/Utils.dart';
import 'package:homepage_flutter/cubit/home_cubit.dart';
import 'package:homepage_flutter/provider/home_provider.dart';
import 'package:homepage_flutter/repository/home_state.dart';
import 'package:homepage_flutter/widget/about_widget.dart';
import 'package:homepage_flutter/widget/cancellation_widget.dart';
import 'package:homepage_flutter/widget/device_frame_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homepage_flutter/widget/footer_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homepage_flutter/widget/login_widget.dart';
import 'package:homepage_flutter/widget/plan_and_price_widget.dart';
import 'package:homepage_flutter/widget/support_widget.dart';
import 'contact_widget.dart';
import 'default_widget.dart';
import 'help_widget.dart';

class LandingWidget extends StatefulWidget {
  const LandingWidget({Key? key}) : super(key: key);

  @override
  _LandingWidgetState createState() => _LandingWidgetState();
}

class _LandingWidgetState extends State<LandingWidget> {
  late HomeCubit _homeCubit;
  late Widget _selectedWidget;

  @override
  void initState() {
    super.initState();
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit.init();
    _selectedWidget = DefaultWidget();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeScreenState>(
        builder: (context, isLoginButtonHovered) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Row(
                  children: [
                    Text('Sk',
                        style: GoogleFonts.fredoka(
                            fontWeight: FontWeight.w500,
                            fontSize: 36,
                            color: Color(0xFFFF0000))),
                    Text('Writes',
                        style: GoogleFonts.fredoka(
                            fontWeight: FontWeight.w500,
                            fontSize: 36,
                            color: Color(0xFF1A73E8))),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Row(
                children: navigationOptions(),
              ),
            ],
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {
                 _selectedWidget = LoginPage();
                },
                onHover: (isLoginButtonHovered) {
                  _homeCubit.setIsLoginButtonHovered(isLoginButtonHovered);
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                      color: _homeCubit.getIsLoginButtonHovered()!
                          ? Colors.blue.shade300
                          : Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Login/Sign Up',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _selectedWidget,
                  SizedBox(child: DeviceFrameWidget(), height: 600),
                  FooterWidget(),
                ],
              ),
            );
          },
        ),
      );
    });
  }

  List<Widget> navigationOptions() {
    List<Widget> naviOptions = [];

    for (var index = 0; index < Utils.NAVIGATIONOPTIONS.length; index++) {
      naviOptions.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Utils.NAVIGATIONOPTIONS[index],
                style: GoogleFonts.lato(
                    fontSize: 18,
                    color: index == _homeCubit.getActiveIndex()
                        ? Colors.red
                        : Colors.black,
                    fontWeight: index == _homeCubit.getActiveIndex()
                        ? FontWeight.w500
                        : FontWeight.normal),
              ),
            ),
            onTap: () {
              _homeCubit.setActiveIndex(index); // Update the active index
              _updateUI(Utils.NAVIGATIONOPTIONS[index]);
              // Your onTap logic goes here
            },
          ),
        ),
      );
    }
    return naviOptions;
  }

  void _updateUI(String selectedOption) {
    switch (selectedOption) {
      case "Plans & Pricing":
        _selectedWidget = PlanAndPricing();
        break;

      case "About":
        _selectedWidget = About();
        break;

      case "Contact":
        _selectedWidget = ContactUs();
        break;

      case "Help":
        _selectedWidget = Help();
        break;

      case "Cancellation":
        _selectedWidget = Cancellation();
        break;

      case "Support":
        _selectedWidget = Support();
        break;

      default:
        _selectedWidget = DefaultWidget();
    }
  }

}
