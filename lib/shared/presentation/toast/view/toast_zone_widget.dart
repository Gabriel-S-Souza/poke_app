import 'package:flutter/material.dart';

import '../controller/toast_controller.dart';

class ToastZoneWidget extends StatelessWidget {
  final ToastBehavior behavior;
  final double toastMinHeight;
  final Widget? child;

  const ToastZoneWidget({
    super.key,
    this.behavior = ToastBehavior.pinnedDown,
    this.toastMinHeight = 50,
    this.child,
  });

  @override
  Widget build(BuildContext context) => Directionality(
        textDirection: TextDirection.ltr,
        child: Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => ToastHandlerWidget(
                behavior: behavior,
                toastHeight: toastMinHeight,
              ),
            ),
          ],
        ),
      );
}

// TODO: adjusts toast to the ToastData properties (dismissible, onDismiss, etc)
class ToastHandlerWidget extends StatefulWidget {
  final ToastBehavior behavior;
  final double toastHeight;
  final Widget? child;

  const ToastHandlerWidget({
    Key? key,
    required this.behavior,
    this.toastHeight = 50,
    this.child,
  }) : super(key: key);

  @override
  State<ToastHandlerWidget> createState() => _ToastHandlerWidget();
}

class _ToastHandlerWidget extends State<ToastHandlerWidget> with TickerProviderStateMixin {
  List<ToastData> toastQueue = [];
  bool isShowing = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    Toast.initialize();
    _listenToastStream();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void _listenToastStream() {
    Toast.instance.toastStream.stream.listen((ToastData toastData) {
      if (!toastQueue.any((data) => data.message == toastData.message)) {
        toastQueue.add(toastData);
        if (!isShowing) {
          _showNextToast();
        }
      }
    });
  }

  void _showNextToast() {
    if (toastQueue.isNotEmpty) {
      final toastData = toastQueue.removeAt(0);
      final behavior = toastData.behavior ?? widget.behavior;
      isShowing = true;

      final OverlayEntry toastEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
          bottom: behavior == ToastBehavior.pinnedDown
              ? MediaQuery.of(context).viewInsets.bottom
              : behavior == ToastBehavior.floating
                  ? MediaQuery.of(context).viewInsets.bottom + 50
                  : null,
          top: behavior == ToastBehavior.pinnedUp ? 50 : null,
          child: ToastWidget(
            toastData: toastData,
            animation: _animation,
            behavior: behavior,
          ),
        ),
      );

      Overlay.of(context).insert(toastEntry);

      _animationController.forward();

      final duration = Duration(milliseconds: (toastData.duration.inMilliseconds) - 500);

      Future.delayed(duration).then((_) async {
        _animationController.reverse();
        await Future.delayed(const Duration(milliseconds: 500));
        toastEntry.remove();
        isShowing = false;
        if (toastQueue.isNotEmpty) {
          await Future.delayed(const Duration(milliseconds: 500));
          _showNextToast();
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    Toast.dispose();
  }

  @override
  Widget build(BuildContext context) => const SizedBox();
}

class ToastWidget extends StatefulWidget {
  final ToastData toastData;
  final double toastMinHeight;
  final Animation<double> animation;
  final ToastBehavior behavior;

  const ToastWidget({
    Key? key,
    required this.toastData,
    required this.animation,
    this.toastMinHeight = 50,
    required this.behavior,
  }) : super(key: key);

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget> {
  bool _isShowing = false;
  double toastHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      toastHeight = renderBox.size.height;
      if (!_isShowing) {
        setState(() {
          _isShowing = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.behavior) {
      case ToastBehavior.pinnedDown:
      case ToastBehavior.pinnedUp:
        return Opacity(
          opacity: _isShowing ? 1 : 0,
          child: AnimatedBuilder(
            animation: widget.animation,
            builder: (context, child) {
              final Offset offset;
              final double opacity;
              if (widget.behavior == ToastBehavior.pinnedDown) {
                offset = Offset(0, toastHeight * (1 - widget.animation.value));
                opacity = 1.0;
              } else if (widget.behavior == ToastBehavior.pinnedUp) {
                offset = Offset(0, -toastHeight);
                opacity = 1.0;
              } else {
                offset = Offset.zero;
                opacity = widget.animation.value;
              }
              return Opacity(
                opacity: opacity,
                child: Transform.translate(
                  offset: offset,
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: widget.toastMinHeight,
                      ),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      color:
                          widget.toastData.backgroundColor?.withOpacity(widget.toastData.opacity) ??
                              Colors.black.withOpacity(widget.toastData.opacity),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.toastData.message,
                              style: TextStyle(
                                color: widget.toastData.textColor ?? Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          if (widget.toastData.dismissible)
                            IconButton(
                              onPressed: () {
                                widget.toastData.onDismiss?.call();
                              },
                              icon: Icon(
                                Icons.close,
                                color: widget.toastData.closeButtonColor ?? Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      case ToastBehavior.floating:
        return Opacity(
          opacity: _isShowing ? 1 : 0,
          child: AnimatedBuilder(
            animation: widget.animation,
            builder: (context, child) {
              final Offset offset;
              final double opacity;
              if (widget.behavior == ToastBehavior.pinnedDown) {
                offset = Offset(0, toastHeight * (1 - widget.animation.value));
                opacity = 1.0;
              } else if (widget.behavior == ToastBehavior.pinnedUp) {
                offset = Offset(0, -toastHeight);
                opacity = 1.0;
              } else {
                offset = Offset.zero;
                opacity = widget.animation.value;
              }
              return Opacity(
                opacity: opacity,
                child: Transform.translate(
                  offset: offset,
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              minHeight: widget.toastMinHeight,
                            ),
                            alignment: Alignment.center,
                            color: widget.toastData.backgroundColor
                                    ?.withOpacity(widget.toastData.opacity) ??
                                Colors.black.withOpacity(widget.toastData.opacity),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              'widget.toastData.message',
                              style: TextStyle(
                                color: widget.toastData.textColor ?? Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );

      default:
        return Container();
    }
  }
}
