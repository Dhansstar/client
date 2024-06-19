part of 'view.dart';

class UserListQuestion extends StatelessWidget {

  final UserQuestionController _userQuestionController = Get.put(UserQuestionController());

  UserListQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _body(context)
    );
  }
  Widget _body(BuildContext context){
    return WillPopScope(
      onWillPop: _userQuestionController.handleOnBackPressed,
      child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.blue
            ),
            child: Obx(() {
              if(_userQuestionController.listQuestion.value.question.isEmpty) {
                return const Center(child: Text("Question Not Ready"),);
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 12, right: 12, left: 12),
                        child: Obx((){
                          return LinearPercentIndicator(
                            width: 370,
                            lineHeight: 18.0,
                            percent: (_userQuestionController.indexQuestion.value + 1)/_userQuestionController.listQuestion.value.question.length,
                            progressColor: Colors.redAccent,
                          );
                        }),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Obx((){
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    _userQuestionController.listQuestion.value.question[_userQuestionController.indexQuestion.value].question,
                                    style: Theme.of(context).textTheme.headline1?.copyWith(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                );
                                //return Text(quizController.quiz.value.pengelola[quizController.indexOne.value].question);
                              }),
                            ),
                            const SizedBox(height: 50,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: _userQuestionController.sangatSetujuActive.value ? Colors.blueAccent : Colors.white)
                                  ),
                                  child:  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          _userQuestionController.handleOptionSangatSetuju();
                                        },
                                        child: SvgPicture.asset("assets/icons/strongly-agree.svg", width: 45, height: 45),
                                      ),
                                      const SizedBox(height: 12,),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: _userQuestionController.setujuActive.value ? Colors.blueAccent : Colors.white)
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          _userQuestionController.handleOptionSetuju();
                                        },
                                        child: SvgPicture.asset("assets/icons/agree.svg", width: 45, height: 45),
                                      ),
                                      const SizedBox(height: 12,),

                                    ],
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: _userQuestionController.tidakSetujuActive.value ? Colors.blueAccent : Colors.white)
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          _userQuestionController.handleOptionTidakSetuju();
                                        },
                                        child: SvgPicture.asset("assets/icons/disagree.svg", width: 45, height: 45),
                                      ),
                                      const SizedBox(height: 12,),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: _userQuestionController.sangatTidakSetujuActive.value ? Colors.blueAccent : Colors.white)
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          _userQuestionController.handleOptionSangatTidakSetuju();
                                        },
                                        child: SvgPicture.asset("assets/icons/strongly-disagree.svg", width: 45, height: 45),
                                      ),
                                      const SizedBox(height: 12,),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            if(_userQuestionController.isButtonNextActive.value) {
                              _userQuestionController.handlePostSurvey(_userQuestionController.listQuestion.value.question[_userQuestionController.indexQuestion.value].id);
                                // _userQuestionController.handleNext();
                            } else {
                              print("abc");
                            }
                            // quizController.handlePostSurvey(quizController.quiz.value.pengelola[quizController.indexOne.value].id_question);
                          },
                          child: Text(_userQuestionController.isButtonNextActive.value ? "Next" : "Please Choice"),
                        ),
                      )
                    ],
                  ),
                );
              }
            })
          )
      ),
    );
  }
}