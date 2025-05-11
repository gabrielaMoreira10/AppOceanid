import 'package:flutter/material.dart';
import 'loginTela.dart'; // Vamos importar a tela de perfil

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  String? nomeCadastrado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho com título e botão X
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Cadastre-se',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Campo de texto para o e-mail
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFAEE1E1),
                hintText: 'E-mail',
                hintStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 20),

            // Campo de senha
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFAEE1E1),
                hintText: 'Senha',
                hintStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'Esqueceu a senha?',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 30),

            // Botão Entrar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final email = _emailController.text.trim();
                  if (email.isNotEmpty) {
                    final nome = email.split('@').first;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PerfilPage(nomeUsuario: nome),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, digite seu e-mail!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAEE1E1),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Texto informativo
            const Text(
              'Ao assinar a Oceanid Skin Beauty, você concorda com nossos Termos de Uso e Política de Privacidade e consente em receber mensagens de marketing.',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
