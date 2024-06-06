//store_register_page.dart
import 'package:flutter/material.dart';
import 'home_page.dart';

class StoreRegisterPage extends StatefulWidget {
  const StoreRegisterPage({super.key});

  @override
  StoreRegisterPageState createState() => StoreRegisterPageState();
}

class StoreRegisterPageState extends State<StoreRegisterPage> {
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController storeLocationController = TextEditingController();
  final TextEditingController storePhoneController = TextEditingController();
  final TextEditingController businessNumberController =
  TextEditingController();
  final TextEditingController ownerPhoneController = TextEditingController();
  final TextEditingController storeTypeController = TextEditingController();
  final TextEditingController avgPriceController = TextEditingController();
  final TextEditingController menuFileController = TextEditingController();
  final TextEditingController layoutFileController = TextEditingController();
  final TextEditingController maxCapacityController = TextEditingController();
  final TextEditingController storeFeaturesController = TextEditingController();

  String profileImage = 'assets/iamges/default_profile.jpeg';

  void updateProfileImage() {
    setState(() {
      profileImage = 'assets/iamges/setting_profile.jpg';
    });
  }

  void registerStore() {
    String storeName = storeNameController.text;
    String ownerName = ownerNameController.text;
    String storeLocation = storeLocationController.text;
    String storePhone = storePhoneController.text;
    String businessNumber = businessNumberController.text;
    String ownerPhone = ownerPhoneController.text;
    String storeType = storeTypeController.text;
    String avgPrice = avgPriceController.text;
    String menuFile = menuFileController.text;
    String layoutFile = layoutFileController.text;
    String maxCapacity = maxCapacityController.text;
    String storeFeatures = storeFeaturesController.text;

    if (storeName.isEmpty ||
        ownerName.isEmpty ||
        storeLocation.isEmpty ||
        storePhone.isEmpty ||
        businessNumber.isEmpty ||
        ownerPhone.isEmpty ||
        storeType.isEmpty ||
        avgPrice.isEmpty ||
        menuFile.isEmpty ||
        layoutFile.isEmpty ||
        maxCapacity.isEmpty ||
        storeFeatures.isEmpty) {
      _showError("紐⑤뱺 �븘�뱶瑜� 梨꾩썙 二쇱꽭�슂.");
    } else {
      // 紐⑤뱺 �엯�젰�씠 �셿猷뚮맂 寃쎌슦, DB�뿉 ����옣�븯�뒗 遺�遺� 援ы쁽 �븘�슂
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // �쟾�솕踰덊샇 諛� 媛�寃� �삎�떇 �옄�룞 異붽�� �븿�닔
  String formatPhoneNumber(String text) {
    if (text.length >= 11) {
      return '${text.substring(0, 3)}-${text.substring(3, 7)}-${text.substring(7, 11)}';
    }
    return text;
  }

  String formatCurrency(String text) {
    return '�빟 ${text.replaceAll(RegExp(r'[^\\d]'), '')}�썝';
  }

  String formatCapacity(String text) {
    return '${text.replaceAll(RegExp(r'[^\\d]'), '')}紐�';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: updateProfileImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(profileImage),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: updateProfileImage,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "留ㅼ옣 �젙蹂�",
                    style:
                    TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: storeNameController,
                    decoration: const InputDecoration(
                      labelText: "留ㅼ옣 �씠由�",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: ownerNameController,
                    decoration: const InputDecoration(
                      labelText: "�젏二쇰떂 �꽦�븿",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: storeLocationController,
                    decoration: const InputDecoration(
                      labelText: "留ㅼ옣 �쐞移�",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: storePhoneController,
                    keyboardType: TextInputType.phone,
                    onChanged: (text) {
                      storePhoneController.value = TextEditingValue(
                        text: formatPhoneNumber(text),
                        selection: TextSelection.collapsed(
                            offset: formatPhoneNumber(text).length),
                      );
                    },
                    decoration: const InputDecoration(
                      labelText: "留ㅼ옣 踰덊샇",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: businessNumberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "�궗�뾽�옄 踰덊샇",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: ownerPhoneController,
                    keyboardType: TextInputType.phone,
                    onChanged: (text) {
                      ownerPhoneController.value = TextEditingValue(
                        text: formatPhoneNumber(text),
                        selection: TextSelection.collapsed(
                            offset: formatPhoneNumber(text).length),
                      );
                    },
                    decoration: const InputDecoration(
                      labelText: "�젏二쇰떂 踰덊샇",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: storeTypeController,
                    decoration: const InputDecoration(
                      labelText: "留ㅼ옣 �쑀�삎",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: avgPriceController,
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      avgPriceController.value = TextEditingValue(
                        text: formatCurrency(text),
                        selection: TextSelection.collapsed(
                            offset: formatCurrency(text).length),
                      );
                    },
                    decoration: const InputDecoration(
                      labelText: "�룊洹� �슂由� 媛�寃�",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: menuFileController,
                    decoration: const InputDecoration(
                      labelText: "�뙆�씪泥⑤��",
                      suffixIcon: Icon(Icons.attach_file),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: layoutFileController,
                    decoration: const InputDecoration(
                      labelText: "�뙆�씪泥⑤��",
                      suffixIcon: Icon(Icons.attach_file),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: maxCapacityController,
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      maxCapacityController.value = TextEditingValue(
                        text: formatCapacity(text),
                        selection: TextSelection.collapsed(
                            offset: formatCapacity(text).length),
                      );
                    },
                    decoration: const InputDecoration(
                      labelText: "理쒕�� �닔�슜 �씤�썝",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: storeFeaturesController,
                    decoration: const InputDecoration(
                      labelText: "留ㅼ옣 �듅吏�",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: const Text("痍⑥냼"),
                      ),
                      ElevatedButton(
                        onPressed: registerStore,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text("�떊泥�"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
