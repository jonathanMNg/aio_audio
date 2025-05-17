abstract interface class AdmDownloadItemProvider {
  Future<void> getDownloadItem(String id);
  Future<void> removeDownloadItem(String id);

}