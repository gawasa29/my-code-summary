import 'dart:io';

//libに入ってからターミナルでdart autoFolderCreate.dartで作成できる
Future<void> main() async {
  final features = 'Features';
  final model = 'Model';
  final common = 'Common';
  final template = 'Template';
  final theme = 'Theme';

  await Directory(common).create(recursive: true);
  await Directory(features).create(recursive: true);
  await Directory(model).create(recursive: true);
  await Directory(template).create(recursive: true);
  await Directory(theme).create(recursive: true);

  await File('$common/Utils/utils.dart').create(recursive: true);
  await File('$model/user_model.dart').create(recursive: true);
  await File('$template/Widgets/loader.dart').create(recursive: true);
  await File('$theme/pllete.dart').create(recursive: true);

  await File('$features/Loading/Controller/loading_controller.dart')
      .create(recursive: true);
  await Directory('$features/Loading/Repository/').create(recursive: true);
  await File('$features/Loading/Screen/loading_screen.dart')
      .create(recursive: true);
}
