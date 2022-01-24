import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileListModel{
  String settingTitle;
  String settingSubTitle;
  dynamic settingImage;
  ProfileListModel({this.settingImage, this.settingTitle, this.settingSubTitle});

  void setImage(dynamic image){
    this.settingImage = image;
  }
  void setTitle(String title){
    this.settingTitle = title;
  }
  void setSubtitle(String subtitle){
    this.settingSubTitle = subtitle;
  }
  dynamic getImage(){
    return settingImage;
  }
  String getTitle(){
    return settingTitle;
  }
  String getSubtitle(){
    return settingSubTitle;
  }
}
List<ProfileListModel> profileList(BuildContext context){
  List<ProfileListModel> profileListing = [];

  ProfileListModel profileListModel = new ProfileListModel();
  profileListModel.setImage(Icons.translate);
  profileListModel.setTitle("Change Language");
  profileListModel.setSubtitle("Change the default language");
  profileListing.add(profileListModel);
  profileListModel = new ProfileListModel();

  profileListModel.setImage(Icons.format_paint);
  profileListModel.setTitle("Theme");
  profileListModel.setSubtitle("Change the app theme");
  profileListing.add(profileListModel);
  profileListModel = new ProfileListModel();

  profileListModel.setImage(Icons.cloud);
  profileListModel.setTitle("Cloud Storage");
  profileListModel.setSubtitle("Save your data to the clouds");
  profileListing.add(profileListModel);
  profileListModel = new ProfileListModel();

  profileListModel.setImage(Icons.info);
  profileListModel.setTitle("Privacy Policy");
  profileListModel.setSubtitle("Read our privacy policy and licenses");
  profileListing.add(profileListModel);
  profileListModel = new ProfileListModel();

  profileListModel.setImage(Icons.person);
  profileListModel.setTitle("Sign Out");
  profileListModel.setSubtitle("Log out your account");
  profileListing.add(profileListModel);
  profileListModel = new ProfileListModel();


  profileListModel.setImage(Icons.info);
  profileListModel.setTitle("About");
  profileListModel.setSubtitle("More information about this app.");
  profileListing.add(profileListModel);
  profileListModel = new ProfileListModel();

  return profileListing;

}