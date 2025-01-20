class ImageModel {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;

  ImageModel({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });
}

class ImageData {
  bool test = false;
  List<ImageModel> listImg = [
    ImageModel(
      id: "102",
      author: "Ben Moore",
      width: 4320,
      height: 3240,
      url: "https://unsplash.com/photos/pJILiyPdrXI",
      downloadUrl: "https://picsum.photos/id/102/4320/3240",
    ),
    ImageModel(
      id: "103",
      author: "Ilham Rahmansyah",
      width: 2592,
      height: 1936,
      url: "https://unsplash.com/photos/DwTZwZYi9Ww",
      downloadUrl: "https://picsum.photos/id/103/2592/1936",
    ),
    ImageModel(
      id: "104",
      author: "Dyaa Eldin",
      width: 3840,
      height: 2160,
      url: "https://unsplash.com/photos/2fl-ocJ5MOA",
      downloadUrl: "https://picsum.photos/id/104/3840/2160",
    ),
    ImageModel(
      id: "106",
      author: "Arvee Marie",
      width: 2592,
      height: 1728,
      url: "https://unsplash.com/photos/YnfGtpt2gf4",
      downloadUrl: "https://picsum.photos/id/106/2592/1728",
    ),
    ImageModel(
      id: "107",
      author: "Lukas Schweizer",
      width: 5000,
      height: 3333,
      url: "https://unsplash.com/photos/9VWOr22LhVI",
      downloadUrl: "https://picsum.photos/id/107/5000/3333",
    ),
    ImageModel(
      id: "108",
      author: "Florian Klauer",
      width: 2000,
      height: 1333,
      url: "https://unsplash.com/photos/t1mqA3V3-7g",
      downloadUrl: "https://picsum.photos/id/108/2000/1333",
    ),
    ImageModel(
      id: "109",
      author: "Zwaddi",
      width: 4287,
      height: 2392,
      url: "https://unsplash.com/photos/YvYBOSiBJE8",
      downloadUrl: "https://picsum.photos/id/109/4287/2392",
    ),
    ImageModel(
      id: "110",
      author: "Kenneth Thewissen",
      width: 5000,
      height: 3333,
      url: "https://unsplash.com/photos/D76DklsG-5U",
      downloadUrl: "https://picsum.photos/id/110/5000/3333",
    ),
    ImageModel(
      id: "111",
      author: "Gabe Rodriguez",
      width: 4400,
      height: 2656,
      url: "https://unsplash.com/photos/eLUegVAjN7s",
      downloadUrl: "https://picsum.photos/id/111/4400/2656",
    ),
    ImageModel(
      id: "112",
      author: "Zugr",
      width: 4200,
      height: 2800,
      url: "https://unsplash.com/photos/kmF_Aq8gkp0",
      downloadUrl: "https://picsum.photos/id/112/4200/2800",
    ),
  ];
}
