part of 'view.dart';

class UserListQuestionView extends StatelessWidget {
  // final AdminListQuestionController _adminListQuestionController = Get.put(AdminListQuestionController());

  UserListQuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('List Question')),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context){
    return Container(
        width: double.infinity,
        height: 620,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: Obx((){
          return ListView.builder(
            itemCount:5,
            itemBuilder: (_, index) {
              return _cardCategory(
                  context,
                  quiz: "abc"
              );
            },
          );
        })
    );
  }

  Widget _cardCategory(BuildContext context,{String? quiz}){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
      child: InkWell(
        onTap: (){},
        child: Material(
          color: Colors.transparent,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pengelola",
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline1?.copyWith(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}