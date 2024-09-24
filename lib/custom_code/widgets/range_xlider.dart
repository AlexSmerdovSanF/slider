// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import '/custom_code/actions/index.dart'; // Imports custom actions

import 'package:flutter_xlider/flutter_xlider.dart';

class RangeXlider extends StatefulWidget {
  final double width;
  final double height;
  final double max;
  final double min;
  final bool rangeSlider;
  final double step;
  final List<dynamic>? ignoreSteps;
  final List<dynamic>? fixedValues;
  final Color? activeTrackBarColor;
  final Color? inactiveTrackBarColor;
  final double? trackBarHeight;
  final Color? handlerColor;
  final double? handlerSize;
  final bool? alwaysShowTooltip;
  final Color? tooltipColor;
  final Color? tooltipBackground;
  final double? tooltipFontSize;
  final double? tooltipOffset;
  final bool? tooltipDisabled;
  final bool? tooltipDisabledAnimation;
  final Future Function(
      int handlerIndex, dynamic lowerValue, dynamic upperValue)? onDragStarted;
  final Future Function(
          int handlerIndex, dynamic lowerValue, dynamic upperValue)?
      onDragCompleted;
  final Future Function(
      int handlerIndex, dynamic lowerValue, dynamic upperValue)? onDragging;
  final bool? disabled;
  final bool? rtl;
  final bool? jump;
  final bool? selectByTap;
  final double? minimumDistance;
  final double? maximumDistance;
  final bool? lockHandlers;
  final double? lockDistance;
  final List<dynamic>? hatchMark;
  final bool? centeredOrigin;
  final bool? isVisibleTouchArea;
  final double? touchAreaSize;
  final bool? isVertical;
  final Color? outlineColor; // New parameter for outline color
  final double? outlineWidth; // New parameter for outline width

  const RangeXlider({
    Key? key,
    required this.width,
    required this.height,
    required this.max,
    required this.min,
    this.rangeSlider = true,
    this.step = 1,
    this.ignoreSteps,
    this.fixedValues,
    this.activeTrackBarColor,
    this.inactiveTrackBarColor,
    this.trackBarHeight,
    this.handlerColor,
    this.handlerSize,
    this.alwaysShowTooltip,
    this.tooltipColor,
    this.tooltipBackground,
    this.tooltipFontSize,
    this.tooltipOffset,
    this.tooltipDisabled,
    this.tooltipDisabledAnimation,
    this.onDragStarted,
    this.onDragCompleted,
    this.onDragging,
    this.disabled,
    this.rtl,
    this.jump,
    this.selectByTap,
    this.minimumDistance,
    this.maximumDistance,
    this.lockHandlers,
    this.lockDistance,
    this.hatchMark,
    this.centeredOrigin,
    this.isVisibleTouchArea,
    this.touchAreaSize,
    this.isVertical,
    this.outlineColor, // New parameter
    this.outlineWidth, // New parameter
  }) : super(key: key);

  @override
  _RangeXliderState createState() => _RangeXliderState();
}

class _RangeXliderState extends State<RangeXlider> {
  late List<double> _values;

  @override
  void initState() {
    super.initState();
    _initializeValues();
  }

  @override
  void didUpdateWidget(RangeXlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rangeSlider != widget.rangeSlider) {
      _initializeValues();
    }
  }

  void _initializeValues() {
    if (widget.rangeSlider) {
      _values = [widget.min, widget.max];
    } else {
      _values = [(widget.max + widget.min) / 2];
    }
  }

  List<FlutterSliderIgnoreSteps> _buildIgnoreSteps() {
    return widget.ignoreSteps
            ?.map((step) => FlutterSliderIgnoreSteps(
                  from: step['from'] ?? 0,
                  to: step['to'] ?? 0,
                ))
            .toList() ??
        [];
  }

  List<FlutterSliderFixedValue>? _buildFixedValues() {
    if (widget.fixedValues != null && widget.fixedValues!.isNotEmpty) {
      return widget.fixedValues
              ?.map((value) => FlutterSliderFixedValue(
                    percent: value['percent'] ?? 0,
                    value: value['value']?.toString() ?? '',
                  ))
              .toList() ??
          [];
    }
    return null;
  }

  FlutterSliderHatchMark? _buildHatchMark() {
    if (widget.hatchMark == null) return null;
    return FlutterSliderHatchMark(
      density: 1,
      labels: widget.hatchMark
              ?.map((mark) => FlutterSliderHatchMarkLabel(
                    percent: mark['percent'] ?? 0,
                    label: Text(mark['label']?.toString() ?? ''),
                  ))
              .toList() ??
          [],
    );
  }

  double _processValue(dynamic dynamicValue) {
    print("Processing value: $dynamicValue");
    if (widget.fixedValues != null && widget.fixedValues!.isNotEmpty) {
      var matchingFixedValue = widget.fixedValues!.firstWhere(
        (fixedValue) =>
            fixedValue['value'].toString() == dynamicValue.toString(),
      );
      print("Matched fixed value: $matchingFixedValue");
      return matchingFixedValue['percent'].toDouble();
    } else {
      print("NOT fixed value");
      return dynamicValue is num ? dynamicValue.toDouble() : 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: FlutterSlider(
        values: _values,
        rangeSlider: widget.rangeSlider,
        max: widget.max,
        min: widget.min,
        step: FlutterSliderStep(step: widget.step),
        jump: widget.jump ?? false,
        trackBar: FlutterSliderTrackBar(
          activeTrackBarHeight: widget.trackBarHeight ?? 5,
          inactiveTrackBarHeight: widget.trackBarHeight ?? 5,
          activeTrackBar: BoxDecoration(
            color: widget.activeTrackBarColor ?? Colors.blue,
            border: Border.all(
              color: widget.outlineColor ?? Colors.transparent,
              width: widget.outlineWidth ?? 0,
            ),
          ),
          inactiveTrackBar: BoxDecoration(
            color: widget.inactiveTrackBarColor ?? Colors.grey[300],
            border: Border.all(
              color: widget.outlineColor ?? Colors.transparent,
              width: widget.outlineWidth ?? 0,
            ),
          ),
        ),
        tooltip: FlutterSliderTooltip(
          disabled: widget.tooltipDisabled ?? false,
          disableAnimation: widget.tooltipDisabledAnimation ?? false,
          alwaysShowTooltip: widget.alwaysShowTooltip ?? false,
          textStyle: TextStyle(
            fontSize: widget.tooltipFontSize ?? 14,
            color: widget.tooltipColor ?? Colors.white,
          ),
          boxStyle: FlutterSliderTooltipBox(
            decoration: BoxDecoration(
              color:
                  widget.tooltipBackground?.withOpacity(0.8) ?? Colors.black87,
            ),
          ),
          positionOffset: FlutterSliderTooltipPositionOffset(
            top: widget.isVertical ?? false ? 0 : widget.tooltipOffset ?? 0,
            right: widget.isVertical ?? false ? widget.tooltipOffset ?? 0 : 0,
          ),
          direction: widget.isVertical ?? false
              ? FlutterSliderTooltipDirection.right
              : FlutterSliderTooltipDirection.top,
        ),
        handler: FlutterSliderHandler(
          decoration: BoxDecoration(
            color: widget.handlerColor ?? Colors.black,
            shape: BoxShape.circle,
          ),
          child: Container(),
        ),
        rightHandler: widget.rangeSlider
            ? FlutterSliderHandler(
                decoration: BoxDecoration(
                  color: widget.handlerColor ?? Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Container(),
              )
            : null,
        handlerHeight: widget.handlerSize ?? 20,
        handlerWidth: widget.handlerSize ?? 20,
        disabled: widget.disabled ?? false,
        rtl: widget.rtl ?? false,
        hatchMark: _buildHatchMark(),
        ignoreSteps: _buildIgnoreSteps(),
        fixedValues: widget.fixedValues != null ? _buildFixedValues() : null,
        selectByTap: widget.selectByTap ?? true,
        minimumDistance: widget.minimumDistance ?? 0,
        maximumDistance: widget.maximumDistance ?? 0,
        lockHandlers: widget.lockHandlers ?? false,
        lockDistance: widget.lockDistance ?? 0,
        centeredOrigin: widget.centeredOrigin ?? false,
        visibleTouchArea: widget.isVisibleTouchArea ?? false,
        touchSize: widget.touchAreaSize ?? 50,
        axis: widget.isVertical ?? false ? Axis.vertical : Axis.horizontal,
        onDragStarted: (handlerIndex, lowerValue, upperValue) async {
          if (widget.onDragStarted != null) {
            await widget.onDragStarted!(handlerIndex, lowerValue, upperValue);
          }
        },
        onDragCompleted: (handlerIndex, lowerValue, upperValue) async {
          if (widget.onDragCompleted != null) {
            await widget.onDragCompleted!(handlerIndex, lowerValue, upperValue);
          }
        },
        onDragging: (handlerIndex, lowerValue, upperValue) async {
          setState(() {
            if (widget.rangeSlider) {
              _values[0] = _processValue(lowerValue);
              _values[1] = _processValue(upperValue);
            } else {
              _values[0] = _processValue(lowerValue);
            }
          });
          if (widget.onDragging != null) {
            await widget.onDragging!(handlerIndex, lowerValue, upperValue);
          }
        },
        handlerAnimation: FlutterSliderHandlerAnimation(
          curve: Curves.elasticOut,
          reverseCurve: Curves.bounceIn,
          duration: Duration(milliseconds: 500),
          scale: 1.0,
        ),
      ),
    );
  }
}
