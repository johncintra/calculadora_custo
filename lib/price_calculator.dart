import 'package:flutter/material.dart';

class PriceCalculator extends StatefulWidget {
  final double totalCost;

  PriceCalculator({required this.totalCost});

  @override
  _PriceCalculatorState createState() => _PriceCalculatorState();
}

class _PriceCalculatorState extends State<PriceCalculator> {
  final _shippingCostController = TextEditingController();
  final _packagingCostController = TextEditingController();
  final _profitPercentageController = TextEditingController();
  double _finalPrice = 0.0;

  void _calculateFinalPrice() {
    final double shippingCost = double.parse(_shippingCostController.text);
    final double packagingCost = double.parse(_packagingCostController.text);
    final double profitPercentage = double.parse(_profitPercentageController.text);

    final double totalCost = widget.totalCost + shippingCost + packagingCost;
    final double profit = totalCost * (profitPercentage / 100);
    setState(() {
      _finalPrice = totalCost + profit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: Text('Calcular Preço Final'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromARGB(255, 243, 213, 248), Color.fromARGB(255, 123, 48, 136)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                'Custo Total do Material: R\$${widget.totalCost.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _shippingCostController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Custo do Frete',
                ),
              ),
              TextField(
                controller: _packagingCostController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Custo da Embalagem',
                ),
              ),
              TextField(
                controller: _profitPercentageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Porcentagem de Lucro (%)',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(                
                onPressed: _calculateFinalPrice,
                child: Text('Calcular Preço Final'),
              ),
              SizedBox(height: 20),
              Text(
                'Preço Final: R\$$_finalPrice',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}