import 'package:flutter/widgets.dart';

class LoadErrorDetails {
  final Object error;
  final StackTrace stackTrace;

  LoadErrorDetails(this.error, {required this.stackTrace});
}

typedef GridItemBuilder = Widget Function(
  BuildContext context,
  int index,
);

typedef ListItemBuilder = Widget Function(
  BuildContext context,
  int index,
  dynamic item,
);
typedef ListSeparatorBuilder = Widget Function(
  BuildContext context,
  int index,
);
typedef LoadErrorBuilder = Widget Function(
  BuildContext context,
  LoadErrorDetails errorDetails,
  // PaginatedListViewState listViewState,
);

typedef LoadGridErrorBuilder = Widget Function(
  BuildContext context,
  LoadErrorDetails errorDetails,
  // PaginatedGridViewState gridViewState,
);
