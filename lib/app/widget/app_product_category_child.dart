import 'package:apotech_apps/app/const/app_assets.dart';
import 'package:apotech_apps/app/const/app_sizes.dart';
import 'package:apotech_apps/app/theme/app_colors.dart';
import 'package:apotech_apps/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ProductCategoryChild extends StatefulWidget {
  final String? image;
  final String? title;
  final String? price;
  final String? rate;
  final bool isLabel;
  final String? labelText;
  final Color? labelColor;

  const ProductCategoryChild({
    super.key,
    this.image,
    this.price,
    this.rate,
    this.title,
    this.isLabel = false,
    this.labelColor,
    this.labelText,
  });

  @override
  State<ProductCategoryChild> createState() => _ProductCategoryChildState();
}

class _ProductCategoryChildState extends State<ProductCategoryChild> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 13,
            offset: Offset(0, 3),
            spreadRadius: 0,
          )
        ],
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        splashColor: AppColors.base.withOpacity(0.20),
        onTap: () {},
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ink(
                  decoration: const BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.padding * 1.5,
                      vertical: AppSizes.padding,
                    ),
                    child: Image.asset(
                      widget.image ?? AppAssets.imageOnboard1Path,
                      scale: 1,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSizes.height),
                    Padding(
                      padding: const EdgeInsets.only(left: AppSizes.padding / 2),
                      child: SizedBox(
                        child: Text(
                          widget.title ?? '',
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: AppTextStyle.medium(
                            context,
                            fontSize: 13,
                            color: AppColors.purple,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.height),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: AppSizes.padding / 2),
                            child: Text(
                              widget.price ?? '',
                              style: AppTextStyle.bold(
                                context,
                                fontSize: 14,
                                color: AppColors.purple,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(AppSizes.padding / 4),
                            decoration: const BoxDecoration(
                                color: AppColors.yellow,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                )),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.white,
                                  size: 16,
                                ),
                                Text(
                                  widget.rate ?? '',
                                  style: AppTextStyle.bold(
                                    context,
                                    fontSize: 16,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSizes.height),
                  ],
                ),
              ],
            ),
            widget.isLabel
                ? ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                    child: InvertedRightAngledTriangle(
                      color: widget.labelColor,
                      text: widget.labelText,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class InvertedRightAngledTriangle extends StatelessWidget {
  final Color? color;
  final String? text;

  const InvertedRightAngledTriangle({
    super.key,
    this.color,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 60,
          height: 60,
          child: Transform.rotate(
            angle: 40.84,
            child: CustomPaint(
              painter: InvertedRightAngledTrianglePainter(
                color: color,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSizes.padding / 1.5),
          child: Transform.rotate(
            angle: 80.9,
            child: Text(
              text ?? '15% OFF',
              style: AppTextStyle.bold(
                context,
                fontSize: 10,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InvertedRightAngledTrianglePainter extends CustomPainter {
  final Color? color;

  const InvertedRightAngledTrianglePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color ?? Colors.blue
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
