part of 'view.dart';

class AdminListQuestionAddView extends StatelessWidget {
  final AdminListQuestionController _adminListQuestionController = Get.put(AdminListQuestionController());
  AdminListQuestionAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.black),
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
          "Kelola Pertanyaan",
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
    return ListView(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5, 30, 0, 5),
          child: Text(
            'Pilih Jenis Kategori',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontFamily: 'Source Sans Pro',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        _dropDown(),

        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(13, 30, 0, 5),
          child: Text(
            'Pertanyaan',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontFamily: 'Source Sans Pro',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.transparent),
              color: Colors.transparent
          ),
          child: TextField(
            controller: _adminListQuestionController.question,
            decoration: const InputDecoration(
              hintText: 'Masukkan Pertanyaan',
              contentPadding: EdgeInsets.fromLTRB(5, 0, 10, 0),
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

        const SizedBox(height: 20),

        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
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
            onPressed: (){
              if(_adminListQuestionController.isEdit.value) {
                _adminListQuestionController.handleUpdateQuestion();
              } else {
                _adminListQuestionController.handleAddQuestion();
              }
              Get.back();
            },
            child: Obx((){
              return Text(_adminListQuestionController.isEdit.value ? "Update" : "Add");
            }),
          ),
        ),
      ],
    );
  }

  Widget _dropDown(){
    return Obx((){
      return Container(
        margin: const  EdgeInsets.symmetric(horizontal: 22),
        padding: const EdgeInsets.only(left: 22, right: 18, top: 12, bottom: 12),
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
          borderRadius: BorderRadius.circular(18),
          dropdownColor: Colors.deepOrange,
          underline: const SizedBox(),
          iconSize: 26,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.deepOrange,
          ),
          isExpanded: true,
          value: _adminListQuestionController.selectValueCategory.value,
          items: _adminListQuestionController.listCategoryDropDownMenuItem.value,
          onChanged: (String? value) {
            _adminListQuestionController.handleValue(value);
            _adminListQuestionController.handleIdCategory(value);
          },
        ),
      );
    });
  }
}