/*
 发送切换rootcontroller的通知的key值 退出登录和登陆的时候用
 */
#define CHANGEROOTCONTROLLER        @"ChangeRootControoler"

/*
 登陆的时候设置这个key为1  退出登陆移除该key
 */
#define ISLOGIN_KEY         @"ISLOGIN"


// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)


// 2.获得RGB颜色
#define IWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define PHONE_UISCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width

#define PHONE_UISCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height

#define PHONE_UISCREEN_IPHONE4          PHONE_UISCREEN_HEIGHT==480.0f

#define PHONE_UISCREEN_IPHONE5          PHONE_UISCREEN_HEIGHT==568.0f

#define PHONE_UISCREEN_IPHONE6          PHONE_UISCREEN_HEIGHT==667.0f

#define PHONE_UISCREEN_IPHONE6PLUS      PHONE_UISCREEN_HEIGHT==736.0f

// 当前系统版本值
#define SYSTEM_VERSION_FLOAT            [[[UIDevice currentDevice] systemVersion] floatValue]

#define SYSTEM_VERSION_IOS6             6.0<=SYSTEM_VERSION_FLOAT

#define SYSTEM_VERSION_IOS7             7.0<=SYSTEM_VERSION_FLOAT

#define SYSTEM_VERSION_IOS8             8.0<=SYSTEM_VERSION_FLOAT


/*
 *   颜色
 */
#define COLOR_DEFAULTVIEW               [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1.0] //  通用背景颜色

#define COLOR_VAULE(rgb)                        [UIColor colorWithRed:rgb/255.0 green:rgb/255.0 blue:rgb/255.0 alpha:1.0]//颜色值

#define RGBA(r,g,b,a)                   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b)                      RGBA(r,g,b,1.0f)
//#define RRR(r)                          RGB(r,r,r,1.0f)
#define RRR(r)                          [UIColor colorWithRed:r/255.0 green:r/255.0 blue:r/255.0 alpha:1.0]
#define RED_COLOR                       [UIColor colorWithRed:171.0/255.0 green:19.0/255.0 blue:6.0/255.0 alpha:1.0]

#define LINE_COLOR                      [UIColor colorWithRed:192.0/255.0 green:192.0/255.0 blue:192.0/255.0 alpha:1.0]

#define NAV_COLOR                       [UIColor colorWithRed:0/255.0 green:195.0/255.0 blue:236.0/255.0 alpha:1.0]

//请求超时时间
#define REQUEST_TIME_OUT             15

//#define  MAINURL        @"http://192.168.1.120:8080/"

#define  MAINURL          @"http://www.unicrm.com.cn/wbs/"

#define  LogInURL         @"login"  //登录
#define  ChangePassWord   @"base/user/update-pwd"     // 修改密码
#define  CustomerListData @"customer/pageQuery?"      // 客户列表
#define  CUSTONERDEAILS   @"customer/pageQuery?"      // 客户明细
#define  CUSTOMERQUERY    @"customer/pageQuery?"      // 客户查询
#define  ADDCLUES         @"clue/salClue/save"        // 添加线索


#define  CONTRACTTYPE     @"customer/contactType/pageQuery"  // 联系方式
#define  VisitPlanList    @"myplan/mereceive/query?"         // 拜访计划列表
#define  VISITARCHIVE     @"myplan/mearranger/finish"        // 计划归档
#define  VISITDEAILS      @"myplan/schedule/get"             // 计划明细

#define  ADDVISITPLAN     @"myplan/schedule/save"            // 添加拜访计划

#define  CONTRACTDATA     @"customer/contactMan/pageQuery?"  // 联系人列表

#define  ADDCONTRACT      @"customer/contactMan/save"        // 添加联系人

#define  CONTRACTCHANGE   @"customer/contactMan/update"      // 联系人修改

#define  CONTRACTSEARCH   @"/customer/contactMan/pageQuery"  // 联系人搜索

#define  CONTRACTRESULT   @"customer/contactRecords/pageQueryRecords?" //联络结果

#define  QITACONTRACT     @"customer/contactRecords/pageQuery?"

#define  VISITCANCELYUANYIN  @"base/parameter/item/business/queryValid?type=YYLX_REASON_TYPE"



// 计划取消
#define  VISITCANCEL         @"myplan/mearranger/save"
// 计划提醒
#define  VISITPLANTIXING     @"myplan/mearranger/byTime"


// 线索列表
#define CLUESLIST           @"clue/salClue/pageQueryCustomer?"

// 线索明细
#define CLUESDEAILS         @"clue/salClue/get"

// 线索关闭
#define CLUESCLOSE         @"clue/salClueOpeLog/saveClose"


// 线索搜索
#define CLUESSEARCH       @"clue/salClue/pageQuery?"

// 线索拜访计划列表
#define CLUESVISITLIST     @"myplan/mereceive/query?"

// 客户里的添加线索
#define CUSTOMERADDCLUES   @"clue/salClue/save"




// ... 表示宏定义的可变参数
//(__VA_ARGS__)表示函数的可变参数

#ifdef DEBUG  //调试

#define NSLog(...)  NSLog(__VA_ARGS__)

#else //发布

#endif
