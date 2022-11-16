import 'dart:convert';

import 'package:blue_print_pos_plus/receipt/receipt.dart';
import 'package:bluetooth_epos/bluetooth_epos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ChatBottomBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          elevation: 0.0,
          titleSpacing: 0.0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage("assets/images/person.jpg"),
              ),
              const SizedBox(
                width: 15,
              ),
              Text("Person"),
            ],
          ),
          actions: [
            Icon(Icons.video_call),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.call),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.more_vert),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 80),
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundImage: AssetImage('assets/images/person1.jpg'),
                    ),
                    title: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: const Text(
                        'This My First Message',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    trailing: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundImage: AssetImage('assets/images/person2.jpg'),
                    ),
                    title: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: const Text(
                        'This My First Message',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: "Message",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(
                        Icons.tag_faces,
                        color: Colors.white,
                      ),
                      splashRadius: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    suffixIcon: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.paperclip),
                      splashRadius: 24,
                    ),
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      color: Colors.white,
                    ),
                    splashRadius: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';

void main() => runApp(HtmlEditorExampleApp());

class HtmlEditorExampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'برنامج الطباعة',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: HtmlEditorExample(title: 'برنامج الطابعة - مسعد'),
    );
  }
}

class HtmlEditorExample extends StatefulWidget {
  HtmlEditorExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}


 /*connectToBluetooth() async {
  BluetoothManager bluetoothManager = BluetoothManager.instance;
  BluetoothDevice _device;

  bluetoothManager.startScan(timeout: Duration(seconds: 4));
  bluetoothManager.state.listen((state) {
    switch (State){
      case BluetoothManager.CONNECTED:
        break;
      case BluetoothManager.DISCONNECTED:
        break;
      default:
        break;
    }
  });

  await bluetoothManager.connect(_device);

  List<int> bytes = latin1.encode('Hello\n').toList();
  await bluetoothManager.writeData(bytes);

  await bluetoothManager.disconnect();
 }*/





Future<void> _OnPrintReceipt()async{
  final ByteData logoBytes = await rootBundle.load('assets/images/person.jpg');
  final ReceiptSectionText receiptText = ReceiptSectionText();
  receiptText.addImage(
      base64.encode(
          Uint8List.view(logoBytes.buffer)),
          width: 300,
  );
  receiptText.addSpacer();
  receiptText.addText(
    'EXCEED YOUR VISION',
    size: ReceiptTextSizeType.medium,
    style: ReceiptTextStyleType.bold,
  );
  receiptText.addText('MC Koo',size: ReceiptTextSizeType.small);
  receiptText.addSpacer(useDashed: true);
  receiptText.addLeftRightText('Time', '04/06/22, 10:30');
  receiptText.addSpacer(useDashed: true);
  receiptText.addLeftRightText(
    'Apple 4pcs',
    '\$ 10.00',
    leftStyle: ReceiptTextStyleType.normal,
    rightStyle: ReceiptTextStyleType.bold,
  );
  receiptText.addSpacer(useDashed: true);
  receiptText.addLeftRightText(
    'TOTAL',
    '\$ 10.00',
    leftStyle: ReceiptTextStyleType.normal,
    rightStyle: ReceiptTextStyleType.bold,
  );
  receiptText.addSpacer(useDashed: true);
  receiptText.addLeftRightText(
    'Payment',
    'Cash',
    leftStyle: ReceiptTextStyleType.normal,
    rightStyle: ReceiptTextStyleType.normal,
  );
  receiptText.addSpacer(count: 2);

}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {
  String result = '';
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 0,
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  if (kIsWeb) {
                    controller.reloadWeb();
                  } else {
                    controller.editorController!.reload();
                  }
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'اكتب هنا ...',
                  shouldEnsureVisible: true,
                  //initialText: "<p>text content initial, if any</p>",
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  toolbarPosition: ToolbarPosition.aboveEditor, //by default
                  toolbarType: ToolbarType.nativeScrollable, //by default
                  onButtonPressed:
                      (ButtonType type, bool? status, Function? updateStatus) {
                    print(
                        "button '${describeEnum(type)}' pressed, the current selected status is $status");
                    return true;
                  },
                  onDropdownChanged: (DropdownType type, dynamic changed,
                      Function(dynamic)? updateSelectedItem) {
                    print(
                        "dropdown '${describeEnum(type)}' changed to $changed");
                    return true;
                  },
                  mediaLinkInsertInterceptor:
                      (String url, InsertFileType type) {
                    print(url);
                    return true;
                  },
                  mediaUploadInterceptor:
                      (PlatformFile file, InsertFileType type) async {
                    print(file.name); //filename
                    print(file.size); //size in bytes
                    print(file.extension); //file extension (eg jpeg or mp4)
                    return true;
                  },
                ),
                otherOptions: OtherOptions(height: 550),
                callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
                  print('html before change is $currentHtml');
                }, onChangeContent: (String? changed) {
                  print('content changed to $changed');
                }, onChangeCodeview: (String? changed) {
                  print('code changed to $changed');
                }, onChangeSelection: (EditorSettings settings) {
                  print('parent element is ${settings.parentElement}');
                  print('font name is ${settings.fontName}');
                }, onDialogShown: () {
                  print('dialog shown');
                }, onEnter: () {
                  print('enter/return pressed');
                }, onFocus: () {
                  print('editor focused');
                }, onBlur: () {
                  print('editor unfocused');
                }, onBlurCodeview: () {
                  print('codeview either focused or unfocused');
                }, onInit: () {
                  print('init');
                },
                    //this is commented because it overrides the default Summernote handlers
                    /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                    onImageUploadError: (FileUpload? file, String? base64Str,
                        UploadError error) {
                      print(describeEnum(error));
                      print(base64Str ?? '');
                      if (file != null) {
                        print(file.name);
                        print(file.size);
                        print(file.type);
                      }
                    }, onKeyDown: (int? keyCode) {
                      print('$keyCode key downed');
                      print(
                          'current character count: ${controller.characterCount}');
                    }, onKeyUp: (int? keyCode) {
                      print('$keyCode key released');
                    }, onMouseDown: () {
                      print('mouse downed');
                    }, onMouseUp: () {
                      print('mouse released');
                    }, onNavigationRequestMobile: (String url) {
                      print(url);
                      return NavigationActionPolicy.ALLOW;
                    }, onPaste: () {
                      print('pasted into editor');
                    }, onScroll: () {
                      print('editor scrolled');
                    }),
                plugins: [
                  SummernoteAtMention(
                      getSuggestionsMobile: (String value) {
                        var mentions = <String>['test1', 'test2', 'test3'];
                        return mentions
                            .where((element) => element.contains(value))
                            .toList();
                      },
                      mentionsWeb: ['test1', 'test2', 'test3'],
                      onSelect: (String value) {
                        print(value);
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueGrey),
                      onPressed: () {
                        _OnPrintReceipt();
                        /*controller.addNotification('Plaintext notification',
                            NotificationType.plaintext);*/
                      },
                      child:
                      Text('طابعة', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
