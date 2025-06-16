import 'package:aio_image_provider/src/component/src/expanded_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../component/component.dart';
import '../../../screen.dart';

class SearchImageScreenPage extends StatelessWidget {
  const SearchImageScreenPage({super.key, required this.searchKey});
  final String searchKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchImageScreenBloc(searchKey),
      child: SearchImageScreenView(searchKey: searchKey),
    );
  }
}

class SearchImageScreenView extends StatefulWidget {
  const SearchImageScreenView({super.key, required this.searchKey});

  final String searchKey;

  @override
  State<SearchImageScreenView> createState() => _SearchImageScreenViewState();
}

class _SearchImageScreenViewState extends State<SearchImageScreenView> {
  late final ScrollController _scrollController;
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _textEditingController = TextEditingController();
    _textEditingController.text = widget.searchKey;
    _scrollController.addListener(_onScroll);
    context.read<SearchImageScreenBloc>().add(
      InitSearchImages(widget.searchKey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          ImageSearchExpandedHeader(
            titleText: 'Image Search',
            initialValue: widget.searchKey,
            controller: _textEditingController,
            onChanged: (query) {},
            onSubmitted: (query) {
              context.read<SearchImageScreenBloc>().add(
                SearchImagesEvent(query),
              );
            },
          ),
          SliverToBoxAdapter(child: SizedBox(height: 15)),
          BlocBuilder<SearchImageScreenBloc, SearchImageScreenState>(
            builder: (context, state) {
              if (state.status == SearchImageScreenLoadStatus.loaded) {
                final resultUrls = state.resultUrls;
                final crossAxisCount =
                    kIsWeb
                        ? (MediaQuery.sizeOf(context).width / 300).round()
                        : 2;
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      child: SearchImageWidget(
                        imageUrl: state.resultUrls[index],
                        onTap: () {
                          Navigator.of(context).pop(resultUrls[index]);
                        },
                        onTapErrorWidget: () {
                          const snackBar = SnackBar(
                            content: Text(
                              'Invalid Image, Please select another one',
                            ),
                            duration: Duration(seconds: 1),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                    );
                  }, childCount: resultUrls.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                  ),
                );
              }
              else if(state.status == SearchImageScreenLoadStatus.loading) {
                return const SliverToBoxAdapter(
                  child: LinearProgressIndicator(),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          ),
          BlocBuilder<SearchImageScreenBloc, SearchImageScreenState>(
            builder: (context, state) {
              if (state.resultUrls.isNotEmpty) {
                return const SliverToBoxAdapter(
                  child: LinearProgressIndicator(),
                );
              } else {
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<SearchImageScreenBloc>().add(const FetchMoreImages());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
