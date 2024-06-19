part of 'view.dart';

class ViewRegister extends StatelessWidget {

  final RegisterControllers _registerControllers = Get.put(RegisterControllers());
  ViewRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _body(context)
    );
  }

  Widget _body(BuildContext context){
    return Center(
      child: Container (
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: const FractionalOffset(0.3, 0.1),
              end: const FractionalOffset(0.9, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
              colors: <Color>[Colors.white, Colors.greenAccent]
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        'Daftar',
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 54),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                'First Name',
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                'Last Name',
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.transparent),
                                  color: Colors.transparent
                              ),
                              child: TextField(
                                controller: _registerControllers.firstname,
                                decoration: const InputDecoration(
                                  hintText: 'Nama Depan',
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
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.transparent),
                                  color: Colors.transparent
                              ),
                              child: TextField(
                                controller: _registerControllers.lastname,
                                decoration: const InputDecoration(
                                  hintText: 'Nama Belakang',
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 7, 0, 3),
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
                        controller: _registerControllers.username,
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
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 3),
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.transparent),
                          color: Colors.transparent
                      ),
                      child: TextField(
                        controller: _registerControllers.password,
                        decoration: const InputDecoration(
                          hintText: 'Password',
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
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 3),
                      child: Text(
                        'Apa makanan favorit kamu ?',
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
                        controller: _registerControllers.validationOne,
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
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 3),
                      child: Text(
                        'Apa warna favorit kamu ?',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    _dropDown(),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                      child: Text(
                        'Daftar sebagai ?',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    _dropDownRole()
                  ],
                ),
              ),

              const SizedBox(height: 2),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Saya sudah memiliki akun,",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "Source Sans Pro",
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        GestureDetector(
                          onTap: (){_registerControllers.handleBackToLogin();},
                          child: const Text(
                            " MASUK",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Source Sans Pro',
                                fontSize: 16
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 2),
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
                        onPressed: (){_registerControllers.handleRegister();},
                        child: const Text(
                          "Daftar",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Source Sans Pro",
                              fontSize: 16
                          )
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget _dropDown(){
    return Obx((){
      return Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        width: double.infinity,
        decoration:ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(
                  width: 2.0,
                  style: BorderStyle.solid,
                  color: Colors.deepOrange
              ),
             // borderRadius: BorderRadius.all(Radius.circular(5.0)),
            )
        ),
        child: DropdownButton(
          menuMaxHeight: 150.0,
          borderRadius: BorderRadius.circular(18),
          dropdownColor: Colors.deepOrange,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.deepOrange,
          ),
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
          isExpanded: true,
          value: _registerControllers.valueColor.value,
          items: _registerControllers.listColor.map(buildMenuItem).toList(),
          onChanged: (value){
            _registerControllers.handleValue(value);
          },
        ),
      );
    });
  }

  DropdownMenuItem<String> buildMenuItem(String item){
    return DropdownMenuItem(
      onTap: (){
        // homePageController.handleAnimationChangeValue();
      },
      value: item,
      child: Text(item),
    );
  }

  Widget _dropDownRole(){
    return Obx((){
      return Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        width: double.infinity,
        decoration:ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(
                  width: 2.0,
                  style: BorderStyle.solid,
                  color: Colors.deepOrange
              ),
              // borderRadius: BorderRadius.all(Radius.circular(5.0)),
            )
        ),
        child: DropdownButton(
          menuMaxHeight: 150.0,
          borderRadius: BorderRadius.circular(18),
          dropdownColor: Colors.deepOrange,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.deepOrange, // <-- SEE HERE
          ),
          style: const TextStyle(
              color: Colors.deepPurple, //<-- SEE HERE
              fontWeight: FontWeight.bold
          ),
          isExpanded: true,
          value: _registerControllers.selectValueRole.value,
          items: _registerControllers.listRoleDropDownMenuItem.value,
          onChanged: (String? value) {

            _registerControllers.handleValueRole(value);
            _registerControllers.handleIdRole(value);
          },
        ),
      );
    });
  }
}