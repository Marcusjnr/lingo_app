String langCode(String langFull){
  if(langFull.toLowerCase() == 'english'){
    return 'en';
  }else if(langFull.toLowerCase() == 'french'){
    return 'fr';
  }else if(langFull.toLowerCase() == 'igbo'){
    return 'ig';
  }else{
    return 'en';
  }
}