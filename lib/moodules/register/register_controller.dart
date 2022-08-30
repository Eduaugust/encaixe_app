import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class RegisterController {
  final key = GlobalKey<FormState>();
  String date = DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateNumber(String? value) {
    if (value == null || value.isEmpty || value.length != 17)
      return 'Copie o cole o número do whatsapp';
    else
      return null;
  }

  String? validateService(String? value) =>
      value?.isEmpty ?? true ? "Insira um serviço" : null;

  Future<dynamic> postRegister(data) async {
    try {
      var response = await Dio()
          .post('https://encaixe-back.herokuapp.com/clients/', data: data);
      return response;
    } catch (e) {
      return "Erro ao conectar ao servidor";
    }
  }

  Future<void> saveRegister(model) async {
    if (key.currentState!.validate()) {
      model = model.copyWith(userId: 1);
      var json = model.toJson();
      print(await postRegister(json));
    }
  }

  dynamic onChanged(
    model, {
    String? name,
    String? service,
    String? number,
    bool? morning,
    bool? afternoon,
    String? start,
    String? end,
    bool? tuesday,
    bool? wednesday,
    bool? thursday,
    bool? friday,
    bool? saturday,
  }) {
    model = model.copyWith(
        name: name,
        service: service,
        number: number,
        morning: morning,
        afternoon: afternoon,
        start: start,
        end: end,
        tuesday: tuesday,
        wednesday: wednesday,
        thursday: thursday,
        friday: friday,
        saturday: saturday);
    return model;
  }
}
