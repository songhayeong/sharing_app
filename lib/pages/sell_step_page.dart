import 'package:fboe_app_writer/components/sell_category_bool.dart';
import 'package:fboe_app_writer/provider/step_manager_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/sell_step_widget.dart';

class SellStepPage extends StatelessWidget {
  SellStepPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String? _selectedItem; //선택한 항목을 저장할 변수
  StepManagerProvider? _stepManager;

  @override
  Widget build(BuildContext context) {
    _stepManager = Provider.of<StepManagerProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("단계별"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _stepManager!.currentStep == 0 ? const Text("1단계") : const Text("2단계"),
              Form(
                key: _formKey,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _stepManager!.currentStep == 0
                      ? const FirstStepWidget()
                      : const SecondStepWidget(),
                ),
              ),
              _stepManager!.currentStep != 0
                  ? SizedBox(
                      width: 200,
                      height: 200,
                      child: SellCategoryBool(),
                    )
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_stepManager!.currentStep != 0)
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _stepManager!.currentStep -= 1;
                          },
                          child: const Text('이전'),
                        ),
                        const SizedBox(
                          width: 270,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // 서버에 세부항목들 전송 메서드
                          },
                          child: const Text("제출"),
                        ),
                      ],
                    ),
                  if (_stepManager!.currentStep != 1)
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _stepManager!.currentStep += 1;
                        }
                      },
                      child: const Text("디음"),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
