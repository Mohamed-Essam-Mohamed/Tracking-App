
import 'package:tracking_app/features/order_details/order_model.dart';
final OrderDetailsModel order = OrderDetailsModel.fromJson( {
  "_id": "681cb55b1433a666c8da51d8",
  "user": {
    "_id": "678ce031941115133e6de299",
    "firstName": "Mahmoud",
    "lastName": "Reda",
    "email": "sim.mahmoud.reda@gmail.com",
    "gender": "male",
    "phone": "+201066112259",
    "photo": "effe102d-0e89-4fd6-bdcb-72f5451515e4-468706157_2335258493483655_648130331104696351_n.jpg",
    "passwordResetCode": "c45863a8e71c0f844c3ed0e2e5719beef1f5c6b86d5d05e14cd6f492e3847e84",
    "passwordResetExpires": "2025-03-30T14:58:53.772Z",
    "resetCodeVerified": false
  },
  "orderItems": [
    {
      "product": {
        "_id": "673e1cd711599201718280fb",
        "title": "Wedding flowers",
        "slug": "wedding-flowers",
        "description": "This is a Pack of White Widding Flowers",
        "imgCover": "fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png",
        "images": [
          "66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png",
          "f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png",
          "500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"
        ],
        "price": 4400,
        "priceAfterDiscount": 100,
        "quantity": 345486,
        "category": "673c46fd1159920171827c85",
        "occasion": "673b34c21159920171827ae0",
        "createdAt": "2024-11-20T17:31:03.303Z",
        "updatedAt": "2025-05-13T21:38:10.390Z",
        "__v": 0,
        "discount": 50,
        "sold": 1749,
        "rateAvg": 3.5,
        "rateCount": 30
      },
      "price": 440,
      "quantity": 17,
      "_id": "680a982c1433a666c8d4a906"
    },
    {
      "product": {
        "_id": "673e2bd91159920171828139",
        "title": "Red Wdding Flower",
        "slug": "red-wdding-flower",
        "description": "This is a Pack of Red Widding Flowers",
        "imgCover": "5452abf4-2040-43d7-bb3d-3ae8f53c4576-cover_image.png",
        "images": [
          "ba028e59-410f-43ac-aed5-f4f97c102b98-image_four.png",
          "f89bc954-eb0d-4efb-928f-6717f77b69ed-image_one.png",
          "5ed2d072-485b-4a53-a0fa-a41412791397-image_three.png",
          "c0992ec6-d3c0-4a54-b7ec-4cf000138367-image_two.png"
        ],
        "price": 250,
        "priceAfterDiscount": 150,
        "quantity": 49542,
        "category": "673c46fd1159920171827c85",
        "occasion": "673b34c21159920171827ae0",
        "createdAt": "2024-11-20T18:35:05.594Z",
        "updatedAt": "2025-05-13T21:48:20.183Z",
        "__v": 0,
        "sold": 694,
        "discount": 50
      },
      "price": 250,
      "quantity": 6,
      "_id": "680aa1cd1433a666c8d4b29d"
    },
    {
      "product": {
        "_id": "673e2e1f1159920171828153",
        "title": "Dreamy White Roses Bouquet",
        "slug": "dreamy-white-roses-bouquet",
        "description": "Elevate any celebration with our luxury rose bouquet. This exquisite arrangement features pristine white roses wrapped in a sophisticated dark teal wrap, creating a stunning visual contrast. Perfect for celebrations, anniversaries, or as a heartfelt gift, this bouquet combines timeless elegance with modern style. Make a memorable impression with this luxurious floral arrangement. Buy now to delight your loved ones with the beauty and grace of these premium roses.",
        "imgCover": "2d8ddf11-935f-4a45-a100-e1e0765a39c3-cover_image.png",
        "images": [
          "8ee8e389-da6a-4371-8b13-5e35fcca16c6-image_one.png",
          "66fc9304-3ceb-4b73-97dd-730ccf790c49-image_three.png",
          "acf9531b-5ca9-4c45-97fc-f81df9d62091-image_two.png"
        ],
        "price": 320,
        "priceAfterDiscount": 199,
        "quantity": 3333288,
        "category": "673c46fd1159920171827c85",
        "occasion": "673b35c01159920171827aed",
        "createdAt": "2024-11-20T18:44:47.407Z",
        "updatedAt": "2025-05-13T21:17:31.784Z",
        "__v": 0,
        "discount": 50,
        "sold": 145
      },
      "price": 320,
      "quantity": 1,
      "_id": "681754eb1433a666c8d989d4"
    }
  ],
  "totalPrice": 4650,
  "paymentType": "cash",
  "isPaid": false,
  "isDelivered": false,
  "state": "pending",
  "createdAt": "2025-05-08T13:44:59.342Z",
  "updatedAt": "2025-05-08T13:44:59.342Z",
  "orderNumber": "#124771",
  "__v": 0,
  "store": {
    "name": "Elevate FlowerApp Store",
    "image": "https://www.elevateegy.com/elevate.png",
    "address": "123 Fixed Address, City, Country",
    "phoneNumber": "1234567890",
    "latLong": "37.7749,-122.4194"
  }
},);
