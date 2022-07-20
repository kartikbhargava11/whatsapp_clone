import '../models/user.dart';
import '../models/chat.dart';
import '../models/call.dart';
import '../models/status.dart';

final currentUser = User(
    profilePhoto: "https://media.vanityfair.com/photos/551f1c62fa699a350cfdebbf/master/pass/leonardo-dicaprio-resort.jpg",
    contactName: "Kartik Bhargava"
  );

final users = [
  User(
    profilePhoto: "https://static.abplive.com/wp-content/uploads/sites/2/2021/01/23141520/TARA-3.jpg",
    contactName: "+91 98114 11500",
  ),
  User(
    profilePhoto: "https://gumlet.assettype.com/nationalherald%2F2022-04%2F088a9868-5a68-46bf-87e6-fb5d41e5554d%2FBGMI.webp",
    contactName: "B.G.M.I",
    isGroup: true,
  ),
  User(
    profilePhoto: "https://images.news18.com/ibnlive/uploads/2021/08/joe-root-100-celebration-1600-ap.jpg",
    contactName: "Explorers 11",
    isGroup: true,
  ),
  User(
    profilePhoto: "https://upload.wikimedia.org/wikipedia/commons/0/05/Sanjay_Dutt_snapped_promoting_his_film_%E2%80%98Bhoomi%E2%80%99.jpg",
    contactName: "Sanju",
  ),
  User(
    profilePhoto: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Johnny_Depp_Deauville_2019.jpg/640px-Johnny_Depp_Deauville_2019.jpg",
    contactName: "Jhonny",
  ),
  User(
    profilePhoto: "https://pbs.twimg.com/profile_images/1383196364792680448/N8CdupEu_400x400.jpg",
    contactName: "Amber",
  ),
  User(
    profilePhoto: "https://resize.indiatvnews.com/en/resize/oldbucket/715_-/entertainmentbollywood/IndiaTv50d818_emraan-hashmi.jpg",
    contactName: "Emraan",
  ),
  User(
    profilePhoto: "https://m.media-amazon.com/images/M/MV5BMjMwNTIxODg0OF5BMl5BanBnXkFtZTgwODg2NzM0OTE@._V1_.jpg",
    contactName: "Salman",
  ),
  User(
    profilePhoto: "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2022/05/29/2039608-moose-wala-con.jpg",
    contactName: "Sidhu Moose Wala",
  )
];


final chats = [
  Chat(
    user: users[0],
    timestamp: "4:34 PM",
    lastMessage: "Ok",
  ),
  Chat(
    user: users[1],
    timestamp: "4:02 PM",
    lastMessage: "Let's play Boys",
    lastGroupMessageContactName: "Adam",
  ),
  Chat(
    user: users[2],
    timestamp: "3:03 PM",
    lastMessage: "Sunday Playing 11 1) Alex Lees",
    lastGroupMessageContactName: "Joe Root",
    isMute: true
  ),
  Chat(
    user: users[3],
    timestamp: "12:35 PM",
    lastMessage: "ok son",
    isRead: false,
    unseenTexts: 2
  ),
  Chat(
    user: users[4],
    timestamp: "09:25 PM",
    lastMessage: "Jar of dirt",
    isRead: false,
    unseenTexts: 1
  ),
  Chat(
    user: users[5],
    timestamp: "04:15 PM",
    lastMessage: "My dog stepped on a bee",
    isRead: false,
    unseenTexts: 1
  ),
  Chat(
    user: users[6],
    timestamp: "Yesterday",
    lastMessage: "No",
    isRead: false,
  ),
  Chat(
    user: users[7],
    timestamp: "Monday",
    lastMessage: "hahaha",
    isRead: false,
  ),
  Chat(
    user: users[8],
    timestamp: "Sunday",
    lastMessage: "G.O.A.T",
    isRead: false,
  ),
  Chat(
      user: users[5],
      timestamp: "04:15 PM",
      lastMessage: "My dog stepped on a bee",
      isRead: false,
      unseenTexts: 1
  ),
  Chat(
    user: users[6],
    timestamp: "Yesterday",
    lastMessage: "No",
    isRead: false,
  ),
  Chat(
    user: users[7],
    timestamp: "Monday",
    lastMessage: "hahaha",
    isRead: false,
  ),
  Chat(
    user: users[8],
    timestamp: "Sunday",
    lastMessage: "G.O.A.T",
    isRead: false,
  ),
];

final calls = [
  Call(
    user: users[8],
    timestamp: "1:56 PM",
    isIncomingCall: false
  ),
  Call(
    user: users[8],
    timestamp: "1:36 PM",
    numberOfCalls: 4,
    isMissed: true
  ),
  Call(
    user: users[8],
    timestamp: "1:26 PM",
    isMissed: true
  ),
  Call(
    user: users[0],
    timestamp: "11:26 AM",
    isAudioCall: false
  ),
  Call(
    user: users[4],
    timestamp: "11:06 AM",
    isAudioCall: false,
    isMissed: true
  ),
];

final recentUpdates = [
  Status(
    user: users[5],
    timestamp: "22m ago",
    isViewed: true,
  ),
  Status(
    user: users[0],
    timestamp: "32m ago",
    isViewed: true,
  ),
  Status(
    user: users[4],
    timestamp: "1h ago",
    isViewed: true,
  ),
  Status(
    user: users[7],
    timestamp: "1h ago",
    isViewed: true,
  ),
  Status(
    user: users[8],
    timestamp: "2h ago",
    isViewed: true,
  )
];

final viewedUpdates = [
  Status(
    user: users[3],
    timestamp: "20m ago",
    isViewed: true,
  ),
  Status(
    user: users[6],
    timestamp: "4h ago",
    isViewed: true,
  ),
];