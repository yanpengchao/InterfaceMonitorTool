// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "Opinion.pb.h"
#import "FundInfo.pb.h"
#import "Common.pb.h"

@class Common;
@class Common_Builder;
@class CompanyInfo;
@class CompanyInfo_Builder;
@class FundInfo;
@class FundInfo_Builder;
@class Opinion;
@class Opinion_Builder;

@interface CompanyInfoRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface CompanyInfo : PBGeneratedMessage {
@private
  BOOL hasZczb_:1;
  BOOL hasJgmc_:1;
  BOOL hasZzxs_:1;
  BOOL hasClrq_:1;
  BOOL hasClnx_:1;
  BOOL hasGsyg_:1;
  BOOL hasCommon_:1;
  BOOL hasJjsl_:1;
  BOOL hasJlsl_:1;
  Float64 zczb;
  NSString* jgmc;
  NSString* zzxs;
  NSString* clrq;
  NSString* clnx;
  NSString* gsyg;
  Common* common;
  int32_t jjsl;
  int32_t jlsl;
  NSMutableArray* mutableFundInfoList;
  NSMutableArray* mutableOpinionList;
}
- (BOOL) hasCommon;
- (BOOL) hasJgmc;
- (BOOL) hasZzxs;
- (BOOL) hasZczb;
- (BOOL) hasClrq;
- (BOOL) hasClnx;
- (BOOL) hasJjsl;
- (BOOL) hasJlsl;
- (BOOL) hasGsyg;
@property (readonly, retain) Common* common;
@property (readonly, retain) NSString* jgmc;
@property (readonly, retain) NSString* zzxs;
@property (readonly) Float64 zczb;
@property (readonly, retain) NSString* clrq;
@property (readonly, retain) NSString* clnx;
@property (readonly) int32_t jjsl;
@property (readonly) int32_t jlsl;
@property (readonly, retain) NSString* gsyg;
- (NSArray*) fundInfoList;
- (FundInfo*) fundInfoAtIndex:(int32_t) index;
- (NSArray*) opinionList;
- (Opinion*) opinionAtIndex:(int32_t) index;

+ (CompanyInfo*) defaultInstance;
- (CompanyInfo*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (CompanyInfo_Builder*) builder;
+ (CompanyInfo_Builder*) builder;
+ (CompanyInfo_Builder*) builderWithPrototype:(CompanyInfo*) prototype;

+ (CompanyInfo*) parseFromData:(NSData*) data;
+ (CompanyInfo*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CompanyInfo*) parseFromInputStream:(NSInputStream*) input;
+ (CompanyInfo*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CompanyInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (CompanyInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface CompanyInfo_Builder : PBGeneratedMessage_Builder {
@private
  CompanyInfo* result;
}

- (CompanyInfo*) defaultInstance;

- (CompanyInfo_Builder*) clear;
- (CompanyInfo_Builder*) clone;

- (CompanyInfo*) build;
- (CompanyInfo*) buildPartial;

- (CompanyInfo_Builder*) mergeFrom:(CompanyInfo*) other;
- (CompanyInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (CompanyInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCommon;
- (Common*) common;
- (CompanyInfo_Builder*) setCommon:(Common*) value;
- (CompanyInfo_Builder*) setCommonBuilder:(Common_Builder*) builderForValue;
- (CompanyInfo_Builder*) mergeCommon:(Common*) value;
- (CompanyInfo_Builder*) clearCommon;

- (BOOL) hasJgmc;
- (NSString*) jgmc;
- (CompanyInfo_Builder*) setJgmc:(NSString*) value;
- (CompanyInfo_Builder*) clearJgmc;

- (BOOL) hasZzxs;
- (NSString*) zzxs;
- (CompanyInfo_Builder*) setZzxs:(NSString*) value;
- (CompanyInfo_Builder*) clearZzxs;

- (BOOL) hasZczb;
- (Float64) zczb;
- (CompanyInfo_Builder*) setZczb:(Float64) value;
- (CompanyInfo_Builder*) clearZczb;

- (BOOL) hasClrq;
- (NSString*) clrq;
- (CompanyInfo_Builder*) setClrq:(NSString*) value;
- (CompanyInfo_Builder*) clearClrq;

- (BOOL) hasClnx;
- (NSString*) clnx;
- (CompanyInfo_Builder*) setClnx:(NSString*) value;
- (CompanyInfo_Builder*) clearClnx;

- (BOOL) hasJjsl;
- (int32_t) jjsl;
- (CompanyInfo_Builder*) setJjsl:(int32_t) value;
- (CompanyInfo_Builder*) clearJjsl;

- (BOOL) hasJlsl;
- (int32_t) jlsl;
- (CompanyInfo_Builder*) setJlsl:(int32_t) value;
- (CompanyInfo_Builder*) clearJlsl;

- (BOOL) hasGsyg;
- (NSString*) gsyg;
- (CompanyInfo_Builder*) setGsyg:(NSString*) value;
- (CompanyInfo_Builder*) clearGsyg;

- (NSArray*) fundInfoList;
- (FundInfo*) fundInfoAtIndex:(int32_t) index;
- (CompanyInfo_Builder*) replaceFundInfoAtIndex:(int32_t) index with:(FundInfo*) value;
- (CompanyInfo_Builder*) addFundInfo:(FundInfo*) value;
- (CompanyInfo_Builder*) addAllFundInfo:(NSArray*) values;
- (CompanyInfo_Builder*) clearFundInfoList;

- (NSArray*) opinionList;
- (Opinion*) opinionAtIndex:(int32_t) index;
- (CompanyInfo_Builder*) replaceOpinionAtIndex:(int32_t) index with:(Opinion*) value;
- (CompanyInfo_Builder*) addOpinion:(Opinion*) value;
- (CompanyInfo_Builder*) addAllOpinion:(NSArray*) values;
- (CompanyInfo_Builder*) clearOpinionList;
@end
