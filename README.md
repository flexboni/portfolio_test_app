# Portfolio Test App

AIM 모바일 앱 개발자 코딩테스트를 위한 포트폴리오 관리 Flutter 앱입니다.

## 🚀 주요 기능

### 1. 사용자 인증
- **회원가입**: ID/비밀번호/핸드폰/이메일 유효성 검증
  - ID: 영문 7자 이상
  - 비밀번호: 영문 대소문자, 숫자, 특수문자 각 1글자 이상, 총 10자 이상
  - 핸드폰: 010-0000-0000 형식
  - 이메일: 표준 이메일 형식
- **로그인**: 간단한 ID/비밀번호 인증
- **자동 로그인**: 앱 재실행 시 로그인 상태 유지

### 2. 포트폴리오 시각화
- **메인 화면**: 자산 배분 원형 차트 (FL Chart 사용)
- **차트 클릭**: 전체 종목 상세 화면으로 이동
- **종목별 색상**: 주식(파랑), 채권(초록), 기타(주황)

### 3. 자산 목록
- **전체 종목 리스트**: 보유 자산의 상세 정보
- **종목별 정보**: 이름, 심볼, 타입, 비율, 수량, 설명

## 🏗️ 기술 스택

- **Framework**: Flutter 3.x
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **Charts**: FL Chart
- **Local Storage**: SharedPreferences
- **Architecture**: Clean Architecture
- **Code Generation**: Freezed, JSON Serializable

## 📁 프로젝트 구조

```
lib/
├── core/                    # 핵심 공통 기능
│   ├── router/             # 라우팅 설정
│   ├── constants/          # 상수
│   └── utils/             # 유틸리티
├── features/              # 기능별 모듈
│   ├── auth/              # 인증 관련
│   │   ├── data/          # 데이터 레이어
│   │   ├── domain/        # 도메인 레이어
│   │   └── presentation/  # UI 레이어
│   └── portfolio/         # 포트폴리오 관련
│       ├── data/
│       ├── domain/
│       └── presentation/
└── shared/               # 공유 컴포넌트
    ├── services/         # 공통 서비스
    └── widgets/          # 공통 위젯
```

## 🚀 실행 방법

### 1. 의존성 설치
```bash
flutter pub get
dart run build_runner build
```

### 2. 앱 실행
```bash
flutter run
```

## 📱 사용 방법

1. **회원가입**: 앱 실행 후 회원가입 버튼 클릭하여 계정 생성
2. **로그인**: 생성한 계정으로 로그인
3. **포트폴리오 확인**: 메인 화면에서 자산 배분 차트 확인
4. **상세 정보**: 차트 클릭하여 전체 종목 목록 확인
5. **로그아웃**: 우상단 로그아웃 버튼 클릭

## 📊 샘플 데이터

앱에는 코딩테스트 요구사항의 JSON 데이터가 하드코딩되어 있습니다:
- 주식 4종목 (TEST1-4)
- 채권 3종목 (TEST5-7) 
- 현금 1종목 (USD_CASH)

## ⚠️ 주의사항

- 이 앱은 코딩테스트용으로 제작되었습니다
- 실제 백엔드 API 연동은 포함되지 않았습니다
- 사용자 데이터는 로컬에만 저장됩니다

## 🔧 개발 환경

- Flutter SDK: 3.x
- Dart: 3.x
- 플랫폼: iOS, Android
- IDE: VS Code / Android Studio

---

**개발자**: [개발자명]  
**개발 기간**: 2024.09.08  
**연락처**: [이메일]
