import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../../../provider/provider.dart';

part 'search_image_screen_event.dart';
part 'search_image_screen_state.dart';

class SearchImageScreenBloc
    extends Bloc<SearchImageScreenEvent, SearchImageScreenState> {
  final String searchKey;
  final ImageSearchProvider imageSearchProvider = GetIt.I<ImageSearchProvider>();
  SearchImageScreenBloc(this.searchKey) : super(const SearchImageScreenState()) {
    on<InitSearchImages>(_onInitSearchImagesEvent);
    on<FetchMoreImages>(_onFetchMoreImagesEvent);
    on<SearchImagesEvent>(_onSearchImagesEvent);

    // add(InitSearchImages(searchKey));

  }

  Future<void> _onInitSearchImagesEvent(InitSearchImages event, Emitter<SearchImageScreenState> emit) async {
    emit(state.copyWith(status: SearchImageScreenLoadStatus.loading));
    final initialResults = await imageSearchProvider.searchImages(event.query);
    emit(state.copyWith(status: SearchImageScreenLoadStatus.loaded, resultUrls: initialResults));
  }

  Future<void> _onFetchMoreImagesEvent(FetchMoreImages event, Emitter<SearchImageScreenState> emit) async {
    final resultUrls = await imageSearchProvider.fetchMore();
    if(resultUrls.isEmpty) {
      emit(state.copyWith(hasMore: false));
    }
    else {
      emit(state.copyWith(resultUrls: [...state.resultUrls, ...resultUrls]));
    }
  }

  Future<void> _onSearchImagesEvent(SearchImagesEvent event, Emitter<SearchImageScreenState> emit) async {
    emit(state.copyWith(status: SearchImageScreenLoadStatus.loading));
    final resultUrls = await imageSearchProvider.searchImages(event.query);
    emit(state.copyWith(status: SearchImageScreenLoadStatus.loaded, resultUrls: resultUrls));
  }

  @override
  Future<void> close() async {
    for(final url in state.resultUrls) {
      CachedNetworkImage.evictFromCache(url);
    }
    return super.close();
  }
}
