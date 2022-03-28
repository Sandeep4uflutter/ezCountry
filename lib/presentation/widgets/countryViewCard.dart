import 'package:flutter/material.dart';
import '../../models/model.dart';

class CountryViewCard extends StatefulWidget {
  const CountryViewCard({Key? key, required this.countryName,
    required this.countryCode, required this.flag, required this.languages}) : super(key: key);
  final String countryName;
  final String countryCode;
  final String flag;
  final List<Language> languages;

  @override
  State<CountryViewCard> createState() => _CountryViewCardState();
}
class _CountryViewCardState extends State<CountryViewCard>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.withOpacity(0.2),
          child: Column(
            children: [
              Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Row(
                      children: [
                        const SizedBox(
                            width: 30,
                            child: Icon(Icons.circle, size: 16, color: Colors.grey,)),
                        Expanded(child: Text(widget.countryName.toString(), style: const TextStyle(fontSize: 15, color: Colors.white),)),
                      ],
                    )),
                  )),
              Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              const SizedBox(
                                  width: 100,
                                  child: Text('Country Code : ', style: TextStyle(fontSize: 15, color: Colors.black),)),
                              Expanded(child: Text(widget.countryCode.toString(), style: const TextStyle(fontSize: 15, color: Colors.black),)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              const SizedBox(
                                  width: 40,
                                  child: Text('Flag : ', style: TextStyle(fontSize: 15, color: Colors.black),)),
                              Expanded(child: Text(widget.flag.toString(), style: const TextStyle(fontSize: 15, color: Colors.black),)),
                            ],
                          ),
                        ),
                      ],
                    )),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: const [
                    Text(
                      'Languages',
                      style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 40,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                        child:ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.languages.length,
                          itemBuilder: (BuildContext context, index2){
                            Language lang = widget.languages[index2];
                            widget.languages.sort((a, b) => a.name.compareTo(b.name));
                            return Container(
                              height: 40,
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(lang.name.toString()),
                                    const SizedBox(width: 10,),
                                    if(index2!=widget.languages.length-1)
                                      const Icon(Icons.circle, size: 10, color: Colors.black,),
                                  ],
                                )),
                              ),
                            );
                          },
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
