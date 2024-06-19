part of 'view.dart';

class AdminView extends StatelessWidget {
  final LoginControllers loginController = Get.put(LoginControllers());
  final HomeViewAdminController _homeViewController = Get.put(HomeViewAdminController());

  AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
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
      body: _body(context),
    );
  }

  Widget _body(BuildContext context){
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: new DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.64), BlendMode.srcATop),
                image: AssetImage("assets/images/pusatkarier5.gif"),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                _background(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                  child: _header(context),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 55, 50, 0),
                  child: _jumbotron(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 185, 30, 0),
                  child: _grafik(context),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 335, 30, 0),
                  child: _kelolaPertanyaanKategori(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _background(){
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: const FractionalOffset(0.19, 0.1),
            end: const FractionalOffset(0.76, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
            colors: <Color>[Colors.white, Colors.greenAccent]
        ),
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
        color: Color(0x00EEEEEE),
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
              Obx((){
                return InkWell(
                  onTap: () {Get.to(() => ProfileView());},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: (_homeViewController.dataUpdateUser.value.data.profile_picture.isEmpty) ?
                    Image.asset('assets/images/logo-uin.png', width: 30, height: 30, fit: BoxFit.cover,) :
                    Image.network('http://10.0.2.2:7000/${_homeViewController.dataUpdateUser.value.data.profile_picture}'),
                  ),
                );
              }),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Obx((){
                  return InkWell(
                    onTap: (){
                      _homeViewController.findUser();
                    },
                    child: Text(
                      'Hai, ${_homeViewController.dataUpdateUser.value.data.firstname}',
                      style:Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  );
                }),
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
                // Icon(
                //   Icons.notifications,
                //   color: Colors.white,
                //   size: 30,
                // ),

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
                                onPressed: (){ _homeViewController.logOut();},
                                child: Text('Ya'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.black,
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
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(14),
      // ),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            image: new DecorationImage(
              //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.91), BlendMode.dstATop),
                image: AssetImage("assets/images/pusatkarier7.gif"),
                fit: BoxFit.cover
            )
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

  Widget _grafik(BuildContext context){
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grafik Penilaian',
            style: Theme.of(context).textTheme.headline1?.copyWith(
              fontFamily: 'Source Sans Pro',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {Get.to(() => AdminMandatoryView());},
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: 135,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.deepOrangeAccent
                        // color:
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.article_outlined,
                              color: Colors.white,
                              size: 38,
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.white,
                            ),
                            Text(
                              'Grafik Penilaian',
                              style: Theme.of(context).textTheme.headline1?.copyWith(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
        ],
      ),
    );
  }
}

Widget _kelolaPertanyaanKategori(BuildContext context){
  return Container(
    width: double.infinity,
    height: 140,
    decoration: BoxDecoration(),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kelola Pertanyaan dan Kategori',
          style: Theme.of(context).textTheme.headline1?.copyWith(
            fontFamily: 'Source Sans Pro',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {Get.to(() => AdminListCategoryView());},
                child: Material(
                  color: Colors.transparent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    width: 135,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFF64DD17),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.question_answer_rounded,
                            color: Colors.white,
                            size: 38,
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.white,
                          ),
                          Text(
                            'Kelola Kategori',
                            style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {Get.to(() => AdminListQuestionView());},
                child: Material(
                  color: Colors.transparent,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    width: 135,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFF40C4FF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.text_decrease_sharp,
                            color: Colors.white,
                            size: 38,
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.white,
                          ),
                          Text(
                            'Kelola Pertanyaan',
                             style: Theme.of(context).textTheme.headline1?.copyWith(
                               fontFamily: 'Source Sans Pro',
                               fontSize: 14,
                               fontWeight: FontWeight.bold,
                               color: Colors.white,
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
      ],
    ),
  );
}
