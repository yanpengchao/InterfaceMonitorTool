//
//  HBSimpleFunctionsDef.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef HowbuyFund_HBSimpleFunctionsDef_h
#define HowbuyFund_HBSimpleFunctionsDef_h

#define fHBReplaceNULL2Empty(str)           ((nil == (str)) ? @"" : (str))
#define fHBReplaceNULL2HoriLine(str)        ((nil == (str)) ? @"--" : (str))
#define fHBReplaceNSNull2HoriLine(str)      ([str isEqual:[NSNull null]] ? @"--" : (str))
#define fHBIfStringInvalid(str)             (str == nil || [str isEqual:[NSNull null]] || [str isEqualToString:@""])
#define fHBReplaceInvalidStr2HoriLine(str)  (fHBIfStringInvalid(str) ? @"--" : (str))
#define fHBReplaceNilOrNull2Empty(str)      ((str == nil || [str isEqual:[NSNull null]]) ? @"" : str)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed: ((float)((rgbValue & 0xFF0000) >> 16))/255.0 green: ((float)((rgbValue & 0xFF00) >> 8))/255.0 blue: ((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif
