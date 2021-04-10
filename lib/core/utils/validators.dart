String passwordValidation(String text) {
  if (text.isEmpty) {
    return "Preencha este campo!";
  } else if (text.length > 50) {
    return "Você ultrapassou o limite de caracteres!";
  }
  else if(text.length<8){
    return "A senha precisa ter no mínimo 8 caracteres!";
  }
  return null;
}
