import 'package:flutter/material.dart';
import 'package:learn_flutter_app/src/res/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter_app/src/view/Create_note.dart';
import 'package:learn_flutter_app/src/view/widgets/empty_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.appName,
                      style: GoogleFonts.poppins(fontSize: 24)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isListView = !isListView;
                      });
                    },
                    icon:
                        Icon(isListView ? Icons.splitscreen : Icons.grid_view),
                  ),
                ],
              ),
            ),
            EmptyView(),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreateNoteView()));
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
