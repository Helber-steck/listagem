import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Cria a lista de contatos
  List<Contato> contatos =[];

  @override
   void initState() {
    super.initState();
    contatos.add(Contato(
         nome: "Helber", telefone: "98876-2200", tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
         nome: "Deyse", telefone: "98876-4400", tipo: ContatoType.CELULAR));

    contatos.add(Contato(
         nome: "Heitor", telefone: "98876-3300", tipo: ContatoType.FAVORITO));

    contatos.add(Contato(
         nome: "Mack", telefone: "98876-0000", tipo: ContatoType.CASA));
        contatos.sort((a,b) => a.nome.compareTo(b.nome));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // ListView recebe e o componete separated separa a lista
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = contatos[index];
              //ListTile adiciona parametros a lista
              return ListTile (
                leading: CircleAvatar(
                  child:ContatoHelper.getIconByContatoType(contato.tipo),
                  backgroundColor: Colors.blue[200],),
                title: Text(contato.nome),
                subtitle: Text (contato.telefone),
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () => {},
                ),
              );
            },
            separatorBuilder:(context, index)=>Divider(),
            itemCount: contatos.length));
    }
}


class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({required this.nome, required this.telefone, required this.tipo});
}


enum ContatoType {CELULAR, TRABALHO, FAVORITO, CASA}

//adiciona icone e cor ao contatos da lista
class ContatoHelper{
  static Icon getIconByContatoType(ContatoType tipo) {
     switch(tipo) {
      case ContatoType.CELULAR:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContatoType.TRABALHO:
        return Icon(Icons.work, color: Colors.brown[700]);
      case ContatoType.FAVORITO:
        return Icon(Icons.star, color: Colors.yellow[700]);
      case ContatoType.CASA:
        return Icon(Icons.home, color: Colors.purple[700]);

    }
  }
}