import 'pessoa_model.dart';

class IMC extends Pessoa {
  // Construtor que repassa os parâmetros para a classe pai (Pessoa)
  IMC({
    required super.nome,
    required super.peso,
    required super.altura,
  });

  double calculoIMC() {
    return getPeso() / ((getAltura()/100) * (getAltura()/100));
  }

  String classificacaoIMC({double? valorIMC}) {
    if (valorIMC == null) {
      return 'Informe o valor do IMC';
    } else if (valorIMC < 16){
      return 'Magreza grave';
    } else if (valorIMC < 17){
      return 'Magreza moderada';
    } else if (valorIMC < 18.5) {
      return 'Magreza leve';
    } else if (valorIMC < 25) {
      return 'Saudável';
    } else if (valorIMC < 30) {
      return 'Sobrepeso';
    } else if (valorIMC < 35) {
      return 'Obesidade grau I';
    } else if (valorIMC < 40) {
      return 'Obesidade grau II (Severa)';
    } else {
      return 'Obesidade grau III (Mórbida)';
    }
  }
}