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
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Searching for ${widget.searchKey}')),
      body: BlocBuilder<SearchImageScreenBloc, SearchImageScreenState>(
        builder: (context, state) {
          if(state.status == SearchImageScreenLoadStatus.loaded) {
            final resultUrls = state.resultUrls;
            final crossAxisCount =
            kIsWeb ? (MediaQuery.sizeOf(context).width / 300).round() : 2;
            return
              ListView(
                controller: _scrollController,
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                    ),
                    itemBuilder: (context, index) {
                      Widget child = GestureDetector(
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
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(snackBar);
                          },
                        ),
                      );
                      return child;
                    },
                    itemCount: resultUrls.length,
                  ),
                  const SizedBox(height: 15),
                  const LinearProgressIndicator(),
                ],
              );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<SearchImageScreenBloc>().add(const FetchMoreImages());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
