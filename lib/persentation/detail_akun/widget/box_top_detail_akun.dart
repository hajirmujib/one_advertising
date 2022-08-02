import 'package:one_advertising/controller/user_c.dart';
import 'package:one_advertising/services/services.dart';

import '../../index.dart';

class ContainerAtas extends StatelessWidget {
  const ContainerAtas({
    this.image = "",
    Key? key,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();

    return Container(
        width: 100.w,
        height: 20.h,
        color: Colors.blue[900]!,
        padding: const EdgeInsets.all(15),
        child: Center(
          child: CircleAvatar(
            radius: 15.w,
            backgroundImage: NetworkImage(urlImage + image),
            onBackgroundImageError: (exception, stackTrace) =>
                const Icon(Icons.error),
            child: InkWell(
              onTap: () {
                controller.getImage(true);
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.photo,
                    color: Colors.blue[900]!,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
