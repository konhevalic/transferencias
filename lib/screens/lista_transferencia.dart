import 'package:flutter/material.dart';
import 'package:hello_wolrd/models/transferencia.dart';

import 'formulario_transferencia.dart';

class ListaTransferencias extends StatefulWidget {

  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Transferências')
        ),
      body: ListView.builder (
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final Future<Transferencia?> future = Navigator.push(context, MaterialPageRoute(builder: (context) { 
              return FormularioTransferencia();
            }));
            future.then((transferenciaRecebida) {
              debugPrint('then do future');
              debugPrint('$transferenciaRecebida');
              if(transferenciaRecebida != null) {
                setState(() {
                  widget._transferencias.add(transferenciaRecebida);
                });
              }
            });
          },
          child: Icon(Icons.add)
        ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);
  
  @override
  Widget build(BuildContext context) {
    return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(_transferencia.valor.toString()),
              subtitle: Text(_transferencia.numeroConta.toString()),
              )
            );
  }
}