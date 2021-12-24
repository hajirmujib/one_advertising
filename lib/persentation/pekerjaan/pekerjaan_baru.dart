import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_advertising/config/color.dart';
import 'package:sizer/sizer.dart';

class PekerjaanBaru extends StatelessWidget {
  const PekerjaanBaru({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: ColorApp.canvasColor,
          appBar: AppBar(
            title: const Text(
              "Pekerjaan Baru",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppin Semi Bold"),
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.check_mark))
            ],
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Jenis Pekerjaan",
                      style: TextStyle(
                        fontFamily: "Poppin Semi Bold",
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Container(
                    width: 90.w,
                    height: 9.h,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue[900]!),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonFormField(
                      value: "Stempel",
                      hint: const Text("Jenis Pekerjaan"),
                      isExpanded: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      items: const [
                        DropdownMenuItem(
                          child: Text("Stempel"),
                          value: "Stempel",
                        ),
                        DropdownMenuItem(
                          child: Text("Spanduk"),
                          value: "Spanduk",
                        ),
                        DropdownMenuItem(
                          child: Text("Stiker"),
                          value: "Stiker",
                        ),
                        DropdownMenuItem(
                          child: Text("Yasin"),
                          value: "Yasin",
                        ),
                        DropdownMenuItem(
                          child: Text("Id Card"),
                          value: "Id Card",
                        ),
                        DropdownMenuItem(
                          child: Text("Name Tag"),
                          value: "Name Tag",
                        ),
                        DropdownMenuItem(
                          child: Text("Neonbox"),
                          value: "Neonbox",
                        ),
                        DropdownMenuItem(
                          child: Text("Plakat"),
                          value: "Plakat",
                        ),
                        DropdownMenuItem(
                          child: Text("Buku"),
                          value: "Buku",
                        ),
                        DropdownMenuItem(
                          child: Text("Sablon"),
                          value: "Sablon",
                        ),
                        DropdownMenuItem(
                          child: Text("Brosur"),
                          value: "Brosur",
                        ),
                        DropdownMenuItem(
                          child: Text("Nota"),
                          value: "Nota",
                        ),
                        DropdownMenuItem(
                          child: Text("Undangan"),
                          value: "Undangan",
                        )
                      ],
                      onChanged: (String? value) {
                        // print(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 15.0),
                    child: Text(
                      "Keterangan",
                      style: TextStyle(
                        fontFamily: "Poppin Semi Bold",
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  textInput(maxLines: 5, height: 15.h),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 15.0),
                    child: Text(
                      "Nama Pelanggan",
                      style: TextStyle(
                        fontFamily: "Poppin Semi Bold",
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  textInput(height: 6.h, maxLines: 1),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 15.0),
                    child: Text(
                      "No. Telphone",
                      style: TextStyle(
                        fontFamily: "Poppin Semi Bold",
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  textInput(
                      height: 6.h,
                      maxLines: 1,
                      textInputType: TextInputType.phone),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textInput(
      {int? maxLines = 1,
      double? width = 0,
      double? height = 0,
      TextInputType textInputType = TextInputType.text}) {
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
}
