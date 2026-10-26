import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FormularioExemplo()));

class FormularioExemplo extends StatefulWidget {
  const FormularioExemplo({super.key});

  @override
  State<FormularioExemplo> createState() => _FormularioExemploState();
}

class _FormularioExemploState extends State<FormularioExemplo> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _especieController = TextEditingController();
  final _idadeController = TextEditingController();
  bool _aceitouTermos = false;

  void _submeterFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processando dados de ${_nomeController.text}...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro Rápido')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Pet',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Informe um nome válido!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                items: const [
                   DropdownMenuItem(value: "gato", child: Text('Gato')),
                   DropdownMenuItem(value: "dog", child: Text('Dog')),
                   DropdownMenuItem(value: "pinto", child: Text('Pinto')),
                   DropdownMenuItem(value: "jabuti", child: Text('Jabuti')),
                ],
                onChanged: (value) {
                  _especieController.text = value!;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Espécie inválida!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _idadeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Idade em anos do pet',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Idade inválida!';
                  }
                  return null;
                },
              ),
              
               CheckboxListTile(
                title: const Text('Aceito os termos de castração'),
                subtitle: const Text(
                'Aceito os termos'),
                value: _aceitouTermos,
                onChanged: (novoValor){
                  setState(() {
                    _aceitouTermos = novoValor ?? false;
                  });
                },
               ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submeterFormulario,
                child: const Text('Cadastrar pet'),
              ),
            ],
          ),
        ),
      ),
    );
  }}