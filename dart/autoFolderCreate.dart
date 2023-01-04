import 'dart:io';

//libに入ってからターミナルでdart autoFolderCreate.dartで作成できる
Future<void> main() async {
  final features = 'features/home';

  await Directory('common').create(recursive: true);
  await Directory('models').create(recursive: true);

  await File('${features}/controller/home_controller.dart')
      .create(recursive: true);
  await File('${features}/repository/home_repository.dart')
      .create(recursive: true);
  await File('${features}/screens/home_screen.dart').create(recursive: true);

  await File('theme/pllete.dart').create(recursive: true);
}
