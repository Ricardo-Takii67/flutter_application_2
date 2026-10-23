import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FormularioExemplo()));

class FormularioExemplo extends StatefulWidget {
  const FormularioExemplo({super.key});

  @override
  State<FormularioExemplo> createState() => _FormularioExemploState();
}

class _FormularioExemploState extends State<FormularioExemplo> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _submeterFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processando dados de ${_emailController.text}...')),
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
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Informe um e-mail válido!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submeterFormulario,
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }}