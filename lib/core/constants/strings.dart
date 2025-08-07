class Strings {
  const Strings._();

  /// App
  static const appName = 'Portfolio App';

  /// Common
  static const confirm = '확인';
  static const close = '닫기';
  static const logout = '로그아웃';
  static const login = '로그인';
  static const signup = '회원가입';
  static const cancel = '취소';
  static const save = '저장';
  static const delete = '삭제';
  static const edit = '수정';

  /// Main Page
  static const portfolio = '포트폴리오';
  static const assetAllocation = '자산 배분';
  static const legend = '범례';
  static const stock = '주식';
  static const bond = '채권';
  static const etc = '기타';
  static const cash = '현금';
  static const chartTooltip = '차트를 클릭하면 상세 정보를 확인할 수 있습니다';

  /// Auth
  static const email = '이메일';
  static const password = '비밀번호';
  static const confirmPassword = '비밀번호 확인';
  static const username = '사용자명';
  static const userId = '아이디';
  static const phone = '핸드폰 번호';
  static const alreadyHaveAccount = '이미 계정이 있으신가요? 로그인';
  static const dontHaveAccount = '계정이 없으신가요?';
  
  /// Auth Validation
  static const userIdHint = '아이디 (영문 7자 이상)';
  static const userIdHelper = '영문 7자 이상';
  static const passwordHelper = '영문 대소문자, 숫자, 특수문자 각 1글자 이상, 총 10자 이상';
  static const phoneHelper = '010-0000-0000 형식';
  static const emailHelper = 'example@email.com';

  /// Error Messages
  static const errorUnknown = '알 수 없는 오류가 발생했습니다.';
  static const errorLoginFailed = '로그인에 실패했습니다.';
  static const errorSignupFailed = '회원가입에 실패했습니다.';
  static const errorInvalidEmail = '올바른 이메일 형식이 아닙니다';
  static const errorPasswordMismatch = '비밀번호가 일치하지 않습니다.';
  static const errorPasswordTooShort = '비밀번호는 6자 이상이어야 합니다.';
  static const errorEmptyField = '필수 항목을 입력해주세요.';
  
  /// Auth Error Messages
  static const errorUserIdEmpty = '아이디를 입력해주세요';
  static const errorUserIdTooShort = '아이디는 7자 이상이어야 합니다';
  static const errorUserIdEnglishOnly = '아이디는 영문만 사용 가능합니다';
  static const errorPasswordEmpty = '비밀번호를 입력해주세요';
  static const errorPasswordTooShortSignup = '비밀번호는 10자 이상이어야 합니다';
  static const errorPasswordNoUppercase = '영문 대문자를 1글자 이상 포함해야 합니다';
  static const errorPasswordNoLowercase = '영문 소문자를 1글자 이상 포함해야 합니다';
  static const errorPasswordNoNumber = '숫자를 1글자 이상 포함해야 합니다';
  static const errorPasswordNoSpecial = '특수문자를 1글자 이상 포함해야 합니다';
  static const errorPhoneEmpty = '핸드폰 번호를 입력해주세요';
  static const errorPhoneInvalid = '올바른 핸드폰 번호 형식이 아닙니다 (010-0000-0000)';
  static const errorEmailEmpty = '이메일을 입력해주세요';

  /// Success Messages
  static const successLogin = '로그인되었습니다.';
  static const successSignup = '회원가입이 완료되었습니다!';
  static const successLogout = '로그아웃되었습니다.';

  /// Stock Page
  static const stockList = '전체 주식';
  static const stockDetails = '주식 상세';
  static const stockSymbol = '종목 코드';
  static const stockName = '종목명';
  static const quantity = '수량';
  static const ratio = '비율';
  static const description = '설명';
  static const assetList = '보유 자산 목록';
  static const totalAssets = '총';
  static const assetsUnit = '개 종목';
  static const stockDetailInfo = '상세 정보';
  static const unknown = '알수없음';

  /// Mock Data Labels
  static const testSecurityPrefix = '테스트를 위한 종목';
  static const testSecurityNamePrefix = 'test security';
}