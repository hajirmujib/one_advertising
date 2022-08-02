import '../../index.dart';

Widget textInput(
    {int? maxLines = 1,
    double? width = 0,
    double? height = 0,
    TextInputType textInputType = TextInputType.text,
    TextEditingController? controller,
    TextCapitalization textCapitalization = TextCapitalization.sentences}) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue[900]!),
      borderRadius: BorderRadius.circular(10),
    ),
    width: width == 0 ? 100.w : width,
    height: height == 0 ? 6.h : height,
    child: Center(
      child: TextFormField(
        textCapitalization: textCapitalization,
        controller: controller,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        keyboardType: textInputType,
        maxLines: maxLines,
        style: TextStyle(fontFamily: "Poppin Semi Bold", fontSize: 10.sp),
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.all(5),
        ),
      ),
    ),
  );
}
