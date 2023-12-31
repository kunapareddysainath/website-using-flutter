class HomeRepository{

  bool ? isLoginButtonHovered;
  int ? activeIndex;
  List<bool>? showAnswer;

  HomeRepository({this.activeIndex,this.isLoginButtonHovered,this.showAnswer});

}

abstract class HomeScreenState{
  const HomeScreenState();
}

class SimpleHomeScreenState extends HomeScreenState {
  HomeRepository? homeRepository;

  SimpleHomeScreenState(this.homeRepository);
}