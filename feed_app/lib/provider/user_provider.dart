import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class UserProvider extends ChangeNotifier {
  //로그인 정보
  late User _userInfo;

  //로그인 상태
  bool _loginStat = false;

  //전역변수로 지정!
  //이 형태를 취하지 않으면 가져와 사용할 수 없습니다.
  //get : getter + notifyListener
  User get userInfo => _userInfo;
  bool get isLogin => _loginStat;

  //카카오 로그인 요청 메소드
  Future<void> kakaoLogin() async {
    try {
      //loginWithKakaoTalk()는 카카오톡 어플을 열어버립니다.
      // OAuthToken token = await UserApi.instance.loginWithKakaoTalk();

      //로그인 요청 -> token
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      print('로그인 성공...');
      print(token.accessToken);
      _loginStat = true;

      getUserInfo();
    } catch (e) {
      print('로그인 실패...');
      print(await KakaoSdk.origin);
      print(e);
    }
    //공유된 상태를 가진 위젯 다시 빌드
    //❤❤이게 없으면 프로바이더 하위 페이지들이 프로바이더에 대한 반응을 하지 않습니다!!!!!!!
    notifyListeners();
  }
  Future<void> kakaoTalkLogin() async {
    try {
      //loginWithKakaoTalk()는 카카오톡 어플을 열어버립니다.
      // OAuthToken token = await UserApi.instance.loginWithKakaoTalk();

      //로그인 요청 -> token
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('로그인 성공...');
      print(token.accessToken);
      _loginStat = true;

      getUserInfo();
    } catch (e) {
      print('로그인 실패...');
      print(e);
    }
    //공유된 상태를 가진 위젯 다시 빌드
    //❤❤이게 없으면 프로바이더 하위 페이지들이 프로바이더에 대한 반응을 하지 않습니다!!!!!!!
    notifyListeners();
  }

  Future<void> getUserInfo() async {
    _userInfo = await UserApi.instance.me();
    print('사용자 정보 요청 성공');
    print('id ${_userInfo.id}');
    print('nickname ${_userInfo.kakaoAccount?.profile?.nickname}');
    print('profileImage ${_userInfo.kakaoAccount?.profile?.profileImageUrl}');
    // String? profileNickname = jsonData['profile_nickname'];
    // var profileImage = jsonData['profile_image'];
  }

  Future<void> loginCheck() async {
    //💥비로그인
    if (!_loginStat) return;

    //✳로그인
    if (await AuthApi.instance.hasToken()) {
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print('토큰 유효성 체크 성공 ${tokenInfo.id} - ${tokenInfo.expiresIn}');
      } catch (e) {
        print('토큰 유효성 체크 과정에서 문제가 발생했습니다.');
        if (e is KakaoException && e.isInvalidTokenError()) {
          print('토큰이 만료되었습니다. ${e}');
        } else {
          print('토큰 정보 확인에 실패하여습니다. ${e}');
        }
        _loginStat = false;
      }
    } else {
      print('발급된 토큰이 없습니다.');
      _loginStat = false;
    }
    notifyListeners();
  }
}
