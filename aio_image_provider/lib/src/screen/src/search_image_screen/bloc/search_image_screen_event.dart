part of 'search_image_screen_bloc.dart';

sealed class SearchImageScreenEvent extends Equatable {
  const SearchImageScreenEvent();

  @override
  List<Object> get props => [];
}

final class InitSearchImages extends SearchImageScreenEvent {
  final String query;
  const InitSearchImages(this.query);
}

final class FetchMoreImages extends SearchImageScreenEvent {
  const FetchMoreImages();
}

final class SearchImagesEvent extends SearchImageScreenEvent {
  final String query;
  const SearchImagesEvent(this.query);
}