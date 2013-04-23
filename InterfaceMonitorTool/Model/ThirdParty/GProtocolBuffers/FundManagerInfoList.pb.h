// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "FundManagerInfo.pb.h"
#import "Common.pb.h"

@class Common;
@class Common_Builder;
@class FundManagerInfo;
@class FundManagerInfoList;
@class FundManagerInfoList_Builder;
@class FundManagerInfo_Builder;

@interface FundManagerInfoListRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface FundManagerInfoList : PBGeneratedMessage {
@private
  BOOL hasNewestManagerInfoVer_:1;
  BOOL hasCommon_:1;
  NSString* newestManagerInfoVer;
  Common* common;
  NSMutableArray* mutableFundManagerInfoList;
}
- (BOOL) hasCommon;
- (BOOL) hasNewestManagerInfoVer;
@property (readonly, retain) Common* common;
@property (readonly, retain) NSString* newestManagerInfoVer;
- (NSArray*) fundManagerInfoList;
- (FundManagerInfo*) fundManagerInfoAtIndex:(int32_t) index;

+ (FundManagerInfoList*) defaultInstance;
- (FundManagerInfoList*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (FundManagerInfoList_Builder*) builder;
+ (FundManagerInfoList_Builder*) builder;
+ (FundManagerInfoList_Builder*) builderWithPrototype:(FundManagerInfoList*) prototype;

+ (FundManagerInfoList*) parseFromData:(NSData*) data;
+ (FundManagerInfoList*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundManagerInfoList*) parseFromInputStream:(NSInputStream*) input;
+ (FundManagerInfoList*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundManagerInfoList*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (FundManagerInfoList*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface FundManagerInfoList_Builder : PBGeneratedMessage_Builder {
@private
  FundManagerInfoList* result;
}

- (FundManagerInfoList*) defaultInstance;

- (FundManagerInfoList_Builder*) clear;
- (FundManagerInfoList_Builder*) clone;

- (FundManagerInfoList*) build;
- (FundManagerInfoList*) buildPartial;

- (FundManagerInfoList_Builder*) mergeFrom:(FundManagerInfoList*) other;
- (FundManagerInfoList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (FundManagerInfoList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCommon;
- (Common*) common;
- (FundManagerInfoList_Builder*) setCommon:(Common*) value;
- (FundManagerInfoList_Builder*) setCommonBuilder:(Common_Builder*) builderForValue;
- (FundManagerInfoList_Builder*) mergeCommon:(Common*) value;
- (FundManagerInfoList_Builder*) clearCommon;

- (BOOL) hasNewestManagerInfoVer;
- (NSString*) newestManagerInfoVer;
- (FundManagerInfoList_Builder*) setNewestManagerInfoVer:(NSString*) value;
- (FundManagerInfoList_Builder*) clearNewestManagerInfoVer;

- (NSArray*) fundManagerInfoList;
- (FundManagerInfo*) fundManagerInfoAtIndex:(int32_t) index;
- (FundManagerInfoList_Builder*) replaceFundManagerInfoAtIndex:(int32_t) index with:(FundManagerInfo*) value;
- (FundManagerInfoList_Builder*) addFundManagerInfo:(FundManagerInfo*) value;
- (FundManagerInfoList_Builder*) addAllFundManagerInfo:(NSArray*) values;
- (FundManagerInfoList_Builder*) clearFundManagerInfoList;
@end

