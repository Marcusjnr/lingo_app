import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingo_app/screens/learn_completed_page.dart';
import 'package:lingo_app/screens/learn_quiz_view.dart';
import 'package:lingo_app/styles/styles.dart';
import 'package:lingo_app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class LearnPageQuiz extends StatefulWidget {
  String learnType;

  LearnPageQuiz({this.learnType});
  @override
  _LearnPageQuizState createState() => _LearnPageQuizState();
}

class _LearnPageQuizState extends State<LearnPageQuiz> {

  List<LearnQuizView> learnPages = [];
  PageController _controller = PageController();
  int presentPage = 0;
  int previousPage = 0;
  int nextPage = 1;
  int totalPages = 5;
  bool endOfLearning = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    learnPages = getLearnPages(widget.learnType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              padding: EdgeInsets.only(right:40.0),
              alignment: Alignment.center,
              child: Text("$presentPage/$totalPages", style: bodyOneTextBold,),
            )

          ],
          leading: IconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: textColor,),
            onPressed: () => Navigator.pop(context),),
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
                PageView(
                  onPageChanged: (int newPage){
                    setState(() {
                      presentPage = newPage;
                      if(nextPage < totalPages){
                        nextPage = presentPage + 1;
                      }
                      if(previousPage > 0){
                        previousPage =- 1;
                      }
                      if(newPage == totalPages){
                        endOfLearning = true;
                      }
                    });
                  },
                  controller: _controller,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: learnPages,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          child: Text("Previous", style: buttonTextalt,),
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.only(left: 40.0, right:40.0, top: 18.0, bottom: 18.0),
                              backgroundColor: textColor,
                              onSurface: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                          ),
                          onPressed: () {
                            _controller.animateToPage(previousPage, duration: Duration(milliseconds: 250), curve: Curves.easeIn);
                          }
                          ),
                      endOfLearning
                      ?
                      TextButton(
                          child: Text("Finish", style: buttonTextalt,),
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.only(left: 40.0, right:40.0, top: 18.0, bottom: 18.0),
                              backgroundColor: primaryColor,
                              onSurface: textColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LearnCompleted()));
                          }
                      )
                      :
                      TextButton(
                          child: Text(LocaleKeys.continue_text.tr(), style: buttonTextalt,),
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.only(left: 40.0, right:40.0, top: 18.0, bottom: 18.0),
                              backgroundColor: primaryColor,
                              onSurface: textColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0)))
                          ),
                          onPressed: () {
                            _controller.animateToPage(nextPage, duration: Duration(milliseconds: 250), curve: Curves.easeIn);
                          }
                         ),
                    ],
                  ),
                ),

            ] ,
          ),
        ),
    );
  }
}
