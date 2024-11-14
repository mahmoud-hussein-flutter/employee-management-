// lib/domain/repositories/file_manager_interface.dart
abstract class FileManagerInterface {
  Future<void> uploadFile(String filePath);
  Future<String?> pickFile();
}
