import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


const Color myColor = Color(0xFF800000);
class NewsDetailsScreen extends StatefulWidget {

  final String newImage, newsTitle, newsDate, author, description, content, source;
  const NewsDetailsScreen({Key? key,
    required this.newImage,
    required this.newsTitle,
    required this.newsDate,
    required this.author,
    required this.description,
    required this.content,
    required this.source,
  }) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {

  final format = DateFormat('MMMM dd, yyyy');

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.sizeOf(context).height * 1;

    DateTime dateTime = DateTime.parse(widget.newsDate);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: height * .45,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.newImage,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          Container(
            height: height * .6,
            margin: EdgeInsets.only(top: height * .4),
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              ),
            ),
            child: ListView(
              children: [
                Text(widget.newsTitle, style: GoogleFonts.poppins(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w700),),
                SizedBox(height: height * .02,),
                Row(
                  children: [
                    Expanded(child: Text(widget.source, style: GoogleFonts.poppins(fontSize: 13, color: myColor, fontWeight: FontWeight.w600),)),
                    Text(format.format(dateTime), style: GoogleFonts.poppins(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500),),
                  ],
                ),
                SizedBox(height: height * .03,),
                Text(widget.content, style: GoogleFonts.poppins(fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w500),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
