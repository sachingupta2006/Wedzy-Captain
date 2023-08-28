import 'package:get/get.dart';
import 'package:wedzy_captain/Routes/route_name.dart';
import 'package:wedzy_captain/Utils/Widgets/search.dart';
import 'package:wedzy_captain/View/Home/Duo/budgetpage.dart';
import 'package:wedzy_captain/View/Home/Duo/closedguest.dart';
import 'package:wedzy_captain/View/Home/Duo/duo_details.dart';
import 'package:wedzy_captain/View/Home/Duo/manage_duo.dart';
import 'package:wedzy_captain/View/Home/Duo/manageguest.dart';
import 'package:wedzy_captain/View/Home/Duo/managepayments.dart';
import 'package:wedzy_captain/View/Home/Duo/managevendors.dart';
import 'package:wedzy_captain/View/Home/Duo/mywallet.dart';
import 'package:wedzy_captain/View/Home/Duo/paymenthistory.dart';
import 'package:wedzy_captain/View/Home/Side%20Menu/Ideas/real_weddings.dart';
import 'package:wedzy_captain/View/Home/Side%20Menu/Ideas/stories_ideas.dart';
import 'package:wedzy_captain/View/Chat/chatbox.dart';
import 'package:wedzy_captain/View/Chat/chatgroupname.dart';
import 'package:wedzy_captain/View/Chat/chatgroupselectedmembers.dart';
import 'package:wedzy_captain/View/Chat/chatgroupselectmembers.dart';
import 'package:wedzy_captain/View/Chat/messages.dart';
import 'package:wedzy_captain/View/Home/Side%20Menu/contact_us.dart';
import 'package:wedzy_captain/View/Home/Side%20Menu/edit_profile.dart';
import 'package:wedzy_captain/View/Home/Side%20Menu/faqs.dart';
import 'package:wedzy_captain/View/Home/Side%20Menu/feedback.dart';
import 'package:wedzy_captain/View/Home/Side%20Menu/Ideas/ideas.dart';
import 'package:wedzy_captain/View/Home/Side%20Menu/notifications.dart';
import 'package:wedzy_captain/View/Home/Task/add_task.dart';
import 'package:wedzy_captain/View/Home/Task/completed_task.dart';
import 'package:wedzy_captain/View/Home/Task/ongoing_task.dart';
import 'package:wedzy_captain/View/Home/Task/upcoming_task.dart';
import 'package:wedzy_captain/View/Home/custom_bottombar.dart';
import 'package:wedzy_captain/View/Vendors/Anchor/anchorpage.dart';
import 'package:wedzy_captain/View/Vendors/Anchor/anchorpreview.dart';
import 'package:wedzy_captain/View/Vendors/Bartender/bartenderpage.dart';
import 'package:wedzy_captain/View/Vendors/Bartender/bartenderpreview.dart';
import 'package:wedzy_captain/View/Vendors/Cake/cakepage.dart';
import 'package:wedzy_captain/View/Vendors/Cake/cakepreview.dart';
import 'package:wedzy_captain/View/Vendors/Catering/cateringpage.dart';
import 'package:wedzy_captain/View/Vendors/Catering/cateringpreview.dart';
import 'package:wedzy_captain/View/Vendors/Choreography/choreopage.dart';
import 'package:wedzy_captain/View/Vendors/Choreography/choreopreview.dart';
import 'package:wedzy_captain/View/Vendors/Clothing/clothingpage.dart';
import 'package:wedzy_captain/View/Vendors/Clothing/clothingpreview.dart';
import 'package:wedzy_captain/View/Vendors/DJ/djpage.dart';
import 'package:wedzy_captain/View/Vendors/DJ/djpreview.dart';
import 'package:wedzy_captain/View/Vendors/Decoration/decorationpage.dart';
import 'package:wedzy_captain/View/Vendors/Decoration/decorationpreview.dart';
import 'package:wedzy_captain/View/Vendors/Jewellery/jewellerypage.dart';
import 'package:wedzy_captain/View/Vendors/Jewellery/jewellerypreview.dart';
import 'package:wedzy_captain/View/Vendors/Makeup/makeuppage.dart';
import 'package:wedzy_captain/View/Vendors/Makeup/makeuppreview.dart';
import 'package:wedzy_captain/View/Vendors/Mehendi/mehendipage.dart';
import 'package:wedzy_captain/View/Vendors/Mehendi/mehendipreview.dart';
import 'package:wedzy_captain/View/Vendors/Photography/photographypage.dart';
import 'package:wedzy_captain/View/Vendors/Photography/photographyreview.dart';
import 'package:wedzy_captain/View/Vendors/vendorsmain.dart';
import 'package:wedzy_captain/View/Vendors/Venue/venuepage.dart';
import 'package:wedzy_captain/View/Vendors/Venue/venuepreview.dart';
import '../View/Home/Side Menu/about_us.dart';
import '../View/Home/Side Menu/privacy.dart';
import '../View/Home/Side Menu/profile_screen.dart';
import '../View/Home/Side Menu/terms_conditions.dart';
import '../View/Onboarding/login_screen.dart';
import '../View/Onboarding/onboarding.dart';
import '../View/Onboarding/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RouteName.splashScreen, page: () => const SplashScreen()),
        GetPage(name: RouteName.onboarding, page: () => const Onboarding()),
        GetPage(name: RouteName.loginScreen, page: () => const LoginScreen()),
        GetPage(
            name: RouteName.customBottomBar,
            page: () => const CustomBottomBar()),
        // Common
        GetPage(name: RouteName.searchPage, page: () => const SearchPage()),
        // Side Menu
        GetPage(
            name: RouteName.profileScreen, page: () => const ProfileScreen()),
        GetPage(name: RouteName.editProfile, page: () => const EditProfile()),
        GetPage(
            name: RouteName.termsCondition, page: () => const TermsCondition()),
        GetPage(name: RouteName.privacy, page: () => const Privacy()),
        GetPage(name: RouteName.aboutUs, page: () => const AboutUs()),
        GetPage(name: RouteName.feedback, page: () => const Feedback()),
        GetPage(name: RouteName.contactUs, page: () => const ContactUs()),
        GetPage(name: RouteName.faqs, page: () => const Faqs()),
        GetPage(
            name: RouteName.notifications, page: () => const Notifications()),
        GetPage(name: RouteName.ideas, page: () => const Ideas()),
        GetPage(
            name: RouteName.chatgroupselectmembers,
            page: () => const Chatgroupmembersselect()),
        GetPage(
            name: RouteName.chatgroupselected,
            page: () => const Chatgroupselectedmembers()),
        GetPage(
            name: RouteName.chatgroupname, page: () => const Chatgroupname()),
        GetPage(name: RouteName.messages, page: () => const Messagepage()),

        GetPage(name: RouteName.storiesIdeas, page: () => const StoriesIdeas()),
        GetPage(name: RouteName.realWeddings, page: () => const RealWeddings()),

        // Bottom bar Tabs
        GetPage(name: RouteName.addTask, page: () => const AddTask()),
        GetPage(name: RouteName.ongoingTask, page: () => const OngoingTask()),
        GetPage(name: RouteName.upcomingTask, page: () => const UpcomingTask()),
        GetPage(
            name: RouteName.completedTask, page: () => const CompletedTask()),
        GetPage(name: RouteName.chatbox, page: () => const ChatBox()),

// vendors route
        GetPage(name: RouteName.vendorsmain, page: () => const Vendorsmain()),
        GetPage(name: RouteName.venuepage, page: () => const Venuepage()),
        GetPage(name: RouteName.venuepreview, page: () => const Venuepreview()),

        GetPage(
            name: RouteName.photographypage,
            page: () => const Photographypage()),
        GetPage(
            name: RouteName.photographypreview,
            page: () => const Photographypreview()),

        GetPage(name: RouteName.makeuppage, page: () => const MakeupPage()),
        GetPage(
            name: RouteName.makeuppreview, page: () => const Makeuppreview()),

        GetPage(
            name: RouteName.decorationpage, page: () => const DecorationPage()),
        GetPage(
            name: RouteName.decorpreview,
            page: () => const Decorationpreview()),

        GetPage(name: RouteName.mehendipage, page: () => const MehendiPage()),
        GetPage(
            name: RouteName.mehendipreview, page: () => const Mehendipreview()),

        GetPage(
            name: RouteName.bartenderpage, page: () => const Bartenderpage()),
        GetPage(
            name: RouteName.bartenderpreview,
            page: () => const Bartenderpreview()),

        GetPage(name: RouteName.cateringpage, page: () => const CateringPage()),
        GetPage(
            name: RouteName.cateringpreview,
            page: () => const Cateringpreview()),

        GetPage(name: RouteName.djpage, page: () => const DJpage()),
        GetPage(name: RouteName.djpreview, page: () => const DJpreview()),

        GetPage(name: RouteName.anchorpage, page: () => const AnchorPage()),
        GetPage(name: RouteName.anchorpreview, page: () => const AnchorPreview()),

        GetPage(name: RouteName.cakepage, page: () => const Cakepage()),
        GetPage(name: RouteName.cakepreview, page: () => const Cakepreview()),

        GetPage(name: RouteName.choreopage, page: () => const ChoreographyPage()),
        GetPage(name: RouteName.choreopreview, page: () => const Choreopreview()),

        GetPage(name: RouteName.jewellerypage, page: () => const JewelleryPage()),
        GetPage(name: RouteName.jewellerypreview, page: () => const Jewellerypreview()),

        GetPage(name: RouteName.clothingpage, page: () => const ClothingPage()),
        GetPage(name: RouteName.clothingpreview, page: () => const Clothingpreview()),

      // Duo
      GetPage(name: RouteName.manageDuo, page: () => const ManageDuo(),),
      GetPage(name: RouteName.duodetails, page: () => const Duodetails(),),
      GetPage(name: RouteName.budgetpage, page: () => const BudgetPage(),),
      GetPage(name: RouteName.mangepayments, page: () => const ManagePayments(),),
      GetPage(name: RouteName.paymenthistory, page: () => const PaymentHistory(),),
      GetPage(name: RouteName.mangevendors, page: () => const ManageVendors(),),
      GetPage(name: RouteName.manageguest, page: () => const ManageGuest(),),
      GetPage(name: RouteName.closedguest, page: () => const ClosedGuest(),),
      GetPage(name: RouteName.mywallet, page: () => const MyWallet(),),





      ];
}
