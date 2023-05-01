import 'package:fboe_app_writer/components/category_drop_button.dart';
import 'package:fboe_app_writer/components/category_form.dart';
import 'package:fboe_app_writer/provider/category_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellCategoryBool extends StatelessWidget {
  SellCategoryBool({Key? key}) : super(key: key);

  FormProvider? _formProvider;

  @override
  Widget build(BuildContext context) {
    _formProvider = Provider.of<FormProvider>(context, listen: true);
    return Scaffold(
      body: Column(
        children: [
          CategoryDropButton(),
          Consumer<FormProvider>(
            builder: (context, form, child){
              return form.isAnalog ? AnalogForm() : DigitalForm();
            },
          ),
        ],
      ),
    );
  }
}
