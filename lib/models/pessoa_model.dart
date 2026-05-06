abstract class Pessoa {
  String _nome;
  double _peso;
  double _altura;

  Pessoa({required String nome, required double peso, required double altura})
    : _nome = nome,
      _peso = peso,
      _altura = altura;

  String getNome() {
    return _nome;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  double getPeso() {
    return _peso;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double getAltura() {
    return _altura;
  }

  void setAltura(double altura) {
    _altura = altura;
  }
}
