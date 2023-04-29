import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portfolio/core/env/env.dart';
import 'package:portfolio/core/models/widgets/informations_form_field.dart';
import 'package:portfolio/core/models/widgets/message_form_field.dart';
import 'package:portfolio/responsive/responsive_layout.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:validatorless/validatorless.dart';
import 'package:http/http.dart' as http;

import '../../../ui/colors/app_colors.dart';
import '../../../ui/fonts/app_fonts.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

final fullNameEC = TextEditingController();
final emailAddressEC = TextEditingController();
final numberEC = TextEditingController();
final subjectEC = TextEditingController();
final messageEC = TextEditingController();
final formKey = GlobalKey<FormState>();
String serviceId = Env.i['service_id'] ?? '';
String templateId = Env.i['template_id'] ?? '';
String userId = Env.i['user_id'] ?? '';
String urlEnv = Env.i['email_send_url'] ?? '';
bool isLoading = false;

Future<void> sendEmail(name, email, subject, message, number) async {
  final url = Uri.parse(urlEnv);
  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': 'Número do usuário: $number, Mensagem: $message',
          }
        },
      ),
    );
    log(response.body);
  } on Error catch (e, s) {
    log('Erro ao enviar email', error: e, stackTrace: s);
    throw ErrorDescription('Erro ao enviar e-mail');
  }
}

class _ContactSectionState extends State<ContactSection> {
  @override
  void dispose() {
    super.dispose();
    fullNameEC.dispose();
    emailAddressEC.dispose();
    numberEC.dispose();
    subjectEC.dispose();
    messageEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: Container(
        color: AppColors.primaryColor,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * .9,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 90),
                  child: RichText(
                    text: TextSpan(
                      text: 'Entre em',
                      style: AppFonts.aboutText(
                        MediaQuery.of(context).size.height * 0.05,
                        Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: ' Contato',
                          style: AppFonts.aboutText(
                            MediaQuery.of(context).size.height * 0.05,
                            AppColors.secColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          validator: Validatorless.required(
                              'Você precisa informar o seu nome'),
                          controller: fullNameEC,
                          decoration: InputDecoration(
                            label: const Text(
                              'Nome Completo',
                              style: TextStyle(color: AppColors.secColor),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                            ),
                          ),
                          style: const TextStyle(color: AppColors.secColor),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          validator: Validatorless.multiple([
                            Validatorless.required(
                                'Você precisa informar um E-mail'),
                            Validatorless.email('Esse E-mail não é válido')
                          ]),
                          controller: emailAddressEC,
                          decoration: InputDecoration(
                            label: const Text(
                              'Informe o seu E-mail',
                              style: TextStyle(color: AppColors.secColor),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                            ),
                          ),
                          style: const TextStyle(color: AppColors.secColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: Validatorless.multiple([
                            Validatorless.required('Informe o seu número'),
                            Validatorless.number('Isso não é um número'),
                          ]),
                          controller: numberEC,
                          maxLines: 1,
                          decoration: InputDecoration(
                            label: const Text(
                              'Informe o seu telefone',
                              style: TextStyle(color: AppColors.secColor),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                            ),
                          ),
                          style: const TextStyle(color: AppColors.secColor),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          validator: Validatorless.required(
                              'Informe o assunto da conversa'),
                          controller: subjectEC,
                          decoration: InputDecoration(
                            label: const Text(
                              'Assunto',
                              style: TextStyle(color: AppColors.secColor),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: AppColors.secColor, width: 3),
                            ),
                          ),
                          style: const TextStyle(color: AppColors.secColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.860,
                  child: MessageFormField(
                    controller: messageEC,
                    label: 'Escreva sua mensagem',
                    validator: Validatorless.required('Coloque uma mensagem'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.080,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                      onPressed: () async {
                        final valid = formKey.currentState?.validate() ?? false;
                        if (valid) {
                          setState(() => isLoading = true);
                          await sendEmail(
                            fullNameEC.text,
                            emailAddressEC.text,
                            subjectEC.text,
                            messageEC.text,
                            numberEC.text,
                          ).onError((error, stackTrace) {
                            showTopSnackBar(
                              Overlay.of(context)!,
                              CustomSnackBar.error(
                                message: error.toString(),
                              ),
                            );
                            setState(() => isLoading = false);
                          });
                          setState(() => isLoading = false);
                          showTopSnackBar(
                            Overlay.of(context)!,
                            const CustomSnackBar.success(
                              message: 'Email enviado !',
                            ),
                          );
                          fullNameEC.clear();
                          emailAddressEC.clear();
                          numberEC.clear();
                          subjectEC.clear();
                          messageEC.clear();
                        }
                      },
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Enviar',
                              style: AppFonts.buttonText(
                                  MediaQuery.of(context).size.height * 0.020),
                            )),
                )
              ],
            ),
          ),
        ),
      ),
      desktopBody: Container(
        color: AppColors.primaryColor,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * .9,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: RichText(
                  text: TextSpan(
                    text: 'Entre em',
                    style: AppFonts.aboutText(
                      MediaQuery.of(context).size.height * 0.05,
                      Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: ' Contato',
                        style: AppFonts.aboutText(
                          MediaQuery.of(context).size.height * 0.05,
                          AppColors.secColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InformationsFormField(
                      controller: fullNameEC,
                      label: 'Nome Completo',
                      validator: Validatorless.required(
                          'Você precisa informar o seu nome'),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        validator: Validatorless.multiple([
                          Validatorless.required(
                              'Você precisa informar um E-mail'),
                          Validatorless.email('Esse E-mail não é válido')
                        ]),
                        controller: emailAddressEC,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 10.0),
                          label: const Text(
                            'Informe o seu E-mail',
                            style: TextStyle(color: AppColors.secColor),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.secColor, width: 3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: AppColors.secColor, width: 3),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: AppColors.secColor, width: 3),
                          ),
                        ),
                        style: const TextStyle(color: AppColors.secColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: Validatorless.multiple([
                          Validatorless.required('Informe o seu número'),
                          Validatorless.number('Isso não é um número'),
                        ]),
                        controller: numberEC,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 10.0),
                          label: const Text(
                            'Informe o seu telefone',
                            style: TextStyle(color: AppColors.secColor),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.secColor, width: 3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: AppColors.secColor, width: 3),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: AppColors.secColor, width: 3),
                          ),
                        ),
                        style: const TextStyle(color: AppColors.secColor),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    InformationsFormField(
                      controller: subjectEC,
                      label: 'Assunto',
                      validator: Validatorless.required(
                          'Informe o assunto da conversa'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.815,
                child: MessageFormField(
                  controller: messageEC,
                  label: 'Escreva sua mensagem',
                  validator: Validatorless.required('Coloque uma mensagem'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.080,
                width: MediaQuery.of(context).size.width * 0.080,
                child: ElevatedButton(
                    onPressed: () async {
                      final valid = formKey.currentState?.validate() ?? false;
                      if (valid) {
                        setState(() => isLoading = true);
                        await sendEmail(
                          fullNameEC.text,
                          emailAddressEC.text,
                          subjectEC.text,
                          messageEC.text,
                          numberEC.text,
                        ).onError((error, stackTrace) {
                          showTopSnackBar(
                            Overlay.of(context)!,
                            CustomSnackBar.error(
                              message: error.toString(),
                            ),
                          );
                          setState(() => isLoading = false);
                        });
                        setState(() => isLoading = false);
                        showTopSnackBar(
                          Overlay.of(context)!,
                          const CustomSnackBar.success(
                            message: 'Email enviado !',
                          ),
                        );
                        fullNameEC.clear();
                        emailAddressEC.clear();
                        numberEC.clear();
                        subjectEC.clear();
                        messageEC.clear();
                      }
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Enviar',
                            style: AppFonts.buttonText(
                                MediaQuery.of(context).size.height * 0.020),
                          )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submit(BuildContext context) async {}
}
