class FileDownloadException implements Exception { // Abstract class olduğundan implements ettik bu sayede kedni exceptionumuzu özelleştirdik
  @override
  String toString() {
    return 'File download has failed';
  }
}