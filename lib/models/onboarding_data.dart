import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';

class OnboardingData{

  String title, desc, image;
  OnboardingData({this.title, this.desc, this.image});

  void setTitle(String getTitle){
    title = getTitle;
  }
  void setDesc(String getDesc){
    desc = getDesc;
  }
  void setImage(String getImage){
    image = getImage;
  }
  String getImage(){
    return image;
  }
  String getTitle(){
    return title;
  }
  String getDesc(){
    return desc;
  }

}

List<OnboardingData> getOnBoardingList(BuildContext context){
  List<OnboardingData> OnboardingSlides = [];
  OnboardingData onboardingData = new OnboardingData();

  //Slide 1
  onboardingData.setTitle(LocaleKeys.slider_title_1.tr());
  onboardingData.setDesc(LocaleKeys.slider_subtitle_1.tr());
  onboardingData.setImage(sliderImage2);
  OnboardingSlides.add(onboardingData);

  onboardingData = new OnboardingData();

  //Slide 2
  onboardingData.setTitle(LocaleKeys.slider_title_2.tr());
  onboardingData.setDesc(LocaleKeys.slider_subtitle_2.tr());
  onboardingData.setImage(sliderImage3);
  OnboardingSlides.add(onboardingData);

  onboardingData = new OnboardingData();
  return OnboardingSlides;


}