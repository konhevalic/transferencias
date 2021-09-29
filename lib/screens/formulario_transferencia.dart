import 'package:flutter/material.dart';
import 'package:hello_wolrd/components/editor.dart';
import 'package:hello_wolrd/models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dados da Transferência'),),
      body: Column(
        children: [
          Editor(_controladorCampoNumeroConta,'Número da conta', '0000', null),
          Editor( _controladorCampoValor, 'Valor', '100.00', Icons.monetization_on),
          ElevatedButton(
            child: const Text('Confirmar'),
            onPressed: () => _criaTransferencia(context), 
          ),
        ],
      ),
    );
  }
  void _criaTransferencia(BuildContext context) {
        final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
        final double? valor = double.tryParse(_controladorCampoValor.text);
        if(numeroConta != null && valor != null) {
          final transferenciaCriada = Transferencia(valor, numeroConta);
          debugPrint('criando a transferencia');
          debugPrint('$transferenciaCriada');
          Navigator.pop(context, transferenciaCriada);
        }
      }
}