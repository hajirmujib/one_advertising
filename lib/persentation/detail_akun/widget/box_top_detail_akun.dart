import '../../index.dart';

class ContainerAtas extends StatelessWidget {
  const ContainerAtas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w,
        height: 20.h,
        color: Colors.blue[900]!,
        padding: const EdgeInsets.all(15),
        child: Center(
          child: CircleAvatar(
            radius: 15.w,
            backgroundImage: const AssetImage(
              "assets/images/logo_github.png",
            ),
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
        ));
  }
}
