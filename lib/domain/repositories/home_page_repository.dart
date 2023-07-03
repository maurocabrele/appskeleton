import 'package:appskeleton/domain/entities/home/json_placeholder.dart';

abstract class HomePageRepository {
  Future<List<JsonPlaceholder>> getHomePageList();
}
