import 'dart:io';

void main() {
  print('Bem Vindo ao Cálculo de IMC \n');
  print('Gostaria de realizar uma nova operação? Yes(y) / No(n): ');
  String opc = insereDado().toLowerCase();

  while (opc != 'n' && opc != 'no') {
    print(
        'Insira o seu peso e altura abaixo para saber como você esta na tabela!');

    print('Peso: ');
    String peso = insereDado();
    print('Altura: ');
    String altura = insereDado();

    validaImc(
      calculaImc(peso: double.parse(peso), altura: double.parse(altura)),
    );

    print('Gostaria de realizar uma nova operação? Yes(y) / No(n): ');
    opc = insereDado().toLowerCase();
  }
}

///Cálcula o IMC com base no peso e altura informados
double calculaImc({required double peso, required double altura}) {
  return (peso / (altura * altura)).roundToDouble();
}

///Retorna o dado inserido pelo usuário e no caso de ser informado um valor nulo a solicitação é refeita
String insereDado() {
  String? dado = stdin.readLineSync();

  if (dado != null && dado != '') {
    return dado;
  } else {
    print('Você precisa digitar um valor');
    return insereDado();
  }
}

/// Retorna a situação na tabela de acordo com o IMC enviado
void validaImc(double imc) {
  final bool isAbaixo = imc < 18.5;
  final bool isNormal = imc >= 18.5 && imc <= 24.9;
  final bool isExcesso = imc >= 25.0 && imc <= 29.9;
  final bool isObesidade1 = imc >= 30.0 && imc <= 34.9;
  final bool isObesidade2 = imc >= 35.0 && imc <= 39.9;

  if (isAbaixo) {
    print('===> Seu IMC($imc) esta abaixo do peso normal <===');
  } else if (isNormal) {
    print('===> Seu IMC($imc) esta no peso normal <===');
  } else if (isExcesso) {
    print('===> Seu IMC($imc) esta acima do peso <===');
  } else if (isObesidade1) {
    print('===> Seu IMC($imc) esta como obesidade grau I <===');
  } else if (isObesidade2) {
    print('===> Seu IMC($imc) esta como obesidade grau II <===');
  } else {
    print('===> Seu IMC($imc) esta como obesidade grau III <===');
  }
}
