import 'package:get/get.dart';
import 'package:one_advertising/config/enum.dart';

class GlobalController extends GetxController {
  // ?view state reactive value
  final viewState = ViewState.initial.obs;
  //? view state history
  final historyViewState = <ViewState>[];
  //? set viewstate
  void setState(ViewState state) {
    viewState.value = state;
    historyViewState.add(state);
  }
}
