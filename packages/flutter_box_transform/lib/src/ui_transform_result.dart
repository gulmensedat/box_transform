import 'dart:ui' as ui;

import 'package:box_transform/box_transform.dart' as transform;

/// An abstract class that represents the result of a transform operation.
abstract class UIBoxTransformResult {
  /// The new [Rect] of the node after the move.
  final ui.Rect newRect;

  /// The old [Rect] of the node before the move.
  final ui.Rect oldRect;

  /// The delta used to move the node.
  final ui.Offset delta;

  /// Creates a [UIMoveResult] object.
  UIBoxTransformResult({
    required this.newRect,
    required this.oldRect,
    required this.delta,
  });

  @override
  bool operator ==(Object other) =>
      other is UIMoveResult &&
      other.newRect == newRect &&
      other.oldRect == oldRect &&
      other.delta == delta;

  @override
  int get hashCode => newRect.hashCode ^ oldRect.hashCode ^ delta.hashCode;

  @override
  String toString() =>
      'UIMoveResult(newRect: $newRect, oldRect: $oldRect, delta: $delta)';
}

/// A Flutter translation of a [transform.MoveResult].
/// Helps disambiguate between [UIMoveResult] and [UIResizeResult].
class UIMoveResult extends UIBoxTransformResult {
  /// Creates a [UIMoveResult] object.
  UIMoveResult({
    required super.newRect,
    required super.oldRect,
    required super.delta,
  });
}

/// A Flutter translation of a [transform.ResizeResult].
class UIResizeResult extends UIBoxTransformResult {
  /// The [Flip] of the node after the resize.
  final transform.Flip flip;

  /// The [ResizeMode] of the node after the resize.
  final transform.ResizeMode resizeMode;

  /// The new size of the node after the resize.
  final ui.Size newSize;

  /// Whether the resizing box hit its maximum possible width.
  final bool minWidthReached;

  /// Whether the resizing box hit its minimum possible width.
  final bool maxWidthReached;

  /// Whether the resizing box hit its maximum possible height.
  final bool minHeightReached;

  /// Whether the resizing box hit its minimum possible height.
  final bool maxHeightReached;

  /// Creates a [UIResizeResult] object.
  UIResizeResult({
    required super.newRect,
    required super.oldRect,
    required super.delta,
    required this.flip,
    required this.resizeMode,
    required this.newSize,
    required this.minWidthReached,
    required this.maxWidthReached,
    required this.minHeightReached,
    required this.maxHeightReached,
  });

  @override
  bool operator ==(Object other) =>
      other is UIResizeResult &&
      other.newRect == newRect &&
      other.oldRect == oldRect &&
      other.flip == flip &&
      other.resizeMode == resizeMode &&
      other.delta == delta &&
      other.delta == newSize;

  @override
  int get hashCode =>
      Object.hash(newRect, oldRect, flip, resizeMode, delta, newSize);

  @override
  String toString() {
    return 'FlutterResizeResult(newRect: $newRect, oldRect: $oldRect, flip: $flip, resizeMode: $resizeMode, delta: $delta, newSize: $newSize)';
  }
}
