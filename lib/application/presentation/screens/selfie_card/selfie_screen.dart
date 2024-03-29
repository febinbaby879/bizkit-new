import 'package:bizkit/application/presentation/screens/selfie_card/widgets/qr_scanner_view.dart';
import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:bizkit/application/presentation/screens/card_share/view/widgets/card_sharing_qr.dart';
import 'package:bizkit/application/presentation/screens/selfie_card/widgets/selfie_preview_screen.dart';
import 'package:flutter/material.dart';

class SelfieScreen extends StatefulWidget {
  const SelfieScreen({super.key});

  @override
  State<SelfieScreen> createState() => _SelfieScreenState();
}

class _SelfieScreenState extends State<SelfieScreen>
    with SingleTickerProviderStateMixin {
  final buttons = [
    'asset/images/camerFromgalleryIcon.png',
    'asset/images/Vector.png',
    'asset/images/ic_twotone-tap-and-play.png'
  ];
  final centerButtons = [
    'asset/images/solar_gallery-bold.png',
    'asset/images/camera select Icon.png',
    'asset/images/phone_connectivity_bold.png'
  ];
  int indexofButton = 1;
  int leftButton = 0;
  int rightButton = 2;

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: kwidth,
        height: double.infinity,
        decoration: indexofButton == 2
            ? const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/images/connecting_iphone.gif'),
                    fit: BoxFit.cover),
              )
            : null,
        child: ColoredBox(
          color: indexofButton == 2 ? kblack.withOpacity(0.8) : knill,
          child: Column(
            children: [
              adjustHieght(khieght * 0.10),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CardSharingScreen(),
                      ),
                    ),
                    child: CircleAvatar(
                      radius: kwidth * 0.080,
                      backgroundColor: textFieldFillColr,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('asset/images/bizkitIcon.png'),
                      ),
                    ),
                  ),
                ),
              ),
              adjustHieght(khieght * 0.05),
              indexofButton == 1
                  ? Column(
                      children: [
                        Container(
                          width: kwidth * 0.80,
                          height: kwidth * 0.60,
                          color: kwhite,
                          // build qr code scanner
                          child: const QrScannerView(),
                        ),
                        adjustHieght(10),
                        TextButton(
                            onPressed: () async {
                              // final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                              //   if (image == null) {
                              //     return; // Handle no image selected case
                              //   }
                              //   final file=File(image.path);
                              //   final barcodeScanner = BarcodeScannerPlugin();
                              //   List<Barcode> barcodes =
                              //       await barcodeScanner.scan(file
                              //           .path); // Replace with _image!.path

                              //   if (barcodes.isEmpty) {
                              //     print('No QR codes found in the image.');
                              //   } else {
                              //     // Process the extracted data (first barcode assumed):
                              //     final data = barcodes[0].displayValue;
                              //     print('Extracted QR code data: $data');
                              //     // Use the extracted data as needed in your app
                              //   }
                            },
                            child: const Text('Upload from gallery'))
                      ],
                    )
                  : const SizedBox(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  scannerButton(image: buttons[leftButton], left: true),
                  InkWell(
                    splashColor: neonShade,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelfiePreviewScreen(),
                        ),
                      );
                    },
                    customBorder: const CircleBorder(),
                    child: FadeTransition(
                      opacity: _controller,
                      child: Container(
                        padding: const EdgeInsets.all(35),
                        width: kwidth * 0.28,
                        height: kwidth * 0.28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kwidth * 0.2),
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                              'asset/images/cameraSelectBackground.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Image.asset(
                          centerButtons[indexofButton],
                        ),
                      ),
                    ),
                  ),
                  scannerButton(image: buttons[rightButton], left: false)
                ],
              ),
              adjustHieght(khieght * 0.05)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget scannerButton({required String image, required bool left}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.forward(from: 0.5);
          if (left) {
            int temp = leftButton;
            leftButton = indexofButton;
            indexofButton = temp;
          } else {
            int temp = rightButton;
            rightButton = indexofButton;
            indexofButton = temp;
          }
        });
      },
      child: FadeTransition(
        opacity: _controller,
        child: Container(
          width: kwidth * 0.13,
          height: kwidth * 0.13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(kwidth * 0.1)),
            border: Border.all(
              color: neonShade,
              width: kwidth * 0.003,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}
