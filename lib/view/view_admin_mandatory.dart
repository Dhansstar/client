part of "view.dart";

class AdminMandatoryView extends StatelessWidget {
  final AdminMandatoryController _adminMandatoryController = Get.put(AdminMandatoryController());

  AdminMandatoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.greenAccent, Colors.yellowAccent]
              )
          ),
        ),
        title : Text(
          "Grafik Penilaian",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Source Sans Pro",
              fontSize: 23
          ),
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context){
    return Container(
        width: double.infinity,
        height: 1000,
        decoration: BoxDecoration(
            image: new DecorationImage(
                //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.64), BlendMode.srcATop),
                image: AssetImage("assets/images/pusatkarier6.gif"),
                fit: BoxFit.cover
            )
        ),
        child: Obx((){
          return ListView.builder(
            itemCount: _adminMandatoryController.category.value.dataCategory.length,
            itemBuilder: (context, index) {
              return _cardCategory(
                context,
                (){_adminMandatoryController.handleReadQuestionByCategory(_adminMandatoryController.category.value.dataCategory[index].idCategory.toString());},
                pengelola: _adminMandatoryController.category.value.dataCategory[index].category,
                keterangan: _adminMandatoryController.category.value.dataCategory[index].keterangan,
              );
            },
          );
        })
    );
  }

  Widget _cardCategory(BuildContext context, Function readResult, {String? pengelola, String? keterangan}){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: (){
          readResult();
          // Get.to(() => AdminResultSurveyView());
        },
        child: Material(
          color: Colors.transparent,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                // color :Colors.transparent
                gradient: LinearGradient(
                    begin: const FractionalOffset(0.2, 0.1),
                    end: const FractionalOffset(0.8, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                    colors: <Color>[Colors.greenAccent, Colors.transparent]
                )
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Container(
                  //   width: 80,
                  //   height: 80,
                  //   decoration: BoxDecoration(
                  //       image: new DecorationImage(
                  //           // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.64), BlendMode.srcATop),
                  //           image: AssetImage("assets/images/pusatkarier3.gif"),
                  //           fit: BoxFit.cover
                  //       )
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (pengelola != null) ? pengelola : "Pengelola",
                          style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontFamily: 'Source Sans Pro',
                              color : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          (keterangan != null) ? keterangan : "Keterangan",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 14,
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
    );
  }
}