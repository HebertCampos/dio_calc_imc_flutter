import '../models/imc_model.dart';

class ImcRepository {
  final List<IMC> _imcList = [];

  Future<void> adicionarIMC(IMC imc) async{
    await Future.delayed(Duration(microseconds: 200));
    _imcList.add(imc);
  }

  Future<List<IMC>> listarIMCs() async{
    await Future.delayed(Duration(microseconds: 200));
    return _imcList;
  }
}