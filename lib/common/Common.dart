
import 'package:foxschool/common/FoxschoolLocalization.dart';

import '../di/Dependencies.dart';

class Common
{
  static const String PACKAGE_NAME = "com.littlefox.app.foxschool";
  static const String PATH_APP_ROOT = "/data/data/" + PACKAGE_NAME + "/files/";

  static const String BASE_URL  = "https://foxschool-api.littlefox.co.kr/";
  static const String BASE_API  = BASE_URL + "api/";

  static const String API_INIT                  = BASE_API + "app/version";
  static const String API_SCHOOL_LIST           = BASE_API + "users/school";
  static const String API_LOGIN                 = BASE_API + "auth/login";
  static const String API_ME                    = BASE_API + "auth/me";
  static const String API_MAIN                  = BASE_API + "app/main";
  static const String API_MY_INFO_UPDATE        = BASE_API + "users/myinfo/update";
  static const String API_PASSWORD_CHANGE       = BASE_API + "users/password/update";
  static const String API_PASSWORD_CHANGE_NEXT  = BASE_API + "users/password/next";
  static const String API_PASSWORD_CHANGE_KEEP  = BASE_API + "users/password/keep";
  static const String API_INQUIRE               = BASE_API + "forum/inquiry";
  static const String API_FOXSCHOOL_NEWS        = BASE_API + "forum/board/news";
  static const String API_FAQ                   = BASE_API + "forum/board/faq";
  static const String API_STUDENT_HOMEWORK      = BASE_API + "homeworks/student";
  static const String API_TEACHER_HOMEWORK      = BASE_API + "homeworks/teacher";

  static const String API_STUDENT_HOMEWORK_DETAIL_LIST  = API_STUDENT_HOMEWORK + "/list";
  static const String API_TEACHER_CLASS_LIST            = API_TEACHER_HOMEWORK + "/class";
  static const String API_HOMEWORK_STATUS_DATA          = API_TEACHER_HOMEWORK + "/state";
  static const String API_TEACHER_HOMEWORK_DETAIL_LIST  = API_TEACHER_HOMEWORK + "/list";
  static const String API_TEACHER_HOMEWORK_CONTENTS     = API_TEACHER_HOMEWORK + "/show";

  static const String API_CONTENTS            = BASE_API + "contents/";
  static const String API_STORY_DETAIL_LIST   = API_CONTENTS + "story/series/";
  static const String API_SONG_DETAIL_LIST    = API_CONTENTS + "song/series/";
  static const String API_INTRODUCE_SERIES    = API_STORY_DETAIL_LIST + "info/";

  static const String API_QUIZ                = API_CONTENTS + "quiz/";
  static const String API_AUTH_CONTENT_PLAY   = API_CONTENTS + "player/";
  static const String API_STUDY_LOG_SAVE      = API_CONTENTS + "player/save";
  static const String API_QUIZ_SAVE_RECORD    = API_CONTENTS + "quiz/";
  static const String API_VOCABULARY_CONTENTS = API_CONTENTS + "vocabularies";
  static const String API_SEARCH_LIST         = API_CONTENTS + "search";
  static const String API_BOOKSHELF           = API_CONTENTS + "bookshelves";
  static const String API_VOCABULARY_SHELF    = API_CONTENTS + "vocabularies";
  static const String API_RECORD_UPLOAD       = API_CONTENTS + "record";
  static const String API_RECORD_HISTORY      = API_CONTENTS + "record/history";
  static const String API_FLASHCARD_SAVE      = API_CONTENTS + "flashcard";

  static const String BASE_WEBVIEW_URL    = BASE_URL + "web/";
  static const String URL_LEARNING_LOG    = BASE_WEBVIEW_URL + "studylog/history";
  static const String URL_FAQS            = BASE_WEBVIEW_URL + "help/faq/list";
  static const String URL_1_ON_1_ASK      = BASE_WEBVIEW_URL + "help/qna/list";
  static const String URL_GAME_STARWORDS  = BASE_WEBVIEW_URL + "game/starwords/";
  static const String URL_GAME_CROSSWORD  = BASE_WEBVIEW_URL + "game/crossword/";
  static const String URL_EBOOK           = BASE_WEBVIEW_URL + "ebook/";

  static const String URL_FOXSCHOOL_NEWS_DETAIL = BASE_WEBVIEW_URL + "forum/board/news/";
  static const String URL_FAQ_DETAIL            = BASE_WEBVIEW_URL + "forum/board/faq/";
  static const String URL_TERMS                 = BASE_WEBVIEW_URL + "forum/usernote";
  static const String URL_PRIVACY               = BASE_WEBVIEW_URL + "forum/privacy";
  static const String URL_ORIGIN_TRANSLATE      = BASE_WEBVIEW_URL + "contents/originaltranslate/";
  static const String URL_FIND_ID               = BASE_WEBVIEW_URL + "auth/find/id";
  static const String URL_FIND_PW               = BASE_WEBVIEW_URL + "auth/find/password";
  static const String URL_FOXSCHOOL_INTRODUCE   = "https://foxschool.littlefox.co.kr/home/app";

  static const String PARAMS_DISPLAY_METRICS = "display_metrics";
  static const String PARAMS_REGISTER_APP_VERSION = "app_version";
  static const String PARAMS_VERSION_INFORMATION = "version_information";
  static const String PARAMS_USER_LOGIN = "user_login";
  static const String PARAMS_FILE_MAIN_INFO = "file_main_info";
  static const String PARAMS_ACCESS_TOKEN = "access_token";
  static const String PARAMS_USER_API_INFORMATION = "user_api_information";
  static const String PARAMS_IS_AUTO_LOGIN_DATA = "is_auto_login_data";
  static const String PARAMS_IS_DISPOSABLE_LOGIN = "is_disposable_login";
  static const String PARAMS_IS_VIDEO_HIGH_RESOLUTION = "is_video_high_resolution";
  static const String PARAMS_PLAYER_SPEED_INDEX = "player_speed_index";
  static const String PARAMS_IS_ENABLE_CAPTION = "is_enable_caption";
  static const String PARAMS_IS_ENABLE_PAGE_BY_PAGE = "is_enable_page_by_page";
  static const String PARAMS_VOCABULARY_INTERVAL = "vocabulary_interval";
  static const String PARAMS_APP_EXECUTE_DATE = "app_execute_date";
  static const String PARAMS_IAC_CONTROLLER_INFORMATION = "iac_controller_information";
  static const String PARAMS_IS_FORCE_PROGRESSIVE_PLAY = "is_force_progressive_play";
  static const String PARAMS_FIREBASE_PUSH_TOKEN = "firebase_access_token";
  static const String PARAMS_IS_PUSH_SEND = "is_push_send";
  static const String PARAMS_IS_TEACHER_MODE = "is_teacher_mode";
  static const String PARAMS_CHECK_TABLET = "check_tablet";
  static const String PARAMS_CHECK_PHONE_DEVICE_RADIO = "check_phone_device_radio";
  static const String PARAMS_CHECK_TABLET_DEVICE_RADIO = "check_tablet_device_radio";
  static const String PARAMS_SECURE_ANDROID_ID = "secure_android_id";

  static const String INTENT_IS_LOGIN_FROM_MAIN = "init_intro_login";
  static const String INTENT_PLAYER_DATA_PARAMS = "player_data_params";
  static const String INTENT_PLAYER_INTRODUCE_VIDEO_PARAMS = "introduce_video";
  static const String INTENT_VOCABULARY_DATA = "vocabulary_data";
  static const String INTENT_MODIFY_BOOKSHELF_NAME = "modify_bookshelf_name";
  static const String INTENT_MODIFY_VOCABULARY_NAME = "vocabulary_name";
  static const String INTENT_RESULT_SERIES_ID = "series_id";
  static const String INTENT_STORY_SERIES_DATA = "story_series_data";
  static const String INTENT_STORY_CATEGORY_DATA = "story_category_data";
  static const String INTENT_SERIES_INFORMATION_ID = "series_information_id";
  static const String INTENT_QUIZ_PARAMS = "quiz_params";
  static const String INTENT_GAME_STARWORDS_ID = "starwords_id";
  static const String INTENT_GAME_CROSSWORD_ID = "crossword_id";
  static const String INTENT_FLASHCARD_DATA = "flashcard_data";
  static const String INTENT_RECORD_PLAYER_DATA = "record_player_data";
  static const String INTENT_ORIGIN_TRANSLATE_ID = "origin_translate";
  static const String INTENT_FIND_INFORMATION = "find_information";
  static const String INTENT_HOMEWORK_CHECKING_DATA = "homework_checking_data";
  static const String INTENT_BOOKSHELF_DATA = "bookshelf_data";
  static const String INTENT_MANAGEMENT_MYBOOKS_DATA = "management_mybooks_type";
  static const String INTENT_EBOOK_DATA = "ebook_data";

  static const String LOG_FILE = "littlefox_foxschool.txt";

  // View name of the header image. Used for activity scene transitions
  static const String STORY_DETAIL_LIST_HEADER_IMAGE = "story_content_list_header_image";
  static const String CATEGORY_DETAIL_LIST_HEADER_IMAGE = "category_content_list_header_image";

  static const String CONTENT_TYPE_ALL = "";
  static const String CONTENT_TYPE_STORY = "S";
  static const String CONTENT_TYPE_SONG = "M";

  static const String HTTP_HEADER_ANDROID = "Android";
  static const String HTTP_HEADER_APP_NAME = "LF_APP_AOS";
  static const String DEVICE_TYPE_PHONE = "phone";
  static const String DEVICE_TYPE_TABLET = "tablet";

  static const String SERVICE_NOT_SUPPORTED = "N";
  static const String SERVICE_SUPPORTED_PAID = "Y";
  static const String SERVICE_SUPPORTED_FREE = "F";

  static const String SERVICE_NOT_ENDED = "N";
  static const String SERVICE_ENDED = "Y";

  static const String USER_TYPE_STUDENT = "S";
  static const String USER_TYPE_TEACHER = "T";

  static const int MILLI_SECOND = 100;
  static const int HALF_SECOND = 500;
  static const int SECOND = 1000;
  static const double MINIMUM_TABLET_DISPLAY_RADIO = 1.4;
  static const double PHONE_DISPLAY_RADIO_20_9 = 1.9;
  static const double PHONE_DISPLAY_RADIO_FLIP = 2.2;

  static const double TARGET_PHONE_DISPLAY_WIDTH = 1080.0;
  static const double TARGET_TABLET_DISPLAY_WIDTH = 1920.0;

  static const int LOADING_DIALOG_SIZE = 150;

  static const int DURATION_SHORTEST = 100;
  static const int DURATION_SHORTER = 150;
  static const int DURATION_SHORT = 350;
  static const int DURATION_MENU_ANIMATION_PHONE = 350;
  static const int DURATION_NORMAL = 500;
  static const int DURATION_CHANGE_USER = 600;
  static const int DURATION_SHORT_LONG = 700;
  static const int DURATION_LONG = 1000;
  static const int DURATION_LONGER = 1500;
  static const int DURATION_LONGEST = 2000;
  static const int DURATION_EASTER_EGG = 5000;

  /**
   * 한 화면에 페이지 표시 개수
   */
  static const int MAX_PAGE_BY_PAGE_COUNT_IN_LINE = 5;

  static const int MAX_RECENTLY_LEARN_CONTENTS = 10;
  static const int MAX_BOOKSHELF_SIZE = 10;
  static const int MAX_BOOKSHELF_CONTENTS_SIZE = 300;
  static const int MAX_VOCABULARY_SIZE = 10;
  static const int MAX_VOCABULARY_CONTENTS_SIZE = 300;

  static const int PAGE_STORY = 0;
  static const int PAGE_SONG = 1;
  static const int PAGE_MY_BOOKS = 2;

  /**
   * 나의 정보 화면 페이지 ( 나의 정보 0 / 나의 정보 수정 1 / 비밀번호 변경 2 )
   */
  static const int PAGE_MY_INFO = 0;
  static const int PAGE_MY_INFO_CHANGE = 1;
  static const int PAGE_PASSWORD_CHANGE = 2;

  /**
   * 포럼 페이지 (리스트 0 / 상세화면 1)
   */
  static const int PAGE_FORUM_LIST = 0;
  static const int PAGE_FORUM_WEBVIEW = 1;

  /**
   * 숙제관리 화면 페이지
   *  - 공통 : 달력 0, 숙제 현황 1, 코멘트(학습자/선생님 한마디) 3
   *  - 선생님 : 숙제현황상세보기/숙제 내용 2
   */
  static const int PAGE_HOMEWORK_CALENDAR = 0;
  static const int PAGE_HOMEWORK_STATUS = 1;
  static const int PAGE_HOMEWORK_DETAIL = 2;
  static const int PAGE_HOMEWORK_COMMENT = 3;

  static const String BRIDGE_NAME = "littlefoxJavaInterface";

  static const String IAC_AWAKE_CODE_ALWAYS_VISIBLE = "C";
  static const String IAC_AWAKE_CODE_ONCE_VISIBLE = "E";
  static const String IAC_AWAKE_CODE_SPECIAL_DATE_VISIBLE = "F";

  static const int RESULT_CODE_SERIES_LIST = 10002;

  /** 개발자 이메일  */
  static const String DEVELOPER_EMAIL = "foxschool@littlefox.co.kr";

  static const String INAPP_CAMPAIGN_MODE_NEWS = "N";
  static const String INAPP_CAMPAIGN_MODE_TESTIMONIAL = "T";

  static const String PLAYER_TYPE_NORMAL = "normal";
  static const String PLAYER_TYPE_PROGRESSIVE = "progressive";

  static const int MAXIMUM_LOG_FILE_SIZE = 1024 * 1024 * 10;

  /** 퀴즈 종류별 코드 */
  static const String QUIZ_CODE_PICTURE = "N";
  static const String QUIZ_CODE_TEXT = "T";
  static const String QUIZ_CODE_PHONICS_SOUND_TEXT = "S";
  static const String QUIZ_CODE_SOUND_TEXT = "E";

  static const String PUSH_TOPIC_NAME = "FOXSCHOOL";

  static const String FILE_TEACHER_MANUAL = "teacher_manual.pdf";
  static const String FILE_HOME_NEWSPAPER = "school_letter.hwp";

  //API
  static const int FAIL_CODE_NETWORK_NOT_CONNECT = 105;
  static const int FAIL_CODE_USER_AUTHORIZATION_NO_TAKEN = 401;
  static const int FAIL_CODE_USER_AUTHORIZATION_INVALID_TOKEN = 4011;
  static const int FAIL_CODE_USER_PAID_CHANGE = 450;
  static const int FAIL_CODE_USER_EXPIRE_USER = 451;
  static const int FAIL_CODE_USER_DUPLICATE_LOGIN = 452;
  static const int FAIL_CODE_INTERNAL_SERVER_ERROR = 500;
  static const int SUCCESS_CODE_OK = 200;

  static const int PAGE_LOAD_COUNT = 20;

  static const String TEST_USER_AGENT = "LF_APP_AOS:phone/1.0.0/SM-S911N/Android:14";

  static final List<String> VOCABULARY_INTERVAL_TEXT = [
    '간격 없음',
    '1초 간격',

  ];

}