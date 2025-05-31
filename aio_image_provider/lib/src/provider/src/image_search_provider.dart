abstract interface class ImageSearchProvider {
  Future<List<String>> searchImages(String query);
  Future<List<String>> fetchMore();
}