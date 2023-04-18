import 'package:flutter/material.dart';
import 'package:flutter_ui/application/loading/circle_hole_loading.dart';
import 'package:flutter_ui/application/loading/diameter_run.dart';
import 'package:flutter_ui/application/loading/halo_round.dart';
import 'package:flutter_ui/application/loading/simple_loading.dart';
import 'package:flutter_ui/application/loading/simple_round_motion.dart';

class RunLoadingPage extends StatefulWidget {
  const RunLoadingPage({Key? key}) : super(key: key);

  @override
  State<RunLoadingPage> createState() => _RunLoadingPageState();
}

class _RunLoadingPageState extends State<RunLoadingPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: SimpleRoundMotion(),
          ),
          SizedBox(
            height: 140,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Container(
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height - 200,
                                width: MediaQuery.of(context).size.width - 50,
                                child: const SimpleLoading(),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('シンプル Loading'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Container(
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height - 200,
                                width: MediaQuery.of(context).size.width - 50,
                                child: const HaloRound(),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('光輪（ハロー）'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Container(
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height - 200,
                                width: MediaQuery.of(context).size.width - 50,
                                child: const CircleHoleLoading(),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('Loading完成'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Container(
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height - 200,
                                width: MediaQuery.of(context).size.width - 50,
                                child: const DiameterRun(),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('球体の単振動直径運動'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
