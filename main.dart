import 'package:flutter/material.dart';

void main() => runApp(const EduTruthApp());

// ============================ MODELS ============================

enum Role { student, mentor, admin }

enum AccountStatus { pending, verified, rejected }

enum RequestStatus { pending, accepted, rejected }

class AppUser {
  final String id;
  String name;
  String email;
  String password;
  String phone;
  Role role;
  AccountStatus status;
  DateTime registeredAt;
  // student
  String city;
  String stream;
  // mentor
  String college;
  String expertise;
  String experience;
  String bio;

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    this.phone = '',
    this.status = AccountStatus.pending,
    DateTime? registeredAt,
    this.city = '',
    this.stream = '',
    this.college = '',
    this.expertise = '',
    this.experience = '',
    this.bio = '',
  }) : registeredAt = registeredAt ?? DateTime.now();
}

class College {
  final String id;
  final String name;
  final String location;
  final String type;
  final String stream;
  final double rating;
  final String fees;
  final String about;
  College(this.id, this.name, this.location, this.type, this.stream,
      this.rating, this.fees, this.about);
}

class Review {
  final String id;
  final String collegeId;
  final String authorId;
  final String authorName;
  final int rating;
  final String text;
  final DateTime createdAt;
  Review(this.id, this.collegeId, this.authorId, this.authorName, this.rating,
      this.text)
      : createdAt = DateTime.now();
}

class MentorRequest {
  final String id;
  final String studentId;
  final String mentorId;
  RequestStatus status;
  final DateTime createdAt;
  MentorRequest(this.id, this.studentId, this.mentorId)
      : status = RequestStatus.pending,
        createdAt = DateTime.now();
}

class ChatMessage {
  final String id;
  final String requestId;
  final String senderId;
  final String text;
  final DateTime sentAt;
  ChatMessage(this.id, this.requestId, this.senderId, this.text)
      : sentAt = DateTime.now();
}

class AppNotification {
  final String id;
  final String userId; // 'admin' for admin
  final String title;
  final String body;
  final DateTime createdAt;
  bool read;
  AppNotification(this.id, this.userId, this.title, this.body)
      : createdAt = DateTime.now(),
        read = false;
}

// ============================ I18N ============================

enum Lang { en, te, hi, ta, kn, ml, mr, bn, gu, pa, or }

const Map<Lang, String> kLangNames = {
  Lang.en: 'English',
  Lang.te: 'తెలుగు',
  Lang.hi: 'हिंदी',
  Lang.ta: 'தமிழ்',
  Lang.kn: 'ಕನ್ನಡ',
  Lang.ml: 'മലയാളം',
  Lang.mr: 'मराठी',
  Lang.bn: 'বাংলা',
  Lang.gu: 'ગુજરાતી',
  Lang.pa: 'ਪੰਜਾਬੀ',
  Lang.or: 'ଓଡ଼ିଆ',
};

Lang langFromCode(String code) =>
    Lang.values.firstWhere((l) => l.name == code, orElse: () => Lang.en);

/// Order of translations: te, hi, ta, kn, ml, mr, bn, gu, pa, or
const List<Lang> _langOrder = [
  Lang.te,
  Lang.hi,
  Lang.ta,
  Lang.kn,
  Lang.ml,
  Lang.mr,
  Lang.bn,
  Lang.gu,
  Lang.pa,
  Lang.or,
];

const Map<String, List<String>> _t = {
  'EduTruth': [
    'ఎడ్యుట్రూత్',
    'एडुट्रुथ',
    'எடுட்ரூத்',
    'ಎಡುಟ್ರೂತ್',
    'എഡുട്രൂത്ത്',
    'एडुट्रुथ',
    'এডুট্রুথ',
    'એડુટ્રુથ',
    'ਐਡੂਟਰੂਥ',
    'ଏଡୁଟ୍ରୁଥ'
  ],
  'Honest college guidance from verified mentors': [
    'ధృవీకరించిన మెంటర్ల నుండి నిజమైన కళాశాల మార్గదర్శకత్వం',
    'सत्यापित मेंटर्स से सच्चा कॉलेज मार्गदर्शन',
    'சரிபார்க்கப்பட்ட வழிகாட்டிகளிடமிருந்து நேர்மையான கல்லூரி வழிகாட்டல்',
    'ಪರಿಶೀಲಿತ ಮಾರ್ಗದರ್ಶಕರಿಂದ ಪ್ರಾಮಾಣಿಕ ಕಾಲೇಜು ಮಾರ್ಗದರ್ಶನ',
    'സ്ഥിരീകരിച്ച മെന്റർമാരിൽ നിന്ന് സത്യസന്ധമായ കോളേജ് മാർഗനിർദേശം',
    'सत्यापित मार्गदर्शकांकडून प्रामाणिक महाविद्यालय मार्गदर्शन',
    'যাচাইকৃত মেন্টরদের কাছ থেকে সৎ কলেজ নির্দেশনা',
    'ચકાસાયેલ મેન્ટર્સ તરફથી પ્રામાણિક કૉલેજ માર્ગદર્શન',
    'ਤਸਦੀਕਸ਼ੁਦਾ ਮੈਂਟਰਾਂ ਤੋਂ ਇਮਾਨਦਾਰ ਕਾਲਜ ਮਾਰਗਦਰਸ਼ਨ',
    'ଯାଞ୍ଚିତ ମେଣ୍ଟରଙ୍କଠାରୁ ସଚ୍ଚୋଟ କଲେଜ ମାର୍ଗଦର୍ଶନ'
  ],
  'Login': [
    'లాగిన్',
    'लॉगिन',
    'உள்நுழைவு',
    'ಲಾಗಿನ್',
    'ലോഗിൻ',
    'लॉगिन',
    'লগইন',
    'લૉગિન',
    'ਲੌਗਇਨ',
    'ଲଗଇନ୍'
  ],
  'Create Account': [
    'ఖాతా సృష్టించండి',
    'खाता बनाएँ',
    'கணக்கை உருவாக்கு',
    'ಖಾತೆ ರಚಿಸಿ',
    'അക്കൗണ്ട് സൃഷ്ടിക്കുക',
    'खाते तयार करा',
    'অ্যাকাউন্ট তৈরি করুন',
    'ખાતું બનાવો',
    'ਖਾਤਾ ਬਣਾਓ',
    'ଆକାଉଣ୍ଟ ତିଆରି କରନ୍ତୁ'
  ],
  'Student': [
    'విద్యార్థి',
    'छात्र',
    'மாணவர்',
    'ವಿದ್ಯಾರ್ಥಿ',
    'വിദ്യാർത്ഥി',
    'विद्यार्थी',
    'শিক্ষার্থী',
    'વિદ્યાર્થી',
    'ਵਿਦਿਆਰਥੀ',
    'ଛାତ୍ର'
  ],
  'Mentor': [
    'మెంటర్',
    'मेंटर',
    'வழிகாட்டி',
    'ಮಾರ್ಗದರ್ಶಕ',
    'മെന്റർ',
    'मार्गदर्शक',
    'মেন্টর',
    'મેન્ટર',
    'ਮੈਂਟਰ',
    'ମେଣ୍ଟର'
  ],
  'Admin': [
    'అడ్మిన్',
    'एडमिन',
    'நிர்வாகி',
    'ನಿರ್ವಾಹಕ',
    'അഡ്മിൻ',
    'प्रशासक',
    'অ্যাডমিন',
    'એડમિન',
    'ਐਡਮਿਨ',
    'ଆଡମିନ୍'
  ],
  'Home': [
    'హోమ్',
    'होम',
    'முகப்பு',
    'ಮುಖಪುಟ',
    'ഹോം',
    'मुख्यपृष्ठ',
    'হোম',
    'હોમ',
    'ਹੋਮ',
    'ହୋମ୍'
  ],
  'Colleges': [
    'కళాశాలలు',
    'कॉलेज',
    'கல்லூரிகள்',
    'ಕಾಲೇಜುಗಳು',
    'കോളേജുകൾ',
    'महाविद्यालये',
    'কলেজসমূহ',
    'કૉલેજો',
    'ਕਾਲਜ',
    'କଲେଜଗୁଡ଼ିକ'
  ],
  'Verified Mentors': [
    'ధృవీకరించిన మెంటర్లు',
    'सत्यापित मेंटर्स',
    'சரிபார்க்கப்பட்ட வழிகாட்டிகள்',
    'ಪರಿಶೀಲಿತ ಮಾರ್ಗದರ್ಶಕರು',
    'സ്ഥിരീകരിച്ച മെന്റർമാർ',
    'सत्यापित मार्गदर्शक',
    'যাচাইকৃত মেন্টর',
    'ચકાસાયેલ મેન્ટર્સ',
    'ਤਸਦੀਕਸ਼ੁਦਾ ਮੈਂਟਰ',
    'ଯାଞ୍ଚିତ ମେଣ୍ଟରମାନେ'
  ],
  'Profile': [
    'ప్రొఫైల్',
    'प्रोफ़ाइल',
    'சுயவிவரம்',
    'ಪ್ರೊಫೈಲ್',
    'പ്രൊഫൈൽ',
    'प्रोफाइल',
    'প্রোফাইল',
    'પ્રોફાઇલ',
    'ਪ੍ਰੋਫਾਈਲ',
    'ପ୍ରୋଫାଇଲ୍'
  ],
  'Notifications': [
    'నోటిఫికేషన్లు',
    'सूचनाएँ',
    'அறிவிப்புகள்',
    'ಅಧಿಸೂಚನೆಗಳು',
    'അറിയിപ്പുകൾ',
    'सूचना',
    'বিজ্ঞপ্তি',
    'સૂચનાઓ',
    'ਸੂਚਨਾਵਾਂ',
    'ବିଜ୍ଞପ୍ତି'
  ],
  'Logout': [
    'లాగ్ అవుట్',
    'लॉगआउट',
    'வெளியேறு',
    'ಲಾಗ್ ಔಟ್',
    'ലോഗ് ഔട്ട്',
    'लॉगआउट',
    'লগআউট',
    'લૉગઆઉટ',
    'ਲੌਗਆਊਟ',
    'ଲଗଆଉଟ୍'
  ],
  'Search': [
    'వెతకండి',
    'खोजें',
    'தேடு',
    'ಹುಡುಕಿ',
    'തിരയുക',
    'शोधा',
    'খুঁজুন',
    'શોધો',
    'ਖੋਜੋ',
    'ଖୋଜନ୍ତୁ'
  ],
  'Saved': [
    'సేవ్ చేసినవి',
    'सहेजे गए',
    'சேமித்தவை',
    'ಉಳಿಸಿದವು',
    'സേവ് ചെയ്തവ',
    'जतन केलेले',
    'সংরক্ষিত',
    'સાચવેલ',
    'ਸੰਭਾਲੇ',
    'ସଞ୍ଚିତ'
  ],
  'Reviews': [
    'సమీక్షలు',
    'समीक्षाएँ',
    'மதிப்புரைகள்',
    'ವಿಮರ್ಶೆಗಳು',
    'അവലോകനങ്ങൾ',
    'पुनरावलोकने',
    'পর্যালোচনা',
    'સમીક્ષાઓ',
    'ਸਮੀਖਿਆਵਾਂ',
    'ସମୀକ୍ଷା'
  ],
  'Chat': [
    'చాట్',
    'चैट',
    'அரட்டை',
    'ಚಾಟ್',
    'ചാറ്റ്',
    'चॅट',
    'চ্যাট',
    'ચેટ',
    'ਚੈਟ',
    'ଚାଟ୍'
  ],
  'Requests': [
    'అభ్యర్థనలు',
    'अनुरोध',
    'கோரிக்கைகள்',
    'ವಿನಂತಿಗಳು',
    'അഭ്യർത്ഥനകൾ',
    'विनंत्या',
    'অনুরোধ',
    'વિનંતીઓ',
    'ਬੇਨਤੀਆਂ',
    'ଅନୁରୋଧ'
  ],
  'Language': [
    'భాష',
    'भाषा',
    'மொழி',
    'ಭಾಷೆ',
    'ഭാഷ',
    'भाषा',
    'ভাষা',
    'ભાષા',
    'ਭਾਸ਼ਾ',
    'ଭାଷା'
  ],
  'Your account approval request has been sent to Admin.': [
    'మీ ఖాతా ఆమోద అభ్యర్థన అడ్మిన్‌కు పంపబడింది.',
    'आपका खाता अनुमोदन अनुरोध एडमिन को भेज दिया गया है।',
    'உங்கள் கணக்கு ஒப்புதல் கோரிக்கை நிர்வாகிக்கு அனுப்பப்பட்டது.',
    'ನಿಮ್ಮ ಖಾತೆ ಅನುಮೋದನೆ ವಿನಂತಿಯನ್ನು ನಿರ್ವಾಹಕರಿಗೆ ಕಳುಹಿಸಲಾಗಿದೆ.',
    'നിങ്ങളുടെ അക്കൗണ്ട് അംഗീകാര അഭ്യർത്ഥന അഡ്മിന് അയച്ചു.',
    'तुमची खाते मंजुरी विनंती प्रशासकाकडे पाठवली आहे.',
    'আপনার অ্যাকাউন্ট অনুমোদনের অনুরোধ অ্যাডমিনের কাছে পাঠানো হয়েছে।',
    'તમારી ખાતા મંજૂરી વિનંતી એડમિનને મોકલવામાં આવી છે.',
    'ਤੁਹਾਡੀ ਖਾਤਾ ਮਨਜ਼ੂਰੀ ਬੇਨਤੀ ਐਡਮਿਨ ਨੂੰ ਭੇਜੀ ਗਈ ਹੈ।',
    'ଆପଣଙ୍କ ଆକାଉଣ୍ଟ ଅନୁମୋଦନ ଅନୁରୋଧ ଆଡମିନଙ୍କୁ ପଠାଯାଇଛି।'
  ],
  'Your account is waiting for Admin approval.': [
    'మీ ఖాతా అడ్మిన్ ఆమోదం కోసం వేచి ఉంది.',
    'आपका खाता एडमिन अनुमोदन की प्रतीक्षा में है।',
    'உங்கள் கணக்கு நிர்வாகி ஒப்புதலுக்காக காத்திருக்கிறது.',
    'ನಿಮ್ಮ ಖಾತೆ ನಿರ್ವಾಹಕರ ಅನುಮೋದನೆಗಾಗಿ ಕಾಯುತ್ತಿದೆ.',
    'നിങ്ങളുടെ അക്കൗണ്ട് അഡ്മിൻ അംഗീകാരത്തിനായി കാത്തിരിക്കുന്നു.',
    'तुमचे खाते प्रशासक मंजुरीची वाट पाहत आहे.',
    'আপনার অ্যাকাউন্ট অ্যাডমিন অনুমোদনের অপেক্ষায় আছে।',
    'તમારું ખાતું એડમિન મંજૂરીની રાહ જોઈ રહ્યું છે.',
    'ਤੁਹਾਡਾ ਖਾਤਾ ਐਡਮਿਨ ਮਨਜ਼ੂਰੀ ਦੀ ਉਡੀਕ ਕਰ ਰਿਹਾ ਹੈ।',
    'ଆପଣଙ୍କ ଆକାଉଣ୍ଟ ଆଡମିନ୍ ଅନୁମୋଦନ ପାଇଁ ଅପେକ୍ଷା କରୁଛି।'
  ],
  'A student': [
    'ఒక విద్యార్థి',
    'एक छात्र',
    'ஒரு மாணவர்',
    'ಒಬ್ಬ ವಿದ್ಯಾರ್ಥಿ',
    'ഒരു വിദ്യാർത്ഥി',
    'एक विद्यार्थी',
    'একজন শিক্ষার্থী',
    'એક વિદ્યાર્થી',
    'ਇੱਕ ਵਿਦਿਆਰਥੀ',
    'ଜଣେ ଛାତ୍ର'
  ],
  'About': [
    'గురించి',
    'परिचय',
    'பற்றி',
    'ಬಗ್ಗೆ',
    'കുറിച്ച്',
    'विषयी',
    'সম্পর্কে',
    'વિશે',
    'ਬਾਰੇ',
    'ବିଷୟରେ'
  ],
  'Accept': [
    'ఆమోదించు',
    'स्वीकार करें',
    'ஏற்கவும்',
    'ಸ್ವೀಕರಿಸಿ',
    'സ്വീകരിക്കുക',
    'स्वीकारा',
    'গ্রহণ করুন',
    'સ્વીકારો',
    'ਸਵੀਕਾਰ ਕਰੋ',
    'ଗ୍ରହଣ କରନ୍ତୁ'
  ],
  'Accepted': [
    'ఆమోదించబడింది',
    'स्वीकृत',
    'ஏற்கப்பட்டது',
    'ಸ್ವೀಕರಿಸಲಾಗಿದೆ',
    'സ്വീകരിച്ചു',
    'स्वीकारले',
    'গৃহীত',
    'સ્વીકૃત',
    'ਸਵੀਕਾਰ ਕੀਤਾ',
    'ଗୃହୀତ'
  ],
  'Account approved': [
    'ఖాతా ఆమోదించబడింది',
    'खाता स्वीकृत',
    'கணக்கு அங்கீகரிக்கப்பட்டது',
    'ಖಾತೆ ಅನುಮೋದಿಸಲಾಗಿದೆ',
    'അക്കൗണ്ട് അംഗീകരിച്ചു',
    'खाते मंजूर',
    'অ্যাকাউন্ট অনুমোদিত',
    'ખાતું મંજૂર',
    'ਖਾਤਾ ਮਨਜ਼ੂਰ',
    'ଆକାଉଣ୍ଟ ଅନୁମୋଦିତ'
  ],
  'Account deleted.': [
    'ఖాతా తొలగించబడింది.',
    'खाता हटा दिया गया।',
    'கணக்கு நீக்கப்பட்டது.',
    'ಖಾತೆ ಅಳಿಸಲಾಗಿದೆ.',
    'അക്കൗണ്ട് ഇല്ലാതാക്കി.',
    'खाते हटवले.',
    'অ্যাকাউন্ট মুছে ফেলা হয়েছে।',
    'ખાતું કાઢી નાખ્યું.',
    'ਖਾਤਾ ਮਿਟਾ ਦਿੱਤਾ ਗਿਆ।',
    'ଆକାଉଣ୍ଟ ବିଲୋପ ହେଲା।'
  ],
  'Account rejected': [
    'ఖాతా తిరస్కరించబడింది',
    'खाता अस्वीकृत',
    'கணக்கு நிராகரிக்கப்பட்டது',
    'ಖಾತೆ ತಿರಸ್ಕರಿಸಲಾಗಿದೆ',
    'അക്കൗണ്ട് നിരസിച്ചു',
    'खाते नाकारले',
    'অ্যাকাউন্ট প্রত্যাখ্যাত',
    'ખાતું નકારાયું',
    'ਖਾਤਾ ਰੱਦ',
    'ଆକାଉଣ୍ଟ ପ୍ରତ୍ୟାଖ୍ୟାତ'
  ],
  'Add': [
    'జోడించు',
    'जोड़ें',
    'சேர்',
    'ಸೇರಿಸಿ',
    'ചേർക്കുക',
    'जोडा',
    'যোগ করুন',
    'ઉમેરો',
    'ਸ਼ਾਮਲ ਕਰੋ',
    'ଯୋଡ଼ନ୍ତୁ'
  ],
  'Add college': [
    'కళాశాలను జోడించు',
    'कॉलेज जोड़ें',
    'கல்லூரி சேர்',
    'ಕಾಲೇಜು ಸೇರಿಸಿ',
    'കോളേജ് ചേർക്കുക',
    'महाविद्यालय जोडा',
    'কলেজ যোগ করুন',
    'કૉલેજ ઉમેરો',
    'ਕਾਲਜ ਸ਼ਾਮਲ ਕਰੋ',
    'କଲେଜ ଯୋଡ଼ନ୍ତୁ'
  ],
  'Added by admin.': [
    'అడ్మిన్ ద్వారా జోడించబడింది.',
    'एडमिन द्वारा जोड़ा गया।',
    'நிர்வாகியால் சேர்க்கப்பட்டது.',
    'ನಿರ್ವಾಹಕರಿಂದ ಸೇರಿಸಲಾಗಿದೆ.',
    'അഡ്മിൻ ചേർത്തത്.',
    'प्रशासकाने जोडले.',
    'অ্যাডমিন যোগ করেছেন।',
    'એડમિન દ્વારા ઉમેરાયું.',
    'ਐਡਮਿਨ ਵੱਲੋਂ ਸ਼ਾਮਲ।',
    'ଆଡମିନ୍ ଦ୍ୱାରା ଯୋଡ଼ାଯାଇଛି।'
  ],
  'Admin Dashboard': [
    'అడ్మిన్ డాష్‌బోర్డ్',
    'एडमिन डैशबोर्ड',
    'நிர்வாக டாஷ்போர்டு',
    'ನಿರ್ವಾಹಕ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್',
    'അഡ്മിൻ ഡാഷ്ബോർഡ്',
    'प्रशासक डॅशबोर्ड',
    'অ্যাডমিন ড্যাশবোর্ড',
    'એડમિન ડેશબોર્ડ',
    'ਐਡਮਿਨ ਡੈਸ਼ਬੋਰਡ',
    'ଆଡମିନ୍ ଡ୍ୟାସବୋର୍ଡ'
  ],
  'Admin Login': [
    'అడ్మిన్ లాగిన్',
    'एडमिन लॉगिन',
    'நிர்வாகி உள்நுழைவு',
    'ನಿರ್ವಾಹಕ ಲಾಗಿನ್',
    'അഡ്മിൻ ലോഗിൻ',
    'प्रशासक लॉगिन',
    'অ্যাডমিন লগইন',
    'એડમિન લૉગિન',
    'ਐਡਮਿਨ ਲੌਗਇਨ',
    'ଆଡମିନ୍ ଲଗଇନ୍'
  ],
  'Admin view is read only. Replying is disabled.': [
    'అడ్మిన్ వీక్షణ చదవడానికి మాత్రమే. ప్రత్యుత్తరం నిలిపివేయబడింది.',
    'एडमिन दृश्य केवल पढ़ने के लिए है। उत्तर देना बंद है।',
    'நிர்வாகி பார்வை படிக்க மட்டும். பதில் அளிக்க முடியாது.',
    'ನಿರ್ವಾಹಕ ವೀಕ್ಷಣೆ ಓದಲು ಮಾತ್ರ. ಉತ್ತರಿಸುವುದು ನಿಷ್ಕ್ರಿಯ.',
    'അഡ്മിൻ കാഴ്ച വായിക്കാൻ മാത്രം. മറുപടി അപ്രാപ്തം.',
    'प्रशासक दृश्य फक्त वाचनासाठी. उत्तर देणे बंद.',
    'অ্যাডমিন ভিউ শুধু পড়ার জন্য। উত্তর দেওয়া বন্ধ।',
    'એડમિન વ્યૂ ફક્ત વાંચવા માટે. જવાબ આપવો બંધ.',
    'ਐਡਮਿਨ ਦ੍ਰਿਸ਼ ਸਿਰਫ਼ ਪੜ੍ਹਨ ਲਈ। ਜਵਾਬ ਦੇਣਾ ਬੰਦ।',
    'ଆଡମିନ୍ ଦୃଶ୍ୟ କେବଳ ପଢ଼ିବା ପାଇଁ। ଉତ୍ତର ଦେବା ବନ୍ଦ।'
  ],
  'All': [
    'అన్నీ',
    'सभी',
    'அனைத்தும்',
    'ಎಲ್ಲಾ',
    'എല്ലാം',
    'सर्व',
    'সব',
    'બધા',
    'ਸਾਰੇ',
    'ସମସ୍ତ'
  ],
  'All accounts': [
    'అన్ని ఖాతాలు',
    'सभी खाते',
    'அனைத்து கணக்குகள்',
    'ಎಲ್ಲಾ ಖಾತೆಗಳು',
    'എല്ലാ അക്കൗണ്ടുകളും',
    'सर्व खाती',
    'সব অ্যাকাউন্ট',
    'બધા ખાતાં',
    'ਸਾਰੇ ਖਾਤੇ',
    'ସମସ୍ତ ଆକାଉଣ୍ଟ'
  ],
  'Already registered?': [
    'ఇప్పటికే నమోదు అయ్యారా?',
    'पहले से पंजीकृत हैं?',
    'ஏற்கனவே பதிவு செய்துள்ளீர்களா?',
    'ಈಗಾಗಲೇ ನೋಂದಾಯಿಸಿದ್ದೀರಾ?',
    'ഇതിനകം രജിസ്റ്റർ ചെയ്തോ?',
    'आधीच नोंदणी केली आहे?',
    'ইতিমধ্যে নিবন্ধিত?',
    'પહેલેથી નોંધાયેલ છો?',
    'ਪਹਿਲਾਂ ਹੀ ਰਜਿਸਟਰਡ?',
    'ପୂର୍ବରୁ ପଞ୍ଜୀକୃତ?'
  ],
  'An account with this email already exists.': [
    'ఈ ఇమెయిల్‌తో ఖాతా ఇప్పటికే ఉంది.',
    'इस ईमेल से खाता पहले से मौजूद है।',
    'இந்த மின்னஞ்சலுடன் கணக்கு ஏற்கனவே உள்ளது.',
    'ಈ ಇಮೇಲ್‌ನೊಂದಿಗೆ ಖಾತೆ ಈಗಾಗಲೇ ಇದೆ.',
    'ഈ ഇമെയിലിൽ അക്കൗണ്ട് നിലവിലുണ്ട്.',
    'या ईमेलसह खाते आधीच अस्तित्वात आहे.',
    'এই ইমেলে অ্যাকাউন্ট ইতিমধ্যে আছে।',
    'આ ઈમેલ સાથે ખાતું પહેલેથી છે.',
    'ਇਸ ਈਮੇਲ ਨਾਲ ਖਾਤਾ ਪਹਿਲਾਂ ਹੀ ਹੈ।',
    'ଏହି ଇମେଲରେ ଆକାଉଣ୍ଟ ପୂର୍ବରୁ ଅଛି।'
  ],
  'Approval Requests': [
    'ఆమోద అభ్యర్థనలు',
    'अनुमोदन अनुरोध',
    'ஒப்புதல் கோரிக்கைகள்',
    'ಅನುಮೋದನೆ ವಿನಂತಿಗಳು',
    'അംഗീകാര അഭ്യർത്ഥനകൾ',
    'मंजुरी विनंत्या',
    'অনুমোদনের অনুরোধ',
    'મંજૂરી વિનંતીઓ',
    'ਮਨਜ਼ੂਰੀ ਬੇਨਤੀਆਂ',
    'ଅନୁମୋଦନ ଅନୁରୋଧ'
  ],
  'Approve': [
    'ఆమోదించు',
    'स्वीकृत करें',
    'அங்கீகரி',
    'ಅನುಮೋದಿಸಿ',
    'അംഗീകരിക്കുക',
    'मंजूर करा',
    'অনুমোদন',
    'મંજૂર કરો',
    'ਮਨਜ਼ੂਰ ਕਰੋ',
    'ଅନୁମୋଦନ କରନ୍ତୁ'
  ],
  'Bio': [
    'పరిచయం',
    'बायो',
    'சுயவிவரக் குறிப்பு',
    'ಪರಿಚಯ',
    'ബയോ',
    'परिचय',
    'পরিচিতি',
    'બાયો',
    'ਬਾਇਓ',
    'ପରିଚୟ'
  ],
  'By': [
    'ద్వారా',
    'द्वारा',
    'மூலம்',
    'ಮೂಲಕ',
    'എഴുതിയത്',
    'द्वारा',
    'লিখেছেন',
    'દ્વારા',
    'ਵੱਲੋਂ',
    'ଦ୍ୱାରା'
  ],
  'Cancel': [
    'రద్దు',
    'रद्द करें',
    'ரத்து',
    'ರದ್ದು',
    'റദ്ദാക്കുക',
    'रद्द करा',
    'বাতিল',
    'રદ કરો',
    'ਰੱਦ ਕਰੋ',
    'ବାତିଲ'
  ],
  'Chat History': [
    'చాట్ చరిత్ర',
    'चैट इतिहास',
    'அரட்டை வரலாறு',
    'ಚಾಟ್ ಇತಿಹಾಸ',
    'ചാറ്റ് ചരിത്രം',
    'चॅट इतिहास',
    'চ্যাট ইতিহাস',
    'ચેટ ઇતિહાસ',
    'ਚੈਟ ਇਤਿਹਾਸ',
    'ଚାଟ୍ ଇତିହାସ'
  ],
  'Chat is available only after the mentor accepts.': [
    'మెంటర్ ఆమోదించిన తర్వాతే చాట్ అందుబాటులో ఉంటుంది.',
    'चैट केवल मेंटर के स्वीकार करने के बाद उपलब्ध है।',
    'வழிகாட்டி ஏற்ற பிறகே அரட்டை கிடைக்கும்.',
    'ಮಾರ್ಗದರ್ಶಕರು ಸ್ವೀಕರಿಸಿದ ನಂತರವೇ ಚಾಟ್ ಲಭ್ಯ.',
    'മെന്റർ സ്വീകരിച്ചാൽ മാത്രമേ ചാറ്റ് ലഭ്യമാകൂ.',
    'मार्गदर्शकाने स्वीकारल्यानंतरच चॅट उपलब्ध.',
    'মেন্টর গ্রহণ করার পরেই চ্যাট উপলব্ধ।',
    'મેન્ટર સ્વીકારે પછી જ ચેટ ઉપલબ્ધ.',
    'ਮੈਂਟਰ ਦੇ ਸਵੀਕਾਰ ਕਰਨ ਤੋਂ ਬਾਅਦ ਹੀ ਚੈਟ ਉਪਲਬਧ।',
    'ମେଣ୍ଟର ଗ୍ରହଣ କଲାପରେ ହିଁ ଚାଟ୍ ଉପଲବ୍ଧ।'
  ],
  'Chat with Mentor': [
    'మెంటర్‌తో చాట్',
    'मेंटर से चैट',
    'வழிகாட்டியுடன் அரட்டை',
    'ಮಾರ್ಗದರ್ಶಕರೊಂದಿಗೆ ಚಾಟ್',
    'മെന്ററുമായി ചാറ്റ്',
    'मार्गदर्शकाशी चॅट',
    'মেন্টরের সাথে চ্যাট',
    'મેન્ટર સાથે ચેટ',
    'ਮੈਂਟਰ ਨਾਲ ਚੈਟ',
    'ମେଣ୍ଟରଙ୍କ ସହ ଚାଟ୍'
  ],
  'City': [
    'నగరం',
    'शहर',
    'நகரம்',
    'ನಗರ',
    'നഗരം',
    'शहर',
    'শহর',
    'શહેર',
    'ਸ਼ਹਿਰ',
    'ସହର'
  ],
  'College': [
    'కళాశాల',
    'कॉलेज',
    'கல்லூரி',
    'ಕಾಲೇಜು',
    'കോളേജ്',
    'महाविद्यालय',
    'কলেজ',
    'કૉલેજ',
    'ਕਾਲਜ',
    'କଲେଜ'
  ],
  'College / Organisation': [
    'కళాశాల / సంస్థ',
    'कॉलेज / संस्था',
    'கல்லூரி / அமைப்பு',
    'ಕಾಲೇಜು / ಸಂಸ್ಥೆ',
    'കോളേജ് / സ്ഥാപനം',
    'महाविद्यालय / संस्था',
    'কলেজ / প্রতিষ্ঠান',
    'કૉલેજ / સંસ્થા',
    'ਕਾਲਜ / ਸੰਸਥਾ',
    'କଲେଜ / ସଂସ୍ଥା'
  ],
  'College Details': [
    'కళాశాల వివరాలు',
    'कॉलेज विवरण',
    'கல்லூரி விவரங்கள்',
    'ಕಾಲೇಜು ವಿವರಗಳು',
    'കോളേജ് വിശദാംശങ്ങൾ',
    'महाविद्यालय तपशील',
    'কলেজের বিবরণ',
    'કૉલેજ વિગતો',
    'ਕਾਲਜ ਵੇਰਵੇ',
    'କଲେଜ ବିବରଣୀ'
  ],
  'College Management': [
    'కళాశాల నిర్వహణ',
    'कॉलेज प्रबंधन',
    'கல்லூரி மேலாண்மை',
    'ಕಾಲೇಜು ನಿರ್ವಹಣೆ',
    'കോളേജ് മാനേജ്മെന്റ്',
    'महाविद्यालय व्यवस्थापन',
    'কলেজ ব্যবস্থাপনা',
    'કૉલેજ સંચાલન',
    'ਕਾਲਜ ਪ੍ਰਬੰਧਨ',
    'କଲେଜ ପରିଚାଳନା'
  ],
  'College added.': [
    'కళాశాల జోడించబడింది.',
    'कॉलेज जोड़ा गया।',
    'கல்லூரி சேர்க்கப்பட்டது.',
    'ಕಾಲೇಜು ಸೇರಿಸಲಾಗಿದೆ.',
    'കോളേജ് ചേർത്തു.',
    'महाविद्यालय जोडले.',
    'কলেজ যোগ হয়েছে।',
    'કૉલેજ ઉમેરાયું.',
    'ਕਾਲਜ ਸ਼ਾਮਲ ਹੋਇਆ।',
    'କଲେଜ ଯୋଡ଼ାଗଲା।'
  ],
  'Delete': [
    'తొలగించు',
    'हटाएँ',
    'நீக்கு',
    'ಅಳಿಸಿ',
    'ഇല്ലാതാക്കുക',
    'हटवा',
    'মুছুন',
    'કાઢી નાખો',
    'ਮਿਟਾਓ',
    'ବିଲୋପ କରନ୍ତୁ'
  ],
  'Delete account': [
    'ఖాతా తొలగించు',
    'खाता हटाएँ',
    'கணக்கை நீக்கு',
    'ಖಾತೆ ಅಳಿಸಿ',
    'അക്കൗണ്ട് ഇല്ലാതാക്കുക',
    'खाते हटवा',
    'অ্যাকাউন্ট মুছুন',
    'ખાતું કાઢી નાખો',
    'ਖਾਤਾ ਮਿਟਾਓ',
    'ଆକାଉଣ୍ଟ ବିଲୋପ କରନ୍ତୁ'
  ],
  'Delete account?': [
    'ఖాతా తొలగించాలా?',
    'खाता हटाएँ?',
    'கணக்கை நீக்கவா?',
    'ಖಾತೆ ಅಳಿಸಬೇಕೆ?',
    'അക്കൗണ്ട് ഇല്ലാതാക്കണോ?',
    'खाते हटवायचे?',
    'অ্যাকাউন্ট মুছবেন?',
    'ખાતું કાઢી નાખવું?',
    'ਖਾਤਾ ਮਿਟਾਉਣਾ ਹੈ?',
    'ଆକାଉଣ୍ଟ ବିଲୋପ କରିବେ?'
  ],
  'Delete college?': [
    'కళాశాలను తొలగించాలా?',
    'कॉलेज हटाएँ?',
    'கல்லூரியை நீக்கவா?',
    'ಕಾಲೇಜು ಅಳಿಸಬೇಕೆ?',
    'കോളേജ് ഇല്ലാതാക്കണോ?',
    'महाविद्यालय हटवायचे?',
    'কলেজ মুছবেন?',
    'કૉલેજ કાઢી નાખવું?',
    'ਕਾਲਜ ਮਿਟਾਉਣਾ ਹੈ?',
    'କଲେଜ ବିଲୋପ କରିବେ?'
  ],
  'Deleted mentor': [
    'తొలగించిన మెంటర్',
    'हटाया गया मेंटर',
    'நீக்கப்பட்ட வழிகாட்டி',
    'ಅಳಿಸಿದ ಮಾರ್ಗದರ್ಶಕ',
    'ഇല്ലാതാക്കിയ മെന്റർ',
    'हटवलेला मार्गदर्शक',
    'মুছে ফেলা মেন্টর',
    'કાઢી નાખેલ મેન્ટર',
    'ਮਿਟਾਇਆ ਮੈਂਟਰ',
    'ବିଲୋପିତ ମେଣ୍ଟର'
  ],
  'Deleted student': [
    'తొలగించిన విద్యార్థి',
    'हटाया गया छात्र',
    'நீக்கப்பட்ட மாணவர்',
    'ಅಳಿಸಿದ ವಿದ್ಯಾರ್ಥಿ',
    'ഇല്ലാതാക്കിയ വിദ്യാർത്ഥി',
    'हटवलेला विद्यार्थी',
    'মুছে ফেলা শিক্ষার্থী',
    'કાઢી નાખેલ વિદ્યાર્થી',
    'ਮਿਟਾਇਆ ਵਿਦਿਆਰਥੀ',
    'ବିଲୋପିତ ଛାତ୍ର'
  ],
  'Direct chat': [
    'నేరుగా చాట్',
    'सीधी चैट',
    'நேரடி அரட்டை',
    'ನೇರ ಚಾಟ್',
    'നേരിട്ടുള്ള ചാറ്റ്',
    'थेट चॅट',
    'সরাসরি চ্যাট',
    'સીધી ચેટ',
    'ਸਿੱਧੀ ਚੈਟ',
    'ସିଧା ଚାଟ୍'
  ],
  'Don\'t have an account?': [
    'ఖాతా లేదా?',
    'खाता नहीं है?',
    'கணக்கு இல்லையா?',
    'ಖಾತೆ ಇಲ್ಲವೇ?',
    'അക്കൗണ്ട് ഇല്ലേ?',
    'खाते नाही?',
    'অ্যাকাউন্ট নেই?',
    'ખાતું નથી?',
    'ਖਾਤਾ ਨਹੀਂ ਹੈ?',
    'ଆକାଉଣ୍ଟ ନାହିଁ?'
  ],
  'Email': [
    'ఇమెయిల్',
    'ईमेल',
    'மின்னஞ்சல்',
    'ಇಮೇಲ್',
    'ഇമെയിൽ',
    'ईमेल',
    'ইমেল',
    'ઈમેલ',
    'ਈਮੇਲ',
    'ଇମେଲ'
  ],
  'Engineering': [
    'ఇంజనీరింగ్',
    'इंजीनियरिंग',
    'பொறியியல்',
    'ಇಂಜಿನಿಯರಿಂಗ್',
    'എൻജിനീയറിങ്',
    'अभियांत्रिकी',
    'প্রকৌশল',
    'એન્જિનિયરિંગ',
    'ਇੰਜੀਨੀਅਰਿੰਗ',
    'ଇଞ୍ଜିନିୟରିଂ'
  ],
  'Enter a valid email': [
    'సరైన ఇమెయిల్ నమోదు చేయండి',
    'मान्य ईमेल दर्ज करें',
    'சரியான மின்னஞ்சலை உள்ளிடவும்',
    'ಮಾನ್ಯ ಇಮೇಲ್ ನಮೂದಿಸಿ',
    'സാധുവായ ഇമെയിൽ നൽകുക',
    'वैध ईमेल टाका',
    'বৈধ ইমেল দিন',
    'માન્ય ઈમેલ દાખલ કરો',
    'ਵੈਧ ਈਮੇਲ ਦਰਜ ਕਰੋ',
    'ବୈଧ ଇମେଲ ଦିଅନ୍ତୁ'
  ],
  'Every student and mentor is approved by the admin team.': [
    'ప్రతి విద్యార్థి మరియు మెంటర్ అడ్మిన్ బృందం ద్వారా ఆమోదించబడతారు.',
    'हर छात्र और मेंटर एडमिन टीम द्वारा स्वीकृत होते हैं।',
    'ஒவ்வொரு மாணவரும் வழிகாட்டியும் நிர்வாகக் குழுவால் அங்கீகரிக்கப்படுகிறார்கள்.',
    'ಪ್ರತಿಯೊಬ್ಬ ವಿದ್ಯಾರ್ಥಿ ಮತ್ತು ಮಾರ್ಗದರ್ಶಕರನ್ನು ನಿರ್ವಾಹಕ ತಂಡ ಅನುಮೋದಿಸುತ್ತದೆ.',
    'ഓരോ വിദ്യാർത്ഥിയും മെന്ററും അഡ്മിൻ ടീം അംഗീകരിക്കുന്നു.',
    'प्रत्येक विद्यार्थी आणि मार्गदर्शक प्रशासक संघाकडून मंजूर होतो.',
    'প্রতিটি শিক্ষার্থী ও মেন্টর অ্যাডমিন দল অনুমোদন করে।',
    'દરેક વિદ્યાર્થી અને મેન્ટરને એડમિન ટીમ મંજૂરી આપે છે.',
    'ਹਰ ਵਿਦਿਆਰਥੀ ਤੇ ਮੈਂਟਰ ਨੂੰ ਐਡਮਿਨ ਟੀਮ ਮਨਜ਼ੂਰ ਕਰਦੀ ਹੈ।',
    'ପ୍ରତ୍ୟେକ ଛାତ୍ର ଓ ମେଣ୍ଟର ଆଡମିନ୍ ଦଳ ଦ୍ୱାରା ଅନୁମୋଦିତ।'
  ],
  'Experience': [
    'అనుభవం',
    'अनुभव',
    'அனுபவம்',
    'ಅನುಭವ',
    'പരിചയം',
    'अनुभव',
    'অভিজ্ঞতা',
    'અનુભવ',
    'ਤਜਰਬਾ',
    'ଅଭିଜ୍ଞତା'
  ],
  'Experience (e.g. 5 years)': [
    'అనుభవం (ఉదా. 5 సంవత్సరాలు)',
    'अनुभव (जैसे 5 वर्ष)',
    'அனுபவம் (எ.கா. 5 ஆண்டுகள்)',
    'ಅನುಭವ (ಉದಾ. 5 ವರ್ಷ)',
    'പരിചയം (ഉദാ. 5 വർഷം)',
    'अनुभव (उदा. 5 वर्षे)',
    'অভিজ্ঞতা (যেমন ৫ বছর)',
    'અનુભવ (દા.ત. 5 વર્ષ)',
    'ਤਜਰਬਾ (ਜਿਵੇਂ 5 ਸਾਲ)',
    'ଅଭିଜ୍ଞତା (ଯେମିତି ୫ ବର୍ଷ)'
  ],
  'Expertise': [
    'నైపుణ్యం',
    'विशेषज्ञता',
    'நிபுணத்துவம்',
    'ಪರಿಣತಿ',
    'വൈദഗ്ധ്യം',
    'तज्ज्ञता',
    'দক্ষতা',
    'નિપુણતા',
    'ਮੁਹਾਰਤ',
    'ବିଶେଷଜ୍ଞତା'
  ],
  'Fees': [
    'ఫీజు',
    'फीस',
    'கட்டணம்',
    'ಶುಲ್ಕ',
    'ഫീസ്',
    'शुल्क',
    'ফি',
    'ફી',
    'ਫੀਸ',
    'ଫି'
  ],
  'Full name': [
    'పూర్తి పేరు',
    'पूरा नाम',
    'முழு பெயர்',
    'ಪೂರ್ಣ ಹೆಸರು',
    'മുഴുവൻ പേര്',
    'पूर्ण नाव',
    'পূর্ণ নাম',
    'પૂરું નામ',
    'ਪੂਰਾ ਨਾਮ',
    'ପୂର୍ଣ୍ଣ ନାମ'
  ],
  'Government': [
    'ప్రభుత్వం',
    'सरकारी',
    'அரசு',
    'ಸರ್ಕಾರಿ',
    'സർക്കാർ',
    'सरकारी',
    'সরকারি',
    'સરકારી',
    'ਸਰਕਾਰੀ',
    'ସରକାରୀ'
  ],
  'Guide students through admissions and career choices.': [
    'ప్రవేశాలు మరియు కెరీర్ ఎంపికల్లో విద్యార్థులకు మార్గనిర్దేశం చేయండి.',
    'छात्रों को प्रवेश और करियर विकल्पों में मार्गदर्शन दें।',
    'சேர்க்கை மற்றும் தொழில் தேர்வுகளில் மாணவர்களை வழிநடத்துங்கள்.',
    'ಪ್ರವೇಶ ಮತ್ತು ವೃತ್ತಿ ಆಯ್ಕೆಗಳಲ್ಲಿ ವಿದ್ಯಾರ್ಥಿಗಳಿಗೆ ಮಾರ್ಗದರ್ಶನ ನೀಡಿ.',
    'പ്രവേശനത്തിലും കരിയർ തിരഞ്ഞെടുപ്പിലും വിദ്യാർത്ഥികളെ നയിക്കുക.',
    'प्रवेश आणि करिअर निवडीत विद्यार्थ्यांना मार्गदर्शन करा.',
    'ভর্তি ও ক্যারিয়ার পছন্দে শিক্ষার্থীদের পথ দেখান।',
    'પ્રવેશ અને કારકિર્દી પસંદગીમાં વિદ્યાર્થીઓને માર્ગદર્શન આપો.',
    'ਦਾਖਲੇ ਤੇ ਕਰੀਅਰ ਚੋਣਾਂ ਵਿੱਚ ਵਿਦਿਆਰਥੀਆਂ ਦੀ ਅਗਵਾਈ ਕਰੋ।',
    'ଆଡମିଶନ ଓ କ୍ୟାରିଅର ଚୟନରେ ଛାତ୍ରମାନଙ୍କୁ ମାର୍ଗଦର୍ଶନ କରନ୍ତୁ।'
  ],
  'Invalid Admin credentials.': [
    'తప్పుడు అడ్మిన్ వివరాలు.',
    'अमान्य एडमिन विवरण।',
    'தவறான நிர்வாகி விவரங்கள்.',
    'ಅಮಾನ್ಯ ನಿರ್ವಾಹಕ ವಿವರಗಳು.',
    'അസാധുവായ അഡ്മിൻ വിവരങ്ങൾ.',
    'अवैध प्रशासक तपशील.',
    'অবৈধ অ্যাডমিন তথ্য।',
    'અમાન્ય એડમિન વિગતો.',
    'ਗਲਤ ਐਡਮਿਨ ਵੇਰਵੇ।',
    'ଅବୈଧ ଆଡମିନ୍ ବିବରଣୀ।'
  ],
  'Invalid email or password.': [
    'తప్పుడు ఇమెయిల్ లేదా పాస్‌వర్డ్.',
    'अमान्य ईमेल या पासवर्ड।',
    'தவறான மின்னஞ்சல் அல்லது கடவுச்சொல்.',
    'ಅಮಾನ್ಯ ಇಮೇಲ್ ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್.',
    'തെറ്റായ ഇമെയിൽ അല്ലെങ്കിൽ പാസ്‌വേഡ്.',
    'अवैध ईमेल किंवा पासवर्ड.',
    'ভুল ইমেল বা পাসওয়ার্ড।',
    'અમાન્ય ઈમેલ કે પાસવર્ડ.',
    'ਗਲਤ ਈਮੇਲ ਜਾਂ ਪਾਸਵਰਡ।',
    'ଭୁଲ ଇମେଲ କିମ୍ବା ପାସୱାର୍ଡ।'
  ],
  'Last': [
    'చివరిది',
    'अंतिम',
    'கடைசி',
    'ಕೊನೆಯ',
    'അവസാനം',
    'शेवटचे',
    'শেষ',
    'છેલ્લું',
    'ਆਖਰੀ',
    'ଶେଷ'
  ],
  'Location': [
    'ప్రాంతం',
    'स्थान',
    'இடம்',
    'ಸ್ಥಳ',
    'സ്ഥലം',
    'ठिकाण',
    'অবস্থান',
    'સ્થાન',
    'ਟਿਕਾਣਾ',
    'ସ୍ଥାନ'
  ],
  'Mentor Profile': [
    'మెంటర్ ప్రొఫైల్',
    'मेंटर प्रोफ़ाइल',
    'வழிகாட்டி சுயவிவரம்',
    'ಮಾರ್ಗದರ್ಶಕ ಪ್ರೊಫೈಲ್',
    'മെന്റർ പ്രൊഫൈൽ',
    'मार्गदर्शक प्रोफाइल',
    'মেন্টর প্রোফাইল',
    'મેન્ટર પ્રોફાઇલ',
    'ਮੈਂਟਰ ਪ੍ਰੋਫਾਈਲ',
    'ମେଣ୍ଟର ପ୍ରୋଫାଇଲ୍'
  ],
  'Mentor request sent. Status: Pending': [
    'మెంటర్ అభ్యర్థన పంపబడింది. స్థితి: పెండింగ్',
    'मेंटर अनुरोध भेजा गया। स्थिति: लंबित',
    'வழிகாட்டி கோரிக்கை அனுப்பப்பட்டது. நிலை: நிலுவையில்',
    'ಮಾರ್ಗದರ್ಶಕ ವಿನಂತಿ ಕಳುಹಿಸಲಾಗಿದೆ. ಸ್ಥಿತಿ: ಬಾಕಿ',
    'മെന്റർ അഭ്യർത്ഥന അയച്ചു. നില: കാത്തിരിപ്പ്',
    'मार्गदर्शक विनंती पाठवली. स्थिती: प्रलंबित',
    'মেন্টর অনুরোধ পাঠানো হয়েছে। অবস্থা: অপেক্ষমাণ',
    'મેન્ટર વિનંતી મોકલી. સ્થિતિ: બાકી',
    'ਮੈਂਟਰ ਬੇਨਤੀ ਭੇਜੀ। ਸਥਿਤੀ: ਬਕਾਇਆ',
    'ମେଣ୍ଟର ଅନୁରୋଧ ପଠାଗଲା। ସ୍ଥିତି: ବିଚାରାଧୀନ'
  ],
  'Mentors': [
    'మెంటర్లు',
    'मेंटर्स',
    'வழிகாட்டிகள்',
    'ಮಾರ್ಗದರ್ಶಕರು',
    'മെന്റർമാർ',
    'मार्गदर्शक',
    'মেন্টরগণ',
    'મેન્ટર્સ',
    'ਮੈਂਟਰ',
    'ମେଣ୍ଟରମାନେ'
  ],
  'Minimum 6 characters': [
    'కనీసం 6 అక్షరాలు',
    'न्यूनतम 6 अक्षर',
    'குறைந்தது 6 எழுத்துகள்',
    'ಕನಿಷ್ಠ 6 ಅಕ್ಷರಗಳು',
    'കുറഞ്ഞത് 6 അക്ഷരങ്ങൾ',
    'किमान 6 अक्षरे',
    'কমপক্ষে ৬ অক্ষর',
    'ઓછામાં ઓછા 6 અક્ષરો',
    'ਘੱਟੋ-ਘੱਟ 6 ਅੱਖਰ',
    'ସର୍ବନିମ୍ନ ୬ ଅକ୍ଷର'
  ],
  'Name': [
    'పేరు',
    'नाम',
    'பெயர்',
    'ಹೆಸರು',
    'പേര്',
    'नाव',
    'নাম',
    'નામ',
    'ਨਾਮ',
    'ନାମ'
  ],
};

/// Legacy key -> English source text.
const Map<String, String> _legacyKeys = {
  'appName': 'EduTruth',
  'tagline': 'Honest college guidance from verified mentors',
  'login': 'Login',
  'register': 'Create Account',
  'student': 'Student',
  'mentor': 'Mentor',
  'admin': 'Admin',
  'home': 'Home',
  'colleges': 'Colleges',
  'mentors': 'Verified Mentors',
  'profile': 'Profile',
  'notifications': 'Notifications',
  'logout': 'Logout',
  'search': 'Search',
  'saved': 'Saved',
  'reviews': 'Reviews',
  'chat': 'Chat',
  'requests': 'Requests',
  'language': 'Language',
  'sentToAdmin': 'Your account approval request has been sent to Admin.',
  'waitingApproval': 'Your account is waiting for Admin approval.',
};

String translate(String en, Lang lang) {
  if (lang == Lang.en) return en;
  final row = _t[en];
  if (row == null) return en;
  final i = _langOrder.indexOf(lang);
  if (i < 0 || i >= row.length) return en;
  final v = row[i];
  return v.isEmpty ? en : v;
}

/// Translates literal English UI text using the currently selected language.
String tt(String en) => translate(en, Store.instance.lang);

String tr(String key, Lang lang) => translate(_legacyKeys[key] ?? key, lang);

// ============================ STORE ============================

class Store extends ChangeNotifier {
  static final Store instance = Store._();
  Store._();

  Lang lang = Lang.en;
  AppUser? currentUser;
  bool adminLoggedIn = false;

  final List<AppUser> users = [];
  final List<College> colleges = [];
  final List<Review> reviews = [];
  final List<MentorRequest> requests = [];
  final List<ChatMessage> messages = [];
  final List<AppNotification> notifications = [];
  final Map<String, Set<String>> savedColleges = {}; // userId -> collegeIds

  int _seq = 0;
  String _id(String p) => '$p${++_seq}';

  static const String adminUsername = 'Naren';
  static const String adminPassword = '7382506666';

  // ---------- helpers ----------
  AppUser? userById(String id) {
    for (final u in users) {
      if (u.id == id) return u;
    }
    return null;
  }

  College collegeById(String id) => colleges.firstWhere((c) => c.id == id);

  List<AppUser> get pendingUsers =>
      users.where((u) => u.status == AccountStatus.pending).toList();
  List<AppUser> get allRequestsUsers => users.toList();
  List<AppUser> get verifiedStudents => users
      .where(
          (u) => u.role == Role.student && u.status == AccountStatus.verified)
      .toList();
  List<AppUser> get verifiedMentors => users
      .where((u) => u.role == Role.mentor && u.status == AccountStatus.verified)
      .toList();

  void setLang(Lang l) {
    lang = l;
    notifyListeners();
  }

  void notify(String userId, String title, String body) {
    notifications.add(AppNotification(_id('n'), userId, title, body));
  }

  List<AppNotification> notificationsFor(String userId) =>
      notifications.where((n) => n.userId == userId).toList().reversed.toList();

  int unreadCount(String userId) =>
      notifications.where((n) => n.userId == userId && !n.read).length;

  void markAllRead(String userId) {
    for (final n in notifications) {
      if (n.userId == userId) n.read = true;
    }
    notifyListeners();
  }

  // ---------- auth ----------
  String? register(AppUser u) {
    if (users.any((x) => x.email.toLowerCase() == u.email.toLowerCase())) {
      return tt('An account with this email already exists.');
    }
    final user = AppUser(
      id: _id('u'),
      name: u.name,
      email: u.email,
      password: u.password,
      role: u.role,
      phone: u.phone,
      city: u.city,
      stream: u.stream,
      college: u.college,
      expertise: u.expertise,
      experience: u.experience,
      bio: u.bio,
    );
    users.add(user);
    notify(
        'admin',
        tt('New approval request'),
        '${user.name} (${user.role == Role.student ? tt('Student') : tt('Mentor')}) ' +
            tt('registered and is awaiting approval.'));
    notifyListeners();
    return null;
  }

  /// Returns null on success, otherwise an error message.
  String? login(String email, String password, Role role) {
    AppUser? found;
    for (final u in users) {
      if (u.email.toLowerCase() == email.trim().toLowerCase() &&
          u.password == password &&
          u.role == role) {
        found = u;
        break;
      }
    }
    if (found == null) return tt('Invalid email or password.');
    if (found.status == AccountStatus.pending) {
      return tr('waitingApproval', lang);
    }
    if (found.status == AccountStatus.rejected) {
      return tt('Your account request was rejected by Admin.');
    }
    currentUser = found;
    adminLoggedIn = false;
    notifyListeners();
    return null;
  }

  bool adminLogin(String username, String password) {
    final u = username.trim();
    final p = password.trim();
    if (u.toLowerCase() == adminUsername.toLowerCase() && p == adminPassword) {
      adminLoggedIn = true;
      currentUser = null;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    currentUser = null;
    adminLoggedIn = false;
    notifyListeners();
  }

  // ---------- admin actions ----------
  void approve(AppUser u) {
    u.status = AccountStatus.verified;
    notify(u.id, tt('Account approved'),
        tt('Your account has been verified by Admin. You can now login.'));
    notifyListeners();
  }

  void reject(AppUser u) {
    u.status = AccountStatus.rejected;
    notify(
        u.id, tt('Account rejected'), tt('Your account request was rejected.'));
    notifyListeners();
  }

  void deleteUser(AppUser u) {
    users.remove(u);
    final relatedRequestIds = requests
        .where((r) => r.studentId == u.id || r.mentorId == u.id)
        .map((r) => r.id)
        .toSet();
    messages.removeWhere(
        (m) => relatedRequestIds.contains(m.requestId) || m.senderId == u.id);
    requests.removeWhere((r) => r.studentId == u.id || r.mentorId == u.id);
    reviews.removeWhere((r) => r.authorId == u.id);
    notifications.removeWhere((n) => n.userId == u.id);
    savedColleges.remove(u.id);
    notifyListeners();
  }

  // ---------- colleges ----------
  List<College> searchColleges(String q, String type, String stream) {
    final query = q.trim().toLowerCase();
    return colleges.where((c) {
      final matchQ = query.isEmpty ||
          c.name.toLowerCase().contains(query) ||
          c.location.toLowerCase().contains(query) ||
          c.stream.toLowerCase().contains(query);
      final matchT = type == 'All' || c.type == type;
      final matchS = stream == 'All' || c.stream == stream;
      return matchQ && matchT && matchS;
    }).toList();
  }

  bool isSaved(String userId, String collegeId) =>
      savedColleges[userId]?.contains(collegeId) ?? false;

  void toggleSave(String userId, String collegeId) {
    final set = savedColleges.putIfAbsent(userId, () => <String>{});
    if (!set.remove(collegeId)) set.add(collegeId);
    notifyListeners();
  }

  List<Review> reviewsFor(String collegeId) =>
      reviews.where((r) => r.collegeId == collegeId).toList().reversed.toList();

  void addReview(String collegeId, AppUser author, int rating, String text) {
    reviews
        .add(Review(_id('r'), collegeId, author.id, author.name, rating, text));
    notify(
        'admin',
        tt('New review'),
        '${author.name} ' +
            tt('reviewed') +
            ' ${collegeById(collegeId).name}.');
    notifyListeners();
  }

  // ---------- mentor requests ----------
  MentorRequest? requestBetween(String studentId, String mentorId) {
    for (final r in requests) {
      if (r.studentId == studentId && r.mentorId == mentorId) return r;
    }
    return null;
  }

  void sendRequest(String studentId, String mentorId) {
    final existing = requestBetween(studentId, mentorId);
    if (existing != null && existing.status != RequestStatus.rejected) return;
    if (existing != null) requests.remove(existing);
    requests.add(MentorRequest(_id('mr'), studentId, mentorId));
    notify(
        mentorId,
        tt('New mentorship request'),
        '${userById(studentId)?.name ?? tt('A student')} ' +
            tt('sent you a mentorship request.'));
    notifyListeners();
  }

  List<MentorRequest> requestsForStudent(String id) =>
      requests.where((r) => r.studentId == id).toList();
  List<MentorRequest> requestsForMentor(String id) =>
      requests.where((r) => r.mentorId == id).toList();

  void setRequestStatus(MentorRequest r, RequestStatus s) {
    r.status = s;
    final mentorName = userById(r.mentorId)?.name ?? tt('Mentor');
    notify(
        r.studentId,
        s == RequestStatus.accepted
            ? tt('Request accepted')
            : tt('Request rejected'),
        s == RequestStatus.accepted
            ? '$mentorName ' + tt('accepted your request. You can chat now.')
            : '$mentorName ' + tt('rejected your request.'));
    notifyListeners();
  }

  List<ChatMessage> chat(String requestId) =>
      messages.where((m) => m.requestId == requestId).toList();

  /// All student-mentor conversations that contain at least one real message.
  List<MentorRequest> get conversations {
    final ids = messages.map((m) => m.requestId).toSet();
    final list = requests.where((r) => ids.contains(r.id)).toList();
    list.sort((a, b) {
      final la = chat(a.id).last.sentAt;
      final lb = chat(b.id).last.sentAt;
      return lb.compareTo(la);
    });
    return list;
  }

  void sendMessage(String requestId, String senderId, String text) {
    final t = text.trim();
    if (t.isEmpty) return;
    messages.add(ChatMessage(_id('m'), requestId, senderId, t));
    notifyListeners();
  }
}

// ============================ THEME ============================

const Color kBrand = Color(0xFF0F766E);
const Color kBrandDark = Color(0xFF115E59);
const Color kAccent = Color(0xFFF59E0B);
const Color kBg = Color(0xFFF6F8F8);

ThemeData buildTheme() {
  final base = ThemeData(useMaterial3: true);
  return base.copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: kBrand),
    scaffoldBackgroundColor: kBg,
    appBarTheme: AppBarTheme(
      backgroundColor: kBrand,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        side: BorderSide(color: Color(0xFFE2E8F0)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kBrand, width: 1.6),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kBrand,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

// ============================ APP ROOT ============================

/// Makes the whole widget tree (including pages pushed with Navigator)
/// rebuild whenever the Store notifies — this is what keeps language
/// changes instant on the currently open screen.
class StoreScope extends InheritedNotifier<Store> {
  const StoreScope({super.key, required Store store, required super.child})
      : super(notifier: store);

  static Store of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<StoreScope>();
    return scope?.notifier ?? Store.instance;
  }
}

class EduTruthApp extends StatelessWidget {
  const EduTruthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreScope(
      store: Store.instance,
      child: MaterialApp(
        title: tt('EduTruth'),
        debugShowCheckedModeBanner: false,
        theme: buildTheme(),
        builder: (context, child) => StoreScope(
          store: Store.instance,
          child: child ?? const SizedBox.shrink(),
        ),
        home: const HomePage(),
      ),
    );
  }
}

// ============================ SHARED WIDGETS ============================

void toast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
      backgroundColor: kBrandDark,
    ));
}

/// Admin-only confirmation before permanently removing an account.
Future<bool> confirmDeleteAccount(BuildContext context, AppUser u) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(tt('Delete account?')),
      content: Text(tt(
          'This will permanently remove this account along with their requests, chats and notifications.')),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(tt('Cancel'))),
        FilledButton(
          style:
              FilledButton.styleFrom(backgroundColor: const Color(0xFFB91C1C)),
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(tt('Delete')),
        ),
      ],
    ),
  );
  return ok == true;
}

Widget statusChip(AccountStatus s) {
  late Color c;
  late String t;
  switch (s) {
    case AccountStatus.pending:
      c = kAccent;
      t = tt('Pending Approval');
      break;
    case AccountStatus.verified:
      c = kBrand;
      t = tt('Verified');
      break;
    case AccountStatus.rejected:
      c = const Color(0xFFDC2626);
      t = tt('Rejected');
      break;
  }
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
        color: c.withOpacity(0.12), borderRadius: BorderRadius.circular(999)),
    child: Text(t,
        style: TextStyle(color: c, fontSize: 12, fontWeight: FontWeight.w600)),
  );
}

Widget reqChip(RequestStatus s) {
  final map = {
    RequestStatus.pending: [kAccent, tt('Pending')],
    RequestStatus.accepted: [kBrand, tt('Accepted')],
    RequestStatus.rejected: [Color(0xFFDC2626), tt('Rejected')],
  };
  final c = map[s]![0] as Color;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
        color: c.withOpacity(0.12), borderRadius: BorderRadius.circular(999)),
    child: Text(map[s]![1] as String,
        style: TextStyle(color: c, fontSize: 12, fontWeight: FontWeight.w600)),
  );
}

String fmtTime(DateTime d) {
  final h24 = d.hour;
  final ampm = h24 >= 12 ? 'PM' : 'AM';
  var h = h24 % 12;
  if (h == 0) h = 12;
  return '$h:${d.minute.toString().padLeft(2, '0')} $ampm';
}

String fmtDateTime(DateTime d) => '${fmtDate(d)} · ${fmtTime(d)}';

String fmtDate(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

class NotificationBell extends StatelessWidget {
  final String userId;
  const NotificationBell({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final count = Store.instance.unreadCount(userId);
    return Stack(children: [
      IconButton(
        tooltip: tt('Notifications'),
        icon: const Icon(Icons.notifications_outlined),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => NotificationsPage(userId: userId))),
      ),
      if (count > 0)
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                color: Color(0xFFDC2626), shape: BoxShape.circle),
            child: Text('$count',
                style: TextStyle(color: Colors.white, fontSize: 10)),
          ),
        ),
    ]);
  }
}

// ============================ HOME PAGE ============================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final lang = s.lang;
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          const Icon(Icons.verified_outlined),
          const SizedBox(width: 8),
          Text(tr('appName', lang),
              style: TextStyle(fontWeight: FontWeight.bold)),
        ]),
        actions: [
          PopupMenuButton<Lang>(
            tooltip: tr('language', lang),
            icon: const Icon(Icons.language),
            onSelected: s.setLang,
            itemBuilder: (_) => Lang.values
                .map(
                    (l) => PopupMenuItem(value: l, child: Text(kLangNames[l]!)))
                .toList(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 32),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [kBrand, kBrandDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr('appName', lang),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(tr('tagline', lang),
                    style: TextStyle(color: Colors.white70, fontSize: 15)),
                const SizedBox(height: 20),
                Wrap(spacing: 10, runSpacing: 10, children: [
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.white, foregroundColor: kBrand),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CollegeSearchPage())),
                    icon: const Icon(Icons.search),
                    label: Text(tr('colleges', lang)),
                  ),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                        backgroundColor: kAccent,
                        foregroundColor: Colors.black87),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MentorListPage())),
                    icon: const Icon(Icons.people_alt_outlined),
                    label: Text(tr('mentors', lang)),
                  ),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _roleCard(
            context,
            icon: Icons.school_outlined,
            title: tr('student', lang),
            subtitle: tt(
                'Search colleges, read honest reviews, connect with mentors.'),
            onLogin: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const LoginPage(role: Role.student))),
            onRegister: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const RegisterPage(role: Role.student))),
            lang: lang,
          ),
          _roleCard(
            context,
            icon: Icons.workspace_premium_outlined,
            title: tr('mentor', lang),
            subtitle:
                tt('Guide students through admissions and career choices.'),
            onLogin: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const LoginPage(role: Role.mentor))),
            onRegister: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const RegisterPage(role: Role.mentor))),
            lang: lang,
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Color(0xFFE2E8F0),
                  child: Icon(Icons.admin_panel_settings_outlined,
                      color: kBrandDark)),
              title: Text(tr('admin', lang),
                  style: TextStyle(fontWeight: FontWeight.w700)),
              subtitle: Text(tt('Platform administration')),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AdminLoginPage())),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(tt('Why EduTruth?'),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          _feature(Icons.verified_user_outlined, tt('Verified accounts'),
              tt('Every student and mentor is approved by the admin team.')),
          _feature(Icons.reviews_outlined, tt('Real reviews'),
              tt('Reviews are written by students who studied there.')),
          _feature(Icons.chat_bubble_outline, tt('Direct chat'),
              tt('Talk to your mentor one-to-one after they accept your request.')),
        ],
      ),
    );
  }

  Widget _roleCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onLogin,
      required VoidCallback onRegister,
      required Lang lang}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            CircleAvatar(
                backgroundColor: kBrand.withOpacity(0.12),
                child: Icon(icon, color: kBrand)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: TextStyle(color: Colors.black54, fontSize: 13)),
                  ]),
            ),
          ]),
          const SizedBox(height: 14),
          Row(children: [
            Expanded(
              child: OutlinedButton(
                  onPressed: onRegister, child: Text(tr('register', lang))),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                  onPressed: onLogin, child: Text(tr('login', lang))),
            ),
          ]),
        ]),
      ),
    );
  }

  Widget _feature(IconData i, String t, String d) => Card(
        child: ListTile(
          leading: Icon(i, color: kBrand),
          title: Text(t, style: TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(d),
        ),
      );
}

// ============================ AUTH PAGES ============================

class LoginPage extends StatefulWidget {
  final Role role;
  const LoginPage({super.key, required this.role});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;
  String? _error;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_form.currentState!.validate()) return;
    final err = Store.instance.login(_email.text, _password.text, widget.role);
    if (err != null) {
      setState(() => _error = err);
      return;
    }
    final user = Store.instance.currentUser!;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (_) => user.role == Role.student
              ? const StudentShell()
              : const MentorShell()),
      (r) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isStudent = widget.role == Role.student;
    final lang = StoreScope.of(context).lang;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${isStudent ? tr('student', lang) : tr('mentor', lang)} ${tr('login', lang)}'),
        actions: [
          IconButton(
            tooltip: tr('home', lang),
            icon: const Icon(Icons.home_outlined),
            onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _form,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Icon(
                isStudent
                    ? Icons.school_outlined
                    : Icons.workspace_premium_outlined,
                size: 56,
                color: kBrand),
            const SizedBox(height: 16),
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: tt('Email'), prefixIcon: Icon(Icons.mail_outline)),
              validator: (v) => (v == null || !v.contains('@'))
                  ? tt('Enter a valid email')
                  : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _password,
              obscureText: _obscure,
              decoration: InputDecoration(
                labelText: tt('Password'),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon:
                      Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              validator: (v) => (v == null || v.length < 4)
                  ? tt('Password is too short')
                  : null,
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color(0xFFFEE2E2),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(children: [
                  const Icon(Icons.error_outline, color: Color(0xFFB91C1C)),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Text(_error!,
                          style: TextStyle(color: Color(0xFFB91C1C)))),
                ]),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _submit, child: Text(tr('login', lang))),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => RegisterPage(role: widget.role))),
              child: Text(
                  "${tt("Don't have an account?")} ${tr('register', lang)}"),
            ),
          ]),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  final Role role;
  const RegisterPage({super.key, required this.role});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _city = TextEditingController();
  final _stream = TextEditingController();
  final _college = TextEditingController();
  final _expertise = TextEditingController();
  final _experience = TextEditingController();
  final _bio = TextEditingController();
  String? _error;

  @override
  void dispose() {
    for (final c in [
      _name,
      _email,
      _phone,
      _password,
      _city,
      _stream,
      _college,
      _expertise,
      _experience,
      _bio
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _submit() {
    if (!_form.currentState!.validate()) return;
    final err = Store.instance.register(AppUser(
      id: '',
      name: _name.text.trim(),
      email: _email.text.trim(),
      password: _password.text,
      role: widget.role,
      phone: _phone.text.trim(),
      city: _city.text.trim(),
      stream: _stream.text.trim(),
      college: _college.text.trim(),
      expertise: _expertise.text.trim(),
      experience: _experience.text.trim(),
      bio: _bio.text.trim(),
    ));
    if (err != null) {
      setState(() => _error = err);
      return;
    }
    toast(context, tr('sentToAdmin', StoreScope.of(context).lang));
    Navigator.popUntil(context, (r) => r.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final isStudent = widget.role == Role.student;
    final lang = StoreScope.of(context).lang;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${isStudent ? tr('student', lang) : tr('mentor', lang)} ${tr('register', lang)}'),
        actions: [
          IconButton(
            tooltip: tr('home', lang),
            icon: const Icon(Icons.home_outlined),
            onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _form,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            _field(_name, tt('Full name'), Icons.person_outline),
            _field(_email, tt('Email'), Icons.mail_outline,
                keyboard: TextInputType.emailAddress,
                validator: (v) => (v == null || !v.contains('@'))
                    ? tt('Enter a valid email')
                    : null),
            _field(_phone, tt('Phone'), Icons.phone_outlined,
                keyboard: TextInputType.phone),
            _field(_password, tt('Password'), Icons.lock_outline,
                obscure: true,
                validator: (v) => (v == null || v.length < 6)
                    ? tt('Minimum 6 characters')
                    : null),
            if (isStudent) ...[
              _field(_city, tt('City'), Icons.location_city_outlined),
              _field(_stream, tt('Preferred stream (e.g. Engineering)'),
                  Icons.menu_book_outlined),
            ] else ...[
              _field(_college, tt('College / Organisation'),
                  Icons.apartment_outlined),
              _field(_expertise, tt('Expertise'), Icons.star_outline),
              _field(_experience, tt('Experience (e.g. 5 years)'),
                  Icons.timeline_outlined),
              _field(_bio, tt('Short bio'), Icons.notes_outlined, maxLines: 3),
            ],
            if (_error != null) ...[
              const SizedBox(height: 6),
              Text(_error!, style: TextStyle(color: Color(0xFFB91C1C))),
            ],
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: kAccent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                  tt('Your account will be reviewed by Admin before you can login.'),
                  style: TextStyle(fontSize: 13)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: _submit, child: Text(tr('register', lang))),
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => LoginPage(role: widget.role))),
              child: Text('${tt('Already registered?')} ${tr('login', lang)}'),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _field(TextEditingController c, String label, IconData icon,
      {bool obscure = false,
      int maxLines = 1,
      TextInputType? keyboard,
      String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: c,
        obscureText: obscure,
        maxLines: obscure ? 1 : maxLines,
        keyboardType: keyboard,
        decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
        validator: validator ??
            (v) => (v == null || v.trim().isEmpty)
                ? '$label ' + tt('is required')
                : null,
      ),
    );
  }
}

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});
  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final _form = GlobalKey<FormState>();
  final _user = TextEditingController();
  final _pass = TextEditingController();
  bool _obscure = true;
  String? _error;

  @override
  void dispose() {
    _user.dispose();
    _pass.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_form.currentState!.validate()) return;
    final ok = Store.instance.adminLogin(_user.text.trim(), _pass.text);
    if (!ok) {
      setState(() => _error = tt('Invalid Admin credentials.'));
      return;
    }
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => const AdminShell()), (r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tt('Admin Login'))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _form,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Icon(Icons.admin_panel_settings_outlined,
                size: 56, color: kBrand),
            const SizedBox(height: 20),
            TextFormField(
              controller: _user,
              decoration: InputDecoration(
                  labelText: tt('Username'),
                  prefixIcon: Icon(Icons.person_outline)),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? tt('Username is required')
                  : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _pass,
              obscureText: _obscure,
              decoration: InputDecoration(
                labelText: tt('Password'),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon:
                      Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              validator: (v) =>
                  (v == null || v.isEmpty) ? tt('Password is required') : null,
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!,
                  style: TextStyle(color: Color(0xFFB91C1C)),
                  textAlign: TextAlign.center),
            ],
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _submit, child: Text(tt('Login'))),
          ]),
        ),
      ),
    );
  }
}

// ============================ NOTIFICATIONS ============================

class NotificationsPage extends StatefulWidget {
  final String userId;
  const NotificationsPage({super.key, required this.userId});
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => Store.instance.markAllRead(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    final items = Store.instance.notificationsFor(widget.userId);
    return Scaffold(
      appBar:
          AppBar(title: Text(tr('notifications', StoreScope.of(context).lang))),
      body: items.isEmpty
          ? _Empty(
              icon: Icons.notifications_none, text: tt('No notifications yet'))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: items.length,
              itemBuilder: (_, i) {
                final n = items[i];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Color(0xFFE2E8F0),
                        child: Icon(Icons.notifications_outlined,
                            color: kBrandDark)),
                    title: Text(n.title,
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('${n.body}\n${fmtDate(n.createdAt)}'),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}

class _Empty extends StatelessWidget {
  final IconData icon;
  final String text;
  _Empty({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) => Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 56, color: Colors.black26),
          const SizedBox(height: 10),
          Text(text, style: TextStyle(color: Colors.black45)),
        ]),
      );
}

// ============================ STUDENT ============================

class StudentShell extends StatefulWidget {
  const StudentShell({super.key});
  @override
  State<StudentShell> createState() => _StudentShellState();
}

class _StudentShellState extends State<StudentShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final user = s.currentUser;
    if (user == null) return const HomePage();
    final lang = s.lang;
    final pages = [
      const StudentHomeTab(),
      const CollegeSearchPage(embedded: true),
      const MentorListPage(embedded: true),
      const StudentRequestsTab(),
      const ProfilePage(embedded: true),
    ];
    final titles = [
      tr('home', lang),
      tr('colleges', lang),
      tr('mentors', lang),
      tr('requests', lang),
      tr('profile', lang),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('${tt('EduTruth')} · ${titles[_index]}'),
        actions: [
          IconButton(
            tooltip: tr('search', lang),
            icon: const Icon(Icons.search),
            onPressed: () => setState(() => _index = 1),
          ),
          NotificationBell(userId: user.id),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (v) {
              if (v == 'profile') setState(() => _index = 4);
              if (v == 'logout') {
                s.logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (r) => false);
              }
              if (v.startsWith('lang:'))
                s.setLang(langFromCode(v.substring(5)));
            },
            itemBuilder: (_) => [
              PopupMenuItem(value: 'profile', child: Text(tr('profile', lang))),
              ...Lang.values.map((l) => PopupMenuItem(
                  value: 'lang:${l.name}', child: Text(kLangNames[l]!))),
              PopupMenuItem(value: 'logout', child: Text(tr('logout', lang))),
            ],
          ),
        ],
      ),
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: tr('home', lang)),
          NavigationDestination(
              icon: const Icon(Icons.school_outlined),
              selectedIcon: const Icon(Icons.school),
              label: tr('colleges', lang)),
          NavigationDestination(
              icon: const Icon(Icons.people_alt_outlined),
              selectedIcon: const Icon(Icons.people_alt),
              label: tr('mentor', lang)),
          NavigationDestination(
              icon: const Icon(Icons.forum_outlined),
              selectedIcon: const Icon(Icons.forum),
              label: tr('chat', lang)),
          NavigationDestination(
              icon: const Icon(Icons.person_outline),
              selectedIcon: const Icon(Icons.person),
              label: tr('profile', lang)),
        ],
      ),
    );
  }
}

class StudentHomeTab extends StatelessWidget {
  const StudentHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final user = s.currentUser!;
    final savedIds = s.savedColleges[user.id] ?? <String>{};
    final accepted = s
        .requestsForStudent(user.id)
        .where((r) => r.status == RequestStatus.accepted)
        .length;
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [kBrand, kBrandDark]),
            borderRadius: BorderRadius.circular(18),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${tt('Welcome')}, ${user.name}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(tt('Verified student account'),
                style: TextStyle(color: Colors.white70)),
          ]),
        ),
        Row(children: [
          Expanded(
              child: _stat(
                  tt('Saved'), '${savedIds.length}', Icons.bookmark_outline)),
          Expanded(
              child:
                  _stat(tt('Mentors'), '$accepted', Icons.people_alt_outlined)),
          Expanded(
              child: _stat(
                  tt('Reviews'),
                  '${s.reviews.where((r) => r.authorId == user.id).length}',
                  Icons.rate_review_outlined)),
        ]),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Text(tt('Saved colleges'),
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        ),
        if (savedIds.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(tt('You have not saved any colleges yet.'),
                style: TextStyle(color: Colors.black54)),
          )
        else
          ...savedIds.map((id) {
            final c = s.collegeById(id);
            return CollegeCard(college: c);
          }),
      ],
    );
  }

  Widget _stat(String label, String value, IconData icon) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(children: [
            Icon(icon, color: kBrand),
            const SizedBox(height: 6),
            Text(value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(label, style: TextStyle(fontSize: 12, color: Colors.black54)),
          ]),
        ),
      );
}

// -------- Colleges --------

class CollegeCard extends StatelessWidget {
  final College college;
  const CollegeCard({super.key, required this.college});

  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final user = s.currentUser;
    final saved = user != null && s.isSaved(user.id, college.id);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CollegeDetailsPage(college: college))),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  color: kBrand.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.apartment, color: kBrand),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(college.name,
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 2),
                    Text(college.location,
                        style: TextStyle(fontSize: 12, color: Colors.black54)),
                    const SizedBox(height: 6),
                    Wrap(spacing: 6, children: [
                      _tag(college.type),
                      _tag(college.stream),
                      _tag('★ ${college.rating}'),
                    ]),
                  ]),
            ),
            if (user != null && user.role == Role.student)
              IconButton(
                tooltip: saved ? tt('Unsave') : 'Save',
                icon: Icon(saved ? Icons.bookmark : Icons.bookmark_border,
                    color: saved ? kAccent : Colors.black45),
                onPressed: () {
                  s.toggleSave(user.id, college.id);
                  toast(context,
                      saved ? tt('Removed from saved') : 'College saved');
                },
              ),
          ]),
        ),
      ),
    );
  }

  Widget _tag(String t) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
            color: const Color(0xFFEFF2F5),
            borderRadius: BorderRadius.circular(999)),
        child: Text(t, style: TextStyle(fontSize: 11)),
      );
}

class CollegeSearchPage extends StatefulWidget {
  final bool embedded;
  const CollegeSearchPage({super.key, this.embedded = false});
  @override
  State<CollegeSearchPage> createState() => _CollegeSearchPageState();
}

class _CollegeSearchPageState extends State<CollegeSearchPage> {
  final _q = TextEditingController();
  String _type = 'All';
  String _stream = 'All';

  @override
  void dispose() {
    _q.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final results = Store.instance.searchColleges(_q.text, _type, _stream);
    final body = Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: TextField(
          controller: _q,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: tt('Search colleges, city or stream'),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _q.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(() => _q.clear()),
                  ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              value: _type,
              decoration: InputDecoration(labelText: tt('Type'), isDense: true),
              items: ['All', 'Government', 'Private']
                  .map((e) => DropdownMenuItem(value: e, child: Text(tt(e))))
                  .toList(),
              onChanged: (v) => setState(() => _type = v ?? 'All'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: _stream,
              decoration:
                  InputDecoration(labelText: tt('Stream'), isDense: true),
              items: ['All', 'Engineering', 'Medical', 'Science', 'Commerce']
                  .map((e) => DropdownMenuItem(value: e, child: Text(tt(e))))
                  .toList(),
              onChanged: (v) => setState(() => _stream = v ?? 'All'),
            ),
          ),
        ]),
      ),
      Expanded(
        child: results.isEmpty
            ? _Empty(icon: Icons.search_off, text: tt('No colleges found'))
            : ListView.builder(
                itemCount: results.length,
                itemBuilder: (_, i) => CollegeCard(college: results[i]),
              ),
      ),
    ]);

    if (widget.embedded) return body;
    return Scaffold(
      appBar: AppBar(title: Text(tr('colleges', StoreScope.of(context).lang))),
      body: body,
    );
  }
}

class CollegeDetailsPage extends StatefulWidget {
  final College college;
  const CollegeDetailsPage({super.key, required this.college});
  @override
  State<CollegeDetailsPage> createState() => _CollegeDetailsPageState();
}

class _CollegeDetailsPageState extends State<CollegeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final user = s.currentUser;
    final c = widget.college;
    final saved = user != null && s.isSaved(user.id, c.id);
    final revs = s.reviewsFor(c.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(tt('College Details')),
        actions: [
          if (user != null && user.role == Role.student)
            IconButton(
              tooltip: saved ? tt('Unsave') : 'Save',
              icon: Icon(saved ? Icons.bookmark : Icons.bookmark_border),
              onPressed: () {
                s.toggleSave(user.id, c.id);
                setState(() {});
                toast(context,
                    saved ? tt('Removed from saved') : 'College saved');
              },
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [kBrand, kBrandDark])),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(c.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(c.location, style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 10),
              Row(children: [
                const Icon(Icons.star, color: kAccent, size: 18),
                const SizedBox(width: 4),
                Text('${c.rating}', style: TextStyle(color: Colors.white)),
                const SizedBox(width: 16),
                const Icon(Icons.payments_outlined,
                    color: Colors.white70, size: 18),
                const SizedBox(width: 4),
                Text(c.fees, style: TextStyle(color: Colors.white)),
              ]),
            ]),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tt('About'),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 6),
                    Text(c.about),
                    const SizedBox(height: 12),
                    Row(children: [
                      Expanded(child: _kv(tt('Type'), tt(c.type))),
                      Expanded(child: _kv(tt('Stream'), tt(c.stream))),
                    ]),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${tr('reviews', s.lang)} (${revs.length})',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                if (user != null && user.role == Role.student)
                  TextButton.icon(
                    onPressed: () async {
                      final done = await Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SubmitReviewPage(college: c)),
                      );
                      if (done == true && mounted) setState(() {});
                    },
                    icon: const Icon(Icons.rate_review_outlined),
                    label: Text(tt('Write review')),
                  ),
              ],
            ),
          ),
          if (revs.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(tt('No reviews yet.'),
                  style: TextStyle(color: Colors.black54)),
            )
          else
            ...revs.map((r) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: kBrand.withOpacity(0.12),
                        child: Text(r.authorName.characters.first.toUpperCase(),
                            style: TextStyle(color: kBrand))),
                    title: Row(children: [
                      Expanded(
                          child: Text(r.authorName,
                              style: TextStyle(fontWeight: FontWeight.w600))),
                      ...List.generate(
                          r.rating,
                          (_) =>
                              const Icon(Icons.star, size: 14, color: kAccent)),
                    ]),
                    subtitle: Text('${r.text}\n${fmtDate(r.createdAt)}'),
                    isThreeLine: true,
                  ),
                )),
        ],
      ),
    );
  }

  Widget _kv(String k, String v) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(k, style: TextStyle(fontSize: 12, color: Colors.black54)),
          Text(v, style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      );
}

class SubmitReviewPage extends StatefulWidget {
  final College college;
  const SubmitReviewPage({super.key, required this.college});
  @override
  State<SubmitReviewPage> createState() => _SubmitReviewPageState();
}

class _SubmitReviewPageState extends State<SubmitReviewPage> {
  final _form = GlobalKey<FormState>();
  final _text = TextEditingController();
  int _rating = 5;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tt('Submit Review'))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _form,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(widget.college.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(tt('Your rating')),
            Row(
              children: List.generate(
                5,
                (i) => IconButton(
                  icon: Icon(i < _rating ? Icons.star : Icons.star_border,
                      color: kAccent, size: 32),
                  onPressed: () => setState(() => _rating = i + 1),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _text,
              maxLines: 5,
              decoration: InputDecoration(
                  labelText: tt('Your review'), alignLabelWithHint: true),
              validator: (v) => (v == null || v.trim().length < 5)
                  ? tt('Please write at least 5 characters')
                  : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: Text(tt('Submit Review')),
              onPressed: () {
                if (!_form.currentState!.validate()) return;
                Store.instance.addReview(widget.college.id,
                    Store.instance.currentUser!, _rating, _text.text.trim());
                toast(context, tt('Review submitted successfully.'));
                Navigator.pop(context, true);
              },
            ),
          ]),
        ),
      ),
    );
  }
}

// -------- Mentors (student side) --------

class MentorListPage extends StatefulWidget {
  final bool embedded;
  const MentorListPage({super.key, this.embedded = false});
  @override
  State<MentorListPage> createState() => _MentorListPageState();
}

class _MentorListPageState extends State<MentorListPage> {
  final _q = TextEditingController();

  @override
  void dispose() {
    _q.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _q.text.trim().toLowerCase();
    final mentors = Store.instance.verifiedMentors
        .where((m) =>
            query.isEmpty ||
            m.name.toLowerCase().contains(query) ||
            m.expertise.toLowerCase().contains(query) ||
            m.college.toLowerCase().contains(query))
        .toList();

    final body = Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: TextField(
          controller: _q,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
              hintText: tt('Search mentors'), prefixIcon: Icon(Icons.search)),
        ),
      ),
      Expanded(
        child: mentors.isEmpty
            ? _Empty(
                icon: Icons.people_outline, text: tt('No verified mentors yet'))
            : ListView.builder(
                itemCount: mentors.length,
                itemBuilder: (_, i) {
                  final m = mentors[i];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: kBrand.withOpacity(0.12),
                          child: Text(m.name.characters.first.toUpperCase(),
                              style: TextStyle(color: kBrand))),
                      title: Row(children: [
                        Flexible(
                            child: Text(m.name,
                                style: TextStyle(fontWeight: FontWeight.w700))),
                        const SizedBox(width: 6),
                        const Icon(Icons.verified, size: 16, color: kBrand),
                      ]),
                      subtitle: Text(
                          '${m.expertise.isEmpty ? tt('Mentor') : m.expertise}\n${m.college}'),
                      isThreeLine: true,
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MentorProfilePage(mentor: m)));
                        if (mounted) setState(() {});
                      },
                    ),
                  );
                },
              ),
      ),
    ]);

    if (widget.embedded) return body;
    return Scaffold(
      appBar: AppBar(title: Text(tr('mentors', StoreScope.of(context).lang))),
      body: body,
    );
  }
}

class MentorProfilePage extends StatefulWidget {
  final AppUser mentor;
  const MentorProfilePage({super.key, required this.mentor});
  @override
  State<MentorProfilePage> createState() => _MentorProfilePageState();
}

class _MentorProfilePageState extends State<MentorProfilePage> {
  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final user = s.currentUser;
    final m = widget.mentor;
    final req = user == null ? null : s.requestBetween(user.id, m.id);
    return Scaffold(
      appBar: AppBar(title: Text(tt('Mentor Profile'))),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [kBrand, kBrandDark])),
          child: Row(children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Text(m.name.characters.first.toUpperCase(),
                  style: TextStyle(
                      color: kBrand,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Row(children: [
                      Icon(Icons.verified, size: 15, color: Colors.white),
                      SizedBox(width: 4),
                      Text(tt('Verified Mentor'),
                          style: TextStyle(color: Colors.white70)),
                    ]),
                  ]),
            ),
          ]),
        ),
        Card(
          child: Column(children: [
            _row(Icons.apartment_outlined, tt('College'), m.college),
            _row(Icons.star_outline, tt('Expertise'), m.expertise),
            _row(Icons.timeline_outlined, tt('Experience'), m.experience),
            _row(Icons.mail_outline, tt('Email'), m.email),
            if (m.bio.isNotEmpty)
              _row(Icons.notes_outlined, tt('About'), m.bio),
          ]),
        ),
        if (user != null && user.role == Role.student)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Builder(builder: (_) {
              if (req == null || req.status == RequestStatus.rejected) {
                return Column(children: [
                  if (req?.status == RequestStatus.rejected)
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(tt('Your previous request was rejected.'),
                          style: TextStyle(color: Color(0xFFB91C1C))),
                    ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.send),
                    label: Text(tt('Send Request')),
                    onPressed: () {
                      s.sendRequest(user.id, m.id);
                      setState(() {});
                      toast(
                          context, tt('Mentor request sent. Status: Pending'));
                    },
                  ),
                ]);
              }
              if (req.status == RequestStatus.pending) {
                return Column(children: [
                  reqChip(req.status),
                  const SizedBox(height: 8),
                  Text(tt('Waiting for the mentor to accept your request.'),
                      style: TextStyle(color: Colors.black54)),
                ]);
              }
              return ElevatedButton.icon(
                icon: const Icon(Icons.chat_bubble_outline),
                label: Text(tt('Chat with Mentor')),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChatPage(request: req, otherUser: m)),
                ),
              );
            }),
          ),
      ]),
    );
  }

  Widget _row(IconData i, String k, String v) => ListTile(
        leading: Icon(i, color: kBrand),
        title: Text(k, style: TextStyle(fontSize: 12, color: Colors.black54)),
        subtitle: Text(v.isEmpty ? '-' : v,
            style: TextStyle(fontSize: 15, color: Colors.black87)),
      );
}

class StudentRequestsTab extends StatelessWidget {
  const StudentRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final user = s.currentUser!;
    final reqs = s.requestsForStudent(user.id);
    if (reqs.isEmpty) {
      return _Empty(
          icon: Icons.forum_outlined, text: tt('No mentor requests yet'));
    }
    return ListView.builder(
      itemCount: reqs.length,
      itemBuilder: (_, i) {
        final r = reqs[i];
        final m = s.userById(r.mentorId);
        if (m == null) return const SizedBox.shrink();
        return Card(
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: kBrand.withOpacity(0.12),
                child: Text(m.name.characters.first.toUpperCase(),
                    style: TextStyle(color: kBrand))),
            title: Text(m.name, style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: reqChip(r.status),
            ),
            trailing: r.status == RequestStatus.accepted
                ? IconButton(
                    icon: const Icon(Icons.chat_bubble_outline, color: kBrand),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                ChatPage(request: r, otherUser: m))),
                  )
                : const Icon(Icons.chevron_right),
            onTap: () {
              if (r.status == RequestStatus.accepted) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatPage(request: r, otherUser: m)));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MentorProfilePage(mentor: m)));
              }
            },
          ),
        );
      },
    );
  }
}

// ============================ CHAT (person to person, no AI) ============================

class ChatPage extends StatefulWidget {
  final MentorRequest request;
  final AppUser otherUser;
  const ChatPage({super.key, required this.request, required this.otherUser});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();
  final _scroll = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _send() {
    final me = Store.instance.currentUser!;
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    // Sends ONLY the exact text typed by the logged-in user. No auto replies.
    Store.instance.sendMessage(widget.request.id, me.id, text);
    _controller.clear();
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(_scroll.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final me = Store.instance.currentUser!;
    final msgs = Store.instance.chat(widget.request.id);
    final canChat = widget.request.status == RequestStatus.accepted;
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            child: Text(widget.otherUser.name.characters.first.toUpperCase(),
                style: TextStyle(color: kBrand, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 10),
          Expanded(
              child:
                  Text(widget.otherUser.name, overflow: TextOverflow.ellipsis)),
        ]),
      ),
      body: Column(children: [
        Expanded(
          child: msgs.isEmpty
              ? _Empty(
                  icon: Icons.chat_bubble_outline, text: tt('No messages yet'))
              : ListView.builder(
                  controller: _scroll,
                  padding: const EdgeInsets.all(12),
                  itemCount: msgs.length,
                  itemBuilder: (_, i) {
                    final m = msgs[i];
                    final mine = m.senderId == me.id;
                    return Align(
                      alignment:
                          mine ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        constraints: const BoxConstraints(maxWidth: 280),
                        decoration: BoxDecoration(
                          color: mine ? kBrand : Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Text(m.text,
                            style: TextStyle(
                                color: mine ? Colors.white : Colors.black87)),
                      ),
                    );
                  },
                ),
        ),
        if (!canChat)
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(tt('Chat is available only after the mentor accepts.'),
                style: TextStyle(color: Colors.black54)),
          )
        else
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
              child: Row(children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _send(),
                    decoration: InputDecoration(hintText: tt('Type a message')),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: kBrand,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _send,
                  ),
                ),
              ]),
            ),
          ),
      ]),
    );
  }
}

// ============================ PROFILE ============================

class ProfilePage extends StatelessWidget {
  final bool embedded;
  final AppUser? user;
  const ProfilePage({super.key, this.embedded = false, this.user});

  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final u = user ?? s.currentUser;
    if (u == null)
      return _Empty(icon: Icons.person_off, text: tt('No profile'));
    final readOnly = user != null;

    final body = ListView(children: [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [kBrand, kBrandDark])),
        child: Row(children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Text(u.name.characters.first.toUpperCase(),
                style: TextStyle(
                    color: kBrand, fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(u.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Text(u.role == Role.student ? tt('Student') : tt('Mentor'),
                  style: TextStyle(color: Colors.white70)),
            ]),
          ),
        ]),
      ),
      Card(
        child: Column(children: [
          ListTile(title: Text(tt('Status')), trailing: statusChip(u.status)),
          _row(Icons.mail_outline, tt('Email'), u.email),
          _row(Icons.phone_outlined, tt('Phone'), u.phone),
          _row(Icons.event_outlined, tt('Registered on'),
              fmtDate(u.registeredAt)),
          if (u.role == Role.student) ...[
            _row(Icons.location_city_outlined, tt('City'), u.city),
            _row(Icons.menu_book_outlined, tt('Stream'), u.stream),
          ] else ...[
            _row(Icons.apartment_outlined, tt('College'), u.college),
            _row(Icons.star_outline, tt('Expertise'), u.expertise),
            _row(Icons.timeline_outlined, tt('Experience'), u.experience),
            _row(Icons.notes_outlined, tt('Bio'), u.bio),
          ],
        ]),
      ),
      if (!readOnly)
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            OutlinedButton.icon(
              icon: const Icon(Icons.notifications_outlined),
              label: Text(tr('notifications', s.lang)),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => NotificationsPage(userId: u.id))),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB91C1C)),
              icon: const Icon(Icons.logout),
              label: Text(tr('logout', s.lang)),
              onPressed: () {
                s.logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (r) => false);
              },
            ),
          ]),
        ),
    ]);

    if (embedded) return body;
    return Scaffold(
      appBar: AppBar(title: Text(tr('profile', s.lang))),
      body: body,
    );
  }

  Widget _row(IconData i, String k, String v) => ListTile(
        leading: Icon(i, color: kBrand),
        title: Text(k, style: TextStyle(fontSize: 12, color: Colors.black54)),
        subtitle: Text(v.isEmpty ? '-' : v,
            style: TextStyle(fontSize: 15, color: Colors.black87)),
      );
}

// ============================ MENTOR SHELL ============================

class MentorShell extends StatefulWidget {
  const MentorShell({super.key});
  @override
  State<MentorShell> createState() => _MentorShellState();
}

class _MentorShellState extends State<MentorShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final me = s.currentUser;
    if (me == null) return const HomePage();
    final lang = s.lang;
    final pages = [
      const MentorRequestsTab(pendingOnly: true),
      const MentorRequestsTab(pendingOnly: false),
      const ProfilePage(embedded: true),
    ];
    final titles = ['Student Requests', 'My Students', tr('profile', lang)];
    return Scaffold(
      appBar: AppBar(
        title: Text('${tt('EduTruth')} · ${titles[_index]}'),
        actions: [
          NotificationBell(userId: me.id),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (v) {
              if (v == 'profile') setState(() => _index = 2);
              if (v == 'logout') {
                s.logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (r) => false);
              }
              if (v.startsWith('lang:'))
                s.setLang(langFromCode(v.substring(5)));
            },
            itemBuilder: (_) => [
              PopupMenuItem(value: 'profile', child: Text(tr('profile', lang))),
              ...Lang.values.map((l) => PopupMenuItem(
                  value: 'lang:${l.name}', child: Text(kLangNames[l]!))),
              PopupMenuItem(value: 'logout', child: Text(tr('logout', lang))),
            ],
          ),
        ],
      ),
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.inbox_outlined), label: tt('Requests')),
          NavigationDestination(
              icon: Icon(Icons.groups_outlined), label: tt('Students')),
          NavigationDestination(
              icon: const Icon(Icons.person_outline),
              label: tr('profile', lang)),
        ],
      ),
    );
  }
}

class MentorRequestsTab extends StatefulWidget {
  final bool pendingOnly;
  const MentorRequestsTab({super.key, required this.pendingOnly});
  @override
  State<MentorRequestsTab> createState() => _MentorRequestsTabState();
}

class _MentorRequestsTabState extends State<MentorRequestsTab> {
  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final me = s.currentUser!;
    final all = s.requestsForMentor(me.id);
    final list = widget.pendingOnly
        ? all.where((r) => r.status == RequestStatus.pending).toList()
        : all.where((r) => r.status == RequestStatus.accepted).toList();

    if (list.isEmpty) {
      return _Empty(
          icon:
              widget.pendingOnly ? Icons.inbox_outlined : Icons.groups_outlined,
          text: widget.pendingOnly
              ? tt('No pending student requests')
              : tt('No accepted students yet'));
    }

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, i) {
        final r = list[i];
        final st = s.userById(r.studentId);
        if (st == null) return const SizedBox.shrink();
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                CircleAvatar(
                    backgroundColor: kBrand.withOpacity(0.12),
                    child: Text(st.name.characters.first.toUpperCase(),
                        style: TextStyle(color: kBrand))),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(st.name,
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        Text(st.email,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54)),
                      ]),
                ),
                reqChip(r.status),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.visibility_outlined, size: 18),
                    label: Text(tt('View')),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProfilePage(user: st))),
                  ),
                ),
                const SizedBox(width: 8),
                if (widget.pendingOnly) ...[
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40)),
                      icon: const Icon(Icons.check, size: 18),
                      label: Text(tt('Accept')),
                      onPressed: () {
                        s.setRequestStatus(r, RequestStatus.accepted);
                        setState(() {});
                        toast(
                            context, tt('Request accepted. You can chat now.'));
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB91C1C),
                          minimumSize: const Size.fromHeight(40)),
                      icon: const Icon(Icons.close, size: 18),
                      label: Text(tt('Reject')),
                      onPressed: () {
                        s.setRequestStatus(r, RequestStatus.rejected);
                        setState(() {});
                        toast(context, tt('Request rejected.'));
                      },
                    ),
                  ),
                ] else
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40)),
                      icon: const Icon(Icons.chat_bubble_outline, size: 18),
                      label: Text(tt('Chat')),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  ChatPage(request: r, otherUser: st))),
                    ),
                  ),
              ]),
            ]),
          ),
        );
      },
    );
  }
}

// ============================ ADMIN ============================

class AdminShell extends StatefulWidget {
  const AdminShell({super.key});
  @override
  State<AdminShell> createState() => _AdminShellState();
}

class _AdminShellState extends State<AdminShell> {
  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    if (!s.adminLoggedIn) return const HomePage();
    final pending = s.pendingUsers.length;
    return Scaffold(
      appBar: AppBar(
        title: Text(tt('Admin Dashboard')),
        actions: [
          const NotificationBell(userId: 'admin'),
          PopupMenuButton<Lang>(
            tooltip: tt('Language'),
            icon: const Icon(Icons.language),
            onSelected: s.setLang,
            itemBuilder: (_) => Lang.values
                .map(
                    (l) => PopupMenuItem(value: l, child: Text(kLangNames[l]!)))
                .toList(),
          ),
          IconButton(
            tooltip: tt('Logout'),
            icon: const Icon(Icons.logout),
            onPressed: () {
              s.logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (r) => false);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              Expanded(
                  child:
                      _stat(tt('Pending'), '$pending', Icons.pending_actions)),
              const SizedBox(width: 10),
              Expanded(
                  child: _stat(tt('Students'), '${s.verifiedStudents.length}',
                      Icons.school_outlined)),
              const SizedBox(width: 10),
              Expanded(
                  child: _stat(tt('Mentors'), '${s.verifiedMentors.length}',
                      Icons.workspace_premium_outlined)),
            ]),
          ),
          _tile(context, Icons.how_to_reg_outlined, tt('Approval Requests'),
              '$pending ' + tt('pending'), const AdminApprovalPage()),
          _tile(
              context,
              Icons.school_outlined,
              tt('Verified Students'),
              '${s.verifiedStudents.length} ' + tt('verified'),
              const AdminVerifiedPage(role: Role.student)),
          _tile(
              context,
              Icons.workspace_premium_outlined,
              tt('Verified Mentors'),
              '${s.verifiedMentors.length} ' + tt('verified'),
              const AdminVerifiedPage(role: Role.mentor)),
          _tile(
              context,
              Icons.apartment_outlined,
              tt('College Management'),
              '${s.colleges.length} ' + tt('colleges'),
              const AdminCollegesPage()),
          _tile(context, Icons.rate_review_outlined, tt('Reviews / Reports'),
              '${s.reviews.length} ' + tt('reviews'), const AdminReviewsPage()),
          _tile(
              context,
              Icons.forum_outlined,
              tt('Chat History'),
              '${s.conversations.length} ' + tt('conversations'),
              const AdminChatHistoryPage()),
          _tile(
              context,
              Icons.notifications_outlined,
              tt('Notifications'),
              '${s.notificationsFor('admin').length} ' + tt('items'),
              const NotificationsPage(userId: 'admin')),
        ],
      ),
    );
  }

  Widget _stat(String label, String value, IconData icon) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Column(children: [
          Icon(icon, color: kBrand),
          const SizedBox(height: 6),
          Text(value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.black54)),
        ]),
      );

  Widget _tile(BuildContext context, IconData i, String title, String sub,
          Widget page) =>
      Card(
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: kBrand.withOpacity(0.12),
              child: Icon(i, color: kBrand)),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text(sub),
          trailing: const Icon(Icons.chevron_right),
          onTap: () async {
            await Navigator.push(
                context, MaterialPageRoute(builder: (_) => page));
            if (mounted) setState(() {});
          },
        ),
      );
}

class AdminApprovalPage extends StatefulWidget {
  const AdminApprovalPage({super.key});
  @override
  State<AdminApprovalPage> createState() => _AdminApprovalPageState();
}

class _AdminApprovalPageState extends State<AdminApprovalPage> {
  int _tab = 0; // 0 pending, 1 all

  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final list = _tab == 0
        ? s.pendingUsers
        : s.users.where((u) => u.role != Role.admin).toList();
    return Scaffold(
      appBar: AppBar(title: Text(tt('Approval Requests'))),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SegmentedButton<int>(
            segments: [
              ButtonSegment(value: 0, label: Text(tt('Pending'))),
              ButtonSegment(value: 1, label: Text(tt('All accounts'))),
            ],
            selected: {_tab},
            onSelectionChanged: (v) => setState(() => _tab = v.first),
          ),
        ),
        Expanded(
          child: list.isEmpty
              ? _Empty(icon: Icons.inbox_outlined, text: tt('No requests'))
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    final u = list[i];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(u.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16)),
                                        Text(u.email,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54)),
                                        const SizedBox(height: 4),
                                        Text(
                                            '${u.role == Role.student ? tt('Student') : tt('Mentor')} · ${fmtDate(u.registeredAt)}',
                                            style: TextStyle(fontSize: 12)),
                                      ]),
                                ),
                                statusChip(u.status),
                              ]),
                              const SizedBox(height: 12),
                              Wrap(spacing: 8, runSpacing: 8, children: [
                                OutlinedButton.icon(
                                  icon: const Icon(Icons.visibility_outlined,
                                      size: 18),
                                  label: Text(tt('View')),
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              ProfilePage(user: u))),
                                ),
                                if (u.status != AccountStatus.verified)
                                  FilledButton.icon(
                                    icon: const Icon(Icons.check, size: 18),
                                    label: Text(tt('Approve')),
                                    onPressed: () {
                                      s.approve(u);
                                      setState(() {});
                                      toast(context,
                                          '${u.name} ' + tt('approved.'));
                                    },
                                  ),
                                if (u.status != AccountStatus.rejected)
                                  FilledButton.icon(
                                    style: FilledButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFB91C1C)),
                                    icon: const Icon(Icons.close, size: 18),
                                    label: Text(tt('Reject')),
                                    onPressed: () {
                                      s.reject(u);
                                      setState(() {});
                                      toast(context,
                                          '${u.name} ' + tt('rejected.'));
                                    },
                                  ),
                                TextButton.icon(
                                  icon: const Icon(Icons.delete_outline,
                                      size: 18, color: Color(0xFFB91C1C)),
                                  label: Text(tt('Delete'),
                                      style:
                                          TextStyle(color: Color(0xFFB91C1C))),
                                  onPressed: () async {
                                    final ok = await showDialog<bool>(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: Text(tt('Delete account?')),
                                        content: Text(tt(
                                            'This will permanently remove this account.')),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(ctx, false),
                                              child: Text(tt('Cancel'))),
                                          FilledButton(
                                              style: FilledButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xFFB91C1C)),
                                              onPressed: () =>
                                                  Navigator.pop(ctx, true),
                                              child: Text(tt('Delete'))),
                                        ],
                                      ),
                                    );
                                    if (ok == true) {
                                      s.deleteUser(u);
                                      if (mounted) setState(() {});
                                      if (context.mounted) {
                                        toast(context, tt('Account deleted.'));
                                      }
                                    }
                                  },
                                ),
                              ]),
                            ]),
                      ),
                    );
                  },
                ),
        ),
      ]),
    );
  }
}

class AdminVerifiedPage extends StatefulWidget {
  final Role role;
  const AdminVerifiedPage({super.key, required this.role});
  @override
  State<AdminVerifiedPage> createState() => _AdminVerifiedPageState();
}

class _AdminVerifiedPageState extends State<AdminVerifiedPage> {
  final _q = TextEditingController();

  @override
  void dispose() {
    _q.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final base =
        widget.role == Role.student ? s.verifiedStudents : s.verifiedMentors;
    final query = _q.text.trim().toLowerCase();
    final list = base
        .where((u) =>
            query.isEmpty ||
            u.name.toLowerCase().contains(query) ||
            u.email.toLowerCase().contains(query))
        .toList();
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.role == Role.student
              ? tt('Verified Students')
              : tt('Verified Mentors'))),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: TextField(
            controller: _q,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
                hintText: tt('Search by name or email'),
                prefixIcon: Icon(Icons.search)),
          ),
        ),
        Expanded(
          child: list.isEmpty
              ? _Empty(
                  icon: Icons.people_outline, text: tt('No verified accounts'))
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    final u = list[i];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor: kBrand.withOpacity(0.12),
                            child: Text(u.name.characters.first.toUpperCase(),
                                style: TextStyle(color: kBrand))),
                        title: Text(u.name,
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        subtitle: Text(
                            '${u.email}\n${tt('Registered')} ${fmtDate(u.registeredAt)}'),
                        isThreeLine: true,
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          statusChip(u.status),
                          IconButton(
                            tooltip: tt('Delete account'),
                            icon: const Icon(Icons.delete_outline,
                                color: Color(0xFFB91C1C)),
                            onPressed: () async {
                              final ok = await confirmDeleteAccount(context, u);
                              if (ok) {
                                s.deleteUser(u);
                                if (mounted) setState(() {});
                                if (context.mounted) {
                                  toast(context, tt('Account deleted.'));
                                }
                              }
                            },
                          ),
                        ]),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProfilePage(user: u))),
                      ),
                    );
                  },
                ),
        ),
      ]),
    );
  }
}

class AdminCollegesPage extends StatefulWidget {
  const AdminCollegesPage({super.key});
  @override
  State<AdminCollegesPage> createState() => _AdminCollegesPageState();
}

class _AdminCollegesPageState extends State<AdminCollegesPage> {
  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(tt('College Management'))),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kBrand,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: Text(tt('Add college')),
        onPressed: () => _addDialog(context),
      ),
      body: ListView.builder(
        itemCount: s.colleges.length,
        itemBuilder: (_, i) {
          final c = s.colleges[i];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.apartment, color: kBrand),
              title:
                  Text(c.name, style: TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(
                  '${c.location}\n${tt(c.type)} · ${tt(c.stream)} · ★ ${c.rating}'),
              isThreeLine: true,
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  icon: const Icon(Icons.visibility_outlined),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CollegeDetailsPage(college: c))),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline,
                      color: Color(0xFFB91C1C)),
                  onPressed: () async {
                    final ok = await showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text(tt('Delete college?')),
                        content: Text(c.name),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(ctx, false),
                              child: Text(tt('Cancel'))),
                          FilledButton(
                              onPressed: () => Navigator.pop(ctx, true),
                              child: Text(tt('Delete'))),
                        ],
                      ),
                    );
                    if (ok == true) {
                      s.colleges.remove(c);
                      s.reviews.removeWhere((r) => r.collegeId == c.id);
                      if (mounted) setState(() {});
                    }
                  },
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  Future<void> _addDialog(BuildContext context) async {
    final name = TextEditingController();
    final loc = TextEditingController();
    final fees = TextEditingController(text: 'Rs. 50K / year');
    String type = 'Government';
    String stream = 'Engineering';
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setSt) => AlertDialog(
          title: Text(tt('Add college')),
          content: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                  controller: name,
                  decoration: InputDecoration(labelText: tt('Name'))),
              const SizedBox(height: 8),
              TextField(
                  controller: loc,
                  decoration: InputDecoration(labelText: tt('Location'))),
              const SizedBox(height: 8),
              TextField(
                  controller: fees,
                  decoration: InputDecoration(labelText: tt('Fees'))),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: type,
                decoration: InputDecoration(labelText: tt('Type')),
                items: ['Government', 'Private']
                    .map((e) => DropdownMenuItem(value: e, child: Text(tt(e))))
                    .toList(),
                onChanged: (v) => setSt(() => type = v ?? type),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: stream,
                decoration: InputDecoration(labelText: tt('Stream')),
                items: ['Engineering', 'Medical', 'Science', 'Commerce']
                    .map((e) => DropdownMenuItem(value: e, child: Text(tt(e))))
                    .toList(),
                onChanged: (v) => setSt(() => stream = v ?? stream),
              ),
            ]),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(tt('Cancel'))),
            FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(tt('Add'))),
          ],
        ),
      ),
    );
    if (ok == true && name.text.trim().isNotEmpty) {
      Store.instance.colleges.add(College(
        'c${DateTime.now().millisecondsSinceEpoch}',
        name.text.trim(),
        loc.text.trim(),
        type,
        stream,
        4.0,
        fees.text.trim(),
        tt('Added by admin.'),
      ));
      if (mounted) setState(() {});
      if (context.mounted) toast(context, tt('College added.'));
    }
    name.dispose();
    loc.dispose();
    fees.dispose();
  }
}

class AdminReviewsPage extends StatefulWidget {
  const AdminReviewsPage({super.key});
  @override
  State<AdminReviewsPage> createState() => _AdminReviewsPageState();
}

class _AdminReviewsPageState extends State<AdminReviewsPage> {
  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final revs = s.reviews.reversed.toList();
    return Scaffold(
      appBar: AppBar(title: Text(tt('Reviews / Reports'))),
      body: revs.isEmpty
          ? _Empty(icon: Icons.rate_review_outlined, text: tt('No reviews yet'))
          : ListView.builder(
              itemCount: revs.length,
              itemBuilder: (_, i) {
                final r = revs[i];
                String collegeName = tt('Unknown college');
                for (final c in s.colleges) {
                  if (c.id == r.collegeId) collegeName = c.name;
                }
                return Card(
                  child: ListTile(
                    title: Text('$collegeName · ★ ${r.rating}',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(
                        '${r.text}\n${tt('By')} ${r.authorName} · ${fmtDate(r.createdAt)}'),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline,
                          color: Color(0xFFB91C1C)),
                      onPressed: () {
                        s.reviews.remove(r);
                        setState(() {});
                        toast(context, tt('Review removed.'));
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// ============================ ADMIN CHAT HISTORY (READ ONLY) ============================

class AdminChatHistoryPage extends StatefulWidget {
  const AdminChatHistoryPage({super.key});
  @override
  State<AdminChatHistoryPage> createState() => _AdminChatHistoryPageState();
}

class _AdminChatHistoryPageState extends State<AdminChatHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    final convos = s.conversations;
    return Scaffold(
      appBar: AppBar(title: Text(tt('Chat History'))),
      body: convos.isEmpty
          ? _Empty(icon: Icons.forum_outlined, text: tt('No conversations yet'))
          : ListView.builder(
              itemCount: convos.length,
              itemBuilder: (_, i) {
                final r = convos[i];
                final student = s.userById(r.studentId);
                final mentor = s.userById(r.mentorId);
                final msgs = s.chat(r.id);
                final last = msgs.last;
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: kBrand.withOpacity(0.12),
                        child: const Icon(Icons.forum_outlined, color: kBrand)),
                    title: Text(
                        '${student?.name ?? tt('Deleted student')} · ${mentor?.name ?? tt('Deleted mentor')}',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    subtitle: Text(
                        '${msgs.length} ${tt('messages')}\n${tt('Last')}: ${fmtDateTime(last.sentAt)}'),
                    isThreeLine: true,
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  AdminChatViewPage(requestId: r.id)));
                      if (mounted) setState(() {});
                    },
                  ),
                );
              },
            ),
    );
  }
}

/// Read-only transcript. Admin cannot send, reply or impersonate anyone.
class AdminChatViewPage extends StatelessWidget {
  final String requestId;
  const AdminChatViewPage({super.key, required this.requestId});

  @override
  Widget build(BuildContext context) {
    final s = StoreScope.of(context);
    MentorRequest? req;
    for (final r in s.requests) {
      if (r.id == requestId) req = r;
    }
    final student = req == null ? null : s.userById(req.studentId);
    final mentor = req == null ? null : s.userById(req.mentorId);
    final msgs = s.chat(requestId);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${student?.name ?? tt('Deleted student')} · ${mentor?.name ?? tt('Deleted mentor')}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            Text(tt('Read only'),
                style: TextStyle(fontSize: 11, color: Colors.white70)),
          ],
        ),
      ),
      body: Column(children: [
        Container(
          width: double.infinity,
          color: kAccent.withOpacity(0.12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(children: [
            Icon(Icons.lock_outline, size: 16, color: Color(0xFF92400E)),
            SizedBox(width: 8),
            Expanded(
              child: Text(tt('Admin view is read only. Replying is disabled.'),
                  style: TextStyle(fontSize: 12, color: Color(0xFF92400E))),
            ),
          ]),
        ),
        Expanded(
          child: msgs.isEmpty
              ? _Empty(icon: Icons.chat_bubble_outline, text: tt('No messages'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: msgs.length,
                  itemBuilder: (_, i) {
                    final m = msgs[i];
                    final isStudent = m.senderId == req?.studentId;
                    final senderName = s.userById(m.senderId)?.name ??
                        (isStudent ? tt('Student') : tt('Mentor'));
                    return Align(
                      alignment: isStudent
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(12),
                        constraints: const BoxConstraints(maxWidth: 300),
                        decoration: BoxDecoration(
                          color: isStudent
                              ? Colors.white
                              : kBrand.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '$senderName · ${isStudent ? tt('Student') : tt('Mentor')}',
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: kBrandDark)),
                            const SizedBox(height: 4),
                            Text(m.text),
                            const SizedBox(height: 4),
                            Text(fmtDateTime(m.sentAt),
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black54)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ]),
    );
  }
}
