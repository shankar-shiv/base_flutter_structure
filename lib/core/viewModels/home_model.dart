import 'package:provider_architecture/core/enums/viewstate.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/viewModels/base_model.dart';
import 'package:provider_architecture/locator.dart';
import './base_model.dart';
import '../../locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userID) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userID);
    setState(ViewState.Idle);
  }
}
