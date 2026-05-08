class AutenticarVM{
  String compararsenha = '';
  
  String? validarusuario(String? valor){
    if(valor == null || valor.isEmpty){
      return 'Campo obrigatorio';
    }else{
      return null;
    }
  }

  String? validaremail(String? valor){
      if(valor != null && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$',).hasMatch(valor)){
        return 'Email invalido';
      }else if(valor == null){
        return 'Campo obrigatório';
      }else if(valor != null && valor.isEmpty){
        return 'Campo obrigatorio';
      }else{
        return null;
      }
  }

  String? validarsenha(String? valor){
    if(valor != null && !RegExp(r'\d').hasMatch(valor)){
      return 'Precisa ter numero';
    }else if(valor != null && !RegExp(r'[A-Z]').hasMatch(valor)){
      return 'Precisa ter letras Maiuscula';
    }else if(valor !=null && !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(valor)){
      return 'Precisa ter simbolos';
    }else if(valor != null && valor.isEmpty){
      return 'Campo obrigatorio';
    }else if(valor == null){
      return 'Campo obrigatorio';
    }else{
      compararsenha = valor;
      return null;
    }
  }

  String? confirmasenha(String? valor){
    if(valor != null && valor.isEmpty){
      return 'Campo obrigatorio';
    }else if(valor == null){
      return 'Campo obrigatorio';
    }else if(compararsenha != valor){
      return 'Senha não esta igual';
    }else{
      return null;
    }
  }

}