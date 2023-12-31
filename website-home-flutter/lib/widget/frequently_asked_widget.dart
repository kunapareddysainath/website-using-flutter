import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Utils.dart';
import '../cubit/home_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQSection extends StatefulWidget {
  const FAQSection({Key? key}) : super(key: key);

  @override
  State<FAQSection> createState() => _FAQSectionState();
}


class _FAQSectionState extends State<FAQSection> {
  List<bool> showAnswer =
  List.generate(Utils.FREQUENTQUESTIONS.length, (index) => false);

  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> questionWidgets = [];

    for (int index = 0; index < Utils.FREQUENTQUESTIONS.length; index++) {
      questionWidgets.add(
        Card(
          elevation: 2,
          margin: EdgeInsets.all(5),
          color: Colors.red,
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 4, 20, 4),
                        child: Text(
                          Utils.FREQUENTQUESTIONS[index]['question']!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _homeCubit.toggleShowAnswer(index);
                        },
                        child: Icon(
                          _homeCubit.getShowAnswerAtIndex(index)
                              ? Icons.close
                              : Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_homeCubit.getShowAnswerAtIndex(index))
                  Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(Utils.FREQUENTQUESTIONS[index]['answer']!),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Know Sk Writes",
            style: GoogleFonts.fredoka(color: Colors.white, fontSize: 18),
          ),
        ),
        ...questionWidgets,
      ],
    );
  }
}