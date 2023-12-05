import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double height;

  const CustomButton({super.key, this.height = 100});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final _buttonKey = GlobalKey();
  double _buttonWidth = 0.0;
  bool _expanded = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _buttonWidth = (_buttonKey.currentContext?.size?.width ?? 0.0) + 14;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movement = widget.height / 4;
    return TweenAnimationBuilder(
      tween: _expanded ? Tween(begin: 0.0, end: 1.0) : Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) => SizedBox(
        height: widget.height,
        child: Column(
          children: [
            Transform.translate(offset: Offset(0.0, movement * value), child: _upperWidget()),
            Transform.translate(offset: Offset(0.0, -movement * value), child: _bottomWidget()),
          ],
        ),
      ),
    );
  }

  Widget _upperWidget() {
    return Container(
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        height: widget.height / 2,
        child: Row(
          key: _buttonKey,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.facebook_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.g_mobiledata_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.apple_rounded)),
          ],
        ));
  }

  Widget _bottomWidget() {
    return Material(
        elevation: 5,
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
              height: widget.height / 2,
              width: _buttonWidth,
              child: const Center(
                child: Text(
                  'SHARE',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              )),
        ));
  }
}
