part of 'view.dart';

class ForgetPassword extends StatelessWidget {
  final ForgetPasswordController _forgetPasswordController = Get.put(ForgetPasswordController());

  ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context){
    return Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                  //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.91), BlendMode.dstATop),
                    image: AssetImage("assets/images/pusatkarier10.gif"),
                    fit: BoxFit.cover
                )
            ),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2),
                      Center(
                        child: Text(
                          'Forget Password',
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 40, 0, 5),
                        child: Text(
                          'Username',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
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
                          controller: _forgetPasswordController.username,
                          decoration: const InputDecoration(
                            hintText: 'Username',
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
                      const SizedBox(height: 18,),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                        child: Text(
                          'Apa Makanan Favorit Kamu ?',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
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
                          controller: _forgetPasswordController.validationOne,
                          decoration: const InputDecoration(
                            hintText: 'Makanan Favorit',
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
                      const SizedBox(height: 18,),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                        child: Text(
                          'Apa Warna Favorit Kamu ?',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
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
                          controller: _forgetPasswordController.validationTwo,
                          decoration: const InputDecoration(
                            hintText: 'Warna Favorit',
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
                      const SizedBox(height: 18,),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                        child: Text(
                          'Password Baru',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
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
                          controller: _forgetPasswordController.password,
                          decoration: const InputDecoration(
                            hintText: 'Password Baru',
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
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Saya tidak memiliki akun,",
                            style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                          GestureDetector(
                            onTap: (){_forgetPasswordController.handleToRegister();},
                            child: const Text(
                              " DAFTAR",
                              style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48)
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.deepOrange;
                                return null;
                              },
                            ),
                          ),
                          onPressed: (){_forgetPasswordController.handleForgetPassword();},
                          child: const Text(
                              "Update Password",
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
        )
    );
  }
}