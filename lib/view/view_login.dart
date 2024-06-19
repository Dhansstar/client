part of 'view.dart';

class ViewLogin extends StatelessWidget {
  final LoginControllers _loginControllers = Get.put(LoginControllers());

  ViewLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _body(context)
    );
  }

  Widget _body(BuildContext context){
    return Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: new DecorationImage(
                  //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.91), BlendMode.dstATop),
                  image: AssetImage("assets/images/pusatkarier2.gif"),
                  fit: BoxFit.cover
              )
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 100),
                        Center(
                          child: Text(
                          'MASUK',
                            style: Theme.of(context).textTheme.headline1?.copyWith(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                        ),
                        Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 30, 0, 5),
                          child: Text(
                          'Username',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontFamily: 'Source Sans Pro',
                              fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.transparent),
                              color: Colors.transparent
                          ),
                          child: TextField(
                            controller: _loginControllers.username,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan Username Anda',
                              contentPadding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                          child: Text(
                            'Password',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Obx((() => TextFormField(
                          controller: _loginControllers.password,
                          obscureText: _loginControllers.txtPasswordVisibility.value,
                          decoration: InputDecoration(
                            hintText: 'Masukkan Password Anda',
                            contentPadding: EdgeInsets.fromLTRB(4, 15, 0, 0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepOrange,
                                width: 2,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                _loginControllers.txtPasswordVisibility.value =
                                !_loginControllers.txtPasswordVisibility.value;
                                },
                              child: Icon(
                                _loginControllers.txtPasswordVisibility.value
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.deepOrange,
                                size: 22,
                              ),
                            ),
                          ),
                        ))),
                        const SizedBox(height: 18,),
                        GestureDetector(
                            onTap : (){_loginControllers.goToForgetPassword();},
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                              child: Text(
                                'Lupa Password ?',
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontStyle: FontStyle.normal,
                                    fontFamily: "Source Sans Pro",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height:50),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Anda tidak memiliki akun?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Source Sans Pro",
                                  fontSize: 16
                              ),
                            ),
                            GestureDetector(
                              onTap: (){_loginControllers.handleToRegister();},
                              child: const Text(
                                " DAFTAR",
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Source Sans Pro",
                                  fontSize: 16
                                ),

                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48)
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.pressed))
                                        return Colors.deepOrange;
                                      return null;
                                      },
                              ),
                            ),
                            onPressed: (){_loginControllers.handleLogin();},
                            child: const Text(
                              "Masuk",
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
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

}