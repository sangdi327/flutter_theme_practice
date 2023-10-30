import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:theme_practice/components/appfont.dart';
import 'package:theme_practice/components/my_button.dart';
import 'package:theme_practice/components/my_drawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 15,
              ),
              Desciption(),
              SizedBox(
                height: 15,
              ),
              AgreementBox(),
              SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                child: MyButton(
                  onPressed: () {},
                  text: '동의 후 다음 페이지로',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.55,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset(
              'assets/svg/icon_drawer.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
          Center(
            child: Image.asset('assets/images/card_image.png'),
          ),
        ],
      ),
    );
  }
}

class Desciption extends StatelessWidget {
  const Desciption({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Appfont(
          '원활한 재무 관리를 위한',
          size: 25,
          fontWeight: FontWeight.w100,
          letterSpacing: -0.5,
          lineHeight: 1.2,
        ),
        Appfont(
          '모바일 뱅킹',
          size: 29,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
          lineHeight: 1.2,
        ),
        SizedBox(height: 20),
        Appfont(
          '재무 워크플로를 간소화하기 위해 예산 책정 앱 및 비용 추적기와 같은 인기 있는 재무 관리 도구 및 서비스와 원활하게 통합됩니다',
          size: 11,
          letterSpacing: -0.5,
          lineHeight: 1.2,
        ),
      ],
    );
  }
}

class AgreementBox extends StatefulWidget {
  const AgreementBox({super.key});

  @override
  State<AgreementBox> createState() => _AgreementBoxState();
}

class _AgreementBoxState extends State<AgreementBox> {
  bool isCheckedTermsOfUse = false;
  bool isCheckedPrivacyPolicy = false;
  bool isCheckedMarketing = false;

  Widget agreementBoxWidget({
    required bool isChecked,
    required String text,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              isChecked
                  ? 'assets/svg/icon_radio_on.svg'
                  : 'assets/svg/icon_radio_off.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).textTheme.labelMedium!.color!,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Appfont(
                text,
                size: 17,
                color: isChecked
                    ? Theme.of(context).textTheme.labelMedium!.color
                    : const Color(0xff717171),
              ),
            ),
            SvgPicture.asset('assets/svg/icon_back.svg'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardTheme.color,
      ),
      child: Column(
        children: [
          agreementBoxWidget(
            isChecked: isCheckedTermsOfUse,
            text: '이용약관',
            onTap: () {
              setState(() {
                isCheckedTermsOfUse = !isCheckedTermsOfUse;
              });
            },
          ),
          const Divider(
            height: 1,
          ),
          agreementBoxWidget(
            isChecked: isCheckedPrivacyPolicy,
            text: '개인정보 처리방침',
            onTap: () {
              setState(() {
                isCheckedPrivacyPolicy = !isCheckedPrivacyPolicy;
              });
            },
          ),
          const Divider(
            height: 1,
          ),
          agreementBoxWidget(
            isChecked: isCheckedMarketing,
            text: '마케팅정보 수신 동의',
            onTap: () {
              setState(() {
                isCheckedMarketing = !isCheckedMarketing;
              });
            },
          ),
        ],
      ),
    );
  }
}
