import 'package:flutter/material.dart';
import 'package:untitled1/search%20result%20screen/Search-result_screen.dart';

class Search extends StatelessWidget {
   Search({super.key});
   TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller:controller ,
                onFieldSubmitted: (value) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchresultScreen(query: value),
                    ),
                  );
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        controller.clear();
                      },
                      child: Icon(Icons.close)),
                  filled: true,
                  fillColor: Color(0xffF0EFF0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xffF0EFF0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff0088FF)),
                  ),

                  hintText: 'Search',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextButton(onPressed: () {
              controller.clear();
            }, child: Text('Cancel')),
          ],
        ),

      ),
    );
  }
}
