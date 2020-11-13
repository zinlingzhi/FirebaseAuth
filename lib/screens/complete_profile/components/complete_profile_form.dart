import 'package:flutter/material.dart';
import 'package:fluttertemp/components/form_error.dart';
import 'package:fluttertemp/helpers/constants.dart';
import 'package:fluttertemp/screens/otp_screen/otp_screen.dart';
import 'package:fluttertemp/helpers/size_config.dart';
import 'package:fluttertemp/services/database_service.dart';

class CompleteProfileForm extends StatefulWidget {
  final String uid;
  CompleteProfileForm({Key key, this.uid}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  String uid;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstname;
  String lastname;
  String companyName;
  String ownerName;
  String phoneNumber;
  String latitude;
  String longitude;
  String picturePath;
  String townCity;
  String pinCode;
  int districtNumber = 0;

  @override
  void initState() {
    uid = widget.uid;
    super.initState();
    print("User  UID");
    print(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(maxHeight: getProportionateScreenWidth(1050)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                  child: Row(children: [
                Text("Company Name"),
                Text(" *", style: TextStyle(color: Colors.red))
              ])),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              buildCompanyNameField(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                  child: Row(children: [
                Text("Owner Name"),
                Text(" *", style: TextStyle(color: Colors.red))
              ])),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              buildOwnerNameField(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                  child: Row(children: [
                Text("Phone Number"),
                Text(" *", style: TextStyle(color: Colors.red))
              ])),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              buildPhoneNumberField(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                  child: Row(children: [
                Text("Shop GPS Location"),
                Text(" *", style: TextStyle(color: Colors.red))
              ])),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              Row(
                children: [
                  Container(
                    width: SizeConfig.screenWidth / 3,
                    child: Text("Latitude"),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Container(
                    width: SizeConfig.screenWidth / 3,
                    child: Text("Longitude"),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Container(
                    width: getProportionateScreenWidth(56),
                    height: getProportionateScreenHeight(56),
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add_location_alt),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(child: Row(children: [Text("Shop Picture")])),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              Container(
                child: Ink(
                  decoration: ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                child: Row(
                  children: [
                    Text("Town / City"),
                    Text(" *", style: TextStyle(color: Colors.red))
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              buildTownCityField(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                  child: Row(children: [
                Text("Pin Code"),
                Text(" *", style: TextStyle(color: Colors.red))
              ])),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              buildPinCodeField(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                  child: Row(children: [
                Text("District"),
                Text(" *", style: TextStyle(color: Colors.red))
              ])),
              SizedBox(
                height: getProportionateScreenHeight(6),
              ),
              Container(
                width: SizeConfig.screenWidth,
                child: DropdownButton(
                  hint: Text(""),
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(child: Text("First Item")),
                    DropdownMenuItem(
                      child: Text(
                        "Second Item",
                      ),
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Third Item",
                      ),
                    ),
                    DropdownMenuItem(
                      child: Text("Fourth Item"),
                    ),
                  ],
                  onChanged: (value) {
                    districtNumber = value;
                  },
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              FormError(errors: errors),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(56),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      if (companyName != "" &&
                          ownerName != "" &&
                          phoneNumber != "" &&
                          townCity != "" &&
                          pinCode != "" &&
                          districtNumber != 0) {
                        print("Submit");
                        print(uid);
                        dynamic result = await DatabaseService(uid: uid)
                            .addUser(companyName, ownerName, phoneNumber,
                                townCity, pinCode, districtNumber);
                        print(result);
                        if (result) {
                          // Send Verify Code via Phone number...

                          Navigator.pushNamed(context, OtpScreen.routeName);
                        } else {
                          if (!errors.contains(completeProfileError)) {
                            errors.add(completeProfileError);
                          }
                          return null;
                        }
                      } else {
                        return;
                      }
                    }
                  },
                  child: Text("Submit",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: Colors.white,
                      )),
                  color: Colors.tealAccent[400],
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(56),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  child: Text("Save Draft",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: Colors.white,
                      )),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildCompanyNameField() {
    return TextFormField(
      onSaved: (value) => companyName = value,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(companyNullError)) {
          setState(() {
            errors.remove(companyNullError);
          });
        }
        companyName = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(companyNullError)) {
          setState(() {
            errors.add(companyNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: textColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: textColor),
          gapPadding: 10,
        ),
      ),
    );
  }

  TextFormField buildOwnerNameField() {
    return TextFormField(
      onSaved: (value) => ownerName = value,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(ownerNullError)) {
          setState(() {
            errors.remove(ownerNullError);
            ownerName = value;
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(ownerNullError)) {
          setState(() {
            errors.add(ownerNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: textColor),
              gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: textColor),
              gapPadding: 10)),
    );
  }

  TextFormField buildPhoneNumberField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (value) => phoneNumber = value,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(phoneNumberNullError)) {
          setState(() {
            errors.remove(phoneNumberNullError);
            phoneNumber = value;
          });
          return null;
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(phoneNumberNullError)) {
          setState(() {
            errors.add(phoneNumberNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: textColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: textColor),
          gapPadding: 10,
        ),
      ),
    );
  }

  TextFormField buildTownCityField() {
    return TextFormField(
      onSaved: (value) => townCity = value,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(townCityNullError)) {
          setState(() {
            errors.remove(townCityNullError);
          });
          townCity = value;
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(townCityNullError)) {
          setState(() {
            errors.add(townCityNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: textColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: textColor),
          gapPadding: 10,
        ),
      ),
    );
  }

  TextFormField buildPinCodeField() {
    return TextFormField(
      onSaved: (value) => pinCode = value,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(pinCodeNullError)) {
          setState(() {
            errors.remove(pinCodeNullError);
          });
          pinCode = value;
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(pinCodeNullError)) {
          setState(() {
            errors.add(pinCodeNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: textColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: textColor),
          gapPadding: 10,
        ),
      ),
    );
  }
}
