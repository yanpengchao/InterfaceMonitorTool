// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "Closes.pb.h"
#import "Common.pb.h"

@class Closes;
@class Closes_Builder;
@class Common;
@class Common_Builder;
@class FundInfoCloses;
@class FundInfoCloses_Builder;

@interface FundInfoClosesRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface FundInfoCloses : PBGeneratedMessage {
@private
  BOOL hasServerTime_:1;
  BOOL hasDateVersion_:1;
  BOOL hasCommon_:1;
  int64_t serverTime;
  int64_t dateVersion;
  Common* common;
  NSMutableArray* mutableClosesList;
}
- (BOOL) hasCommon;
- (BOOL) hasServerTime;
- (BOOL) hasDateVersion;
@property (readonly, retain) Common* common;
@property (readonly) int64_t serverTime;
@property (readonly) int64_t dateVersion;
- (NSArray*) closesList;
- (Closes*) closesAtIndex:(int32_t) index;

+ (FundInfoCloses*) defaultInstance;
- (FundInfoCloses*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (FundInfoCloses_Builder*) builder;
+ (FundInfoCloses_Builder*) builder;
+ (FundInfoCloses_Builder*) builderWithPrototype:(FundInfoCloses*) prototype;

+ (FundInfoCloses*) parseFromData:(NSData*) data;
+ (FundInfoCloses*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundInfoCloses*) parseFromInputStream:(NSInputStream*) input;
+ (FundInfoCloses*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundInfoCloses*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (FundInfoCloses*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface FundInfoCloses_Builder : PBGeneratedMessage_Builder {
@private
  FundInfoCloses* result;
}

- (FundInfoCloses*) defaultInstance;

- (FundInfoCloses_Builder*) clear;
- (FundInfoCloses_Builder*) clone;

- (FundInfoCloses*) build;
- (FundInfoCloses*) buildPartial;

- (FundInfoCloses_Builder*) mergeFrom:(FundInfoCloses*) other;
- (FundInfoCloses_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (FundInfoCloses_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCommon;
- (Common*) common;
- (FundInfoCloses_Builder*) setCommon:(Common*) value;
- (FundInfoCloses_Builder*) setCommonBuilder:(Common_Builder*) builderForValue;
- (FundInfoCloses_Builder*) mergeCommon:(Common*) value;
- (FundInfoCloses_Builder*) clearCommon;

- (BOOL) hasServerTime;
- (int64_t) serverTime;
- (FundInfoCloses_Builder*) setServerTime:(int64_t) value;
- (FundInfoCloses_Builder*) clearServerTime;

- (NSArray*) closesList;
- (Closes*) closesAtIndex:(int32_t) index;
- (FundInfoCloses_Builder*) replaceClosesAtIndex:(int32_t) index with:(Closes*) value;
- (FundInfoCloses_Builder*) addCloses:(Closes*) value;
- (FundInfoCloses_Builder*) addAllCloses:(NSArray*) values;
- (FundInfoCloses_Builder*) clearClosesList;

- (BOOL) hasDateVersion;
- (int64_t) dateVersion;
- (FundInfoCloses_Builder*) setDateVersion:(int64_t) value;
- (FundInfoCloses_Builder*) clearDateVersion;
@end
