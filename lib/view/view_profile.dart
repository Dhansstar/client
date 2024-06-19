part of "view.dart";

class ProfileView extends StatelessWidget {
  final ProfileControllers _profileControllers = Get.put(ProfileControllers());
  final LoginControllers _loginControllers = Get.put(LoginControllers());

  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context){
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  _background(),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(160, 0, 160, 0),
                    child: GestureDetector(
                      onTap: (){
                        _profileControllers.uploadImage(ImageSource.camera);
                        },
                      child: Container(
                        width: 90,
                        height: 90,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Obx((){
                          return Image.network(_profileControllers.dataUpdateUser.value.data.profile_picture.isEmpty ? 'https://cdn-icons-png.flaticon.com/512/149/149071.png' : 'http://10.0.2.2:7000/${_profileControllers.dataUpdateUser.value.data.profile_picture}');
                        }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(40, 130, 40, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 650,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: _content(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _background(){
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: Color(0xFF239BD8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        child: SvgPicture.asset(
          'assets/images/jumbotron_bg.svg',
          width: double.infinity,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _content(BuildContext context){
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                              child: Text(
                                'First Name',
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                              child: Text(
                                'Last Name',
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontFamily: 'Poppins',
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
                                  border: Border.all(color: Colors.blueAccent),
                                  color: Colors.white
                              ),
                              child: TextField(
                                controller: _profileControllers.firstname,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.blueAccent),
                                  color: Colors.white
                              ),
                              child: TextField(
                                controller: _profileControllers.lastname,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                      child: Text(
                        'Username',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.white
                      ),
                      child: TextField(
                        controller: _profileControllers.username,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                      child: Text(
                        'Email',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.white
                      ),
                      child: TextField(
                        controller: _profileControllers.email,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                      child: Text(
                        'No.Hp',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.white
                      ),
                      child: TextField(
                        controller: _profileControllers.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                      child: Text(
                        'Profesi',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.white
                      ),
                      child: TextField(
                        controller: _profileControllers.profesi,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                      child: Obx((){
                        return Text(
                          'Makanan kesukaan kamu adalah ${_profileControllers.dataUpdateUser.value.data.validasi_one}',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        );
                      })
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.white
                      ),
                      child: TextField(
                        controller: _profileControllers.validationOne,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                      child: Obx((){
                        return Text(
                          'Warna kesukaan kamu adalah ${_profileControllers.dataUpdateUser.value.data.validasi_two}',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        );
                      }),
                    ),
                    _dropDown(),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
                      child: Obx((){
                        return Text(
                          'Kamu Register sebagai ${_profileControllers.dataUpdateUser.value.data.role.loginType}',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        );
                      }),
                    ),
                    _dropDownRole()
                  ],
                ),
              ),

              const SizedBox(height: 8,),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48)
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        onPressed: (){
                          _profileControllers.updateUser();
                        },
                        child: Text("Update Profile"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropDown(){
    return Obx((){
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blueAccent),
            color: Colors.white
        ),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(18),
          focusColor: Colors.white,
          underline: const SizedBox(),
          iconSize: 26,
          isExpanded: true,
          value: _profileControllers.valueColor.value,
          items: _profileControllers.listColor.map(buildMenuItem).toList(),
          onChanged: (value){
            _profileControllers.handleValue(value);
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
        width: double.infinity,
        padding: const EdgeInsets.only(left: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blueAccent),
            color: Colors.white
        ),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(18),
          focusColor: Colors.white,
          underline: const SizedBox(),
          iconSize: 26,
          isExpanded: true,
          value: _profileControllers.selectValueRole.value,
          items: _profileControllers.listRoleDropDownMenuItem.value,
          onChanged: (String? value) {
            _profileControllers.handleValueRole(value);
            _profileControllers.handleIdRole(value);
          },
        ),
      );
    });
  }
}