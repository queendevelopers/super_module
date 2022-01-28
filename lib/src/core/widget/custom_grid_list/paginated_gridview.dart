// import 'dart:async';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'list_adapter.dart';
// import 'types.dart';
//
// class PaginatedGridView extends StatefulWidget {
//   final int pageSize;
//   final Widget empty;
//   final BaseListAdapter adapter;
//   final List<Widget> children;
//   final WidgetBuilder loadingBuilder;
//   final GridItemBuilder itemBuilder;
//   final LoadGridErrorBuilder errorBuilder;
//   final AsyncCallback onRefresh;
//   final AsyncCallback onLoadMore;
//   final bool disableRefresh;
//   final EdgeInsets padding;
//   final ScrollPhysics physics;
//   final int itemCount;
//   final Axis scrollDirection;
//   final bool shrinkWrap;
//   final Duration debounceDuration;
//   final Stream<List<dynamic>> stream;
//   final double aspectRatio;
//   final int crossAxisCount;
//
//   const PaginatedGridView({
//     required Key key,
//     this.stream,
//     this.pageSize = 30,
//     this.aspectRatio = 1.0,
//     required this.empty,
//     this.adapter,
//     @required this.itemBuilder,
//     this.loadingBuilder,
//     this.errorBuilder,
//     this.padding,
//     this.physics,
//     this.children,
//     this.itemCount,
//     this.onLoadMore,
//     this.onRefresh,
//     this.disableRefresh = false,
//     this.scrollDirection = Axis.vertical,
//     this.shrinkWrap = true,
//     this.crossAxisCount,
//     this.debounceDuration = const Duration(milliseconds: 500),
//   })  : assert(children != null || itemBuilder != null),
//         assert(children != null || adapter != null || itemCount != null),
//         assert(debounceDuration != null),
//         super(key: key);
//
//   @override
//   PaginatedGridViewState createState() => PaginatedGridViewState();
// }
//
// class PaginatedGridViewState extends State<PaginatedGridView> {
//   List items = [];
//   Future future;
//   bool reachedToEnd = false;
//
//   bool _loading = false;
//   bool _fetching = false;
//   LoadErrorDetails _errorDetails;
//   Timer _loadDebounce;
//
//   bool get loading => _loading;
//
//   bool get fetching => _fetching;
//   final ScrollController _scrollController = ScrollController();
//
//   @override
//   void initState() {
//     _scrollController.addListener(() {
//       final maxScroll = _scrollController.position.maxScrollExtent;
//       final currentScroll = _scrollController.position.pixels;
//       const delta = 200.0;
//       if (maxScroll - currentScroll <= delta) {
//         loadMore();
//       }
//     });
//     loadMore();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   Future fetchData({int offset, bool merge = true}) async {
//     if (_fetching) {
//       return;
//     }
//
//     _fetching = true;
//
//     try {
//       final skip = offset ?? items?.length ?? 0;
//       ListItems result;
//       if (widget.adapter != null) {
//         result = await widget.adapter.getItems(skip, widget.pageSize);
//       }
//
//       if (mounted) {
//         setState(() {
//           reachedToEnd = result.reachedToEnd ?? false;
//           if (merge) {
//             items.addAll(result.items);
//           } else {
//             items = result.items.toList();
//           }
//         });
//       }
//     } finally {
//       _fetching = false;
//     }
//   }
//
//   Future fetchFromAdapter({int offset, bool merge = true}) async {
//     return widget.adapter.getItems(offset, widget.pageSize);
//   }
//
//   Future reload() async {
//     future = null;
//     await fetchData(merge: false);
//   }
//
//   Future refresh() async {
//     if (widget.onRefresh != null) {
//       return widget.onRefresh();
//     } else if (widget.adapter != null) {
//       return reload();
//     }
//   }
//
//   Future loadMore() async {
//     if (reachedToEnd || _loading) {
//       return;
//     }
//     if (widget.adapter == null && widget.onLoadMore == null) {
//       return;
//     }
//     if (_loadDebounce?.isActive ?? false) {
//       _loadDebounce.cancel();
//     }
//
//     _loadDebounce = Timer(widget.debounceDuration, () async {
//       _loading = true;
//
//       try {
//         if (widget.adapter != null) {
//           future = fetchData();
//         } else {
//           future = widget.onLoadMore();
//         }
//
//         setState(() {});
//
//         await future;
//       } on Exception catch (e, stack) {
//         if (mounted) {
//           setState(() {
//             _errorDetails = LoadErrorDetails(e, stackTrace: stack);
//           });
//         }
//       } finally {
//         _loading = false;
//       }
//     });
//   }
//
//   // ignore: missing_return
// //  bool handleScrollNotification(ScrollNotification notification) {
// //    if (_loading) return false;
// //    if (notification.depth > 0) return false;
// //    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
// ////      debugPrint('load more');
// //      loadMore();
// //    }
// //  }
//
//   int get itemCount {
//     return widget.children?.length ?? widget.itemCount ?? items.length;
//   }
//
//   Widget buildItem(BuildContext context, int index) {
//     var idx = index;
//
//     if (idx < itemCount) {
//       return widget.itemBuilder(
//         context,
//         idx,
//       );
//     }
//
//     if (widget.empty != null) {
//       if (idx == itemCount) {
//         if (itemCount == 0) {
//           return widget.empty;
//         } else {
//           return Container();
//         }
//       }
//       idx--;
//     }
//
//     if (widget.loadingBuilder != null || widget.errorBuilder != null) {
//       if (idx == itemCount) {
//         return Consumer<Future>(
//           builder: (context, future, _) {
//             return FutureBuilder(
//               future: future,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return widget.loadingBuilder(context);
//                 } else if (widget.errorBuilder != null) {
//                   return Consumer<LoadErrorDetails>(
//                     builder: (context, details, _) {
//                       if (details == null) {
//                         return Container();
//                       } else {
//                         return widget.errorBuilder(context, details, this);
//                       }
//                     },
//                   );
//                 } else {
//                   return Container();
//                 }
//               },
//             );
//           },
//         );
//       }
//       idx--;
//     }
//
//     throw Exception('Failed to render list item, the index is out of bounds.');
//   }
//
//   Widget buildList(BuildContext context) {
//     return GridView.builder(
//       controller: _scrollController,
//       padding: widget.padding,
//       physics: widget.physics,
//       scrollDirection: widget.scrollDirection,
//       shrinkWrap: widget.shrinkWrap,
//       itemCount: widget.itemCount,
//       itemBuilder: widget.itemBuilder,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: widget.crossAxisCount,
//         crossAxisSpacing: 14.0,
//         mainAxisSpacing: 14.0,
//         childAspectRatio: widget.aspectRatio,
//       ),
//     );
//
// //    if (widget.separatorBuilder == null) {
// //      return ListView.builder(
// //        controller: _scrollController,
// //        padding: widget.padding,
// //        physics: widget.physics,
// //        scrollDirection: widget.scrollDirection,
// //        shrinkWrap: widget.shrinkWrap,
// //        itemBuilder: buildItem,
// //        itemCount: count,
// //      );
// //    }
// //
// //    return ListView.separated(
// //      controller: _scrollController,
// //      padding: widget.padding,
// //      physics: widget.physics,
// //      scrollDirection: widget.scrollDirection,
// //      shrinkWrap: widget.shrinkWrap,
// //      itemBuilder: buildItem,
// //      separatorBuilder: widget.separatorBuilder,
// //      itemCount: count,
// //   );
//   }
//
//   @override
//   Widget build(BuildContext context) {
// //    final Widget notificationListener = NotificationListener<ScrollNotification>(
// //      onNotification: handleScrollNotification,
// //      child: buildList(context),
// //    );
//     final content = widget.disableRefresh
//         ? buildList(context)
//         : RefreshIndicator(
//             onRefresh: refresh,
//             child: buildList(context),
//           );
//
//     return Provider<Future>.value(
//       value: future,
//       child: Provider<LoadErrorDetails>.value(
//         value: _errorDetails,
//         child: content,
//       ),
//     );
//   }
// }
