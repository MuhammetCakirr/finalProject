

import 'package:flutter/cupertino.dart';

class SignUpController extends ChangeNotifier
{
  //Variables

  //page 1
  String _name='';
  String _surname='';
  String _phone='';
  String _email = '';
  String _selectedGender = 'Erkek';
  String _selectedCity = 'İstanbul';
  final List<Map<String, dynamic>> _cityList = [
    {'id': 'Adana', 'name': 'Adana'},
    {'id': 'Adıyaman', 'name': 'Adıyaman'},
    {'id': 'Afyonkarahisar', 'name': 'Afyonkarahisar'},
    {'id': 'Ağrı', 'name': 'Ağrı'},
    {'id': 'Aksaray', 'name': 'Aksaray'},
    {'id': 'Amasya', 'name': 'Amasya'},
    {'id': 'Ankara', 'name': 'Ankara'},
    {'id': 'Antalya', 'name': 'Antalya'},
    {'id': 'Ardahan', 'name': 'Ardahan'},
    {'id': 'Artvin', 'name': 'Artvin'},
    {'id': 'Aydın', 'name': 'Aydın'},
    {'id': 'Balıkesir', 'name': 'Balıkesir'},
    {'id': 'Bartın', 'name': 'Bartın'},
    {'id': 'Batman', 'name': 'Batman'},
    {'id': 'Bayburt', 'name': 'Bayburt'},
    {'id': 'Bilecik', 'name': 'Bilecik'},
    {'id': 'Bingöl', 'name': 'Bingöl'},
    {'id': 'Bitlis', 'name': 'Bitlis'},
    {'id': 'Bolu', 'name': 'Bolu'},
    {'id': 'Burdur', 'name': 'Burdur'},
    {'id': 'Bursa', 'name': 'Bursa'},
    {'id': 'Çanakkale', 'name': 'Çanakkale'},
    {'id': 'Çankırı', 'name': 'Çankırı'},
    {'id': 'Çorum', 'name': 'Çorum'},
    {'id': 'Denizli', 'name': 'Denizli'},
    {'id': 'Diyarbakır', 'name': 'Diyarbakır'},
    {'id': 'Düzce', 'name': 'Düzce'},
    {'id': 'Edirne', 'name': 'Edirne'},
    {'id': 'Elazığ', 'name': 'Elazığ'},
    {'id': 'Erzincan', 'name': 'Erzincan'},
    {'id': 'Erzurum', 'name': 'Erzurum'},
    {'id': 'Eskişehir', 'name': 'Eskişehir'},
    {'id': 'Gaziantep', 'name': 'Gaziantep'},
    {'id': 'Giresun', 'name': 'Giresun'},
    {'id': 'Gümüşhane', 'name': 'Gümüşhane'},
    {'id': 'Hakkari', 'name': 'Hakkari'},
    {'id': 'Hatay', 'name': 'Hatay'},
    {'id': 'Iğdır', 'name': 'Iğdır'},
    {'id': 'Isparta', 'name': 'Isparta'},
    {'id': 'İstanbul', 'name': 'İstanbul'},
    {'id': 'İzmir', 'name': 'İzmir'},
    {'id': 'Kahramanmaraş', 'name': 'Kahramanmaraş'},
    {'id': 'Karabük', 'name': 'Karabük'},
    {'id': 'Karaman', 'name': 'Karaman'},
    {'id': 'Kars', 'name': 'Kars'},
    {'id': 'Kastamonu', 'name': 'Kastamonu'},
    {'id': 'Kayseri', 'name': 'Kayseri'},
    {'id': 'Kırıkkale', 'name': 'Kırıkkale'},
    {'id': 'Kırklareli', 'name': 'Kırklareli'},
    {'id': 'Kırşehir', 'name': 'Kırşehir'},
    {'id': 'Kilis', 'name': 'Kilis'},
    {'id': 'Kocaeli', 'name': 'Kocaeli'},
    {'id': 'Konya', 'name': 'Konya'},
    {'id': 'Kütahya', 'name': 'Kütahya'},
    {'id': 'Malatya', 'name': 'Malatya'},
    {'id': 'Manisa', 'name': 'Manisa'},
    {'id': 'Mardin', 'name': 'Mardin'},
    {'id': 'Mersin', 'name': 'Mersin'},
    {'id': 'Muğla', 'name': 'Muğla'},
    {'id': 'Muş', 'name': 'Muş'},
    {'id': 'Nevşehir', 'name': 'Nevşehir'},
    {'id': 'Niğde', 'name': 'Niğde'},
    {'id': 'Ordu', 'name': 'Ordu'},
    {'id': 'Osmaniye', 'name': 'Osmaniye'},
    {'id': 'Rize', 'name': 'Rize'},
    {'id': 'Sakarya', 'name': 'Sakarya'},
    {'id': 'Samsun', 'name': 'Samsun'},
    {'id': 'Şanlıurfa', 'name': 'Şanlıurfa'},
    {'id': 'Siirt', 'name': 'Siirt'},
    {'id': 'Sinop', 'name': 'Sinop'},
    {'id': 'Sivas', 'name': 'Sivas'},
    {'id': 'Şırnak', 'name': 'Şırnak'},
    {'id': 'Tekirdağ', 'name': 'Tekirdağ'},
    {'id': 'Tokat', 'name': 'Tokat'},
    {'id': 'Trabzon', 'name': 'Trabzon'},
    {'id': 'Tunceli', 'name': 'Tunceli'},
    {'id': 'Uşak', 'name': 'Uşak'},
    {'id': 'Van', 'name': 'Van'},
    {'id': 'Yalova', 'name': 'Yalova'},
    {'id': 'Yozgat', 'name': 'Yozgat'},
    {'id': 'Zonguldak', 'name': 'Zonguldak'},
  ];
  bool _isFirstFormValid = false;

  // page 2
  String _selectedDisablity = 'Fiziksel Engeli';
  String _disabilityRage='';
  bool _isSecondFormValid = false;
  bool _isLoading = false;
  final List<Map<String, String>> _disabilityTypes = [
    {'id': 'Görme Engeli', 'name': 'Görme Engeli'},
    {'id': 'İşitme Engeli', 'name': 'İşitme Engeli'},
    {'id': 'Fiziksel Engeli', 'name': 'Fiziksel Engeli'},
    {'id': 'Zihinsel/Öğrenme Güçlüğü', 'name': 'Zihinsel/Öğrenme Güçlüğü'},
    {'id': 'Kronik Hastalık', 'name': 'Kronik Hastalık'},
    {'id': 'Psikososyal Engeli', 'name': 'Psikososyal Engeli'},
    {'id': 'Dil ve Konuşma Bozukluğu', 'name': 'Dil ve Konuşma Bozukluğu'},
    {'id': 'Diğer', 'name': 'Diğer'},
  ];


  // page 3
  bool _isThirdPageButtonEnabled = false;
  final List<Map<String, String>> _skillList = [
    {'id': 'Müşteri Hizmetleri (Çağrı Merkezi, E-posta)', 'name': 'Müşteri Hizmetleri (Çağrı Merkezi, E-posta)'},
    {'id': 'Veri Girişi ve Yönetimi (Excel, CRM)', 'name': 'Veri Girişi ve Yönetimi (Excel, CRM)'},
    {'id': 'Online Satış Destek (Ürün Yönetimi, Müşteri Takibi)', 'name': 'Online Satış Destek (Ürün Yönetimi, Müşteri Takibi)'},
    {'id': 'İçerik Üretimi (Blog Yazma, Metin Yazarlığı)', 'name': 'İçerik Üretimi (Blog Yazma, Metin Yazarlığı)'},
    {'id': 'Sosyal Medya Yönetimi (Planlama, Paylaşım)', 'name': 'Sosyal Medya Yönetimi (Planlama, Paylaşım)'},
    {'id': 'Çeviri ve Dil Hizmetleri (Metin Çevirisi, Yazılı İletişim)', 'name': 'Çeviri ve Dil Hizmetleri (Metin Çevirisi, Yazılı İletişim)'},
    {'id': 'Erişilebilirlik Testi (Web ve Mobil)', 'name': 'Erişilebilirlik Testi (Web ve Mobil)'},
    {'id': 'Yemek Yapımı ve Hazırlık', 'name': 'Yemek Yapımı ve Hazırlık'},
    {'id': 'Sanatsal Üretim ve El İşleri (Resim, Takı Tasarımı)', 'name': 'Sanatsal Üretim ve El İşleri (Resim, Takı Tasarımı)'},
    {'id': 'Hafif Montaj İşleri (El Ürünleri Montajı)', 'name': 'Hafif Montaj İşleri (El Ürünleri Montajı)'},
    {'id': 'Online Danışmanlık (Yaşam ve İş Koçluğu)', 'name': 'Online Danışmanlık (Yaşam ve İş Koçluğu)'},
    {'id': 'Bahçe İşleri ve Bitki Bakımı', 'name': 'Bahçe İşleri ve Bitki Bakımı'},
    {'id': 'Seslendirme ve Dublaj (Reklam, Eğitim Videoları)', 'name': 'Seslendirme ve Dublaj (Reklam, Eğitim Videoları)'},
    {'id': 'Proje Takibi ve Planlama', 'name': 'Proje Takibi ve Planlama'},
    {'id': 'El Sanatları (Hobi ve Üretim)', 'name': 'El Sanatları (Hobi ve Üretim)'},
    {'id': 'Çay ve İkram Hizmetleri', 'name': 'Çay ve İkram Hizmetleri'},
    {'id': 'Ev Düzeni ve Hafif Temizlik', 'name': 'Ev Düzeni ve Hafif Temizlik'},
    {'id': 'Çocuk Bakımı ve Eğitim Desteği', 'name': 'Çocuk Bakımı ve Eğitim Desteği'},
    {'id': 'Yazılım Test Uzmanlığı (Manuel Test)', 'name': 'Yazılım Test Uzmanlığı (Manuel Test)'},
    {'id': 'Kendi Kendine Yönetim ve Günlük İhtiyaç Planlaması', 'name': 'Kendi Kendine Yönetim ve Günlük İhtiyaç Planlaması'},
  ];
  List<String> _selectedSkillList=[];


  //Getters

  //Page 1 getters
  String get name => _name;
  String get surname => _surname;
  String get phone => _phone;
  String get email => _email;
  List<Map<String, dynamic>> get cityList => _cityList;
  bool get isFirstFormValid => _isFirstFormValid;
  String get selectedGender => _selectedGender;
  String get selectedCity => _selectedCity;
  bool get isFirstPageButtonEnabled {
    print("isFormValid: $isFirstFormValid");
    print("isLoading: $isLoading");
    bool deger = isFirstFormValid && !isLoading;
    print("isButtonEnabled: $deger");
    return isFirstFormValid && !isLoading;
  }

  //Page 2 getters
  String get disabilityRage => _disabilityRage;
  String get selectedDisablity => _selectedDisablity;
  List<Map<String, dynamic>> get disabilityList => _disabilityTypes;
  bool get isSecondPageButtonEnabled {
    print("isFormValid: $_isSecondFormValid");
    print("isLoading: $isLoading");
    bool deger = _isSecondFormValid && !isLoading;
    print("isButtonEnabled: $deger");
    return _isSecondFormValid && !isLoading;
  }

  //Page 3 getters
  List<Map<String, String>> get skillList => _skillList;
  List<String> get selectedSkillList => _selectedSkillList;
  bool get isThirdPageButtonEnabled => _isThirdPageButtonEnabled;

  bool get isLoading => _isLoading;


  //Functions

  // Page 1 Functions
  void setName(String value) {
    _name = value;
    _firstPagevalidateForm();
    notifyListeners();
  }

  void setSurname(String value) {
    _surname = value;
    _firstPagevalidateForm();
    notifyListeners();
  }

  void setPhone(String value) {
    _phone = value;
    _firstPagevalidateForm();
    notifyListeners();
  }

  void setEmail(String value) {
    _email=value;
    _firstPagevalidateForm();
    notifyListeners();
  }

  void setSelectedCity(String city) {
    _selectedCity = city;
    _firstPagevalidateForm();
    notifyListeners();
  }

  void setSelectedGender(String gender) {
    _selectedGender = gender;
    _firstPagevalidateForm();
    notifyListeners();
  }

  void _firstPagevalidateForm() {
    _isFirstFormValid = _email.isNotEmpty &&
        _selectedCity.isNotEmpty &&
        _selectedGender.isNotEmpty &&
        _name.isNotEmpty &&
        _surname.isNotEmpty &&
        _phone.isNotEmpty&&  _email.isNotEmpty;
    notifyListeners();
  }


  // Page 2 Functions
  void setDisabilityRage(String value) {
    _disabilityRage=value;
    _secondPagevalidateForm();
    notifyListeners();
  }

  void setSelectedDisablity(String disability) {
    _selectedDisablity = disability;
    _secondPagevalidateForm();
    notifyListeners();
  }

  void _secondPagevalidateForm() {
    _isSecondFormValid = disabilityRage.isNotEmpty &&
         _selectedDisablity.isNotEmpty;
    notifyListeners();
  }


  // Page 3 Functions
  void validateSelectedSkills() {
    if (_selectedSkillList.isEmpty) {
      _isThirdPageButtonEnabled = false;

    } else {
      _isThirdPageButtonEnabled = true;
    }
    notifyListeners();
  }


  void toggleSkill(String skillId) {
    if (_selectedSkillList.contains(skillId)) {
      _selectedSkillList.remove(skillId);
    } else {
      _selectedSkillList.add(skillId);
    }
    validateSelectedSkills();
    notifyListeners();
  }

  Future<void> signUp() async{
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
  }


  Future<void> NextButtonClick() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
  }




}