import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymobWebView extends StatefulWidget {
  final String paymentUrl;

  const PaymobWebView({super.key, required this.paymentUrl});

  @override
  State<PaymobWebView> createState() => _PaymobWebViewState();
}

class _PaymobWebViewState extends State<PaymobWebView> {
  late final WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            setState(() => isLoading = false);

            // ✅ detect success/failure
            if (url.contains("success")) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("✅ Payment Successful")),
              );
              Navigator.pop(context, true);
            } else if (url.contains("fail") || url.contains("failed")) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("❌ Payment Failed")));
              Navigator.pop(context, false);
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paymob Checkout")),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
