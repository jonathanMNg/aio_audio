import 'package:flutter/material.dart';


class BaseExpandedHeader extends StatelessWidget {
  final Widget title;
  final Widget? expandedTitle;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? subtitle;

  const BaseExpandedHeader({super.key, required this.title, this.leading, this.actions, this.subtitle, this.expandedTitle});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: leading != null ? false : true,
      leading: leading,
      leadingWidth: leading != null ? 15 : null,
      pinned: true,
      title: InvisibleExpandedHeader(
        child: title,
      ),
      expandedHeight: kToolbarHeight * 2,
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Container(
            margin: const EdgeInsets.symmetric(horizontal:  15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                expandedTitle ?? title,
                const SizedBox(
                  height: 10,
                ),
                subtitle ?? const SizedBox.shrink()
              ],
            ),
          )),
      actions: actions,
    );
  }
}


class ImageSearchExpandedHeader extends BaseExpandedHeader {
  ImageSearchExpandedHeader({super.key, required this.titleText, super.leading, super.actions, required this.controller, this.onSubmitted,
    required this.onChanged, this.onClear, this.initialValue})
      : super(title: Text(titleText), expandedTitle: Text(titleText, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 18,)),
    subtitle: ImageSearchField(controller: controller, onChanged: onChanged, onSubmitted: onSubmitted, onClear: onClear, value: initialValue,),
  );
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onClear;
  final String titleText;
  final String? initialValue;
  final TextEditingController? controller;
}


class InvisibleExpandedHeader extends StatefulWidget {
  final Widget child;

  const InvisibleExpandedHeader({super.key, required this.child});

  @override
  // ignore: library_private_types_in_public_api
  _InvisibleExpandedHeaderState createState() {
    return _InvisibleExpandedHeaderState();
  }
}

class _InvisibleExpandedHeaderState extends State<InvisibleExpandedHeader> {
  ScrollPosition? _position;
  bool? _visible;

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context).position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
    context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(visible: _visible ?? false, child: widget.child);
  }
}


class ImageSearchField extends StatefulWidget {
  const ImageSearchField({super.key, this.placeholder, this.value, this.controller, this.onChanged, this.onSubmitted, this.onClear});

  final String? placeholder;
  final String? value;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onClear;

  @override
  State<ImageSearchField> createState() => _ImageSearchFieldState();
}

class _ImageSearchFieldState extends State<ImageSearchField> {

  late TextEditingController textEditingController;
  late FocusNode focusNode;
  bool onFocus = false;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    textEditingController = widget.controller ?? TextEditingController();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   FocusScope.of(context).requestFocus(focusNode);
    // });
    focusNode.addListener(() {
      if(focusNode.hasFocus) {
        setState(() {
          onFocus = true;
        });
      }
      else {
        setState(() {
          onFocus = false;
        });
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextField(
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 16,),
        onChanged: widget.onChanged,
        focusNode: focusNode,
        controller: textEditingController,
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          focusColor: Colors.white,
          isDense: true,
          hintText: widget.placeholder ?? 'Search Image',
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIconColor: onFocus ? Colors.white : Colors.grey,
          prefixIcon: const Icon(Icons.search, size: 20),
          suffixIcon: onFocus? IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              textEditingController.clear();
              widget.onChanged?.call('');
              widget.onClear?.call();
            },
            icon: const Icon(Icons.clear, size: 20, ),
          ) : null,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
              style: BorderStyle.solid,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.solid,
            ),
          ),
          contentPadding: EdgeInsets.zero,
        ),),
    );
  }
}