//
//  HBDefine.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-24.
//
//

#ifndef HowbuyFund_HBDefine_h
#define HowbuyFund_HBDefine_h

#pragma mark - network parameter
#ifdef  DEBUG
#define KHBNetworkRetryCount            0
#define KHBNetworkTimeOut               60
#else
#define KHBNetworkRetryCount            1
#define KHBNetworkTimeOut               15
#endif

#pragma mark - notify key define
//#define KDataBaseQueryFinishedNotifyKey     @"KDataBaseQueryFinishedNotifyKey"
#define KFundsNetValueUpdatedNotifyKey      @"KFundsNetValueUpdatedNotifyKey"
#define KAppNeedUpdateNotifyKey             @"KAppNeedUpdateNotifyKey"
#define KCustomFundsCodeUpdatedNotifyKey    @"KCustomFundsCodeUpdatedNotifyKey"

#pragma mark - fund infos key define
#define KFundInfoCodeKey                @"jjdm"     //基金代码
#define KFundInfoTypeKey                @"jjfl"     //基金分类
#define KFundInfoType2Key               @"jjfl2"    //基金子分类
#define KFundInfoJJPYKey                @"jjpy"     //基金简称拼音
#define KFundInfoFundNameKey            @"jjjc"     //基金简称
#define KFundInfoFundValueKey           @"jjjz"     //基金净值
#define KFundInfoFundSumValueKey        @"ljjz"     //累计净值
#define KFundInfoJJDWKey                @"jzdw"     //净值单位
#define KFundInfoFundPriceKey           @"jjjg"     //基金价格
#define KFundInfoFundStateKey           @"jyzt"     //基金状态
#define KFundInfoCLRQKey                @"clrq"     //成立日期
#define KFundInfoWFSYKey                @"wfsy"     //万份收益
#define KFundInfoQRSYKey                @"qrsy"     //七日收益
#define KFundInfoZYJLKey                @"zyjl"     //折溢价率
#define KFundInfoCXZZKey                @"cxzz"     //存续终止日
#define KFundInfoDateKey                @"jzrq"     //净值日期
#define KFundInfoHBDRKey                @"hbdr"     //日增幅
#define KFundInfoHB1YKey                @"hb1Y"     //月增幅
#define KFundInfoHB3YKey                @"hb3Y"     //季涨幅
#define KFundInfoHB6YKey                @"hb6Y"     //半年涨幅
#define KFundInfoHB1NKey                @"hb1N"     //年涨幅
#define KFundInfoHBJNKey                @"hbjn"     //今年以来
#define KFundInfoZFXZKey                @"zfxz"     //风险评估
#define KFundInfoDTHB1NKey              @"dthb1n"   //定投1年回报
#define KFundInfoDTHB2NKey              @"dthb2n"   //定投2年回报
#define KFundInfoDTHB3NKey              @"dthb3n"   //定投3年回报
#define KFundInfoDTHB4NKey              @"dthb4n"   //定投4年回报
#define KFundInfoDTHB5NKey              @"dthb5n"   //定投5年回报
#define KFundInfoSGBZKey                @"sgbz"     //申购状态
#define KFundInfoSHBZKey                @"shbz"     //赎回状态
#define KFundInfoDTBZKey                @"dtbz"     //定投状态
#define KFundInfoRYDMKey                @"rydm"     //经理代码
#define KFundInfoXMPYKey                @"xmpy"     //经理姓名拼音
#define KFundInfoRYXMKey                @"ryxm"     //经理姓名
#define KFundInfoJGDMKey                @"jgdm"     //公司代码
#define KFundInfoJGPYKey                @"jgpy"     //公司拼音
#define KFundInfoJGJCKey                @"jgjc"     //公司简称
#define KFundInfoGMTypeKey              @"type"     //公司or经理分类
#define KFundInfoStatusKey              @"status"   //基本状态
#define KFundInfoSubTypeKey             @"jjfl2"    //基金二级分类

#pragma mark - fund type

#pragma mark - network keys
#pragma mark - start keys
#define KNWK_ResponseCode               @"responseCode"         // 操作结果
#define KNWK_ResponseContent            @"responseContent"      // 操作失败详情
#define KNWK_VersionNeedUpdate          @"versionNeedUpdate"    // 软件是否有新版本
#define KNWK_UpdateDescription          @"updateDesc"           // 软件更新说明文字
#define KNWK_UpdateUrl                  @"updateUrl"            // 软件更新包的地址
#define KNWK_KFSNeedUpdate              @"kfsNeedUpdate"        // 开放式更新标志
#define KNWK_FBSNeedUpdate              @"fbsNeedUpdate"        // 封闭式更新标志
#define KNWK_HBSNeedUpdate              @"hbsNeedUpdate"        // 货币式更新标志
#define KNWK_SMNeedUpdate               @"smNeedUpdate"         // 私募更新标志
#define KNWK_ServerTime                 @"serverTime"           // 服务器时间戳
#define KNWK_NewsTypeNeedUpdate         @"newsTypeNeedUpdate"   // 新闻类型是否需要更新标志
#define KNWK_PhoneNewsTypeList          @"phoneNewsTypeList"    // 新闻类型列表
#define KNWK_OpinionTypeNeedUpdate      @"opinionTypeNeedUpdate"// 研报类型是否需要更新标志
#define KNWK_PhoneOpinionTypeList       @"phoneOpinionTypeList" // 研报类型列表
#define KNWK_BasicInfoNeedUpdate        @"basicInfoNeedUpdate"  // 基金基本信息更新标志
#define KNWK_ManagerNeedUpdate          @"managerNeedUpdate"    // 基金经理更新标志
#define KNWK_CompanyNeedUpdate          @"companyNeedUpdate"    // 基金公司更新标志

#pragma mark - netvalue keys
#define KNWK_DataVersion                @"dateVersion"          // 数据的版本

#pragma mark - funds info keys
#define KNWK_NewestFundInfoVer          @"newestFundInfoVer"    // 基金基本信息最新版本号
#define KNWK_FundBasicList              @"fundBasicList"        // 基金基本信息列表

#pragma mark - manager info keys
#define KNWK_NewestManagerInfoVer       @"newestManagerInfoVer" // 基金经理信息最新版本号
#define KNWK_FundManagerInfoList        @"fundManagerInfoList"  // 基金经理信息列表

#pragma mark - company info keys
#define KNWK_NewestCompanyInfoVer       @"newestCompanyInfoVer" // 基金公司信息最新版本号
#define KNWK_FundCompanyInfoList        @"fundCompanyInfoList"  // 基金公司信息列表

#pragma mark - news and research keys
#define KNWK_TotalNum                   @"totalNum"             // 条目总数
#define KNWK_CurrentPage                @"currentPage"          // 当前页数
#define KNWK_NewsList                   @"newsList"             // 新闻列表
#define KNWK_OpinionList                @"opinionList"          // 研报列表

#pragma mark - custom funds
#define KNWK_UserFavoritesListKey       @"userFavoritesList"    // 自选基金列表

#pragma mark - simple functions
#define dimof(_a)                       (sizeof(_a)/sizeof(_a[0]))
#define KHBScreenWidth                  [[UIScreen mainScreen] bounds].size.width
#define KHBScreenHeight                 [[UIScreen mainScreen] bounds].size.height
#define KHBNavigatorHeight              26.0
#define KHBSectionHeaderHeight          26.0
#define KHBNaviItemHeight               38.0
#define KHBStatusHeight                 20.0

#define KHBZhFontName                   @"Helvetica"
#define KHBZhBoldFontName               @"Helvetica-Bold"
#define KHBAlphaFontName                @"Helvetica"
#define KHBAlphaBoldFontName            @"Helvetica-Bold"

#define KHBItemsEachPage                20
#define KHBAppFrame                     CGRectMake(0, 0, KHBScreenWidth, KHBScreenHeight - KHBStatusHeight)

#pragma mark - funds type

typedef enum _EFundType_ {
    eFundTypeOpen         = 0x0000, //开放式 0
    eFundTypeOpenStock    = 0x0001, //股票型 1
    eFundTypeOpenBonds    = 0x0002, //债券型 2
    eFundTypeOpenMixture  = 0x0004, //混合型 4
    eFundTypeOpenStruct   = 0x0008, //结构型 8
    eFundTypeOpenQdii     = 0x0010, //QDII  16
    eFundTypeOpenExponent = 0x0011, //指数型 17
    eFundTypeClose        = 0x0100, //封闭式 256
    eFundTypeMoney        = 0x0200, //货币型 512
    eFundTypePrivate      = 0x0400, //私募   1024
    EFundTypeUnknown      = 0xEFFF  //未知类型
}EFundType;

#pragma mark - Regexs
#define KHBSpaceRegex                   @"^[ ]$"
#define kHBUserNameRegex                @"^[A-Za-z0-9_]{3,18}(@([a-zA-Z0-9_-])+(\\.[a-zA-Z0-9_-]+)){0,1}$"
#define kHBPasswordRegex                @".{6,12}"
#define kHBPhoneNumberRegex             @"^(\\+86|[0]{0,2}86){0,1}(13[0-9]|15[0-9]|18[0-9]|14[0-9])[0-9]{8}$"
#define kHBPhoneNumberRegex2            @"^(\\+|\\+8|\\+86|0{1,2}|0{0,2}8|[0]{0,2}86){0,1}(1|1[3458]|(1[3458][0-9]{0,9})){0,1}$"
#define KHBPhoneNumberRegex3            @"^[0-9\\+]{7,15}$"

#pragma net work define
#ifdef  DEBUG
#define kHBNetworkRetryCount            0
#define kHBNetworkTimeOut               60
#else
#define kHBNetworkRetryCount            1
#define kHBNetworkTimeOut               15
#endif

#endif
