import 'package:appskeleton/domain/entities/home/json_placeholder.dart';
import 'package:appskeleton/domain/repositories/home_page_repository.dart';
import 'package:appskeleton/presentation/pages/homepage/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final HomePageRepository _homePageRepository;

  HomePageCubit(this._homePageRepository) : super(HomePageInitial());

  void getHomePageList() async {
    final List<JsonPlaceholder> jsonPlaceholder =
        await _homePageRepository.getHomePageList();
    emit(HomePageLoaded(jsonPlaceholder));
  }
}
