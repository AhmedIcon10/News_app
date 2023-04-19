abstract class NewsAppState {}

class NewsInitialState extends NewsAppState {}

class NewsChangeBottomItemsState extends NewsAppState {}

class NewsBusinessLoadingState extends NewsAppState {}

class NewsGetBusinessSuccessState extends NewsAppState {}

class NewsGetBusinessErrorState extends NewsAppState {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsSportsLoadingState extends NewsAppState {}

class NewsGetSportsSuccessState extends NewsAppState {}

class NewsGetSportsErrorState extends NewsAppState {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsScienceLoadingState extends NewsAppState {}

class NewsGetScienceSuccessState extends NewsAppState {}

class NewsGetScienceErrorState extends NewsAppState {
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsSearchLoadingState extends NewsAppState {}

class NewsGetSearchSuccessState extends NewsAppState {}

class NewsGetSearchErrorState extends NewsAppState {
  final String error;
  NewsGetSearchErrorState(this.error);
}

class NewsChangeAppModeState extends NewsAppState {}
