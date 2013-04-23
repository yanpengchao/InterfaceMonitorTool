// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "TrustInfo.pb.h"
#import "Common.pb.h"

@class Common;
@class Common_Builder;
@class TrustInfo;
@class TrustInfoPageList;
@class TrustInfoPageList_Builder;
@class TrustInfo_Builder;

@interface TrustInfoPageListRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface TrustInfoPageList : PBGeneratedMessage {
@private
  BOOL hasCommon_:1;
  BOOL hasTotalNum_:1;
  Common* common;
  int32_t totalNum;
  NSMutableArray* mutableTrustInfoList;
}
- (BOOL) hasCommon;
- (BOOL) hasTotalNum;
@property (readonly, retain) Common* common;
@property (readonly) int32_t totalNum;
- (NSArray*) trustInfoList;
- (TrustInfo*) trustInfoAtIndex:(int32_t) index;

+ (TrustInfoPageList*) defaultInstance;
- (TrustInfoPageList*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (TrustInfoPageList_Builder*) builder;
+ (TrustInfoPageList_Builder*) builder;
+ (TrustInfoPageList_Builder*) builderWithPrototype:(TrustInfoPageList*) prototype;

+ (TrustInfoPageList*) parseFromData:(NSData*) data;
+ (TrustInfoPageList*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TrustInfoPageList*) parseFromInputStream:(NSInputStream*) input;
+ (TrustInfoPageList*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (TrustInfoPageList*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (TrustInfoPageList*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface TrustInfoPageList_Builder : PBGeneratedMessage_Builder {
@private
  TrustInfoPageList* result;
}

- (TrustInfoPageList*) defaultInstance;

- (TrustInfoPageList_Builder*) clear;
- (TrustInfoPageList_Builder*) clone;

- (TrustInfoPageList*) build;
- (TrustInfoPageList*) buildPartial;

- (TrustInfoPageList_Builder*) mergeFrom:(TrustInfoPageList*) other;
- (TrustInfoPageList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (TrustInfoPageList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCommon;
- (Common*) common;
- (TrustInfoPageList_Builder*) setCommon:(Common*) value;
- (TrustInfoPageList_Builder*) setCommonBuilder:(Common_Builder*) builderForValue;
- (TrustInfoPageList_Builder*) mergeCommon:(Common*) value;
- (TrustInfoPageList_Builder*) clearCommon;

- (BOOL) hasTotalNum;
- (int32_t) totalNum;
- (TrustInfoPageList_Builder*) setTotalNum:(int32_t) value;
- (TrustInfoPageList_Builder*) clearTotalNum;

- (NSArray*) trustInfoList;
- (TrustInfo*) trustInfoAtIndex:(int32_t) index;
- (TrustInfoPageList_Builder*) replaceTrustInfoAtIndex:(int32_t) index with:(TrustInfo*) value;
- (TrustInfoPageList_Builder*) addTrustInfo:(TrustInfo*) value;
- (TrustInfoPageList_Builder*) addAllTrustInfo:(NSArray*) values;
- (TrustInfoPageList_Builder*) clearTrustInfoList;
@end

