import 'package:movie_series_application/core/_core_exports.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton(this.text, {Key? key, this.buttonColor = AppColors.green}) : super(key: key);
  final String text;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: ScreenSize().getWidthPercent(.3),
        height: ScreenSize().getHeightPercent(.05),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: AppTextStyles.latoBold18Pt.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
