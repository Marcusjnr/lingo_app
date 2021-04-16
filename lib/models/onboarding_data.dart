import 'package:flutter/cupertino.dart';
import 'package:lingo_app/localization/local_constant.dart';
import 'package:lingo_app/styles/styles.dart';

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
  List<OnboardingData> OnboardingSlides = new List<OnboardingData>();
  OnboardingData onboardingData = new OnboardingData();
  //Slide 1
  onboardingData.setTitle(getTranslated(context, 'slider_title_1'));
  onboardingData.setDesc(getTranslated(context, 'slider_subtitle_1'));
  onboardingData.setImage(sliderImage1);
  OnboardingSlides.add(onboardingData);

  onboardingData = new OnboardingData();

  //Slide 2
  onboardingData.setTitle(getTranslated(context, 'slider_title_2'));
  onboardingData.setDesc(getTranslated(context, 'slider_subtitle_2'));
  onboardingData.setImage(sliderImage2);
  OnboardingSlides.add(onboardingData);

  onboardingData = new OnboardingData();

  //Slide 3
  onboardingData.setTitle(getTranslated(context, 'slider_title_3'));
  onboardingData.setDesc(getTranslated(context, 'slider_subtitle_3'));
  onboardingData.setImage(sliderImage3);
  OnboardingSlides.add(onboardingData);

  onboardingData = new OnboardingData();
  return OnboardingSlides;


}