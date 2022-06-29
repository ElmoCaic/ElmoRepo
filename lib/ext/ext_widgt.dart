import 'package:flutter/material.dart';

extension ExtWidget on Widget {
  Widget radius(double radius) {
    return ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
  }
}

extension ExtList<T> on List<T> {
  Widget toListView({
    required Widget Function(BuildContext context, int index, T element) builder,
    double separatorSize = 0,
    Axis axis = Axis.vertical,
    Alignment alignment = Alignment.center,
    ScrollController? controller,
    EdgeInsets? padding,
    bool? shrinkWrap,
    ScrollPhysics? physics,
  }) {
    return ListView.separated(
      physics: physics??const BouncingScrollPhysics(),
      padding: padding ?? EdgeInsets.zero,
      shrinkWrap: shrinkWrap ?? false,
      controller: controller,
      scrollDirection: axis,
      itemBuilder: (context, index) {
        return Align(
          alignment: alignment,
          child: builder(context, index, this[index]),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: axis == Axis.horizontal ? separatorSize : 0,
          height: axis == Axis.vertical ? separatorSize : 0,
        );
      },
      itemCount: length,
    );
  }
}
