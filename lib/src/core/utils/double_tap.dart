DateTime? loginClickTime;

bool isRedundentClick(DateTime currentTime) {
  if (loginClickTime == null) {
    loginClickTime = currentTime;
    return false;
  }
  if (currentTime.difference(loginClickTime!).inSeconds < 3) {
    return true;
  }

  loginClickTime = currentTime;
  return false;
}
