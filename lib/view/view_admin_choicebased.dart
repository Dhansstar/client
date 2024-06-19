// part of "view.dart";
//
// class AdminChoiceBasedView extends StatelessWidget {
//   final AdminChoiceBasedController _adminChoiceBasedController = Get.put(AdminChoiceBasedController());
//
//   AdminChoiceBasedView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(title : Text("Mandatory")),
//       body: _body(context),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(() => AdminAddChoiceBased());
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
//
//   Widget _body(BuildContext context){
//     return Container(
//         width: double.infinity,
//         height: 620,
//         decoration: BoxDecoration(
//           color: Color(0xFFEEEEEE),
//         ),
//         child: Obx((){
//           return ListView.builder(
//             itemCount: _adminChoiceBasedController.category.value.dataCategory.length,
//             itemBuilder: (context, index) {
//               return _cardCategory(
//                 context,
//                     (){_adminChoiceBasedController.handleReadQuestionByCategory(_adminChoiceBasedController.category.value.dataCategory[index].idCategory.toString());},
//                 pengelola: _adminChoiceBasedController.category.value.dataCategory[index].category,
//                 keterangan: _adminChoiceBasedController.category.value.dataCategory[index].keterangan,
//               );
//             },
//           );
//         })
//     );
//   }
//
//   Widget _cardCategory(BuildContext context, Function readResult, {String? pengelola, String? keterangan}){
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 12),
//       child: InkWell(
//         onTap: (){
//           readResult();
//           // Get.to(() => AdminResultSurveyView());
//         },
//         child: Material(
//           color: Colors.transparent,
//           elevation: 5,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Container(
//             width: double.infinity,
//             height: 100,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Container(
//                     width: 80,
//                     height: 80,
//                     decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           (pengelola != null) ? pengelola : "Pengelola",
//                           style: Theme.of(context).textTheme.headline1?.copyWith(
//                               fontFamily: 'Poppins',
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold
//                           ),
//                         ),
//                         Text(
//                           (keterangan != null) ? keterangan : "Keterangan",
//                           style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                             fontFamily: 'Poppins',
//                             fontSize: 13,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }