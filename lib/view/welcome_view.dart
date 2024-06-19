part of 'view.dart';

class WelcomeView extends StatelessWidget {
  final WelcomeController welcomeController = Get.put(WelcomeController());
  WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(context),
    );
  }

  AppBar _appbar(){
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: const FractionalOffset(0.2, 0.1),
              end: const FractionalOffset(0.8, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
              colors: <Color>[Colors.greenAccent, Colors.yellowAccent])
        ),
      ),
      automaticallyImplyLeading: false,
      actions: const [],
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget _body(BuildContext context){
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: const FractionalOffset(0.3, 0.1),
              end: const FractionalOffset(0.8, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
              colors: <Color>[Colors.greenAccent, Colors.yellowAccent]
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_appLogo(), _header(context), _actionButton(context, ()=> {}, () => {})],
          ),
        ),
      ),
    );
  }

  Widget _appLogo(){
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
      child: SvgPicture.asset(
        'assets/images/logo.svg',
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _header(BuildContext context){
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 30, 15, 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/logo-perusahaan.png",
                height: 40,
                fit: BoxFit.cover,
                width: 150
              ),
            ],
          ),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
              child : Text ('Pasarnya ide, salurkan idemu agar membuat perubahan baru',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontFamily: 'Hind Siliguri',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              )
          )
        ],
      ),
    );
  }

  Widget _actionButton(BuildContext context, Function onPressLogin, Function onPressRegister){
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 70),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){welcomeController.handleToLogin();},
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.deepOrange;
                    return null;
                  },
                ),
              ),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Source Sans Pro",
                    fontSize: 16
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 1),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){welcomeController.handleToRegister();},
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.deepOrange;
                    return null;
                  },
                ),
              ),
              child: const Text(
                "DAFTAR",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Source Sans Pro",
                    fontSize: 16
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}