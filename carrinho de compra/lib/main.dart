import 'package:flutter/material.dart';

void main() {
  runApp(ViagemApp());
}

class PacoteViagem {
  final String destino;
  final String descricao;
  final double preco;
  final String imagemUrl;

  PacoteViagem(this.destino, this.descricao, this.preco, this.imagemUrl);
}

class ViagemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacotes de Viagem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViagemHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ViagemHomePage extends StatefulWidget {
  @override
  _ViagemHomePageState createState() => _ViagemHomePageState();
}

class _ViagemHomePageState extends State<ViagemHomePage> {
  double total = 0.0;

  List<PacoteViagem> pacotes = [
    PacoteViagem(
      'Paris, França',
      '7 dias com hotel e passeios inclusos',
      3500.00,
      'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?auto=format&fit=crop&w=600&q=80',
    ),
    PacoteViagem(
      'Maldivas',
      '5 dias de luxo em resort à beira-mar',
      7200.00,
      'https://lh3.googleusercontent.com/gps-cs-s/AC9h4npYHJz6pzkpZMIYbxTETXplYzvutrbJIDKyE1OHUniXTvBBpTpYiTt5ZUGNT4uXwIFhkp-CNQ6U-x6334BVSecQLI6BLfQFIhDMMWLiXfKBNbdYmfXbyXBOB8h-kVwawH8BEY9S1A=w540-h312-n-k-no',
    ),
    PacoteViagem(
      'Tóquio, Japão',
      '8 dias explorando cultura e tecnologia',
      4800.00,
      'https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcTilG-eZs1OLVVeB2MALEal85p_LRyYDIFtViHfBGtPgjsjFVmLjZCP0AtJS2dlcjIBWftd0LDxHD9s6EG6vGm1HnzbgIhfWpTMGDoh6g',
    ),
    PacoteViagem(
      'Nova York, EUA',
      '6 dias com city tour e Broadway',
      4000.00,
      'https://media.istockphoto.com/id/1454217037/pt/foto/statue-of-liberty-and-new-york-city-skyline-with-manhattan-financial-district-world-trade.jpg?s=612x612&w=0&k=20&c=kNeotATISnwVffMVgRGqsfI9y9Ue3PoaTBWxaoeirTA=',
    ),
    PacoteViagem(
      'Moscou, Rússia',
      '7 dias com city tour e Hospedagem',
      8500.00,
      'https://lh3.googleusercontent.com/gps-cs-s/AC9h4np_irZ3J9Ntbi4U2a5qUnVaowaweSFzcpeSuUtdkHQjBQqR9oFfz-ooVGko45dLOwrK-0cDO0ksPvx_Kcr61MupEHAKJlVXbEHh8NpjPBeBFy4_in270usmcm307_Z-GPOhY10v=w540-h312-n-k-no',
    ),
  ];

  void adicionarAoCarrinho(double preco) {
    setState(() {
      total += preco;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pacote adicionado ao carrinho!')),
    );
  }

  void clearCart() {
    setState(() {
      total = 0.0;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Carrinho esvaziado!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 0, 0, 0), // Cor de fundo azul claro em RGB
      appBar: AppBar(
        title: Text('Pacotes de Viagem'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            tooltip: 'Esvaziar Carrinho',
            onPressed: clearCart,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: pacotes.length,
                itemBuilder: (context, index) {
                  final pacote = pacotes[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(
                            pacote.imagemUrl,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pacote.destino,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6),
                              Text(
                                pacote.descricao,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[700]),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'R\$ ${pacote.preco.toStringAsFixed(2)}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () =>
                                        adicionarAoCarrinho(pacote.preco),
                                    icon: Icon(Icons.shopping_cart,
                                        size: 16), // Ícone menor
                                    label: Text('Adicionar'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // Bordas arredondadas
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8), // Ajuste opcional
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.blue.shade50,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total:',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text('R\$ ${total.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 22)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
