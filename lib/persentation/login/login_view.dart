import '../index.dart';

import 'widget/container_atas.dart';
import 'widget/container_bawah.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const ContainerAtasLogin(),
            containerBawah(),
          ],
        ),
      ),
    );
  }
}
