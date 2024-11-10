import 'package:conecta_ai_app/src/ui/components/custom_colors.dart';
import 'package:flutter/material.dart';

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({super.key});

  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final TextEditingController _controller = TextEditingController();
  int questionIndex = 0;
  final List<String> responses = [];
  bool isFormCompleted = false;

  // Lista de perguntas
  final List<String> questions = [
    "Qual é o seu nome?",
    "Qual é sua experiência profissional?",
    "Quais são suas habilidades?",
    "Onde estudou?",
  ];

  // Avança para a próxima pergunta
  void nextQuestion() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        if (responses.length > questionIndex) {
          responses[questionIndex] = _controller.text;
        } else {
          responses.add(_controller.text);
        }
        _controller.clear();
        if (questionIndex < questions.length - 1) {
          questionIndex++;
          _controller.text =
              responses.length > questionIndex ? responses[questionIndex] : '';
        } else {
          isFormCompleted = true; // Sinaliza que o formulário foi concluído
        }
      });
    }
  }

  // Retorna para a pergunta anterior
  void previousQuestion() {
    setState(() {
      if (questionIndex > 0) {
        questionIndex--;
        _controller.text = responses[questionIndex];
        isFormCompleted = false; // Retorna ao modo de perguntas
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Cor.white, size: 28),
        title: const Text(
          'Responda as Perguntas',
          style: TextStyle(color: Cor.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Cor.darkBlue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 6,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Cor.darkBlue.withOpacity(0.9), Cor.lightBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.question_answer,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    // Exibe a pergunta ou a mensagem de conclusão
                    Text(
                      isFormCompleted
                          ? "Formulário concluído com sucesso!"
                          : questions[questionIndex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Campo de resposta somente se o formulário não estiver concluído
                    if (!isFormCompleted)
                      TextField(
                        controller: _controller,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Digite sua resposta...',
                          hintStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.white12,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white70, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Botões de navegação ou de conclusão
            if (!isFormCompleted)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (questionIndex > 0)
                    ElevatedButton(
                      onPressed: previousQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[600],
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Voltar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    )
                  else
                    const SizedBox(width: 100), // Placeholder para alinhamento

                  ElevatedButton(
                    onPressed: nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Cor.darkBlue,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Próximo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            else
              ElevatedButton(
                onPressed: () {
                  // Lógica para gerar o currículo usando as respostas
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Cor.darkBlue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Gerar Currículo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
