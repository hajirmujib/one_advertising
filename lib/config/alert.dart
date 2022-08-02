import 'package:lottie/lottie.dart';

import '../persentation/index.dart';

void failedSnackbar() {
  return Get.snackbar("Status", "Failed",
      maxWidth: 100.w,
      borderColor: Colors.red[400],
      leftBarIndicatorColor: Colors.red[400],
      borderWidth: 1.0,
      margin: EdgeInsets.zero,
      backgroundColor: Colors.white,
      borderRadius: 5);
}

void succesSnacbar() {
  return Get.snackbar("Status", "Succes",
      maxWidth: 100.w,
      borderColor: Colors.blue[400],
      leftBarIndicatorColor: Colors.blue[400],
      borderWidth: 1.0,
      margin: EdgeInsets.zero,
      backgroundColor: Colors.white,
      borderRadius: 5);
}

deleteAlert({String? content, required VoidCallback confirm}) {
  return Get.defaultDialog(
    title: "Anda Yakin Ingin Menghapus ?",
    content: Text(
      content.toString(),
    ),
    textConfirm: "Konfirmasi",
    textCancel: "Batal",
    confirmTextColor: Colors.white,
    onConfirm: confirm,
  );
}

// final Widget emptyData = UnDraw(
//   padding: const EdgeInsets.all(100),
//   illustration: UnDrawIllustration.empty,
//   fit: BoxFit.contain,
//   color: Colors.blue,
//   alignment: Alignment.center,
//   semanticLabel: "Tidak Ada Data",
//   placeholder: const CircularProgressIndicator(
//     color: ColorApp.primaryColor,
//   ),
//   errorWidget: const Text("Yahh error! :("),
// );
final Widget emptyData = Lottie.asset('assets/93134-not-found.json');
