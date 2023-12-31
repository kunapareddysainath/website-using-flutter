import 'package:homepage_flutter/repository/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Utils.dart';
  

class HomeCubit extends Cubit<HomeScreenState> {
  final HomeRepository _homeRepository;
  
  HomeCubit(this._homeRepository) : super (SimpleHomeScreenState(_homeRepository));

  init(){
    emit(SimpleHomeScreenState(HomeRepository(activeIndex: 0,isLoginButtonHovered: false,showAnswer: List.generate(Utils.FREQUENTQUESTIONS.length, (index) => false))));
  }

  reloadState() {
    emit(SimpleHomeScreenState(getStateRepo()));
  }

  HomeRepository getStateRepo() {
    return (state as SimpleHomeScreenState).homeRepository ??
        HomeRepository(activeIndex: 0, isLoginButtonHovered: false,showAnswer: List.generate(Utils.FREQUENTQUESTIONS.length, (index) => false));
  }

  void setActiveIndex(int index){
    getStateRepo().activeIndex = index;
    reloadState();
    return;
  }

  void setIsLoginButtonHovered(bool isHovered){
    getStateRepo().isLoginButtonHovered = isHovered;
    reloadState();
    return;
  }

  bool? getIsLoginButtonHovered(){
    return getStateRepo().isLoginButtonHovered;
  }

  int? getActiveIndex(){
    return getStateRepo().activeIndex;
  }

  List<bool>? getShowAnswer(){
    return getStateRepo().showAnswer;
  }

  setShowAnswer(int index,bool isShowAnswer){
    getStateRepo().showAnswer?[index] = isShowAnswer;
    reloadState();
    return;
  }

 int getShowAnswerLength(){
    return getStateRepo().showAnswer!.length;
  }

  void toggleShowAnswer(int index) {
    for (int i = 0; i < getShowAnswerLength(); i++) {
      if (i != index) {
        setShowAnswer(i, false);
      }
    }
    // Toggle the selected index
    getStateRepo().showAnswer![index] = !getStateRepo().showAnswer![index];
  }

  bool getShowAnswerAtIndex(int index) {
    return getStateRepo().showAnswer![index];
  }


}