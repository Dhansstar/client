part of 'view.dart';

class HomeView extends StatelessWidget {
  final LoginControllers loginController = Get.put(LoginControllers());
  final HomeViewController _homeViewController = Get.put(HomeViewController());
  final UserQuestionController _userQuestionController = Get.put(UserQuestionController());

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: const FractionalOffset(0.2, 0.1),
                      end: const FractionalOffset(0.8, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                      colors: <Color>[Colors.white, Colors.greenAccent]
                  )
              )
          ),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        body: _body(context)
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
        child: ListView(
            children: [
              _header(context),
              Stack(
                children: [
                  _background(),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(50, 55, 50, 0),
                      child: _jumbotron()
                  ),
                ],
              ),
              Text(
                'Mandatory',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              _mandatory(context),
              Text(
                'Choice-Based',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              _choice(context),
            ],
          ),
      ),
    );
  }

  Widget _mandatory(BuildContext context) {
    return Obx((){
      return GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(_homeViewController.listCategoryMandatory.value.length, (index){
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: InkWell(
                onTap: (){
                  _userQuestionController.handleReadQuestionByCategory(_homeViewController.listCategoryMandatory.value[index].idCategory.toString());
                  Get.to(() => UserListQuestion());
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: (index % 2 == 1) ? Colors.amber : ((index % 3 == 0 && index % 2 == 0) ? Colors.red : Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon((index % 2 == 1) ? Icons.domain : ((index % 3 == 0 && index % 2 == 0) ? Icons.credit_card_rounded : Icons.local_play),
                          color: Colors.white,
                          size: 32,
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                        Text(
                          _homeViewController.listCategoryMandatory.value[index].category,
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          })
      );
    });
  }

  Widget _choice(BuildContext context) {
    return Obx((){
      return GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(_homeViewController.listCategoryChoice.value.length, (index){
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: InkWell(
                onTap: (){
                  _userQuestionController.handleReadQuestionByCategory(_homeViewController.listCategoryChoice.value[index].idCategory.toString());
                  Get.to(() => UserListQuestion());
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: (index % 2 == 1) ? Colors.amber : ((index % 3 == 0 && index % 2 == 0) ? Colors.red : Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon((index % 2 == 1) ? Icons.domain : ((index % 3 == 0 && index % 2 == 0) ? Icons.credit_card_rounded : Icons.local_play),
                          color: Colors.white,
                          size: 32,
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                        Text(
                          _homeViewController.listCategoryChoice.value[index].category,
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          })
      );
    });
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

  
  Widget _header(BuildContext context){
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){Get.to(() => ProfileView());},
                child: Obx((){
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: (_homeViewController.dataUpdateUser.value.data.profile_picture.isEmpty) ?
                    Image.asset('assets/images/logo-uin.png', width: 30, height: 30, fit: BoxFit.cover,) :
                    Image.network('http://10.0.2.2:7000/${_homeViewController.dataUpdateUser.value.data.profile_picture}'),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: InkWell(
                    onTap: (){
                      print('abc');
                      _homeViewController.findUser();
                    },
                    child: Obx((){
                      return Text(
                        'Hai, ${_homeViewController.dataUpdateUser.value.data.firstname}',
                        style:Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    })
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // NotificationIcon
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),

                // LogoutButton
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Peringatan'),
                            content: Text('Ingin logout ?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Batal'),
                              ),
                              TextButton(
                                onPressed: (){
                                  _homeViewController.logOut();
                                },
                                child: Text('Ya'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _jumbotron(){
    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/logo-uin.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              Image.asset(
                'assets/images/pusat-karir-uin.png',
                width: 150,
                height: 100,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myProgress(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Progress Saya',
          style: Theme.of(context).textTheme.headline1?.copyWith(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    width: 210,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(45),
                            child: SvgPicture.asset(
                              'assets/icons/strongly-agree.svg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 5, 0, 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Survei Pengelola',
                                  style: Theme.of(context).textTheme.headline1?.copyWith(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Expanded(child: Text(
                                  '1 dari 4 pertanyaan',
                                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                  ),
                                ),),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Color(0xFFC4C4C4),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                      ),
                                    ],
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: 210,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(45),
                              child: SvgPicture.asset(
                                'assets/icons/agree.svg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 5, 0, 5),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text(
                                    'Survei Pengelola',
                                    style: Theme.of(context).textTheme.headline1?.copyWith(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),),
                                  Text(
                                    '1 dari 4 pertanyaan',
                                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Color(0xFFC4C4C4),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 80,
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}