// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "Opens.pb.h"
#import "Common.pb.h"

@class Common;
@class Common_Builder;
@class FundInfoOpens;
@class FundInfoOpens_Builder;
@class Opens;
@class Opens_Builder;

@interface FundInfoOpensRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface FundInfoOpens : PBGeneratedMessage {
@private
  BOOL hasServerTime_:1;
  BOOL hasDateVersion_:1;
  BOOL hasCommon_:1;
  int64_t serverTime;
  int64_t dateVersion;
  Common* common;
  NSMutableArray* mutableOpensList;
}
- (BOOL) hasCommon;
- (BOOL) hasServerTime;
- (BOOL) hasDateVersion;
@property (readonly, retain) Common* common;
@property (readonly) int64_t serverTime;
@property (readonly) int64_t dateVersion;
- (NSArray*) opensList;
- (Opens*) opensAtIndex:(int32_t) index;

+ (FundInfoOpens*) defaultInstance;
- (FundInfoOpens*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (FundInfoOpens_Builder*) builder;
+ (FundInfoOpens_Builder*) builder;
+ (FundInfoOpens_Builder*) builderWithPrototype:(FundInfoOpens*) prototype;

+ (FundInfoOpens*) parseFromData:(NSData*) data;
+ (FundInfoOpens*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundInfoOpens*) parseFromInputStream:(NSInputStream*) input;
+ (FundInfoOpens*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundInfoOpens*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (FundInfoOpens*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface FundInfoOpens_Builder : PBGeneratedMessage_Builder {
@private
  FundInfoOpens* result;
}

- (FundInfoOpens*) defaultInstance;

- (FundInfoOpens_Builder*) clear;
- (FundInfoOpens_Builder*) clone;

- (FundInfoOpens*) build;
- (FundInfoOpens*) buildPartial;

- (FundInfoOpens_Builder*) mergeFrom:(FundInfoOpens*) other;
- (FundInfoOpens_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (FundInfoOpens_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCommon;
- (Common*) common;
- (FundInfoOpens_Builder*) setCommon:(Common*) value;
- (FundInfoOpens_Builder*) setCommonBuilder:(Common_Builder*) builderForValue;
- (FundInfoOpens_Builder*) mergeCommon:(Common*) value;
- (FundInfoOpens_Builder*) clearCommon;

- (BOOL) hasServerTime;
- (int64_t) serverTime;
- (FundInfoOpens_Builder*) setServerTime:(int64_t) value;
- (FundInfoOpens_Builder*) clearServerTime;

- (NSArray*) opensList;
- (Opens*) opensAtIndex:(int32_t) index;
- (FundInfoOpens_Builder*) replaceOpensAtIndex:(int32_t) index with:(Opens*) value;
- (FundInfoOpens_Builder*) addOpens:(Opens*) value;
- (FundInfoOpens_Builder*) addAllOpens:(NSArray*) values;
- (FundInfoOpens_Builder*) clearOpensList;

- (BOOL) hasDateVersion;
- (int64_t) dateVersion;
- (FundInfoOpens_Builder*) setDateVersion:(int64_t) value;
- (FundInfoOpens_Builder*) clearDateVersion;
@end

