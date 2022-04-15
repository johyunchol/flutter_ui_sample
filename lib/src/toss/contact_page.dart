import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.all(12.0), child: Icon(Icons.search, color: Colors.white24)),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: '검색/직접 입력',
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                      disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.2), shape: BoxShape.circle),
                      child: Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.person, color: Colors.blue.withOpacity(0.6))),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [Text('김김김', style: TextStyle(color: Colors.white)), SizedBox(height: 4), Text('김김김', style: TextStyle(color: Colors.grey))],
                      ),
                    )
                  ],
                );
              },
              padding: const EdgeInsets.all(24),
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 24),
              itemCount: 30),
        ),
      ],
    );
  }
}
