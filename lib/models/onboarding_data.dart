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

List<OnboardingData> getOnBoardingList(){
  List<OnboardingData> OnboardingSlides = new List<OnboardingData>();
  OnboardingData onboardingData = new OnboardingData();
  //Slide 1
  onboardingData.setTitle(sliderTitle1);
  onboardingData.setDesc(sliderDesc1);
  onboardingData.setImage(sliderImage1);
  OnboardingSlides.add(onboardingData);

  onboardingData = new OnboardingData();

  //Slide 2
  onboardingData.setTitle(sliderTitle2);
  onboardingData.setDesc(sliderDesc2);
  onboardingData.setImage(sliderImage2);
  OnboardingSlides.add(onboardingData);

  onboardingData = new OnboardingData();

  //Slide 3
  onboardingData.setTitle(sliderTitle3);
  onboardingData.setDesc(sliderDesc3);
  onboardingData.setImage(sliderImage3);
  OnboardingSlides.add(onboardingData);

  onboardingData = new OnboardingData();
  return OnboardingSlides;


}