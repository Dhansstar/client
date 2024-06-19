part of 'view.dart';


class UserFinishSurveyView extends StatelessWidget {
  const UserFinishSurveyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context){
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/Check-big.svg"),
            Text(
              "Ide Anda telah di submit",
              style: Theme.of(context).textTheme.headline1?.copyWith(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){Get.to(() => HomeView());},
                child: Text(
                  "Kembali ke Beranda",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}