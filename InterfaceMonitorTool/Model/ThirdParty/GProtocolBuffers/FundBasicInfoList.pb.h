// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

//#import "FundBasic.pb.h"
#import "FundBasic2.pb.h"
#import "Common.pb.h"

@class Common;
@class Common_Builder;
@class FundBasic;
@class FundBasicInfoList;
@class FundBasicInfoList_Builder;
@class FundBasic_Builder;

@interface FundBasicInfoListRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface FundBasicInfoList : PBGeneratedMessage {
@private
  BOOL hasNewestFundInfoVer_:1;
  BOOL hasCommon_:1;
  NSString* newestFundInfoVer;
  Common* common;
  NSMutableArray* mutableFundBasicList;
}
- (BOOL) hasCommon;
- (BOOL) hasNewestFundInfoVer;
@property (readonly, retain) Common* common;
@property (readonly, retain) NSString* newestFundInfoVer;
- (NSArray*) fundBasicList;
- (FundBasic*) fundBasicAtIndex:(int32_t) index;

+ (FundBasicInfoList*) defaultInstance;
- (FundBasicInfoList*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (FundBasicInfoList_Builder*) builder;
+ (FundBasicInfoList_Builder*) builder;
+ (FundBasicInfoList_Builder*) builderWithPrototype:(FundBasicInfoList*) prototype;

+ (FundBasicInfoList*) parseFromData:(NSData*) data;
+ (FundBasicInfoList*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundBasicInfoList*) parseFromInputStream:(NSInputStream*) input;
+ (FundBasicInfoList*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundBasicInfoList*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (FundBasicInfoList*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface FundBasicInfoList_Builder : PBGeneratedMessage_Builder {
@private
  FundBasicInfoList* result;
}

- (FundBasicInfoList*) defaultInstance;

- (FundBasicInfoList_Builder*) clear;
- (FundBasicInfoList_Builder*) clone;

- (FundBasicInfoList*) build;
- (FundBasicInfoList*) buildPartial;

- (FundBasicInfoList_Builder*) mergeFrom:(FundBasicInfoList*) other;
- (FundBasicInfoList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (FundBasicInfoList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCommon;
- (Common*) common;
- (FundBasicInfoList_Builder*) setCommon:(Common*) value;
- (FundBasicInfoList_Builder*) setCommonBuilder:(Common_Builder*) builderForValue;
- (FundBasicInfoList_Builder*) mergeCommon:(Common*) value;
- (FundBasicInfoList_Builder*) clearCommon;

- (BOOL) hasNewestFundInfoVer;
- (NSString*) newestFundInfoVer;
- (FundBasicInfoList_Builder*) setNewestFundInfoVer:(NSString*) value;
- (FundBasicInfoList_Builder*) clearNewestFundInfoVer;

- (NSArray*) fundBasicList;
- (FundBasic*) fundBasicAtIndex:(int32_t) index;
- (FundBasicInfoList_Builder*) replaceFundBasicAtIndex:(int32_t) index with:(FundBasic*) value;
- (FundBasicInfoList_Builder*) addFundBasic:(FundBasic*) value;
- (FundBasicInfoList_Builder*) addAllFundBasic:(NSArray*) values;
- (FundBasicInfoList_Builder*) clearFundBasicList;
@end

