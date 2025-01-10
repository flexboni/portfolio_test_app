# 📱 Portfolio Management App

> **Clean Architecture + Riverpod**를 활용한 포트폴리오 관리 Flutter 앱

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.x-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

## 🎯 프로젝트 개요

개인 투자 포트폴리오를 관리하고 분석할 수 있는 모바일 앱입니다. **Clean Architecture** 패턴과 **Riverpod** 상태 관리를 통해 확장 가능하고 테스트하기 쉬운 구조로 설계되었습니다.

### ✨ 주요 기능
- 🔐 **사용자 인증** (회원가입/로그인)
- 📊 **포트폴리오 관리** (자산 추가/수정/삭제)
- 📈 **차트 시각화** (자산 배분 원형 차트)
- 💾 **로컬 데이터 저장** (SharedPreferences + 암호화)
- 🔒 **보안** (SHA-256 비밀번호 해싱)

## 🏗️ 아키텍처

### Clean Architecture 3-Layer 구조

```
┌─────────────────────────────────────┐
│         Presentation Layer          │  ← UI, State Management
│   Pages │ Providers │ States        │
└─────────────────────────────────────┘
                  ▲
┌─────────────────────────────────────┐
│           Domain Layer              │  ← Business Logic
│  Entities │ Use Cases │ Repositories │
└─────────────────────────────────────┘
                  ▲
┌─────────────────────────────────────┐
│            Data Layer               │  ← Data Access
│ Repositories │ DataSources │ Models │
└─────────────────────────────────────┘
```

### 핵심 디자인 패턴
- **Repository Pattern**: 데이터 접근 추상화
- **Use Case Pattern**: 비즈니스 로직 캡슐화  
- **Provider Pattern**: 의존성 주입 (Riverpod)
- **State Pattern**: 상태 관리 (Freezed)

## 🛠️ 기술 스택

### Frontend
- **Flutter** 3.x - 크로스 플랫폼 프레임워크
- **Dart** 3.x - 프로그래밍 언어
- **Riverpod** 2.5+ - 상태 관리 및 의존성 주입
- **Go Router** - 선언적 라우팅
- **Freezed** - 코드 생성 (모델, 상태)

### UI/UX
- **FL Chart** - 차트 라이브러리
- **Material Design** 3 - 디자인 시스템
- **반응형 디자인** - 다양한 화면 크기 지원

### 데이터 & 보안
- **SharedPreferences** - 로컬 저장소
- **crypto** - SHA-256 해싱
- **JSON Serialization** - 데이터 직렬화

## 📁 프로젝트 구조

```
lib/
├── core/                          # 공통 기능
│   ├── constants/                 # 상수 (색상, 문자열, 저장소 키)
│   ├── error/                     # 에러 처리
│   ├── providers/                 # 의존성 주입
│   └── router/                    # 라우팅 설정
├── features/                      # 기능별 모듈
│   ├── auth/                      # 인증 기능
│   │   ├── data/                  # 데이터 계층
│   │   │   ├── datasources/       # 데이터 소스 (Local/Remote)
│   │   │   ├── models/            # 데이터 모델
│   │   │   └── repositories/      # 저장소 구현체
│   │   ├── domain/                # 도메인 계층
│   │   │   ├── entities/          # 비즈니스 엔티티
│   │   │   ├── repositories/      # 저장소 인터페이스
│   │   │   └── usecases/          # 비즈니스 로직
│   │   └── presentation/          # 프레젠테이션 계층
│   │       ├── pages/             # UI 화면
│   │       ├── providers/         # 상태 관리
│   │       └── states/            # 상태 정의
│   └── portfolio/                 # 포트폴리오 기능
│       └── [같은 구조]
├── shared/                        # 공유 컴포넌트
└── main.dart                      # 앱 진입점
```

## 🚀 시작하기

### 필요 조건
- Flutter 3.0+
- Dart 3.0+
- Android Studio / VS Code
- iOS 개발용: Xcode (macOS)

### 설치 및 실행

```bash
# 저장소 클론
git clone https://github.com/username/portfolio_test_app.git
cd portfolio_test_app

# 의존성 설치
flutter pub get

# 코드 생성 (Freezed, Riverpod)
dart run build_runner build --delete-conflicting-outputs

# 앱 실행
flutter run
```

### 플랫폼별 실행
```bash
# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d web
```

## 📱 주요 화면

### 인증 플로우
- **로그인 페이지**: 사용자 ID, 비밀번호 입력
- **회원가입 페이지**: 사용자 정보 등록 (유효성 검증 포함)

### 포트폴리오 관리
- **메인 페이지**: 포트폴리오 요약 및 원형 차트
- **자산 목록 페이지**: 보유 자산 상세 리스트

### 인증 규칙
- **사용자 ID**: 영문 7자 이상
- **비밀번호**: 영문 대소문자, 숫자, 특수문자 포함 10자 이상
- **이메일**: 유효한 이메일 형식
- **전화번호**: 010-XXXX-XXXX 형식

## 🔐 보안 기능

### 비밀번호 보안
```dart
// SHA-256 해싱으로 안전한 비밀번호 저장
String _hashPassword(String password) {
  var bytes = utf8.encode(password);
  var digest = sha256.convert(bytes);
  return digest.toString();
}
```

### 데이터 저장
- **분리 저장**: 사용자 데이터와 비밀번호 해시 분리
- **키 관리**: StorageKeys 클래스로 중앙 관리
- **검증 로직**: 실제 회원가입 정보 기반 로그인

## 📊 상태 관리

### Riverpod 기반 상태 관리
```dart
@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated(User user) = AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
  const factory AuthState.error(Failure failure) = AuthError;
}
```

### 의존성 주입
```dart
// 계층적 의존성 주입
SharedPreferences → AuthLocalDataSource → AuthRepository → UseCase → UI
```

## 🧪 테스트

```bash
# 단위 테스트 실행
flutter test

# 위젯 테스트 실행
flutter test test/widget_test.dart

# 통합 테스트 실행
flutter test integration_test/
```

## 📈 성능 최적화

- **코드 생성**: Freezed, Riverpod Generator 활용
- **상태 최적화**: Riverpod의 자동 메모이제이션
- **빌드 최적화**: const 생성자 적극 활용
- **레이지 로딩**: Provider 기반 지연 초기화

## 🔧 개발 도구

### 추천 VS Code 확장
- Flutter
- Dart
- Riverpod Snippets
- Flutter Widget Snippets
- Error Lens

### 유용한 명령어
```bash
# 코드 분석
flutter analyze

# 코드 포맷팅
dart format .

# 의존성 업데이트
flutter pub upgrade

# 빌드 (Release)
flutter build apk
flutter build ios
```

## 🚦 Git 커밋 컨벤션

```bash
feat: 새로운 기능 추가
fix: 버그 수정  
refactor: 코드 리팩토링
docs: 문서 수정
test: 테스트 추가/수정
chore: 빌드 프로세스, 도구 설정
```

## 🎯 향후 개발 계획

### Phase 1 - 기본 기능 완성 ✅
- [x] Clean Architecture 구조 설계
- [x] 사용자 인증 시스템
- [x] 로컬 데이터 저장
- [x] 포트폴리오 UI

### Phase 2 - API 연동 🔄
- [ ] Backend API 서버 구축
- [ ] HTTP 통신 (Dio) 연동
- [ ] JWT 토큰 관리
- [ ] 실시간 주가 데이터 연동

### Phase 3 - 고도화 🚀
- [ ] 푸시 알림
- [ ] 다크 테마
- [ ] 다국어 지원 (i18n)
- [ ] 오프라인 지원
- [ ] 백업/복원 기능

## 📄 라이선스

MIT License - 자세한 내용은 [LICENSE](LICENSE) 파일을 참고하세요.

## 👨‍💻 개발자

**flexboni** - [GitHub](https://github.com/flexboni)

## 🤝 기여하기

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'feat: Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

> 💡 **Clean Architecture**와 **Riverpod**를 학습하고 실습하기 위한 프로젝트입니다.  
> 실제 투자 결정에 사용하지 마세요.
