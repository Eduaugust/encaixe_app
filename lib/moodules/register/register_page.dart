import 'package:encaixe_app/moodules/register/register_controller.dart';
import 'package:encaixe_app/shared/themes/app_colors.dart';
import 'package:encaixe_app/shared/themes/app_text_style.dart';
import 'package:encaixe_app/shared/themes/background_decoration.dart';
import 'package:encaixe_app/shared/widgets/checkbox.dart';
import 'package:encaixe_app/shared/widgets/input_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import '../../shared/models/client_model.dart';
import '../../shared/widgets/footer.dart';
import '../../shared/widgets/header.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isStartOpen = false;
  bool isEndOpen = false;
  String start = DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString();
  String end = DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString();

  void closeDate() {
    setState(() {
      isStartOpen = false;
      isEndOpen = false;
    });
  }

  void endOpen() {
    setState(() {
      isEndOpen = true;
    });
  }

  void startOpen() {
    setState(() {
      isStartOpen = true;
    });
  }

  void onSelectionChangeDate(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {
        if (isStartOpen) {
          start = DateFormat('dd/MM/yyyy').format(args.value).toString();
          model = controller.onChanged(model, start: start);
        } else {
          end = DateFormat('dd/MM/yyyy').format(args.value).toString();
          model = controller.onChanged(model, end: end);
        }
      });
      closeDate();
    });
  }

  final DateRangePickerController controllerDate = DateRangePickerController();

  RegisterController controller = RegisterController();
  var TextNumberController = MaskedTextController(mask: '+00 00 00000-0000');
  ClientModel model = ClientModel(
      morning: false,
      afternoon: false,
      tuesday: false,
      wednesday: false,
      thursday: false,
      friday: false,
      saturday: false,
      start: DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
      end: DateFormat('dd/MM/yyyy').format(DateTime.now()).toString());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BackgroundDecoration.main,
          child: Stack(
            children: [
              // Tela normal
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Header(title: "Novo Registro"),
                    const Spacer(),
                    Form(
                        key: controller.key,
                        child: Container(
                          constraints: BoxConstraints(
                              maxWidth: 600, maxHeight: size.height * 0.7),
                          child: Column(
                            children: [
                              const Spacer(),
                              // Número
                              InputRegister(
                                controller: TextNumberController,
                                validator: controller.validateNumber,
                                label: 'Número',
                                onChanged: (value) {
                                  model = controller.onChanged(model,
                                      number: value);
                                },
                              ),
                              // Nome e serviço
                              Expanded(
                                child: Row(
                                  children: [
                                    InputRegister(
                                      validator: controller.validateName,
                                      label: 'Nome',
                                      onChanged: (value) {
                                        model = controller.onChanged(model,
                                            name: value);
                                      },
                                    ),
                                    // Serviços
                                    InputRegister(
                                      validator: controller.validateService,
                                      label: 'Serviço',
                                      onChanged: (value) {
                                        model = controller.onChanged(model,
                                            service: value);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              // Data inicial e final
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: startOpen,
                                      child: const Text('Data inicial')),
                                  ElevatedButton(
                                      onPressed: endOpen,
                                      child: const Text('Data Final')),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Periodo
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Período: ',
                                      style: AppTextStyle.inputHeader),
                                  CustomCheckbox(
                                      title: 'Manhã',
                                      onChanged: (value) {
                                        setState(() {
                                          model = controller.onChanged(model,
                                              morning: value);
                                        });
                                      },
                                      value: model.morning!),
                                  CustomCheckbox(
                                      title: 'Tarde',
                                      onChanged: (value) {
                                        setState(() {
                                          model = controller.onChanged(model,
                                              afternoon: value);
                                        });
                                      },
                                      value: model.afternoon!),
                                ],
                              ),
                              // Dias da semana terça-quinta
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Dias da\nsemana: ',
                                      style: AppTextStyle.inputHeader),
                                  CustomCheckbox(
                                      title: 'Terça',
                                      onChanged: (value) {
                                        setState(() {
                                          model = controller.onChanged(model,
                                              tuesday: value);
                                        });
                                      },
                                      value: model.tuesday!),
                                  CustomCheckbox(
                                      title: 'Quarta',
                                      onChanged: (value) {
                                        setState(() {
                                          model = controller.onChanged(model,
                                              wednesday: value);
                                        });
                                      },
                                      value: model.wednesday!),
                                  CustomCheckbox(
                                      title: 'Quinta',
                                      onChanged: (value) {
                                        setState(() {
                                          model = controller.onChanged(model,
                                              thursday: value);
                                        });
                                      },
                                      value: model.thursday!),
                                ],
                              ),
                              // Dias da semana sexta-sab.
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  const Spacer(),
                                  CustomCheckbox(
                                      title: 'Sexta',
                                      onChanged: (value) {
                                        setState(() {
                                          model = controller.onChanged(model,
                                              friday: value);
                                        });
                                      },
                                      value: model.friday!),
                                  CustomCheckbox(
                                      title: 'Sab.',
                                      onChanged: (value) {
                                        setState(() {
                                          model = controller.onChanged(model,
                                              saturday: value);
                                        });
                                      },
                                      value: model.saturday!),
                                  const Spacer(),
                                ],
                              ),

                              // Botoes de enviar e limpar
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    onPressed: () {
                                      controller.saveRegister(model);
                                      Navigator.popAndPushNamed(
                                          context, '/register');
                                    },
                                    child: const Text('Enviar'),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        primary: AppColors.black),
                                    onPressed: () {
                                      Navigator.popAndPushNamed(
                                          context, '/register');
                                    },
                                    child: const Text('Limpar'),
                                  ),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                        )),
                    const Spacer(),
                  ],
                ),
              ),

              // Tela preta opacity
              Positioned(
                child: InkWell(
                    onTap: () {
                      closeDate();
                    },
                    child: Visibility(
                      visible: isStartOpen || isEndOpen,
                      child: Opacity(
                        opacity: 0.6,
                        child: Container(color: AppColors.black),
                      ),
                    )),
              ),

              // Tela date picker
              Positioned(
                child: Visibility(
                  visible: isStartOpen || isEndOpen,
                  child: Center(
                    child: Container(
                      constraints:
                          const BoxConstraints(maxWidth: 300, maxHeight: 300),
                      height: size.width * 0.9,
                      width: size.width * 0.9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: SfDateRangePicker(
                          controller: controllerDate,
                          onSelectionChanged: onSelectionChangeDate,
                          backgroundColor: AppColors.white,
                          toggleDaySelection: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
