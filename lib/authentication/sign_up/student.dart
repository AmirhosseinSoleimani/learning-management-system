import 'package:flutter/material.dart';
import '../../models/student_account.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:im_stepper/stepper.dart';


class StudentSignUp extends StatefulWidget {
  static const routeName = '/student-signup';
  const StudentSignUp({Key? key}) : super(key: key);

  @override
  State<StudentSignUp> createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {

  int activeStep = 1;
  int upperBound = 4;
  final _lastNameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _countryFocusNode = FocusNode();

  String dropDownValue = 'Male';
  Country? onSelectedCountry;
  var items = ['Male', 'Female', 'Non-binary', 'I prefer not to say'];
  final _form = GlobalKey<FormState>();
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  // var _signupStudent = StudentAccount(
  //     id: '',
  //     firstName: '',
  //     lastName: '',
  //     dateTime: DateTime.now(),
  //     password: '',
  //     gender: '',
  //     country: '',
  //     phoneNumber: '',
  //     email: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 18.0,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: Column(
        children: [
          IconStepper(
            icons: [
              Icon(Icons.person),
              Icon(Icons.email),
              Icon(Icons.location_city),
              Icon(Icons.favorite),
            ],
            activeStep: activeStep,
            onStepReached: (index) {
              setState(() {
                activeStep = index;
              });
            },
          ),
          header(),
          Expanded(
            child: FittedBox(
              child: Center(
                child: Text('$activeStep'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              previousButton(),
              nextButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('Next'),
    );
  }

  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
    );
  }

  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Preface';

      case 2:
        return 'Table of Contents';

      case 3:
        return 'About the Author';

      case 4:
        return 'Publisher Information';

      default:
        return 'Introduction';
    }
  }
  // switchStepsType() {
  //   setState(() => stepperType == StepperType.vertical
  //       ? stepperType = StepperType.horizontal
  //       : stepperType = StepperType.vertical);
  // }
  //
  // tapped(int step) {
  //   setState(() => _currentStep = step);
  // }
  //
  // continued() {
  //   _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  // }
  //
  // cancel() {
  //   _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  // }
}



// Expanded(
// child: Stepper(
// type: stepperType,
// physics: const ScrollPhysics(),
// currentStep: _currentStep,
// onStepTapped: (step) => tapped(step),
// onStepContinue: continued,
// onStepCancel: cancel,
// steps: [
// Step(
// title: const Text('Account'),
// content: Container(
// height: MediaQuery.of(context).size.height * 0.65,
// width: MediaQuery.of(context).size.width,
// child: Form(
// key: _form,
// child: ListView(
// children: [
// TextFormField(
// decoration: const InputDecoration(
// labelText: 'Last Name'
// ),
// textInputAction: TextInputAction.next,
// validator: (String? value){
// if(value!.isEmpty){
// return 'Please provide a value';
// }
// return null;
// },
// ),
// DropdownButton(
// value: dropDownValue,
// icon: const Icon(Icons.keyboard_arrow_down),
// items: items.map((String items){
// return DropdownMenuItem(
// value: items,
// child: Text(items));
// }).toList(),
// onChanged: (String? newValue){
// setState((){
// dropDownValue = newValue!;
// });
// }),
// DateTimePicker(
// initialValue: '',
// firstDate: DateTime(1900),
// lastDate: DateTime.now(),
// dateLabelText: 'Date',
// onChanged: (val) => print(val),
// validator: (val) {
// print(val);
// return null;
// },
// onSaved: (val) => print(val),
// ),
// TextFormField(
// decoration: const InputDecoration(
// labelText: 'Email'
// ),
// textInputAction: TextInputAction.next,
// keyboardType: TextInputType.emailAddress,
// focusNode: _emailFocusNode,
// onFieldSubmitted: (value) {
// FocusScope.of(context).requestFocus(_phoneNumberFocusNode);
// },
// validator: (String? value){
// if(value!.isEmpty){
// return 'Please provide a value';
// }
// return null;
// },
// ),
// TextFormField(
// decoration: const InputDecoration(
// labelText: 'Phone Number'
// ),
// textInputAction: TextInputAction.next,
// keyboardType: TextInputType.phone,
// focusNode: _phoneNumberFocusNode,
// onFieldSubmitted: (value) {
// FocusScope.of(context).requestFocus(_phoneNumberFocusNode);
// },
// validator: (String? value){
// if(value!.isEmpty){
// return 'Please provide a value';
// }
// return null;
// },
// ),
// TextFormField(
// decoration: const InputDecoration(
// labelText: 'Password'
// ),
// textInputAction: TextInputAction.next,
// keyboardType: TextInputType.visiblePassword,
// obscureText: true,
// focusNode: _passwordFocusNode,
// onFieldSubmitted: (value) {
// FocusScope.of(context).requestFocus(_countryFocusNode);
// },
// validator: (String? value){
// if(value!.isEmpty){
// return 'Please provide a value';
// }
// return null;
// },
// ),
// TextButton(
// onPressed: (){
// showCountryPicker(
// context: context,
// countryListTheme: CountryListThemeData(
// flagSize: 25,
// backgroundColor: Colors.white,
// textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
// bottomSheetHeight: 500, // Optional. Country list modal height
// //Optional. Sets the border radius for the bottomsheet.
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// ),
// //Optional. Styles the search field.
// inputDecoration: InputDecoration(
// labelText: 'Search',
// hintText: 'Start typing to search',
// prefixIcon: const Icon(Icons.search),
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: const Color(0xFF8C98A8).withOpacity(0.2),
// ),
// ),
// ),
// ),
// onSelect: (Country country){
// setState((){
// onSelectedCountry = country;
// });
// },
// );
// },
// child: Text('Select country: ${onSelectedCountry?.displayName}'),
// )
//
//
// ],
// ),
// ),
// )
// ),
// Step(
// title: const Text('Address'),
// content: Column(
// children: <Widget>[
// TextFormField(
// decoration: InputDecoration(labelText: 'Home Address'),
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Postcode'),
// ),
// ],
// ),
// ),
// Step(
// title: const Text('Address'),
// content: Column(
// children: <Widget>[
// TextFormField(
// decoration: InputDecoration(labelText: 'Home Address'),
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Postcode'),
// ),
// ],
// ),
// ),
// Step(
// title: const Text('Address'),
// content: Column(
// children: <Widget>[
// TextFormField(
// decoration: InputDecoration(labelText: 'Home Address'),
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Postcode'),
// ),
// ],
// ),
// )
// ],
// ))