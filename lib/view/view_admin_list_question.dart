part of 'view.dart';

class AdminListQuestionView extends StatelessWidget {
  final AdminListQuestionController _adminListQuestionController = Get.put(AdminListQuestionController());

  AdminListQuestionView({Key? key}) : super(key: key);

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
          "List Pertanyaan",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Source Sans Pro",
              fontSize: 23
          ),
        ),
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _adminListQuestionController.clearInput();
          _adminListQuestionController.handleIsEdit();
          Get.to(() => AdminListQuestionAddView());
          },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _body(BuildContext context){
    return Container(
        width: double.infinity,
        height: 1000,
        decoration: BoxDecoration(
            image: new DecorationImage(
              //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.64), BlendMode.srcATop),
                image: AssetImage("assets/images/pusatkarier7.gif"),
                fit: BoxFit.cover
            )
        ),
        child: Obx((){
          return ListView.builder(
            itemCount: _adminListQuestionController.listQuestion.value.data.length,
            itemBuilder: (_, index) {
              return _cardCategory(
                context,
                () => _adminListQuestionController.handleDeleteQuestion(id: _adminListQuestionController.listQuestion.value.data[index].idQuestion.toString()),
                () => _adminListQuestionController.handleReadDetailQuestion(id: _adminListQuestionController.listQuestion.value.data[index].idQuestion.toString()),
                category: _adminListQuestionController.listQuestion.value.data[index].category.category,
                quiz: _adminListQuestionController.listQuestion.value.data[index].question
              );
            },
          );
        })
    );
  }

  Widget _cardCategory(BuildContext context, Function deleteCategory, Function editCategory,{String? quiz, String? category}){
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
              height: 130,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: const FractionalOffset(0.2, 0.1),
                      end: const FractionalOffset(0.8, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                      colors: <Color>[Colors.greenAccent, Colors.transparent]
                  )
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Container(
                        //   width: 80,
                        //   height: 80,
                        //   decoration: BoxDecoration(
                        //     color: Colors.blueAccent,
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        // ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (quiz != null) ? quiz : "Pengelola",
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline1?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Source Sans Pro",
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  (category != null) ? category : "Category",
                                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Source Sans Pro",
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: (){
                              editCategory();
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.greenAccent,
                              size: 35,
                            )
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                            onTap: (){
                              deleteCategory();
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                              size: 35,
                            )
                        ),
                      ],
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}