import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyMedium;
    final backgroundTheme = Theme.of(context).colorScheme.background;
    // ignore: unused_local_variable
    final iconColor = Theme.of(context).colorScheme.onBackground;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: backgroundTheme,
        centerTitle: true,
        title: Text('name',
            style:
                textColor!.copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                "https://www.bing.com/images/search?q=Umoja+Unity+Symbol&FORM=IRTRRL",
                            height: 100,
                            width: 100,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('following',
                                style: textColor.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 5),
                            Text('Following',
                                style: textColor.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 5),
                          ],
                        ),
                        Container(
                          color: backgroundTheme,
                          width: 1,
                          height: 15,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                        ),
                        Column(
                          children: [
                            Text("13",
                                style: textColor.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 5),
                            Text('Followers',
                                style: textColor.copyWith(
                                  fontSize: 14,
                                )),
                          ],
                        ),
                        Container(
                          color: backgroundTheme,
                          width: 1,
                          height: 15,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                        ),
                        Column(
                          children: [
                            Text("20",
                                style: textColor.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 5),
                            Text('Likes',
                                style: textColor.copyWith(
                                  fontSize: 14,
                                )),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 140,
                      height: 47,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: backgroundTheme,
                        ),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {},
                          child: Text('Follow',
                              style: textColor.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // video list
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.4),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: "https://www.istockphoto.com/search/2/image?utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Ffr%2Fs%2Fphotos%2Fsplash&utm_medium=affiliate&utm_source=unsplash&utm_term=splash%3A%3A%3A&alloweduse=availableforalluses&excludenudity=true&mediatype=photography&phrase=splash&sort=best",
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 10.0,
                                left: 10.0,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "13",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
