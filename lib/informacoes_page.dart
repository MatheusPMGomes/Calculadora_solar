import 'dart:ffi';
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pwon_calculadora_solar/home_page.dart';

class informacoesPage extends StatefulWidget {
  const informacoesPage({super.key});

  @override
  State<informacoesPage> createState() => _informacoesPageState();
}

class _informacoesPageState extends State<informacoesPage> {
 double kilowatshora = 0.0;
 double contaEmReais = 0.0;
 double investimentoTotal = 0.0;
 double margemAlta = 0.0;
 double margemBaixa = 0.0;
 double consumoEstimado = 0.0;
 double economia25Anos = 0.0;
 double qntPaineis = 0.0;
 int qntPaineisConvertida = 0;
 double areaNecessaria = 0.0;
 double valorMaterial = 0.0;
 double valorServicos = 0.0;
 double valorServicoJuros = 0.0;
 double valorTotalComJuros = 0.0;
 double valorParcela12vezes = 0.0;
 double valorParcelasJurosComposto36 = 0.0;
 double valorParcelasJurosComposto48 = 0.0;
 double valorParcelasJurosComposto60 = 0.0;
 double potencia36 = 23.053712442301478;
 double potencia48 = 27.29492797326411;
 double potencia60 = 30.4905564136107;


  createAlertDialog(BuildContext context)
  {
    return showDialog(context: context, builder: (context)
    {
      return AlertDialog(
        title: Text(
          "Estimativa de Investimento: \n"+
          "R\$"+
          // investimentoTotal.toStringAsFixed(0)+
          // "\n\n"+
          margemBaixa.toStringAsFixed(0)+
          "  à  R\$"+
          margemAlta.toStringAsFixed(0)+
          "\n\n\n"+
          // "Economia Mensal: \n"+
          // "R\$"+
          // "0000000"+
          // "\n\n\n"+
          "Economia em 25 Anos: \n"+
          "R\$"+
          economia25Anos.toStringAsFixed(0)+
          "\n\n"+
          "Quantidades de Painéis: \n"+
          qntPaineisConvertida.toString()+
          "\n\n"+
          "Área Necessária: \n"+
          areaNecessaria.toStringAsFixed(2)+" m²"+
          "\n\n"+
          // "Valor da parcela em 12x: "+
          // "R\$"+
          // valorParcela12vezes.toStringAsFixed(2)+
          // "\n\n"+
          "•Parcela financiada em 36x: "+
          "R\$"+
          valorParcelasJurosComposto36.toStringAsFixed(0)+
          "\n"+
          "•Parcela financiada em 48x: "+
          "R\$"+
          valorParcelasJurosComposto48.toStringAsFixed(0)+
          "\n"+
          "•Parcela financiada em 60x: "+
          "R\$"+
          valorParcelasJurosComposto60.toStringAsFixed(0)
          )
      );
    });
  }
  
//  createAlertDialog2(BuildContext context){
//   return showDialog(context: context, builder: (context)
//   {
//     return AlertDialog(title: Text("qualquer coisa"));
//   });
//  }

//  createAlertDialog3(BuildContext context){
//   return showDialog(context: context, builder: (context)
//   {
//     return RichText(
//       text: TextSpan(
//         text: "default",
//         style: TextStyle(),
//         children: <TextSpan>[
//           TextSpan(
//             text: "outra coisa", style: TextStyle(color: Colors.deepOrangeAccent),
//           )
//         ]
//       ));
//   });
//  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 500,
              height: 250,
              child: Image.asset("assets/images/perfil-removebg-preview.png"),
            ),
            Text("PREENCHA O CAMPO ABAIXO COM VALOR DA CONTA DE ENERGIA DO CLIENTE: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(height: 30),
          //   TextField(
          //   keyboardType: TextInputType.number,
          //   onChanged: (value) {
          //     kilowatshora = double.parse(value);
          //   },  
          //   decoration: InputDecoration(
          //     labelText: 'Insira o valor do consumo mensal em KWh',
          //     prefixText: "KWh ",
          //     labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(20)
          //     )
          //   ),
          // ),
            Container(height: 30),
            TextField(
            style: TextStyle(fontSize: 15),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              contaEmReais = double.parse(value);
            },
            decoration: InputDecoration(
              labelText: 'Insira o valor da conta de energia em Reais (R\$)',
              prefixText: "R\$ ",
              labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
          ),
          Container(height: 100),
          Container(
            width: 250,
            height: 80,
            
            child: ElevatedButton(
              onPressed: (){
                kilowatshora = contaEmReais/0.9;
                if(kilowatshora > 0)
                {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => HomePage())
                  // );

                if(kilowatshora >= 150 && kilowatshora<= 599)
                {
                  investimentoTotal = kilowatshora*45.06;
                  margemAlta = kilowatshora*55.87;
                  margemBaixa = kilowatshora*38.73;
                  qntPaineis = contaEmReais*0.0161;
                  qntPaineisConvertida = qntPaineis.ceil();
                  areaNecessaria = qntPaineisConvertida*3*1.3;
                  valorMaterial = investimentoTotal*0.7;
                  valorServicos = investimentoTotal*0.3;
                  valorServicoJuros = valorServicos+(valorServicos*0.12);
                  valorTotalComJuros = valorServicoJuros+valorMaterial;
                  valorParcela12vezes = valorTotalComJuros/12;
                  // valorParcelasJurosComposto36 = investimentoTotal / potencia36;
                  // valorParcelasJurosComposto48 = investimentoTotal / potencia48;
                  // valorParcelasJurosComposto60 = investimentoTotal / potencia60;
                  valorParcelasJurosComposto36 = ((investimentoTotal / 5447)*170.96);
                  valorParcelasJurosComposto48 = ((investimentoTotal / 5447)*150.96);
                  valorParcelasJurosComposto60 = ((investimentoTotal / 5447)*132.54);
                  economia25Anos = kilowatshora*775.15;
                  print(valorParcelasJurosComposto36);
                  print(valorParcelasJurosComposto48);
                  print(valorParcelasJurosComposto60);
                  print(investimentoTotal);
                  print(margemAlta);
                  print(margemBaixa);
                  print(valorTotalComJuros);
                }
                if(kilowatshora >= 600 && kilowatshora<= 1199)
                {
                  investimentoTotal = kilowatshora*36.02;
                  margemAlta = kilowatshora*37.70;
                  margemBaixa = kilowatshora*33.73;
                  qntPaineis = contaEmReais*0.0172;
                  qntPaineisConvertida = qntPaineis.ceil();
                  areaNecessaria = qntPaineisConvertida*3*1.3;
                  valorMaterial = investimentoTotal*0.7;
                  valorServicos = investimentoTotal*0.3;
                  valorServicoJuros = valorServicos+(valorServicos*0.12);
                  valorTotalComJuros = valorServicoJuros+valorMaterial;
                  valorParcela12vezes = valorTotalComJuros/12;
                  // valorParcelasJurosComposto36 = investimentoTotal / potencia36;
                  // valorParcelasJurosComposto48 = investimentoTotal / potencia48;
                  // valorParcelasJurosComposto60 = investimentoTotal / potencia60;
                  valorParcelasJurosComposto36 = ((investimentoTotal / 4253)*172.58);
                  valorParcelasJurosComposto48 = ((investimentoTotal / 4253)*136.01);
                  valorParcelasJurosComposto60 = ((investimentoTotal / 4253)*120.09);
                  economia25Anos = kilowatshora*820.30;
                  print(investimentoTotal);
                  print(margemAlta);
                  print(margemBaixa);
                }
                if(kilowatshora >= 1200 && kilowatshora<= 6999)
                {
                  investimentoTotal = kilowatshora*30.41;
                  margemAlta = kilowatshora*34.74;
                  margemBaixa = kilowatshora*24.09;
                  qntPaineis = contaEmReais*0.0178;
                  qntPaineisConvertida = qntPaineis.ceil();
                  areaNecessaria = qntPaineisConvertida*3*1.3;
                  valorMaterial = investimentoTotal*0.7;
                  valorServicos = investimentoTotal*0.3;
                  valorServicoJuros = valorServicos+(valorServicos*0.12);
                  valorTotalComJuros = valorServicoJuros+valorMaterial;
                  valorParcela12vezes = valorTotalComJuros/12;
                  // valorParcelasJurosComposto36 = investimentoTotal / potencia36;
                  // valorParcelasJurosComposto48 = investimentoTotal / potencia48;
                  // valorParcelasJurosComposto60 = investimentoTotal / potencia60;
                  valorParcelasJurosComposto36 = ((investimentoTotal / 3567)*145.92);
                  valorParcelasJurosComposto48 = ((investimentoTotal / 3567)*120.08);
                  valorParcelasJurosComposto60 = ((investimentoTotal / 3567)*101.51);
                  economia25Anos = kilowatshora*804.37;
                  print(investimentoTotal);
                  print(margemAlta);
                  print(margemBaixa);
                }
                if(kilowatshora >= 7000)
                {
                  investimentoTotal = kilowatshora*27.26;
                  margemAlta = kilowatshora*31.19;
                  margemBaixa = kilowatshora*24.71;
                  qntPaineis = contaEmReais*0.0155;
                  qntPaineisConvertida = qntPaineis.ceil();
                  areaNecessaria = qntPaineisConvertida*3*1.3;
                  valorMaterial = investimentoTotal*0.7;
                  valorServicos = investimentoTotal*0.3;
                  valorServicoJuros = valorServicos+(valorServicos*0.12);
                  valorTotalComJuros = valorServicoJuros+valorMaterial;
                  valorParcela12vezes = valorTotalComJuros/12;
                  // valorParcelasJurosComposto36 = investimentoTotal / potencia36;
                  // valorParcelasJurosComposto48 = investimentoTotal / potencia48;
                  // valorParcelasJurosComposto60 = investimentoTotal / potencia60;
                  valorParcelasJurosComposto36 = ((investimentoTotal / 3667)*143.91);
                  valorParcelasJurosComposto48 = ((investimentoTotal / 3667)*119.07);
                  valorParcelasJurosComposto60 = ((investimentoTotal / 3667)*104.65);
                  economia25Anos = kilowatshora*858.13;
                  print(investimentoTotal);
                  print(margemAlta);
                  print(margemBaixa);
                }
                // economia25Anos = (contaEmReais*300)-investimentoTotal;
                kilowatshora = 0.0;
                contaEmReais = 0.0;
                }
                createAlertDialog(context);           
              },
              child: Text("CALCULAR")),
          ),
          ]
        ),
      ),
    );
  }
}