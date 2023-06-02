import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/item_widget.dart';

class SearchScreen extends StatefulWidget {
  static const String id = "search_page";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: searchController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 45,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFFFF1F3),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    hintText: "Graphic illustration"),
                obscureText: false,
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Your search result",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(CupertinoIcons.slider_horizontal_3)
                ],
              ),
              const SizedBox(height: 35),
              const IconWidget(
                images: "assets/images/img_pencil.png",
                text_1: "Adobe illustrator for all\nbeginner artist",
                text_2: "Samule Doe",
                text_3: "4k student",
                text_4: "4.7",
              ),
              const SizedBox(height: 16),
              const IconWidget(
                images: "assets/images/img_banana.png",
                text_1: "Digital illustration technique\nfor procrete",
                text_2: "Sarrah Morry",
                text_3: "2k student",
                text_4: "4.0",
              ),
              const SizedBox(height: 16),
              const IconWidget(
                images: "assets/images/img_egg.png",
                text_1: "Learn how to draw cartoon\nface in easy way!",
                text_2: "Sarrah Morry",
                text_3: "1k student",
                text_4: "4.2",
              ),
              const SizedBox(height: 16),
              const IconWidget(
                images: "assets/images/img_home.png",
                text_1: "Sketch book essential\nfor everyone!",
                text_2: "Sarrah Morry",
                text_3: "2k student",
                text_4: "4.0",
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.home_outlined,
                    size: 40,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const Text(
                    "Search",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const Icon(
                    Icons.bookmark_border,
                    size: 40,
                    color: Colors.grey,
                  ),
                  const Icon(
                    Icons.perm_identity,
                    size: 40,
                    color: Colors.grey,
                  )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
