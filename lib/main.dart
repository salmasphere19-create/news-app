import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

// HOME 
@override


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<resultsmodel> newsdata = [];
 @override
 void initState() {
    super.initState();
    getnews();
  }


  Future<void> getnews() async {
    newsdata = await getnewsdata();
    setState(() {

    });

  
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // APP BAR 
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "Akhbary App",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      //  BODY 
body: ListView(
  padding: const EdgeInsets.all(16),
  children: [

    // BREAKING NEWS

    const Row(
      children: [
        Icon(
          Icons.circle,
          color: Colors.red,
          size: 9,
        ),

        SizedBox(width: 6),

        Text(
          "BREAKING NEWS",
          style: TextStyle(
            color: Colors.red,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),

    const SizedBox(height: 12),

    // NEWS FROM API

    if (newsdata.isNotEmpty)
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: newsdata.length,
        itemBuilder: (context, index) {

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleScreen(),
                    ),
                  );
                },

                child: Image.network(
                  newsdata[index].image_url ?? "",
                  width: double.infinity,
                  height: 210,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 12),

              // TITLE

              Text(
                newsdata[index].title ?? "",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 8),

              // DESCRIPTION

              Text(
                newsdata[index].description ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 25),

              const Divider(),

              const SizedBox(height: 25),
            ],
          );
        },
      ),

    // TOP STORIES

    const Text(
      "Top Stories",
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
    ),

    const SizedBox(height: 18),

    NewsCard(
      image:
          "https://images.unsplash.com/photo-1497366811353-6870744d04b2?auto=format&fit=crop&w=900&q=80",
      category: "BUSINESS",
      title: "Legislative Deadlock Continues as Deadline Approaches",
    ),

    const SizedBox(height: 25),

    NewsCard(
      image:
          "https://images.unsplash.com/photo-1451187580459-43490279c0fa?auto=format&fit=crop&w=900&q=80",
      category: "TECHNOLOGY",
      title: "Next-Generation AI Models Spark Regulatory Debate",
    ),

    const SizedBox(height: 25),

    NewsCard(
      image:
          "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=900&q=80",
      category: "CULTURE",
      title: "The Resurgence of Analog Arts in a Digital Era",
    ),

    const SizedBox(height: 25),

  
    NewsCard(
      image:
          "https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=900&q=80",
      category: "WORLD",
      title: "Cities Around the World Prepare for a New Urban Era",
    ),

    const SizedBox(height: 30),
  ],
),
    );
  }
}
// NEWS CARD 

class NewsCard extends StatelessWidget {
  final String image;
  final String category;
  final String title;

  const NewsCard({
    super.key,
    required this.image,
    required this.category,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        //  IMAGE 

        Image.network(
          image,

          width: double.infinity,
          height: 160,

          fit: BoxFit.cover,
        ),

        const SizedBox(height: 8),

        //  CATEGORY

        Text(
          category,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 5),

        //  TITLE

        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

//  PAGE 

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //  APP BAR 

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        centerTitle: true,

        title: const Text(
          "Akhbary App",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ARTICLE 

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // IMAGE 

              Image.network(
                "https://images.unsplash.com/photo-1487958449943-2429e8be8625?auto=format&fit=crop&w=900&q=80",

                width: double.infinity,
                height: 240,

                fit: BoxFit.cover,
              ),

              const SizedBox(height: 20),

              //  CATEGORY

              const Text(
                "ARCHITECTURE",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 10),

              //  TITLE

              const Text(
                "The Silent Resurgence of Brutalism in Modern Urban Centers",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.15,
                ),
              ),

              const SizedBox(height: 20),

              // AUTHOR

              Row(
                children: [

                  const CircleAvatar(
                    radius: 22,

                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=200&q=80",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: const [

                      Text(
                        "Eleanor Vance",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "October 12, 2023 • 6 min read",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Divider(),

              const SizedBox(height: 25),

              // PARAGRAPH 

              const Text(
                "For decades, the imposing concrete monoliths of the mid-20th century were viewed as oppressive eyesores—monuments to a functionalist ideology that prioritized mass over humanity.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Yet, as we navigate an era defined by ephemeral digital spaces and lightweight glass-clad towers, a remarkable shift is occurring. Brutalism is returning as a deliberate aesthetic choice.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 25),

              //  QUOTE 

              Container(
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,

                  border: const Border(
                    left: BorderSide(
                      color: Colors.black,
                      width: 4,
                    ),
                  ),
                ),

                child: const Text(
                  "We are no longer building merely to house operations; we are constructing spaces in an age of digital noise.",
                  style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "The modern iteration of brutalism is driven by a new sensibility. Architects are seeking the expressive qualities of concrete while integrating greenery, natural light, and renewable materials.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 25),

              // SECOND ARTICLE IMAGE 

              Image.network(
                "https://images.unsplash.com/photo-1511818966892-d7d671e672a2?auto=format&fit=crop&w=900&q=80",

                width: double.infinity,
                height: 200,

                fit: BoxFit.cover,
              ),

              const SizedBox(height: 10),

              const Text(
                "Concrete architecture continues to inspire modern designers.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Critics argue that this aesthetic remains inherently hostile, a stylistic fascination with the past rather than a meaningful response to contemporary needs. However, proponents see it as a return to honesty.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 30),

              //  SHARE BUTTON 

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,

                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                  ),

                  child: const Text(
                    "Share Article",
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //  SAVE BUTTON 

              SizedBox(
                width: double.infinity,

                child: OutlinedButton(
                  onPressed: () {},

                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                  ),

                  child: const Text(
                    "Save for Later",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
class resultsmodel {
  String? title;
  String? image_url;
  String? description;

  resultsmodel({
    required this.title,
    required this.image_url,
    required this.description,
  });
}
final dio = Dio();
Future<List<resultsmodel>> getnewsdata() async {
  final response = await dio.get(
    'https://newsdata.io/api/1/latest?apikey=pub_3985965f55744f48ae452f6d0064b04f');
  Map<String, dynamic> data = response.data;
  List<dynamic> results =data['results'];
  List<resultsmodel> resultsListmodel= [];
  for(var result in results) {
    resultsListmodel.add(
      resultsmodel(
        title: result['title'],
        image_url: result['image_url'],
        description: result['description'],

      ));
      
  }
  return resultsListmodel;
}


