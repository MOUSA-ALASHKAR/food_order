// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:food_order/ui/shared/colors.dart';
// import 'package:food_order/ui/shared/custom_widgets/button_widget.dart';
// import 'package:image_picker/image_picker.dart';
//
// class Signup2View extends StatefulWidget {
//   Signup2View({Key? key}) : super(key: key);
//
//   @override
//   State<Signup2View> createState() => _Signup2ViewState();
// }
//
// class _Signup2ViewState extends State<Signup2View> {
//
//   final ImagePicker picker = ImagePicker();
//   FileModel? selectedFile;
//   bool showOptions = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(children: [
//         Center(
//           child: Stack(
//             alignment: AlignmentDirectional.bottomEnd,
//             children: [
//               InkWell(
//                 onTap: selectedFile == null || selectedFile!.path.isEmpty
//                     ? () {
//                         setShowOption(true);
//                       }
//                     : null,
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundColor: AppColors.mainOrangeColor,
//                   child: selectedFile == null
//                       ? Icon(Icons.person)
//                       : selectedFile!.path.isNotEmpty && selectedFile!.type == FileType.FILE
//                           ? Icon(Icons.file_copy) : selectedFile!.path.isNotEmpty
//                               ? Image.file(File(selectedFile!.path))
//                               : Icon(Icons.person),
//                 ),
//               ),
//               Visibility(
//                   visible:
//                       selectedFile != null && selectedFile!.path.isNotEmpty,
//                   child: InkWell(
//                     onTap: () {
//                       setShowOption(true);
//                     },
//                     child: CircleAvatar(
//                       radius: 20,
//                       backgroundColor: AppColors.mainBlueColor,
//                     ),
//                   ))
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Visibility(
//           visible: showOptions,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ButtonWidget(
//                 text: 'Camera',
//                 onPressed: () {
//                   pickFile(FileType.CAMERA)
//                       .then((value) => selectedFile = value);
//                 },
//               ),
//               ButtonWidget(
//                 text: 'Gallery',
//                 onPressed: () {
//                   pickFile(FileType.GALLERY)
//                       .then((value) => selectedFile = value);
//                 },
//               ),
//               ButtonWidget(
//                 text: 'File',
//                 onPressed: () {
//                   pickFile(FileType.FILE).then((value) => selectedFile = value);
//                 },
//               ),
//             ],
//           ),
//         )
//       ]),
//     );
//   }
//
//   void setShowOption(bool value) {
//     setState(() {
//       showOptions = value;
//     });
//   }
//
//   Future<FileModel> pickFile(FileType type) async {
//     String path = '';
//
//     switch (type) {
//       case FileType.CAMERA:
//         await picker.pickImage(source: ImageSource.camera).then((value) => path = value?.path ?? '');
//         break;
//       case FileType.GALLERY:
//         await picker.pickImage(source: ImageSource.gallery).then((value) => path = value?.path ?? '');
//         break;
//       case FileType.FILE:
//         await FilePicker.platform.pickFiles().then((value) => path = value?.paths[0] ?? '');
//         break;
//     }
//     setShowOption(false);
//     return FileModel(path.isNotEmpty ? path : selectedFile!.path,
//         path.isNotEmpty ? type : selectedFile!.type);
//   }
// }
//
// class FileModel {
//   FileType type;
//   String path;
//
//   FileModel(this.path, this.type);
// }
//
// enum FileType { CAMERA , GALLERY , FILE }







// class DetailsView extends StatefulWidget {
//   const DetailsView({Key? key, required this.model,}) : super(key: key);
//   final MealModel model;
//
//   @override
//   State<DetailsView> createState() => _DetailsViewState();
// }
//
// class _DetailsViewState extends State<DetailsView> {
//
//   DetailController controller = Get.put(DetailController());
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SafeArea(
//       bottom: false,
//       child: Scaffold(
//
//         resizeToAvoidBottomInset: false,
//
//         body: Obx((){
//           return Text(widget.model.description ?? '');
//         }
//         ),
//       ),
//     );
//
//   }
// }




