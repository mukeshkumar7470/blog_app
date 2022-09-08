class ImageSlider {
  final int? id;
  final String imgUrl;
  final String title;

  ImageSlider({this.id, required this.imgUrl, required this.title});
}

List<ImageSlider> imageSliderList = [
  ImageSlider(imgUrl: 'assets/images/slide_image_1.png', title: "Technology"),
  ImageSlider(imgUrl: 'assets/images/slide_image_2.png', title: "Adventure"),
  ImageSlider(imgUrl: 'assets/images/slide_image_3.jpg', title: "Business"),
];