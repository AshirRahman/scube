import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube/core/common/styles/global_text_style.dart';
import 'package:scube/core/utils/constants/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MetricCircle extends StatelessWidget {
  final RxDouble value;
  final RxString unit;
  final double maxValue;

  const MetricCircle({
    super.key,
    required this.value,
    required this.unit,
    this.maxValue = 90,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Always use a fixed gauge fill level (about 60% of maxValue)
      final gaugeValue = maxValue * 0.6;

      return SizedBox(
        height: 200,
        width: 200,
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              startAngle: 130,
              endAngle: 50,
              minimum: 0,
              maximum: maxValue,
              radiusFactor: 0.8,
              showLabels: false,
              showTicks: false,
              axisLineStyle: const AxisLineStyle(
                thickness: 15,
                color: Color(0xFFE8F1FF),
                cornerStyle: CornerStyle.bothCurve,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: gaugeValue,
                  width: 15,
                  color: AppColors.primary,
                  cornerStyle: CornerStyle.bothCurve,
                  enableAnimation: true,
                  animationDuration: 1500,
                  animationType: AnimationType.ease,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  angle: 270,
                  positionFactor: 0.1,
                  widget: SizedBox(
                    width: 110,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            value.value.toStringAsFixed(2),
                            style: getTextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          unit.value,
                          style: getTextStyle(
                            fontSize: 13,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
