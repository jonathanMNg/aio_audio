part of 'search_image_screen_bloc.dart';

enum SearchImageScreenLoadStatus {initial, loading, loaded, error }

class SearchImageScreenState extends Equatable {
  const SearchImageScreenState({
    this.status = SearchImageScreenLoadStatus.initial,
    this.hasMore = true,
    this.resultUrls = const [],
  });

  final SearchImageScreenLoadStatus status;
  final bool hasMore;
  final List<String> resultUrls;

  SearchImageScreenState copyWith({
    SearchImageScreenLoadStatus? status,
    bool? hasMore,
    List<String>? resultUrls,
  }) {
    return SearchImageScreenState(
      status: status ?? this.status,
      hasMore: hasMore ?? this.hasMore,
      resultUrls: resultUrls ?? this.resultUrls,
    );
  }
  @override
  List<Object> get props => [status, hasMore, resultUrls];
}
