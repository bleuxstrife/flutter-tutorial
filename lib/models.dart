class Employee {
  final String name;
  final String id;
  final String age;
  final String salary;

  Employee({this.name, this.id, this.age, this.salary});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        name: json["employee_name"],
        id: json["id"],
        age: json["employee_age"],
        salary: json["employee_salary"]);
  }
}



class Page {

  final String name;
  final String appbarTitle;
  final List<Content> content;

  Page({this.name, this.appbarTitle, this.content});

  factory Page.fromJson(Map<String, dynamic> json) {
    var listContent = json["content"] as List;

    return Page(
        name: json["name"],
        appbarTitle: json["appbar_title"],
        content: listContent.map((content) => Content.fromJson(content)).toList());
  }



  @override
  String toString() {
    return "Page: \nName: $name\nApp_Bar_Title: $appbarTitle\nContent: ${content}";
  }
}

class Content {
  final String title;
  final String type;
  final String scrollAxis;
  final String goTo;
  final String stringData;
  final List<String> listStringdata;
  final List<ContentDetail> contentDetail;
  final List<DataContentPeople> dataContentPeople;
  final List<DataContentStory> dataContentStory;


  Content(
      {this.title, this.type, this.scrollAxis, this.goTo, this.stringData, this.listStringdata, this.contentDetail, this.dataContentPeople, this.dataContentStory});


  factory Content.fromJson(Map<String, dynamic> json) {
    var listContentDetail = json["content"] as List ?? [];
    var jsonData = json["data"];
    var listDataContent = [];
    var listDataString =[];
    var stringData;

    if(jsonData is String){
      stringData = jsonData as String;
    }
    else if(jsonData is List<String>){
      listDataString = jsonData as List<String>;

    } else{
      listDataContent = jsonData as List;
    }

    return Content(
      title: json["title"],
      type: json["type"],
      scrollAxis: json["scroll_axis"] as String ?? "",
      goTo: json["go_to"],
      contentDetail: listContentDetail.map((detail) => ContentDetail.fromJson(detail)).toList(),
      dataContentPeople: listDataContent.map((listData) => DataContentPeople.fromJson(listData)).toList(),
      dataContentStory: listDataContent.map((listData)=> DataContentStory.fromJson(listData)).toList(),
      stringData: stringData,
      listStringdata: listDataString.cast<String>()
    );
  }
  @override
  String toString() {
    return "\nTitle: $title\nType: $type\nScroll_Axis: $scrollAxis\nGo To: $goTo\n"
        "String Data : $stringData\nContent: ${contentDetail.toString()}\nData People: ${dataContentPeople.toString()}\n"
        "Data Story: ${dataContentStory.toString()}\n Data String: ${listStringdata.toString()}";
  }
}

class ContentDetail {
  final String type;
  final String scrollAxis;
  final String stringData;
  final List<String> listdata;

  ContentDetail({this.type, this.stringData, this.listdata, this.scrollAxis});

  factory ContentDetail.fromJson(Map<String, dynamic> json) {
    var jsonData = json["data"];
    var listData, stringData ;

    print(jsonData.runtimeType);

    if(jsonData is String){
      stringData  = jsonData as String;
    }
    if(jsonData is List){
      listData = jsonData as List;
    }

    return ContentDetail(type: json["type"], scrollAxis: json["scroll_axis"], listdata: listData, stringData: stringData);
  }

  @override
  String toString() {
    return "Type: $type\nScroll Axis: $scrollAxis\nStringData: $stringData\nData: ${listdata.toString()}";
  }

}

class ScreenSizeItem1{
   int width;
   int height;

  ScreenSizeItem1({this.width, this.height});
}

class Tutorial3{
  String name;
  int age;
  double salary;

  Tutorial3({this.name = "Reno", this.age = 1, this.salary = 2000.0});
}

class DataContentStory {
  final String storyId;
  final String author;
  final String writtenDate;
  final String imageUrl;
  final String language;
  final String slug;
  final String title;
  final String shortContent;
  final String longContent;
  final int sortPriority;
  final int createDateTime;
  final String category;
  final int viewCount;

  DataContentStory({this.storyId,
    this.author,
    this.writtenDate,
    this.imageUrl,
    this.language,
    this.slug,
    this.title,
    this.shortContent,
    this.longContent,
    this.sortPriority,
    this.createDateTime,
    this.category,
    this.viewCount});

  factory DataContentStory.fromJson(Map<String, dynamic> json){
    return DataContentStory(
        storyId: json["StoryId"],
        author: json["Author"],
        writtenDate: json["WrittenDate"],
        imageUrl: json["ImageUrl"],
        language: json["Language"],
        slug: json["Slug"],
        title: json["Title"],
        shortContent: json["ShortContent"],
        longContent: json["LongContent"],
        sortPriority: json["SortPriority"],
        createDateTime: json["CreateDateTime"],
        category: json["Category"],
        viewCount: json["ViewCount"]
    );
  }
}

class DataContentPeople {
  final String guid;
  final String balance;
  final String picture;
  final int age;
  final String name;
  final String gender;
  final String company;
  final String email;
  final String phone;
  final String address;
  final String about;
  final String registered;
  final String greeting;

  DataContentPeople({this.guid,
    this.balance,
    this.picture,
    this.age,
    this.name,
    this.gender,
    this.company,
    this.email,
    this.phone,
    this.address,
    this.about,
    this.registered,
    this.greeting});

  factory DataContentPeople.fromJson(Map<String, dynamic> json) {
    return DataContentPeople(
        guid: json["guid"],
        balance: json["balance"],
        picture: json["picture"],
        age: json["age"],
        name: json["name"],
        gender: json["female"],
        company: json["company"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        about: json["about"],
        registered: json["registered"],
        greeting: json["greeting"]);
  }
}

class Fase2 {
  static var x = [
    {
      "name": "home",
      "appbar_title": "Title 1",
      "content": [
        {
          "title": "Orang-Orang",
          "type": "list",
          "scroll_axis": "horizontal",
          "go_to": "orang",
          "content": [
            {"type": "header_picture", "data": "picture"},
            {
              "type": "text",
              "scroll_axis": "horizontal",
              "data": ["name", "balance"]
            },
            {"type": "text", "data": "greeting"}
          ],
          "data": [
            {
              "guid": "22ef78c1-80d7-4cd3-b455-004e3235ce7c",
              "balance": "\$1,433.40",
              "picture": "http://placehold.it/32x32",
              "age": 20,
              "name": "Ericka Dorsey",
              "gender": "female",
              "company": "ZAGGLE",
              "email": "erickadorsey@zaggle.com",
              "phone": "+1 (901) 466-3017",
              "address": "592 Erskine Loop, Rivera, Delaware, 1889",
              "about":
              "Eu ullamco exercitation cupidatat do aute pariatur nisi nulla qui quis voluptate. Consectetur aliquip tempor qui tempor in esse laborum deserunt labore dolor duis sint incididunt cillum. Magna duis reprehenderit exercitation nulla do quis magna officia quis aute nulla labore Lorem nostrud. Laboris nulla nisi ex minim eiusmod enim commodo ipsum commodo irure qui ea irure.\r\n",
              "registered": "2014-10-20T02:54:05 -07:00",
              "greeting": "Hello, Ericka Dorsey! You have 9 unread messages."
            },
            {
              "guid": "30ff2abd-b5fe-40fd-982a-7716106b600d",
              "balance": "\$2,098.34",
              "picture": "http://placehold.it/32x32",
              "age": 25,
              "name": "Nannie Patrick",
              "gender": "female",
              "company": "PYRAMIS",
              "email": "nanniepatrick@pyramis.com",
              "phone": "+1 (936) 581-2757",
              "address": "434 Roosevelt Place, Coalmont, New Jersey, 814",
              "about":
              "Elit ut excepteur ea excepteur adipisicing ea occaecat eu consectetur sunt. Deserunt magna magna sit occaecat anim ex incididunt. Labore sint occaecat incididunt minim irure pariatur. Et ad non deserunt exercitation ex laborum enim exercitation esse occaecat. Nisi nulla ad sit et in ut fugiat cupidatat aliqua laboris.\r\n",
              "registered": "2015-06-08T12:03:50 -07:00",
              "greeting": "Hello, Nannie Patrick! You have 9 unread messages."
            },
            {
              "guid": "859758a8-ce47-4ce6-b72b-cf484ad671de",
              "balance": "\$2,950.00",
              "picture": "http://placehold.it/32x32",
              "age": 26,
              "name": "Amelia Merritt",
              "gender": "female",
              "company": "MEDIFAX",
              "email": "ameliamerritt@medifax.com",
              "phone": "+1 (883) 530-3332",
              "address": "101 Norman Avenue, Helen, Virgin Islands, 6985",
              "about":
              "Nisi in laboris labore qui sint dolor adipisicing pariatur ullamco ullamco ut Lorem eiusmod. Culpa elit officia incididunt est proident in elit enim ex eu aute. Minim exercitation laborum ex aliqua culpa adipisicing magna labore sint. Sint minim cupidatat eu tempor consectetur enim nostrud. Mollit aute anim reprehenderit excepteur quis consectetur nulla nisi quis cupidatat sunt incididunt pariatur ullamco.\r\n",
              "registered": "2014-09-18T05:49:20 -07:00",
              "greeting": "Hello, Amelia Merritt! You have 3 unread messages."
            },
            {
              "guid": "395276ba-d9e4-4e05-a197-3f5b009b34c6",
              "balance": "\$1,130.04",
              "picture": "http://placehold.it/32x32",
              "age": 38,
              "name": "Polly Gregory",
              "gender": "female",
              "company": "MAROPTIC",
              "email": "pollygregory@maroptic.com",
              "phone": "+1 (866) 549-3445",
              "address": "143 Oriental Boulevard, Lydia, American Samoa, 6570",
              "about":
              "Quis esse sint laborum deserunt quis ex veniam veniam. Labore aliquip dolore sunt sunt. Deserunt deserunt deserunt voluptate commodo ad commodo do aliquip fugiat elit ut qui labore. Sint laborum qui enim nostrud reprehenderit incididunt ad pariatur nisi voluptate. Sint cupidatat dolor cupidatat in labore ut mollit. Eiusmod dolore fugiat cupidatat est et tempor nulla.\r\n",
              "registered": "2016-11-28T10:53:31 -07:00",
              "greeting": "Hello, Polly Gregory! You have 3 unread messages."
            },
            {
              "guid": "491487cd-c2c5-493e-bcf4-9b70fd762661",
              "balance": "\$2,240.84",
              "picture": "http://placehold.it/32x32",
              "age": 34,
              "name": "Pittman Witt",
              "gender": "male",
              "company": "UNI",
              "email": "pittmanwitt@uni.com",
              "phone": "+1 (974) 417-3596",
              "address": "905 Christopher Avenue, Marysville, Ohio, 4695",
              "about":
              "Consequat incididunt enim sit elit cupidatat et. Laborum nisi nulla amet cupidatat occaecat non. Magna laboris occaecat elit sunt esse enim consequat aliquip laboris irure.\r\n",
              "registered": "2015-05-25T04:18:58 -07:00",
              "greeting": "Hello, Pittman Witt! You have 1 unread messages."
            },
            {
              "guid": "16e80758-5c32-48b1-a124-2a33d28d998f",
              "balance": "\$1,819.91",
              "picture": "http://placehold.it/32x32",
              "age": 20,
              "name": "Reese Barron",
              "gender": "male",
              "company": "ECLIPSENT",
              "email": "reesebarron@eclipsent.com",
              "phone": "+1 (937) 408-2940",
              "address": "493 Saratoga Avenue, Coloma, New Hampshire, 1487",
              "about":
              "Officia eiusmod minim duis duis esse quis qui sint aliqua dolore dolor. Fugiat ex est officia Lorem dolor commodo cupidatat commodo quis cillum enim. Dolore dolor eu aliquip adipisicing aute commodo et id in consectetur velit non consectetur. Duis aute nisi non fugiat cillum culpa cillum do occaecat voluptate duis consequat. Laboris ut incididunt incididunt ullamco amet anim consectetur excepteur aliqua consequat culpa voluptate consectetur laboris. Non consectetur non sit laborum irure id non consequat commodo consectetur occaecat.\r\n",
              "registered": "2017-06-06T12:52:46 -07:00",
              "greeting": "Hello, Reese Barron! You have 5 unread messages."
            },
            {
              "guid": "92811f00-ed97-46a7-9521-b7980066f7bf",
              "balance": "\$1,987.70",
              "picture": "http://placehold.it/32x32",
              "age": 40,
              "name": "Mercado Ewing",
              "gender": "male",
              "company": "NORALI",
              "email": "mercadoewing@norali.com",
              "phone": "+1 (991) 586-3294",
              "address": "956 Coffey Street, Websterville, Puerto Rico, 6195",
              "about":
              "Do esse amet irure pariatur laborum tempor nostrud cillum sit dolore id officia occaecat. Ad commodo incididunt exercitation aliqua ad occaecat do voluptate adipisicing. Enim voluptate cupidatat ex adipisicing culpa exercitation proident non nulla. Nulla duis exercitation sint eu ex labore fugiat deserunt eiusmod magna consequat consequat tempor.\r\n",
              "registered": "2018-11-10T03:34:25 -07:00",
              "greeting": "Hello, Mercado Ewing! You have 7 unread messages."
            }
          ]
        },
        {
          "title": "Cerita-cerita",
          "type": "list",
          "scroll_axis": "horizontal",
          "go_to": "cerita",
          "content": [
            {"type": "header_picture", "data": "picture"},
            {"type": "text", "data": "Title"},
            {
              "type": "text",
              "scroll_axis": "horizontal",
              "data": ["Author", "WrittenDate"]
            }
          ],
          "data": [
            {
              "StoryId": "a17d5aa2-a12e-4e5c-b50d-d40db00ba978",
              "Author": "Patrecia",
              "WrittenDate": "2018-05-21T00:00:00",
              "ImageUrl":
              "https://nemob.id/service/image/travelstory/a17d5aa2-a12e-4e5c-b50d-d40db00ba978.jpg",
              "Language": "en-US",
              "Slug": "4-Amazing-Historical-Places-Photo-Hunters-Must-Visit-in-Semarang",
              "Title": "4 Amazing Historical Places Photo Hunters Must Visit in Semarang ",
              "ShortContent":
              "The label “The City of Lumpia” for Semarang is already familiar to the people of Indonesia. But besides the label of “The City of Lumpia”, there is one label that is still rarely heard which is Venetië Van Java. ",
              "LongContent":
              "<p dir=\"ltr\">The label &ldquo;The City of Lumpia&rdquo; for Semarang is already familiar to the people of Indonesia. But besides the label of &ldquo;The City of Lumpia&rdquo;, there is one label that is still rarely heard which is Veneti&euml; Van Java. The city of Semarang is called Veneti&euml; Van Java by the Dutch because the city is passed by many rivers in the middle of the city like in Venice, Italy.</p>\n\n<p dir=\"ltr\">Semarang is one of the cities that has much historical tourism that must be visited. You can take a vacation to Semarang while taking photos with the type of Architectural. Armed with a building background of tens to hundreds of years allow you to take photos from different angles. This historic building is also suitable for you who want to find a location for hunting photos or do pre wedding photo shoot with the anti-mainstream theme. These are 4 amazing historic places photo hunters must visit in Semarang.</p>\n\n<p dir=\"ltr\"><strong>&nbsp; &nbsp;<span style=\"font-size:24px\">1.&nbsp;Lawang Sewu</span></strong></p>\n\n<p><img alt=\"\" src=\"http://thetanjungpuratimes.com/file/2017/09/98136-gedung-lawang-sewu-suaracom-dinda-rachamawati.jpg\" style=\"height:100%; width:100%\" /></p>\n\n<p dir=\"ltr\">Lawang Sewu is a well-known building with a thousand kinds of stories behind it. Located on Jalan Sekayu, Sekayu, Semarang, this more than 110 years old building is often being the target of local and foreign tourists to visit. In addition to their curiosity to directly see the building that became a silent witness of the dark Dutch colonial period, taking pictures was something that must be done if it was in this building.</p>\n\n<p dir=\"ltr\">With the thousandth door that is laid out lengthwise, you can take photos with family or friends with a form that resembles a row of stairs. But if you want to take a photo of yourself with a portrait form, you can stand in front of Lawang Sewu building and the alleys inside. There are also bench outside of the building that is often used for taking pictures.</p>\n\n<p dir=\"ltr\">&nbsp; <span style=\"font-size:24px\">2. Semarang Old Town</span></p>\n\n<p><img alt=\"\" src=\"http://cdn2.tstatic.net/jateng/foto/bank/images/semarang-art-gallery_20170807_151750.jpg\" style=\"height:100%; width:100%\" /></p>\n\n<p dir=\"ltr\">The old city is one of the relics of the colonial buildings in Semarang. This Dutch architectural building has existed since the Dutch entered Indonesia. Semarang Old Town or often called Outstadt or Little Netherland is located on Jl. Letjen Suprapto, Semarang Utara, Semarang City. The structure of this building is made following the European 1700s buildings.</p>\n\n<p dir=\"ltr\">This historic building is suitable for those who want to immortalize many vintage themed photos with different building forms. Starting from European style identical ornaments, the huge windows with the use of colored glass, unusual roof shape to the basement. This building is very likely to be used for shooting locations because apart from the tall buildings, Berok Bridge which was used as a connecting road from the sea to Johar Market also complement this place.</p>\n\n<p dir=\"ltr\">&nbsp; &nbsp;<span style=\"font-size:24px\">3. Sam Poo Kong Temple</span></p>\n\n<p><img alt=\"\" src=\"https://jansport.co.id/media/wysiwyg/blog/kuil-sam-poo-kong-semarang.jpg\" style=\"height:100%; width:100%\" /></p>\n\n<p dir=\"ltr\">Sam Poo Kong Temple that established since the 17th century at Jalan Simongan No. 129, Bongsari, Semarang is the oldest temple in Semarang. In addition to a place of worship for Buddhists, Kong Hu Cu, and Taoism, this temple is open for public. Tourists love this place because of the beauty of temple that resembles Chinese temple in general.</p>\n\n<p dir=\"ltr\">The temple which is a stopover and restoration of Cheng Ho&#39;s Warlord can be used as a medium to know Chinese architecture and culture native. You can take a photo by standing in front of an identical red temple or leaning on hand-carved pillars. A typical Chinese outfit is also rented out to complement your style.</p>\n\n<p dir=\"ltr\">To reach the place with a variety of unique and full of stories, you can use a private car or car rental, especially for you who want to do pre wedding photo shoot or photo hunting because it is easier and more practical. Starting from the clothes, makeup, and camera equipment that you can put in the trunk of the car. It is advisable to come on big days like Lunar New Year because you can watch performances like Barongsai.</p>\n\n<p dir=\"ltr\">&nbsp;<span style=\"font-size:24px\">4. Blenduk Church Semarang</span></p>\n\n<p><img alt=\"\" src=\"http://i0.wp.com/exploresemarang.com/wp-content/uploads/2015/09/Gereja-blenduk-semarang.jpg?resize=600%2C350\" style=\"height:100%; width:100%\" /></p>\n\n<p dir=\"ltr\">The church that is now called as GPIB Immanuel Semarang, built in 1753, is a landmark in Kota Lama, Semarang. Located at Jalan Letjend Suprapto No. 32, this church appears in contrast because it was built with a more prominent and classic European style. With a single vertical facade divided into three sections that facing south makes it a unique, elegant, and aristocratic church building. Many people do not know that this church was once styled as a Javanese stage house and has undergone 3 renovations.</p>\n\n<p dir=\"ltr\">This Oldest Christian Church in Central Java is one of the favorite places for pre wedding photos in Semarang besides Sam Poo Kong Temple. When you are in this ancient building, you will feel the Dutch colonial atmosphere with the presence of Marba Building around the church and the hundred-year-old organ (orgel) on the balcony of the church. You can capture a photo with a 2-level church building background intact or take pictures in front of the Marba Building. Moreover, you can immortalize yourself with an organ (orgel) musical instrument.</p>\n\n<p dir=\"ltr\">That&rsquo;s all 4 amazing historical places photo hunters must visit in Semarang.</p>\n\n<p dir=\"ltr\">For those of you who want to visit these places but do not have a private car, Nemob present as a solution for you who want to use easy and cheap car rental in semarang services through Nemob application, official website <a href=\"http://nemob.id\">nemob.id</a> or directly contact Customer Care service at (021) 2962 9902 &amp; 0857 5509 5119.</p>\n",
              "SortPriority": 1,
              "CreateDateTime": 1526887276,
              "Category": "Place",
              "ViewCount": 33
            },
            {
              "StoryId": "fc5674b3-b137-43a5-8d52-68cc88b5e951",
              "Author": "Patrecia",
              "WrittenDate": "2018-05-21T00:00:00",
              "ImageUrl":
              "https://nemob.id/service/image/travelstory/fc5674b3-b137-43a5-8d52-68cc88b5e951.jpg",
              "Language": "en-US",
              "Slug": "Want-to-travel-around-Semarang-but-have-limited-time-Nemob-is-the-solution",
              "Title":
              "Want to travel around Semarang but have limited time? Nemob is the solution!",
              "ShortContent":
              "As a city famous for its historic classical European atmosphere, Semarang has many tourist destinations to visit. Starting from the natural, culinary to religious tourism.\r\n",
              "LongContent":
              "<p dir=\"ltr\">As a city famous for its historic classical European atmosphere, Semarang has many tourist destinations to visit. Starting from the natural, culinary to religious tourism. Along with the nuances of traditional, classical, to modern are all available in this capital city of Central Java.</p>\r\n\r\n<p dir=\"ltr\"><img alt=\"\" src=\"https://jiwandanablog.files.wordpress.com/2017/03/semarang_simpanglima2.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">The city that is dubbed as Lumpia Town, save a lot of history and old buildings of the Dutch colonial relics that became a favorite destination. The historic buildings are scattered at several points around the city center, starting from Simpang Lima to the Old City.</p>\r\n\r\n<p dir=\"ltr\">For you who interest and have a plan to travel around Semarang, but have limited time? Nemob is the solution!</p>\r\n\r\n<p dir=\"ltr\"><img alt=\"Nasi Pecel Mbok Sador Paling Enak di Semarang\" src=\"https://media-cdn.tripadvisor.com/media/photo-o/11/8a/2b/f6/nasi-pecel-mbok-sador.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">Starting from Simpang Lima which is one of the most famous tourist attractions in Semarang, it is incomplete if you do not taste the Nasi Pecel Mbok Sador. Besides of the many culinary on the sidewalk around Simpang Lima, Nasi Pecel Mbok Sador has its own charm. The serving pecel rice with additional chicken, satay with a wide selection of meat, and fried foods that become a boost for the streets around Simpang Lima. You can also relax in Simpang Lima square which is very popular as a place to take pictures or just to refresh your mind when in Semarang.</p>\r\n\r\n<p dir=\"ltr\">Near to Simpang Lima, you can drive onto Lawang Sewu. Aside from the horror story of the Dutch dungeon in Lawang Sewu, this most famous tourist spot in Semarang has a beautiful classical building.</p>\r\n\r\n<p dir=\"ltr\"><img alt=\"Lawang Sewu, Salah satu tempat wisata di semarang\" src=\"http://thetanjungpuratimes.com/file/2017/09/98136-gedung-lawang-sewu-suaracom-dinda-rachamawati.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">Lawang Sewu term which means a thousand doors go hand in hand with the number of doors in the main building of this tourist spot. Although the numbers do not reach a thousand, large wooden doors that exist in the building is often used as the most favorite spot to take pictures. For those of you who like to boost adrenaline, cruising the night dungeon prison at Lawang Sewu can be a must-do activity.</p>\r\n\r\n<p dir=\"ltr\">In addition to Simpang Lima and Lawang Sewu, there are many more destinations in Semarang that must be visited. Kota Lama still presents the beautiful atmosphere of Dutch-style buildings in Central Java.</p>\r\n\r\n<p dir=\"ltr\">The streets of Kota Lama can end with a visit to Kampung Semawis, with the best <a href=\"https://nemob.id/en/search?pickup_city=Semarang\">car rental in Nemob</a>, you will be headed to a popular culinary tour area certainly without would not be bothered with how to get onto the famous tourist spots with a variety of food ranging from the local to foreign countries food.</p>\r\n\r\n<p dir=\"ltr\"><img alt=\"Oleh Oleh Khas Semarang\" src=\"http://ayaka.co/wp-content/uploads/2016/08/lumpia-semarang-makanan-khas-semarang.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">Traveling back from Semarang is not complete without buying the typical souvenirs of Semarang, the most popular food from the capital city of Central Java are Lumpia, Wingko Babat, and Bandeng Tanpa Tulang. It is a regrettable thing to do when you go back home without buying these souvenirs.</p>\r\n\r\n<p dir=\"ltr\">Therefore, before traveling back, you can stop by for a moment to buy the souvenir along Jalan Pandanaran in the direction of Poncol Station. You can buy more to eat in the car while enjoying the journey home with a happy heart and full stomach. Tours in Semarang will be very comfortable and safe with the special choice of cars you can get only in Nemob.</p>\r\n",
              "SortPriority": 2,
              "CreateDateTime": 1526879039,
              "Category": null,
              "ViewCount": 21
            },
            {
              "StoryId": "b791ab28-a7f2-4d6f-8796-5a66d59df3e7",
              "Author": "Patrecia",
              "WrittenDate": "2018-05-18T00:00:00",
              "ImageUrl":
              "https://nemob.id/service/image/travelstory/b791ab28-a7f2-4d6f-8796-5a66d59df3e7.jpg",
              "Language": "en-US",
              "Slug": "The-Hidden-Paradise-in-Bali",
              "Title": "The Hidden Paradise in Bali",
              "ShortContent":
              "Bali is the island known because of its beautifulness that heard throughout the world. The island that is famous for its beautiful beaches and thickness of its arts and cultures have attracted many tourists from inside and outside the country to visit this island. \r\n",
              "LongContent":
              "<p dir=\"ltr\">Bali is the island known because of its beautifulness that heard throughout the world. The island that is famous for its beautiful beaches and thickness of its arts and cultures have attracted many tourists from inside and outside the country to visit this island.</p>\r\n\r\n<p dir=\"ltr\">Starting from Kuta Beach that has a very beautiful sunset, Sanur Beach that becomes the heaven for surfers, Tanah Lot with its beautiful nature to Kecak Dance that has a very meaningful culture make Bali never deserted of visitors. Aside from it, Bali still has many hidden paradises that is not less cool from the listed above. What are those hidden paradises? These are the lists for you:</p>\r\n\r\n<p dir=\"ltr\"><strong><span style=\"font-size:20px\">1. Gunung Payung Beach</span></strong></p>\r\n\r\n<p dir=\"ltr\"><img alt=\"Gunung payung Pancung\" src=\"https://i.imgur.com/TBV6EXI.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">This authentic beach is located in Desa Kutuh, South Kuta, near Pandawa Beach. Gunung Payung Beach serves you the white sand and the blueness of the sea water. You can enjoy this scenery all the way your eyes can see, compliment by the amazing green hill. This &lsquo;package&rsquo; is guaranteed to make yourself comfortable along with the peaceful silence.</p>\r\n\r\n<p dir=\"ltr\">The beautiful landscape that spoils the eye can make the hearts of anyone who visits agree that this beach deserves the nickname &quot;hidden paradise&quot;.</p>\r\n\r\n<p dir=\"ltr\"><strong><span style=\"font-size:20px\">2. Pasih Uug Beach</span></strong></p>\r\n\r\n<p dir=\"ltr\"><strong><span style=\"font-size:20px\"><img alt=\"\" src=\"https://i.imgur.com/tLAql5a.jpg\" style=\"height:100%; width:100%\" /></span></strong></p>\r\n\r\n<p dir=\"ltr\">This beach that is at Nusa Penida offers you the extraordinary natural phenomena that you cannot find on other beaches.</p>\r\n\r\n<p dir=\"ltr\">Broken Beach is the popular name for Pasih Uug Beach serves the panorama of the cliff that forms the natural bridge. Above it, you can find the green grass and trees with the spectacular sea panorama.</p>\r\n\r\n<p dir=\"ltr\">Not only that, if you are lucky, you can see Pari Manta fish and turtle swimming in the ocean.</p>\r\n\r\n<p dir=\"ltr\"><strong><span style=\"font-size:20px\">3. Angel&rsquo;s Billabong</span></strong></p>\r\n\r\n<p dir=\"ltr\"><strong><span style=\"font-size:20px\"><img alt=\"\" src=\"https://i.imgur.com/1iyElsU.jpg\" style=\"height:100%; width:100%\" /></span></strong></p>\r\n\r\n<p dir=\"ltr\">Angel&rsquo;s Billabong located in Nusa Penida has a natural pond that placed in between the rocky rocks cliff. The turquoise colour of this natural pond with the niche that forms the little beautiful ponds make anyone fall in love with it.</p>\r\n\r\n<p dir=\"ltr\">However, you need to remember that if you want to feel the freshness of this ponds&rsquo; water you need to check the sea level when you visit.</p>\r\n\r\n<p dir=\"ltr\">At low tide, these exotics ponds are fairly safe enough for you to refresh your body by soaking in it. On the other hand, at high tide, you are advised not to play at Angel&rsquo;s Billabong. For your safety, just capture the moment at the edge of the cliff is enough, right?</p>\r\n\r\n<p dir=\"ltr\"><strong><span style=\"font-size:20px\">4. The Devil&rsquo;s Tears</span></strong></p>\r\n\r\n<p dir=\"ltr\"><strong><span style=\"font-size:20px\"><img alt=\"\" src=\"https://i.imgur.com/WqedZVZ.jpg\" style=\"height:100%; width:100%\" /></span></strong></p>\r\n\r\n<p dir=\"ltr\">This hidden paradise placed at the small island named Nusa Lembongan. You will not find a white sands beach at The Devil&rsquo;s Tears, but rocky rock cliffs that directly bordering with the Indian Ocean. The Devil&rsquo;s Tears will show you sea panorama and the crashing waves into the reefs that provide the incredible natural scenery.</p>\r\n\r\n<p dir=\"ltr\">The waves crashing into the reef very hard until it caused a spurt of seawater into the air, followed by the seafoam fell on the rocks. Looks like a spring that shoot out and fall back into the ocean makes it perfect for you who are the nature lovers of the beach with the different treats.</p>\r\n\r\n<p dir=\"ltr\">Moreover, the impression of hidden paradise increasingly attached to this place at dusk. The splash of the waves of The Devil&#39;s Tears is fascinating with the sun&#39;s hide drowning in the western horizon, making anyone who comes to enjoy it must be fascinated by the exotic beauty.</p>\r\n\r\n<p dir=\"ltr\"><span style=\"font-size:20px\"><strong>5. Gunung Batur Panorama in Pinggan Village</strong></span></p>\r\n\r\n<p dir=\"ltr\"><span style=\"font-size:20px\"><strong><img alt=\"\" src=\"https://i.imgur.com/6LFOcR5.jpg\" style=\"height:100%; width:100%\" /></strong></span></p>\r\n\r\n<p dir=\"ltr\">The last hidden paradise that located in the Pinggan Village shows the fantastic beauty of nature. Here you can see a cloud of oceans with a rare sunrise appearing between the mountain and the middle of the valley. Especially if you&#39;re lucky, you can see a clear view of two mountains facing each other with sunlight that slowly sweeps the dark night.</p>\r\n\r\n<p dir=\"ltr\">That&rsquo;s all the hidden paradise in Bali that you should visit, let it be easier with Nemob!</p>\r\n\r\n<p dir=\"ltr\">Nemob is the best car rental that ready to help you to provide various kinds of cars that can be found in several big cities such as Jakarta, Bali, Bandung, Surabaya, Medan, Semarang, Yogyakarta and Sorong in accordance with the needs through the Website Nemob.id or Nemob App!</p>\r\n\r\n<p dir=\"ltr\">Download Nemob apps from the App Store and Google Play store for the best and most convenient car rental reservations. Reservation is also available on the official website <a href=\"https://nemob.id/en/search?pickup_city=bali\">nemob.id</a> or Customer Care service at (021) 2962 9902 &amp; 0857 5509 5119. Visit and follow Instagram Nemob.id for the latest information and promo!</p>\r\n\r\n<p>&nbsp;</p>\r\n",
              "SortPriority": 1,
              "CreateDateTime": 1526626649,
              "Category": null,
              "ViewCount": 8
            },
            {
              "StoryId": "14865657-587b-485b-9c11-d118447af75e",
              "Author": "Patrecia",
              "WrittenDate": "2018-05-18T00:00:00",
              "ImageUrl":
              "https://nemob.id/service/image/travelstory/14865657-587b-485b-9c11-d118447af75e.jpg",
              "Language": "en-US",
              "Slug": "5-Authentic-Foods-You-Can-Taste-Only-in-Jogja",
              "Title": "5 Authentic Foods You Can Taste Only in Jogja",
              "ShortContent":
              "There are 2 nicknames for the city of Yogyakarta that are already familiar in the ear which is the City of Batik and the City of Education. The nickname was obtained because of the many famous batik and campus like UGM which makes Yogyakarta as one of the favorite cities in Indonesia for students and batik craft hunters. ",
              "LongContent":
              "<p dir=\"ltr\"><span style=\"font-size:20px\"><tt><em>Number 4 is the best food you won&rsquo;t miss!</em></tt></span></p>\r\n\r\n<p dir=\"ltr\">There are 2 nicknames for the city of Yogyakarta that are already familiar in the ear which is the City of Batik and the City of Education. The nickname was obtained because of the many famous batik and campus like UGM which makes Yogyakarta as one of the favorite cities in Indonesia for students and batik craft hunters.</p>\r\n\r\n<p dir=\"ltr\">However, not only for students and batik crafters, many people who are not in Java Island, people who live in the island of Sumatra and Bali include Jogja City into their holiday list. This also applies to tourists who come from outside Indonesia such as Malaysia, Japan, America and Netherlands.</p>\r\n\r\n<p dir=\"ltr\">There are lots of reasons that make local and abroad tourists want to visit Jogja. One of them is culinary. Many authentic or genuine Jogja culinary that become the target of the visitor when visiting Jogja. Here are 5 authentic foods that you can enjoy only in Jogja.</p>\r\n\r\n<h1 dir=\"ltr\"><strong><span style=\"font-size:24px\">1. Oseng Mercon Bu Narti</span></strong></h1>\r\n\r\n<p><img alt=\"\" src=\"http://www.angkutkoper.com/wp-content/uploads/2015/08/oseng-oseng-mercon-bu-narti.jpg\" style=\"height:100%; width:100%\" /><br />\r\n<br />\r\nsource : osengmercon</p>\r\n\r\n<p dir=\"ltr\">Located on Jalan KH. Ahmad Dahlan, Ngampilan, Yogyakarta, Oseng Mercon Bu Narti is one of the favorite foods of Yogyakarta people and tourists who visit this city. Established since 1998, open from 17.00-23.00, a dish of white rice accompanied by oseng-oseng containing kikil, skin, bone, and lard makes people cannot stop enjoying it.</p>\r\n\r\n<p dir=\"ltr\">Mercon which in Indonesian means firecracker become a term to express how spicy this oseng. With 6kg of chili spent by Bu Narti to cook this oseng every day to give a spicy flavor that hit the tongue, do not make visitors deterrent but instead want to come again and again.</p>\r\n\r\n<p dir=\"ltr\"><strong><span style=\"font-size:24px\">2. Gudeg Mbok Lindu</span></strong></p>\r\n\r\n<p><img alt=\"\" src=\"http://cdn-2.tstatic.net/jogja/foto/bank/images/mbok-lindu_2_20160119_121945.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">source : tribunnews</p>\r\n\r\n<p dir=\"ltr\">Gudeg Mbok Lindu is located in front of Grage Ramayana Hotel, Jalan Sosrowijayan, Yogyakarta. Mbok Lindu whose real name is Setyo Utama is the oldest gudeg seller in Jogja with age almost a century. Has been around for more than 70 years, Gudeg Mbok Lindu is always crowded with visitors.</p>\r\n\r\n<p dir=\"ltr\">Warung gudeg is open from 5.00-11.00 with a price of Rp.15.000-25.000. In addition to gudeg, there are several side dishes are also available such as Chicken, Egg, Sambal Goreng Krecek, and Tempe Bacem.</p>\r\n\r\n<p dir=\"ltr\"><strong><span style=\"font-size:24px\">3. Sate Klatak Pak Bari</span></strong></p>\r\n\r\n<p><img alt=\"Sate Klatak Khas Jogja\" src=\"http://static.republika.co.id/uploads/images/inpicture_slide/sate-klathak-_161114062005-311.png\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">Sate is one of the authentic culinary owned by the people of Indonesia. Type of Satay also varied starting from Chicken Satay, Goat Satay, Padang Satay to Madura Satay. Of the many satays above, there is a unique Satay that is Klatak Jogja Satay especially Pak Bari Klatak Satay. Pieces of goat meat that is punctured to the iron bars which then burned on the coals make it different from the Satay in general.</p>\r\n\r\n<p dir=\"ltr\">The use of iron bars as a substitute for bamboo skewer with the sound of klatak klatak when burned is believed to make goat mature evenly due to the iron properties that deliver heat. To reach the location Pak Bari Klatak Satay at Jejeran Wonokromo Market, Bantul, Yogyakarta, which operates at 18.30 will be easier if using a private car or car rental because the position is far from the city center of Jogja.</p>\r\n\r\n<p dir=\"ltr\"><strong><span style=\"font-size:24px\">4. Tengkleng Gajah</span></strong><br />\r\n&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"http://www.angkutkoper.com/wp-content/uploads/2015/08/tengkleng-gajah-goreng.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">By using a private vehicle or car rental, you can directly arrive at Sari Roso Mulyono Stall a.k.a Tengkleng Gajah Stall located on Jalan Kaliurang, Ngaglik, Sleman. Tengkleng Gajah which is a processed goat meat of &quot;Gajah&quot; portion contains big bone pieces, processed with special herbs and spices cooked for hours create a distinctive taste, making it as the long-awaited food in Jogja city.</p>\r\n\r\n<p dir=\"ltr\">Visitors usually use a straw to enjoy the marrow inside the bone. In addition, Tengkleng Gajah Stall that is open from 09.00-21.00 also provides a variety of other processed goat meat which are Goat Satay, Goat Fried Rice and Goat Tongseng.<br />\r\n<br />\r\n<strong><span style=\"font-size:24px\">5. Mie Persis Telap 12</span></strong></p>\r\n\r\n<p><br />\r\n<img alt=\"\" src=\"https://id.openrice.com/userphoto/Article/0/P/0004XW4ADFEA67C72F37C3original.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">&quot;Not A Regular Instant Noodle&quot; is the most appropriate call to describe Persis Telap 12 Noodle. Located on Jalan Pandeyan, Umbulharjo, Yogyakarta City, you must be willing to stand in line more than 20 minutes to enjoy this noodle dish.</p>\r\n\r\n<p dir=\"ltr\">Most of the visitors are youngsters because the main menu of this place is the current trend instant noodles which presented as similar as the wrap of instant noodles. There are 3 menu recommendations that you should try which are Spicy Fried Persis Noodle, Chicken Curry Persis Noodle and Special Fried Persis Noodle. This dining venue is open daily from evening to drop.</p>\r\n\r\n<p dir=\"ltr\"><strong>That&rsquo;s all 5 authentic foods you can find and taste only in Jogja.</strong></p>\r\n\r\n<p dir=\"ltr\">For those of you who want to visit these places to try the cuisine but do not have a private car, Nemob present as a solution for you who want to use easy and cheap Car Rental services through Nemob application, official website <a href=\"https://nemob.id/en/search?pickup_city=Yogyakarta\">nemob.id</a> or directly contact Customer Care service at (021) 2962 9902 &amp; 0857 5509 5119.</p>\r\n\r\n<p dir=\"ltr\">\f</p>\r\n",
              "SortPriority": 1,
              "CreateDateTime": 1526617284,
              "Category": null,
              "ViewCount": 4
            },
            {
              "StoryId": "3bd1d5ae-0c66-492c-95aa-c740afff7ddd",
              "Author": "Patrecia",
              "WrittenDate": "2018-05-18T00:00:00",
              "ImageUrl":
              "https://nemob.id/service/image/travelstory/3bd1d5ae-0c66-492c-95aa-c740afff7ddd.jpg",
              "Language": "en-US",
              "Slug":
              "5-Most-Favourite-Natural-Tour-Destinations-in-Lembang-You-Should-Visit-With-Your-Family-or-Your-Partner",
              "Title":
              "5 Most Favourite Natural Tour Destinations in Lembang You Should Visit With Your Family or Your Partner!  ",
              "ShortContent":
              "Bandung is a city that has a lot of beauty that makes everyone who visits mesmerized. The city that became the center of West Java is not too far from Jakarta. So, it becomes the favorite destination for people of Jakarta to get away from daily activities in the city which comes with the traffic jam and pollutions.",
              "LongContent":
              "<p dir=\"ltr\">Bandung is a city that has a lot of beauty that makes everyone who visits mesmerized. The city that became the center of West Java is not too far from Jakarta. So, it becomes the favorite destination for people of Jakarta to get away from daily activities in the city which comes with the traffic jam and pollutions.</p>\r\n\r\n<p dir=\"ltr\">This city has so many kind attractions that attract tourist to visit. Starting from the culinary, natural tour destinations, traditional tour destinations to modern tour destinations.</p>\r\n\r\n<p dir=\"ltr\">Among the many interesting places to visit, natural tour destinations in Bandung being one of the most favorite destinations for people of Jakarta to enjoy their holiday with their partner or family. &nbsp;Most of the favorite tourist destinations in Bandung are located in Lembang. Which is at the 1312 meters up to 2084 meters&rsquo; height made Lembang becomes the coldest area in Bandung.</p>\r\n\r\n<p dir=\"ltr\">Lembang has several famous natural tour destinations such as De Ranch, Bandung Treetop Adventure Park, Farm House Susu Lembang, The Lodge Maribaya, and Grafika Cikole.</p>\r\n\r\n<p dir=\"ltr\">Each of these destinations has their own attractions. Want to know what their attractions are? Check out the following reviews:</p>\r\n\r\n<ol>\r\n\t<li dir=\"ltr\">\r\n\t<p dir=\"ltr\"><span style=\"font-size:24px\">De Ranch</span></p>\r\n\t</li>\r\n</ol>\r\n\r\n<p><img alt=\"\" src=\"https://media-cdn.tripadvisor.com/media/photo-o/0f/e4/fb/85/20170715-141813-largejpg.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">De Ranch is a natural tour destination in Lembang with the atmosphere of cowboy tours that accentuate on food, leisure and knowledge. In this place, you can ride a horse while playing archery and wearing a costume like a cowboy. &nbsp;Besides that, you can also learn how to milking a cow, riding a cowboy horse carriage, cycling, playing trampolines, and other games that are not less interesting than the others.</p>\r\n\r\n<p dir=\"ltr\">This place is supported by convenient dining facilities with food and beverage menu that certainly intriguing.</p>\r\n\r\n<ol start=\"2\">\r\n\t<li dir=\"ltr\">\r\n\t<p dir=\"ltr\"><span style=\"font-size:24px\">Bandung Treetop Adventure Park</span></p>\r\n\t</li>\r\n</ol>\r\n\r\n<p><img alt=\"\" src=\"https://media-cdn.tripadvisor.com/media/photo-w/0b/21/4e/e0/photo0jpg.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">Bandung Treetop Adventure Park is a natural tour destination which offers you a fun outbound games activities and adventure with the beauty of Cikole pine forest view.</p>\r\n\r\n<p dir=\"ltr\">Furthermore, doing outbound in this place is very challenging. You can enjoy the challenges of outbound to pass obstacles from one tree to the another, each located at a high altitude.</p>\r\n\r\n<p dir=\"ltr\">But calm down, before reaching to the highest &ldquo;adrenaline&rdquo; level, you have to pass several steps of other circuits first. Not only for the adult, there are also outbound activities for children which are very fun and safe for them.</p>\r\n\r\n<p dir=\"ltr\">Moreover, all the activities in Bandung Treetop Adventure Park are supported by professional instructors and safety equipment with Europe standard.</p>\r\n\r\n<ol start=\"3\">\r\n\t<li dir=\"ltr\">\r\n\t<p dir=\"ltr\"><span style=\"font-size:24px\">Farm House Susu Lembang</span></p>\r\n\t</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\"><img alt=\"\" src=\"https://media-cdn.tripadvisor.com/media/photo-w/12/3b/39/84/dekorasi-bangunan.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">Farm House Susu Lembang is a natural tour destination that brings a nuance of European tourism that is perfect for a photography addict and you who bring the family for holiday.</p>\r\n\r\n<p dir=\"ltr\">In this place, there are 2 favorite spots such as hobbit house and European style house. Both spots are very popular to take a photo because of the European-style photo background is given that is quite unique. Then, your picture can be taken while wearing old European clothes that gives you the impression as if you were in Europe.</p>\r\n\r\n<p dir=\"ltr\">Not only the unique photo spots, you can also take a photo with animals such as rabbits, iguanas, hedgehogs, sheep, birds, cows, horses, and sugar glider that is perfect for children.</p>\r\n\r\n<ol start=\"4\">\r\n\t<li dir=\"ltr\">\r\n\t<p dir=\"ltr\"><span style=\"font-size:24px\">The Lodge Maribaya</span></p>\r\n\t</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\"><img alt=\"\" src=\"https://media-cdn.tripadvisor.com/media/photo-w/10/b5/55/69/photo1jpg.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">The Lodge Maribaya is one of the most famous natural tour destinations in Lembang which present not only for enjoying the cool atmosphere of nature but also to present the amazing natural landscape that has an instagrammable spot.</p>\r\n\r\n<p dir=\"ltr\">There are cool and interesting photo spots you can find such as Hot Air Balloon, Sky Bike, Sky Wing, Sky Bamboo, and Sky Tree.</p>\r\n\r\n<p dir=\"ltr\">Furthermore, there are other things you can enjoy such as Bandung traditional snack, watching a traditional dance, and Tent onion Bombay (Camping Spot) for you who want to try to camp comfortably with family.</p>\r\n\r\n<p dir=\"ltr\">Despite being a tourist destination, this place cannot be reached by public transportation so it will be easier if you go by using your own car or rental car at Nemob.id.</p>\r\n\r\n<ol start=\"5\">\r\n\t<li dir=\"ltr\">\r\n\t<p dir=\"ltr\"><span style=\"font-size:24px\">Wisata Grafika Cikole</span></p>\r\n\t</li>\r\n</ol>\r\n\r\n<p dir=\"ltr\"><img alt=\"\" src=\"https://media-cdn.tripadvisor.com/media/photo-w/06/1a/3a/b2/grafika-cikole-lembang.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">Graphic Cikole is an integrated natural tour destinations area that is perfect for relieving stress with family.</p>\r\n\r\n<p dir=\"ltr\">The main attraction of this place is the inn. The shape of the lodging building in Grafika Cikole using a vintage style that all of its dwellings are made of woods so as to create a thick rural atmosphere.</p>\r\n\r\n<p dir=\"ltr\">Moreover, there are an adventure and traditional themed games provided in Grafika Cikole. The game is divided into 2 categories which are regular and classified.</p>\r\n\r\n<p dir=\"ltr\">For the regular category, there are 11 types of games and for the traditional games, there are sack racing, eating crackers and catching an eel.</p>\r\n\r\n<p dir=\"ltr\">For the classified category, the outbound theme is divided into parts. There are for children, school groups, and adults.</p>\r\n\r\n<p dir=\"ltr\">That&rsquo;s all the most favourite natural tour destinations in Lembang for you who want to visit this place with family or partner. Make your holiday easier with Nemob!</p>\r\n\r\n<p dir=\"ltr\">Download Nemob apps from the App Store and Google Play store for the best and most convenient car rental reservations. Reservation is also available on the official website www.nemob.id or Customer Care service at (021) 2962 9902 &amp; 0857 5509 5119. Visit and follow Instagram Nemob.id for the latest information and promo!</p>\r\n\r\n<p dir=\"ltr\">\f</p>\r\n\r\n<p dir=\"ltr\">\f</p>\r\n",
              "SortPriority": 1,
              "CreateDateTime": 1526609856,
              "Category": null,
              "ViewCount": 4
            },
            {
              "StoryId": "606e3813-1d60-4931-b6cc-24bb6731d478",
              "Author": "Patrecia",
              "WrittenDate": "2018-05-17T00:00:00",
              "ImageUrl":
              "https://nemob.id/service/image/travelstory/606e3813-1d60-4931-b6cc-24bb6731d478.jpg",
              "Language": "en-US",
              "Slug": "Review-Omnia-Bali-Day-Club-Location-Facility-Entrance-Price-and-The-Allure",
              "Title":
              "Review Omnia Bali Day Club – Location, Facility, Entrance Price, and The Allure",
              "ShortContent":
              "Omnia Bali Day Club is a day club sponsored by the Las Vegas-based Hakkasan Group. Inaugurated in early February 2018, Omnia Bali Day Club is a day club with the world's first beach concept in Bali",
              "LongContent":
              "<p dir=\"ltr\"><cite><span dir=\"rtl\"><var><samp><tt><code>The island of Bali is the most famous island in the world due to the richness and exotic nature and culture that makes many people want to visit. The island is located between Java Island and Lombok Island surrounded by several small islands such as Nusa Ceningan Island, Nusa Lembongan Island, and Nusa Penida Island. Due to the majority of its inhabitants who are Hindus, people know the island as the Island of the Gods.</code></tt></samp></var></span></cite></p>\r\n\r\n<p dir=\"ltr\"><span dir=\"rtl\"><var><samp><tt><code><cite>So many clubs and tourist attractions are on the island of Bali. Due to the number of tourist attractions and clubs, Bali became the center of entertainment in the World. One of the famous clubs in Bali Island is the Omnia Bali Day Club</cite><strong>.</strong></code></tt></samp></var></span></p>\r\n\r\n<p dir=\"ltr\"><img alt=\"\" src=\"https://media-cdn.tripadvisor.com/media/photo-o/12/0e/b0/c1/the-cube-provides-an.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\"><strong>Omnia Bali Day Club</strong> is a day club sponsored by the Las Vegas-based Hakkasan Group. Inaugurated in early February 2018, Omnia Bali Day Club is a day club with the world&#39;s first beach concept in Bali. Using the draft concept of WOHA Singapore and New York&#39;s Rockwell, the day club built on the limestone cliff of Uluwatu has become the first target of the tourists while stepping in Bali Island.</p>\r\n\r\n<p dir=\"ltr\">There are many supporting facilities that will make you comfortable and want to stay long in this club. One of them by relaxing in the rooms that have been provided by the Omnia Bali Day Club. You can also rent a room to hold events such as Birthday, Anniversary, and Gathering at this day club.</p>\r\n\r\n<p dir=\"ltr\"><span style=\"font-size:20px\"><strong>The Allure of Omnia Bali Day Club</strong></span></p>\r\n\r\n<p><img alt=\"\" src=\"https://media-cdn.tripadvisor.com/media/photo-w/12/0e/af/36/suspended-above-the-cliff.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">Omnia Bali Day Club has a variety of attractions that make you curious if you do not stop by. With the open concept and beautiful sea view make Omnia Bali Day Club is always crowded especially at the weekend and national holiday.</p>\r\n\r\n<p dir=\"ltr\">Sun beds is prepared in the pool area for visitors who want to rest while pampering the eyes to enjoy the beautiful sunset in Bali. After enjoying the sunset, tourists will be served a view of a glittering silver cube called Cube Bar. Lounge Casual also presented to be able to chit chat with family, spouse or co-worker.</p>\r\n\r\n<p><img alt=\"\" src=\"https://media-cdn.tripadvisor.com/media/photo-o/12/73/5a/86/img-20180304-172502-hdr.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">Beside the lounge, there is Sake no Hana Restaurant which is a modern Japanese restaurant. The restaurant features an elegant restaurant concept complemented by a view of the Indian Ocean that can be seen directly from the edge of the restaurant.</p>\r\n\r\n<p dir=\"ltr\">In addition, the exclusive bungalow is equipped with a private pool and VIP Cabanas present to offer luxurious and elegant facilities that are perfect for you to take photos that are instagrammable with the current trend concept. This place can be used as a place for photo hunting by a photographer because, in addition to the many cool photo spots, the position of this day club looks like floating on the edge of Uluwatu Beach.</p>\r\n\r\n<p dir=\"ltr\"><span style=\"font-size:20px\"><strong>The Exact Position/Location Map</strong></span></p>\r\n\r\n<p><img alt=\"\" src=\"https://media-cdn.tripadvisor.com/media/photo-w/12/0e/af/2e/an-all-day-party-destination.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">This day club is located at the south-western tip of Bukit Peninsula, exactly on Jl. Belimbing Sari, Banjar Tambiyak, Desa Pecatu, Uluwatu, Bali 80364, Indonesia. For visitors who come from outside Bali, you need to travel about 30 minutes from Ngurah Rai International Airport to get to this day club.</p>\r\n\r\n<p dir=\"ltr\">Apart from Ngurah Rai International Airport, you can reach this location for 15 minutes from Jimbaran Bay near the renowned Uluwatu Temple. If you have never been here or are a newcomer in Bali, you can open a walkthrough navigation app like Google Maps or Waze. Location maps are listed below.</p>\r\n\r\n<p dir=\"ltr\">You can also ask the people around Pecantu village because they will know where the exact location of this place is and do not afraid, the very friendly Balinese people will gladly show you the right path.</p>\r\n\r\n<p dir=\"ltr\">Before reaching to this place, you can also stop by to some tourist attractions near the location of Omnia Bali Day Club like Jimbaran Beach, Garuda Wisnu Kencana Cultural Park, and Tegal Wangi Beach.</p>\r\n\r\n<p dir=\"ltr\"><span style=\"font-size:20px\"><strong>Entrance Ticket and Food Price</strong></span></p>\r\n\r\n<p dir=\"ltr\"><span style=\"font-size:20px\"><strong><img alt=\"\" src=\"https://media-cdn.tripadvisor.com/media/photo-w/12/9d/ac/cb/photo0jpg.jpg\" style=\"height:100%; width:100%\" /></strong></span></p>\r\n\r\n<p dir=\"ltr\">Omnia Bali Day Club starts operating from 11:00 to 19:00 every day. But do not worry if you want to eat at Sake no Hana Restaurant, this restaurant will stay open until 23:00. However, the price of food and beverage menu is relatively expensive, Mojito and Cocktails drinks are priced Rp.170.000 / glass, as well as the food price range Rp.300.000 for 2 people.</p>\r\n\r\n<p dir=\"ltr\">For the normal ticket price is Rp.200.000. If you want to come in the special occasion, when there are events and guest stars, ticket prices will jump up in the range of Rp.675.000 to Rp.1.250.000 and you have to make a booking which can be seen in website www.omniaclubs.com. If you are lucky, you can join a party that is held with the performance of some DJ hits that are most in demand by visitors today.</p>\r\n\r\n<p dir=\"ltr\"><strong><span style=\"font-size:20px\">Nearest Hotel to Omnia Bali Day Club</span></strong></p>\r\n\r\n<p dir=\"ltr\">For local and foreign tourists, you can stay in one of the hotels or villas located around Omnia Bali Day Club. There are several hotels and villas that are well suited to rest with the concept and eye-catching scenery such as:</p>\r\n\r\n<ul>\r\n\t<li dir=\"ltr\">\r\n\t<p dir=\"ltr\">Hideway Villas Bali</p>\r\n\t</li>\r\n\t<li dir=\"ltr\">\r\n\t<p dir=\"ltr\">Alila Villas Uluwatu</p>\r\n\t</li>\r\n\t<li dir=\"ltr\">\r\n\t<p dir=\"ltr\">Ungasan Cliff Resort</p>\r\n\t</li>\r\n\t<li dir=\"ltr\">\r\n\t<p dir=\"ltr\">Karma Kandara</p>\r\n\t</li>\r\n\t<li dir=\"ltr\">\r\n\t<p dir=\"ltr\">Banyan Tree Ungasan</p>\r\n\t</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">The price of this hotel or Villa is also varied. For those of you who take a family vacation or are on a group trip, you can rent a Villa that has several rooms in it with a price range of more than Rp.5.000.000. However, for you who are on holiday alone or couples with the number of people around 1-2, you can rent a hotel with a price of about Rp.350.000.</p>\r\n\r\n<p dir=\"ltr\"><span style=\"font-size:20px\"><strong>Best Way to Reach the Location</strong></span></p>\r\n\r\n<p><img alt=\"\" src=\"https://media-cdn.tripadvisor.com/media/photo-w/12/86/67/b9/photo0jpg.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">To reach the Omnia Bali Day Club, it will be easier if driving using a private car or rent a car especially for those of you who go on vacation with family and are in a group trip. Conventional taxis or online taxis cannot reach this location due to limited access. It is also advisable to rent a car + driver for you who have not been reliable in bringing the car because of the many sharp cornering roads.</p>\r\n\r\n<p dir=\"ltr\">Moreover, the Omnia Bali Day Club does not provide parking valet services. You have to park your own car and it is possible not to get a parking lot especially on the weekend and national holidays due to limited parking space. If you belong to a new female driver and are afraid to park your own car, it would be better to rent a car and driver.</p>\r\n",
              "SortPriority": 1,
              "CreateDateTime": 1526539208,
              "Category": null,
              "ViewCount": 6
            },
            {
              "StoryId": "8cfc2ef5-2c8d-44ae-b7d1-fe6c93d85f25",
              "Author": "Patrecia",
              "WrittenDate": "2018-05-15T00:00:00",
              "ImageUrl":
              "https://nemob.id/service/image/travelstory/8cfc2ef5-2c8d-44ae-b7d1-fe6c93d85f25.jpg",
              "Language": "en-US",
              "Slug": "5-Instagrammable-Spots-in-Medan",
              "Title": "5 Instagrammable Spots in Medan ",
              "ShortContent":
              "Medan is the largest metropolitan city in Indonesia after Jakarta and Surabaya. Medan also became one of the most favorite destinations.",
              "LongContent":
              "<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:12.0pt\">Medan is the largest metropolitan city in Indonesia after Jakarta and Surabaya. Medan also became one of the most favorite destinations. The city that has the nickname &ldquo;Kota Melayu Deli&rdquo; is have a lot of destinations and the beauty of its landscape. Starting from the natural tourism, historical, education and culinary can be found in every spot of this city.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:12.0pt\">But not only that, Medan still have other beauty. This city presents a variety of other tours that can mesmerize anyone who comes to visit to take a break from daily activity, or just take a photo.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:11pt\"><span style=\"font-size:12.0pt\">Do you feel curious about the spot? So check this out ! </span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:20px\"><strong><span style=\"font-family:Calibri,sans-serif\">1. Sipiso Waterfall - Piso, The Charm of the Exotic landscape</span></strong></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><img alt=\"\" src=\"https://i.imgur.com/JkcRaNM.jpg\" style=\"height:100%; width:100%\" /></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Located in the natural area which is not too far from the settlement Tongging Village is the highest waterfall in Indonesia which has 120 meters height.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Sipiso - Piso Waterfall give you the exotic scenery of an exotic waterfall. You can also enjoy the scenery of Sipiso - Piso waterfall from Gardu Pandang which is located at the top of the hill while capturing the moment with the background of waterfall.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><strong><span style=\"font-size:20px\"><span style=\"font-family:Calibri,sans-serif\">2. No need to go to Thailand, medan also has a pagoda in Lumbini Natural Park</span></span></strong></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><img alt=\"\" src=\"https://i.imgur.com/aNgKMSs.jpg\" style=\"height:100%; width:100%\" /></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Located in Tanah Karo, Tongkoh Village there is a park that makes anyone who comes to visit feels abroad.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">There is a replica of the Shwedagon Pagoda, which you can take a photo as if you were abroad. So, no need to go to Thailand anymore, just go to this park !</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:20px\"><strong><span style=\"font-family:Calibri,sans-serif\">3. Amazing landscape in the Tinggi Raja White Crater !</span></strong></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><img alt=\"\" src=\"https://i.imgur.com/PmYEyQl.jpg\" style=\"height:100%; width:100%\" /></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Find unusual destinations? Tinggi Raja White Crater could be one option.&nbsp; Tinggi Raja White Crater as known as Dolok Tinggi Raja is located in the middle of Simalungun nature reserve.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Dolok Tinggi Raja is a crater that has a spring water source that reaches a temperature about 90 degrees Celsius and contains sulfur so you can boil eggs in the water until its cooked !</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Also you can enjoy amazing view of the flow of spring water that flows between the limestone rocks staircase that make the rock into a clean white like snow, some people call it with hot snow.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">And the last, you can also take a bath or just wash the body in the turquoise water inside the small estuary of the mini waterfall near the crater.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:20px\"><strong><span style=\"font-family:Calibri,sans-serif\">4. Having fun with elephant in Tangkahan Conservation Forest</span></strong></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><img alt=\"\" src=\"https://i.imgur.com/FppfJBZ.jpg\" style=\"height:100%; width:100%\" /></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Tangkahan Conservation Forest, is a perfect spot for who love nature and want to interact with the animals. Located near Buluh Bulusan River, the spot is also amazing.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">You can walk around the conservation forest by riding an elephant, feeding elephants and also having fun with the elephants in Kualsa Buluh River. A moment you should capture,right?</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:20px\"><strong><span style=\"font-family:Calibri,sans-serif\">5. Explore the Greatest Monastery in Indonesia: Maha Vihara Maitreya</span></strong></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\"><img alt=\"\" src=\"https://i.imgur.com/vVUEwjp.jpg\" style=\"height:100%; width:100%\" /></span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">The monastery, built in 1991 on with 4.5 hectares area, is the largest monastery in Indonesia. The monastery that presents a cool interior with a calm and relaxing atmosphere.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Beside as a prayer room, its also full of culture in the inside , the Maitreya temple also has a lot of spots to take a photo such as buddha statues, koi ponds, and big bells that you shouldn&rsquo;t miss.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Thats all 5 instagrammable spot in Medan you shouldn&rsquo;t miss.</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Being Interested to visit one of those spots? Make it easier with nemob !</span></span></span></p>\r\n\r\n<p style=\"margin-left:0cm; margin-right:0cm\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:12.0pt\">Download apps&nbsp; from the App Store and Google Playstore for the best and most convenient car rental reservations. Reservation is also available in the official website <a href=\"https://nemob.id/id/search?pickup_city=Medan\">nemob.id</a> or Customer Care service at (021) 2962 9902 &amp; 0857 5509 5119. Visit and follow <a href=\"https://www.instagram.com/nemob.id\">Instagram</a>&nbsp;for the latest information and promo!</span></span></span></p>\r\n",
              "SortPriority": 1,
              "CreateDateTime": 1526374869,
              "Category": null,
              "ViewCount": 0
            },
            {
              "StoryId": "e1c1522d-ea15-4237-be9f-9c86cbf87d1c",
              "Author": "Patrecia",
              "WrittenDate": "2018-05-15T00:00:00",
              "ImageUrl":
              "https://nemob.id/service/image/travelstory/e1c1522d-ea15-4237-be9f-9c86cbf87d1c.jpg",
              "Language": "en-US",
              "Slug": "Cheap-Car-Rentals-In-Jakarta",
              "Title": "Cheap Car Rentals In Jakarta",
              "ShortContent":
              "Life in the capital city of Jakarta is identic with a word fast-paced. Most residents of Jakarta spend the day with activities outside the home starting from work, school to college",
              "LongContent":
              "<p dir=\"ltr\">Life in the capital city of Jakarta is identic with a word fast-paced. Most residents of Jakarta spend the day with activities outside the home starting from work, school to college. With the dense activity they do every day, they do not have time to release the stress or refreshing like hanging out or go on vacation. Weekend or national holiday is the most effective moment to spend with family, friends, or spouse.</p>\r\n\r\n<p><img alt=\"\" src=\"https://artikel.pricearea.com/wp-content/uploads/2017/12/tempat-wisata-di-jakarta.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">There are some interesting places in Jakarta that can be an option for a vacation or just hanging out such as National Monument, Angke Kapuk Tourism Park, Dufan (Fantasy World), Ragunan Zoo, etc. For those of you who have children and want to enjoy the water attraction, Jakarta also has some water attractions that are not less interesting like Ancol Dreamland Park, Atlantis Water Adventure, and SnowBay Waterpark TMII. These places are usually alternative interesting places visited by tourists when they are in Jakarta.</p>\r\n\r\n<p><img alt=\"\" src=\"https://i0.wp.com/res.cloudinary.com/trentechid/image/upload/v1481379207/fortechinasia_ziiesj.jpg?fit=740%2C416\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p dir=\"ltr\">For you who live in Jakarta or tourist, you can use a private vehicle to go to the places above because it is easier than using the public transportation. You do not need to jostle with the crowd and can move to the other places more easily and quickly. However, do not worry if you do not have a private vehicle, you can use Car Rental service in Jakarta easily and cheaply through Nemob application, the official website <a href=\"http://nemob.id\">nemob.id</a> or Customer Care service at (021) 2962 9902 &amp; 0857 5509 5119.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">You can book a car directly and do not have to worry about the availability because Nemob car rental is available for 24 hours. Nemob has various renting time starting from 6, 12 to 24 hours. It is also possible if you want to go out of the island or out of town for vacation with a car rental, because Nemob also provides daily, weekly, and monthly car rental.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">The process of this car rental is not complicated, you just leave the ID card and show the driving license if you want to drive by yourself. Before your journey begins, Nemob will give you a briefing and gasoline that will make your trip easier. In addition, for you who cannot drive a car or are afraid to drive out of town, a car rental along with a driver can be found in Nemob.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">What are you waiting for? Let&#39;s take a vacation with Nemob!</p>\r\n\r\n<p>&nbsp;</p>\r\n",
              "SortPriority": 1,
              "CreateDateTime": 1526366346,
              "Category": null,
              "ViewCount": 0
            },
            {
              "StoryId": "b1a42e93-705c-4ee2-bdb4-83c65bf22860",
              "Author": "Patrecia",
              "WrittenDate": "2018-05-15T00:00:00",
              "ImageUrl":
              "https://nemob.id/service/image/travelstory/b1a42e93-705c-4ee2-bdb4-83c65bf22860.jpg",
              "Language": "en-US",
              "Slug": "3-Best-City-Views-in-Bandung-that-Make-You-Speechless",
              "Title": "3 Best City Views in Bandung that Make You Speechless!",
              "ShortContent":
              "Bandung as the capital city of West Java is famous with the nickname \"City of Flower\". There are so many beautiful flower gardens such as Begonia Garden Lembang and Lembang Cihideung Flower Garden",
              "LongContent":
              "<p dir=\"ltr\">Bandung as the capital city of West Java is famous with the nickname &quot;City of Flower&quot;. There are so many beautiful flower gardens such as Begonia Garden Lembang and Lembang Cihideung Flower Garden. Various kinds of flowers can be found in this garden starting from Moon Orchid, Celosia to Melampodium. In addition to the beautiful flower garden, Bandung also has tourist attractions that are visited by so many people such as Farmhouse Lembang, Tangkuban Perahu Mountain and White Crater Ciwidey. Bandung has a fresh air and less pollution than any other capital cities in Indonesia.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">But, apart from that, the main purpose of people who visiting Bandung is to enjoy the magnificent view of the city that can be seen from a place above the altitude. There are several places that can be visited for you who want to enjoy how amazing the city view of Bandung especially at night. These are the 3 best city views in Bandung that will make you speechless.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">1. &nbsp;&nbsp;&nbsp;&nbsp;G.H. Universal Hotel</p>\r\n\r\n<p><img alt=\"\" src=\"https://i.pinimg.com/564x/03/1a/4a/031a4a7e8d7598d6f29bb8f75c5f2235.jpg\" style=\"height:564px; width:564px\" /></p>\r\n\r\n<p dir=\"ltr\">G.H. Universal Hotel is a 5-star hotel located in the northern part of Bandung. The hotel presents the European style, luxury and comfort with Renaissance style architecture in the middle of the beautiful nature of Bandung. You can stay or just visit to enjoy the meal at Bellevue Restaurant while enjoying the beautiful view of the city of Bandung. Then, the rooftop located on the 5th floor of this hotel is also a place that is usually visited by people to see the beauty of Bandung.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">2. &nbsp;&nbsp;&nbsp;Skylight Cafe, Resto, and Lounge</p>\r\n\r\n<p><img alt=\"\" src=\"https://s3-ap-southeast-1.amazonaws.com/magazine.job-like.com/magazine/wp-content/uploads/2017/02/12221035/Skylight-Cafe.jpg\" style=\"height:337px; width:675px\" /></p>\r\n\r\n<p dir=\"ltr\">Located in Citra Green Dago, Permata Indowisata area, Skylight Cafe, Resto and Lounge becomes one of the favorite places visited to see the city view of Bandung while having lunch or dinner. To get onto Skylight Cafe, Resto, and Lounge, you have to use a private vehicle or rent a car. Public transport does not reach this place and the terrain is quite challenging. For those of you who have not been reliable in driving, it is advisable to rent a car with driver to get there.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">3. &nbsp;&nbsp;&nbsp;The Valley Bistro Caf&eacute; and Resort Hotel</p>\r\n\r\n<p><img alt=\"\" src=\"https://bandung.co/wp-content/uploads/2015/06/the-valley-cafe-bandung.jpg\" style=\"height:400px; width:740px\" /></p>\r\n\r\n<p dir=\"ltr\">The Valley Bistro Caf&eacute; and Resort Hotel is located in Dago Pakar, Ciburial, Cimenyan. Staying at this hilltop Hotel can be a choice to enjoy the view of Bandung from the hotel room window. The Valley Bistro Caf&eacute; also makes visitors fall in love with the western-style food dishes served along with a refreshing view. In addition, there are also Adventure Park with interesting game facilities provided such as flying fox, trampoline, and ATV.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">That&#39;s all the 3 amazing places to enjoy the best city view of Bandung.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p dir=\"ltr\">For those of you who want to visit these places but do not have a private car, Nemob present as a solution for you who want to use easy and cheap Car Rental services through Nemob application, official website www.nemob.id or directly contact Customer Care service at (021) 2962 9902 &amp; 0857 5509 5119.</p>\r\n\r\n<p>&nbsp;</p>\r\n",
              "SortPriority": 1,
              "CreateDateTime": 1526365423,
              "Category": null,
              "ViewCount": 2
            },
            {
              "StoryId": "e719564a-46b5-4bf9-9cd6-fa9efc3381ba",
              "Author": "Muntazz",
              "WrittenDate": "2018-04-20T00:00:00",
              "ImageUrl":
              "https://nemob.id/service/image/travelstory/e719564a-46b5-4bf9-9cd6-fa9efc3381ba.jpg",
              "Language": "en-US",
              "Slug": "Amazing-Art-World-Bandung",
              "Title": "Amazing Art World Bandung",
              "ShortContent":
              "You are looking for a cool photo spot? 3D Museum could be one option.",
              "LongContent":
              "<p>You are looking for a cool photo spot? 3D Museum could be one option. Its already exist in the city &nbsp;such as Malang, Semarang, Yogyakarta and Bali. Now, there is a new 3D museum are rising that its not too far from the capital, Bandung.</p>\r\n\r\n<p><img alt=\"\" src=\"https://media.travelingyuk.com/wp-content/uploads/2017/06/Amazing-Art-World.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p>The city Flower&rdquo; (the nickname of Bandung City) has the 3D museum,known as good as other museum in another City,its The Amazing City Art World. Showing dozens of works of three-dimensional painting by 5 Bandung city painter and 15 korean painter, claimed to be the world&#39;s largest 3D Museum.</p>\r\n\r\n<p>Come with the concept of one stop entertainment and education activity, you will be presented with a lot of cool painting that can fool your eyes. Cool paintings &nbsp;are divided into 13 zones of painting 3D, 4D and 5D, it is History Zone, Aqua Zone, Dinosaurs Zone, Animal Zone, Artistic Zone, Living Zone, Media Zone, Main Hall, Fantasy Zone, Love Zone, Black Art Zone, Winter Zone, Daily Zone, dan Roma Italy zone</p>\r\n\r\n<p>In The Amazing Art World, you can freely capture many photos with expressions that match with the background of the 3D painting you select and can also enjoy other exciting ride in The Amazing Art World with Nemob, best car rental in Bandung.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"http://bayudifik.blogs.uny.ac.id/wp-content/uploads/sites/5646/2017/04/Amazing-Art-World-Bandung-Mueseum-3D-Terbesar-Di-Indonesia.jpg\" style=\"height:100%; width:100%\" /></p>\r\n\r\n<p>To reach The Amazing Art World, it took only one hour from the city of Bandung or 6 hours from the capital based on the current traffic conditions. You will get the best and comfortable trip with Nemob, the best car rental in Bandung. With a selection of the best car rental + driver, your trip is definitely feels more exciting and more comfortable cause you can chat with your friends or your family while enjoying the trip to The Amazing Art World.</p>\r\n",
              "SortPriority": 0,
              "CreateDateTime": 1524211567,
              "Category": "Place",
              "ViewCount": 5
            }
          ]
        }
      ]
    },
    {
      "name": "orang",
      "appbar_title": "Orang",
      "content": [
        {"type": "header_picture", "data": "picture"},
        {
          "type": "text",
          "scroll_axis": "horizontal",
          "data": ["name", "gender", "age"]
        },
        {
          "type": "text",
          "scroll_axis": "horizontal",
          "data": ["company", "email"]
        },
        {"type": "text", "data": "address"},
        {"type": "text", "data": "about"}
      ]
    },
    {
      "name": "cerita",
      "appbar_title": "Cerita",
      "content": [
        {"type": "header_picture", "data": "ImageUrl"},
        {"type": "text", "data": "LongContent"}
      ]
    }
  ];


}
