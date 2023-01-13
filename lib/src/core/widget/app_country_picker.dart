import 'package:carrier_info/carrier_info.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class AppCountryPicker extends StatefulWidget {
  final ValueChanged<CountryCode?>? onCountryPicked;

  AppCountryPicker({required Key key, this.onCountryPicked}) : super(key: key);

  @override
  _AppCountryPickerState createState() => _AppCountryPickerState();
}

class _AppCountryPickerState extends State<AppCountryPicker> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CarrierInfo.getAndroidInfo(),
      builder:
          (BuildContext context, AsyncSnapshot<AndroidCarrierData?> snapshot) {
        if (snapshot.hasData) {
          return CountryCodePicker(
            onChanged: widget.onCountryPicked,
            initialSelection: snapshot.data?.telephonyInfo.first.isoCountryCode,
            showFlagDialog: false,
            onInit: widget.onCountryPicked,
          );
        } else {
          return CountryCodePicker(
            onChanged: widget.onCountryPicked,
            initialSelection: WidgetsBinding.instance.window.locale.countryCode,
            showFlagDialog: false,
            onInit: widget.onCountryPicked,
          );
        }
      },
    );
  }
}
