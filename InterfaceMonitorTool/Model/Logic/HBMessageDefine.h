//
//  HBMessageDefine.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef HowbuyFund_HBMessageDefine_h
#define HowbuyFund_HBMessageDefine_h

typedef enum _EMessageID_
{
    eMessageIDUnknown = 0,
    eMessageIDStart,                        // 启动接口
    eMessageIDCheckAppUpdate,               // 检测App新版本
    
    eMessageIDCustomFundSynchronize = 50,   // 同步
    eMessageIDLogin,                        // 登陆
    eMessageIDRegisterCode,                 // 获取注册需要的验证码
    eMessageIDRegister,                     // 注册
    
    eMessageIDGetNewsByType = 100,          // 按类型获取新闻
    eMessageIDGetNewsByKey,                 // 按关键字获取新闻
    eMessageIDGetResearchByType,            // 按类型获取研报
    eMessageIDGetResearchByKey,             // 按关键字获取研报
    eMessageIDGetNewsAndResearchByKey,      // 按关键字获取新闻和研报
    
    eMessageIDGetFundContentLineChart = 150,// 获取基金业绩走势曲线图数据
    eMessageIDGetFundContentF10,            // 获取基金F10信息
    eMessageIDGetFundPerformance,           // 获取基金业绩表现数据
    
    eMessageIDShare2Friends = 200,          // 分享给好友
    eMessageIDFeedBack,                     // 反馈
    eMessageIDSendUserActions,              // 发送用户行为统计信息
    eMessageIDSendNotifyToken,              // 发送本机接受苹果通知的令牌
    eMessageIDUploadContact,                // 上传用户联系人
    
    eMessageIDUpdateManagerInfo = 250,      // 更新基金经理
    eMessageIDUpdateCompanyInfo,            // 更新基金公司
    eMessageIDUpdateFundsBasicInfo,         // 更新基金基本信息
    
    eMessageIDGetOpenFundNetValue = 300,    // 按类型获取基金净值
    eMessageIDGetCloseFundNetValue,         // 按类型获取基金净值
    eMessageIDGetPrivateFundNetValue,       // 按类型获取基金净值
    eMessageIDGetMoneyFundNetValue,         // 按类型获取基金净值
    eMessageIDGetFundNetValueByIDs,         // 根据ID获取基金净值
    eMessageIDGetFixedInvestOderByPage,     // 分页获取定投排行数据
    
    eMessageIDUpOrDown = 350,               // 顶和踩
    eMessageIDGetUpOrDownCount,             // 获取顶和踩的次数
    eMessageIDSendComment,                  // 发送评论
    eMessageIDGetCommentByPage,             // 分页获取评论
    eMessageIDGetCommentByTimestamp,        // 按时间戳获取评论
    
    eMessageIDGetTrustList = 400,           // 获取固定收益列表
    eMessageIDGetTrustContent,              // 获取固定收益内容
    eMessageIDAppointTrust,                 // 预约固定收益
    eMessageIDGetTrustByPage,               // 分页获取固定收益
    
    eMessageIDDingYue = 500,                // 订阅
    
    eMessageIDMax
}EMessageID;

#endif
