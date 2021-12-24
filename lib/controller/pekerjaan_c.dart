import 'package:flutter/services.dart' show rootBundle;

import 'package:one_advertising/model/pekerjaan_m.dart';
import 'package:one_advertising/persentation/index.dart';

class PekerjaanC extends GetxController {
  //list pekerjaan
  final listPerkerjaan = <PekerjaanModel>[].obs;
  // view state reactive value
  final viewState = ViewState.initial.obs;
  // view state history
  final historyViewState = <ViewState>[];

  @override
  void onInit() {
    getPekerjaan();
    super.onInit();
  }

  //get data pekerjaan
  Future<void> getPekerjaan() async {
    _setState(ViewState.busy);
    try {
      var data = await rootBundle.loadString("assets/list_pekerjaan.json");

      final List<PekerjaanModel> res = pekerjaanModelFromJson(data);
      if (res.isNotEmpty) {
        listPerkerjaan.addAll(res);
      } else {
        listPerkerjaan.addAll([]);
      }
    } catch (e) {
      _setState(ViewState.error);
    } finally {
      _setState(ViewState.data);
    }
  }

  // set viewstate
  void _setState(ViewState state) {
    viewState.value = state;
    historyViewState.add(state);
  }
}
