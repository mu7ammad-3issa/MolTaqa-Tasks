import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed/core/helpers/base_extensions/context/navigation.dart';
import 'package:seed/core/helpers/base_extensions/context/padding.dart';
import 'package:seed/core/helpers/helper_methods/spacing.dart';
import 'package:seed/core/theming/app_styles.dart';
import 'package:seed/core/theming/colors_manager.dart';
import 'package:seed/core/widgets/app_text_button.dart';

class TermsAndConditionDialog extends StatelessWidget {
  final VoidCallback onAccept;

  const TermsAndConditionDialog({super.key, required this.onAccept});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        padding: context.symmetric(vertical: 35.h, horizontal: 16.5.w),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FractionallySizedBox(
              widthFactor: 1.15,
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    Icons.close,
                    color: ColorsManager.textSecondary,
                    size: 24.r,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
            ),
            Text(
              'الموافقه علي الشروط والاحكام',
              style: AppStyles.font16TextPrimaryHeavy,
              textDirection: TextDirection.rtl,
            ),
            verticalSpace(16),
            Text(
              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.\nإذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع , هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.',
              style: AppStyles.font14TextSecondaryMedium,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            verticalSpace(24),
            AppTextButton(
              buttonText: 'الموافقه',
              onPressed: () {
                onAccept();
                context.pop();
              },
              buttonWidth: 295.w,
              buttonHeight: 48.h,
            ),
          ],
        ),
      ),
    );
  }
}
