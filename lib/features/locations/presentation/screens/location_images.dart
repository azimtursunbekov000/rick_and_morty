class ImagesLocation {
  final List<String> urls;
  int currentIndex = 0;

  ImagesLocation({required this.urls});

  String getNextImageUrl() {
    final imageUrl = urls[currentIndex];
    currentIndex = (currentIndex + 1) % urls.length;
    return imageUrl;
  }
}

final imagesLocation = ImagesLocation(
  urls: [
    "https://static.wikia.nocookie.net/rickandmorty/images/d/d3/Anatomy_Park_7.png/revision/latest/scale-to-width-down/1200?cb=20160913082442",
    "https://static.wikia.nocookie.net/rickandmorty/images/3/39/S3e5_resort.png/revision/latest?cb=20171119203200",
    "https://static.wikia.nocookie.net/rickandmorty/images/b/ba/The_Smith_Residence.jpg/revision/latest?cb=20151015031818",
    "https://decider.com/wp-content/uploads/2021/06/rick-and-morty-5.jpg?quality=75&strip=all",
    "https://static.wikia.nocookie.net/rickandmorty/images/1/11/Meta_reality.jpg/revision/latest?cb=20230219144844",
    "https://pyxis.nymag.com/v1/imgs/dcb/698/eea6b585943cfb9f9ce6048e514f174dbc-The-Old-Man-and-the-Seat.1x.rsquare.w1400.jpg",
    "https://www.al.com/resizer/ZQ_Z1VR-w8avRmvpZTTS5tbLwRs=/arc-anglerfish-arc2-prod-advancelocal/public/HHIC7OU5KBFG5GVJRQXXGLO4CU.jpg",
  ],
);




