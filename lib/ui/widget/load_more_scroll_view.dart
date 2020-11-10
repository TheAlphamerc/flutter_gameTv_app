library lazy_load_scrollview;

import 'package:flutter/widgets.dart';

enum LoadingStatus { LOADING, STABLE }

typedef void EndOfPageListenerCallback();

class LoadMoreScrollView extends StatefulWidget {
  final Widget child;
  final EndOfPageListenerCallback onEndOfPage;
  final int scrollOffset;
  final bool isLoading;

  @override
  State<StatefulWidget> createState() => LoadMoreScrollViewState();

  LoadMoreScrollView({
    Key key,
    @required this.child,
    @required this.onEndOfPage,
    this.isLoading = false,
    this.scrollOffset = 100,
  })  : assert(onEndOfPage != null),
        assert(child != null),
        super(key: key);
}

class LoadMoreScrollViewState extends State<LoadMoreScrollView> {
  LoadingStatus loadMoreStatus = LoadingStatus.STABLE;

  @override
  void didUpdateWidget(LoadMoreScrollView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isLoading) {
      loadMoreStatus = LoadingStatus.STABLE;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: widget.child,
      onNotification: (notification) => _onNotification(notification, context),
    );
  }

  bool _onNotification(Notification notification, BuildContext context) {
    if (notification is ScrollUpdateNotification) {
      if (notification.metrics.maxScrollExtent > notification.metrics.pixels &&
          notification.metrics.maxScrollExtent - notification.metrics.pixels <=
              widget.scrollOffset) {
        if (loadMoreStatus != null && loadMoreStatus == LoadingStatus.STABLE) {
          loadMoreStatus = LoadingStatus.LOADING;
          widget.onEndOfPage();
        }
      }
      return true;
    }
    if (notification is OverscrollNotification) {
      if (notification.overscroll > 0) {
        if (loadMoreStatus != null && loadMoreStatus == LoadingStatus.STABLE) {
          loadMoreStatus = LoadingStatus.LOADING;
          widget.onEndOfPage();
        }
      }
      return true;
    }
    return false;
  }
}
