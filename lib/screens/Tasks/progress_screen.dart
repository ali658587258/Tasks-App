import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../blocs/chart/chart_cubit.dart';


class ProgressScreen extends StatefulWidget {
  ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {

  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3EE094),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539)
  ];

  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ChartCubit,ChartState>(listener: (context,state){

    },
        builder: (context,state)
        {
          var cubit = ChartCubit.get(context);
          final Map<String,double> dataMap =
          {
            " Completed":cubit.completedCoutner,
            " New":cubit.newCoutner,
            " In_progress":cubit.inProgressCoutner,
            " OutOfDate":cubit.outOfDateCoutner
          };
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: PieChart(
                  dataMap: dataMap,
                  colorList: colorList,
                  chartRadius: MediaQuery.of(context).size.width / 2,
                  centerText: "Progress",
                  ringStrokeWidth: 24,
                  animationDuration: const Duration(seconds: 3),
                  chartValuesOptions: const ChartValuesOptions(
                      showChartValues: true,
                      showChartValuesOutside: true,
                      showChartValuesInPercentage: true,
                      showChartValueBackground: false),
                  legendOptions: const LegendOptions(
                      showLegends: true,
                      legendShape: BoxShape.rectangle,
                      legendTextStyle: TextStyle(fontSize: 16),
                      legendPosition: LegendPosition.bottom,
                    showLegendsInRow: true
                  ),
                  gradientList: gradientList,
                ),
              ),
            ),
          );
        }
        );
  }
}
