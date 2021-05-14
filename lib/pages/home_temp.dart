import "package:flutter/material.dart";
import "package:flutter_application_widgets/pages/utils/icon_string_util.dart";
import "package:flutter_application_widgets/pages/providers/menu_provider.dart";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(context),
    );
  }
  
  /*List<Widget> _crearItems(BuildContext context,){
    List<Widget> lista = new List<Widget>();
    for(String opt in opciones){
      final tempWidget = ListTile(
        title: Text(opt),
        subtitle: Text('Subtitulo '+ opt),
        leading: Icon(Icons.account_box),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageTempDos(opt),
          ));
        }, 
      );
      lista..add(tempWidget)..add(Divider());
      //lista.add(tempWidget);
      //lista.add(Divider());
    }
    return lista;
  }*/

  Widget _list(BuildContext context){
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(
          children: _listI(snapshot.data, context),
        );
      }
    );
  }

  List<Widget> _listI(List<dynamic> data, BuildContext context){
    final List<Widget> opciones = [];
    data.forEach((otp) {
      final widgetTemp = ListTile(
        title: Text(otp['texto']),
        leading: getIcon(otp['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right_sharp,
          color: Colors.lightBlueAccent,
        ),
        onTap: (){
          Navigator.pushNamed(context, otp['ruta']);
          /*showDialog(
            context: context,
            builder: (BuildContext context) => _dialog(context, otp['texto']),
          );*/
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }

  Widget _dialog(BuildContext context, String otp){
    return new AlertDialog(
      title: const Text('Alerta De Dialogo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Es La Opción: '+ otp),
        ],
      ),
      actions: <Widget>[
         TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
