import '../../features/portfolio/domain/entities/asset.dart';

class MockData {
  const MockData._();

  static List<Asset> get assets => [
    const Asset(
      securitySymbol: "TEST1",
      type: "stock",
      securityDescription: "테스트를 위한 종목1",
      quantity: 1,
      ratio: 10.05,
      securityName: "test security 1",
    ),
    const Asset(
      securitySymbol: "TEST2",
      type: "stock",
      securityDescription: "테스트를 위한 종목2",
      quantity: 1,
      ratio: 8.03,
      securityName: "test security 2",
    ),
    const Asset(
      securitySymbol: "TEST3",
      type: "stock",
      securityDescription: "테스트를 위한 종목3",
      quantity: 1,
      ratio: 6.5,
      securityName: "test security 3",
    ),
    const Asset(
      securitySymbol: "TEST4",
      type: "stock",
      securityDescription: "테스트를 위한 종목4",
      quantity: 1,
      ratio: 8.5,
      securityName: "test security 4",
    ),
    const Asset(
      securitySymbol: "TEST5",
      type: "bond",
      securityDescription: "테스트를 위한 종목5",
      quantity: 3,
      ratio: 9.5,
      securityName: "test security 5",
    ),
    const Asset(
      securitySymbol: "TEST6",
      type: "bond",
      securityDescription: "테스트를 위한 종목6",
      quantity: 1,
      ratio: 8.5,
      securityName: "test security 6",
    ),
    const Asset(
      securitySymbol: "TEST7",
      type: "bond",
      securityDescription: "테스트를 위한 종목7",
      quantity: 1,
      ratio: 13.42,
      securityName: "test security 7",
    ),
    const Asset(
      securitySymbol: "usd_cash",
      type: "etc",
      securityDescription: "현금",
      quantity: 1,
      ratio: 35.5,
      securityName: "cash",
    ),
  ];
}