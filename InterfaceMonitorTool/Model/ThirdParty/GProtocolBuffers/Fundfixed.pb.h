// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "Common.pb.h"

@class Common;
@class Common_Builder;
@class FundFixedUpdate;
@class FundFixedUpdate_Builder;
@class Fundfixed;
@class Fundfixed_Builder;

@interface FundfixedRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface Fundfixed : PBGeneratedMessage {
@private
  BOOL hasCode_:1;
  BOOL hasDthb1N_:1;
  BOOL hasDthb2N_:1;
  BOOL hasDthb3N_:1;
  BOOL hasDthb4N_:1;
  BOOL hasDthb5N_:1;
  BOOL hasJjjz_:1;
  BOOL hasLjjz_:1;
  BOOL hasJzrq_:1;
  NSString* code;
  NSString* dthb1N;
  NSString* dthb2N;
  NSString* dthb3N;
  NSString* dthb4N;
  NSString* dthb5N;
  NSString* jjjz;
  NSString* ljjz;
  NSString* jzrq;
}
- (BOOL) hasCode;
- (BOOL) hasDthb1N;
- (BOOL) hasDthb2N;
- (BOOL) hasDthb3N;
- (BOOL) hasDthb4N;
- (BOOL) hasDthb5N;
- (BOOL) hasJjjz;
- (BOOL) hasLjjz;
- (BOOL) hasJzrq;
@property (readonly, retain) NSString* code;
@property (readonly, retain) NSString* dthb1N;
@property (readonly, retain) NSString* dthb2N;
@property (readonly, retain) NSString* dthb3N;
@property (readonly, retain) NSString* dthb4N;
@property (readonly, retain) NSString* dthb5N;
@property (readonly, retain) NSString* jjjz;
@property (readonly, retain) NSString* ljjz;
@property (readonly, retain) NSString* jzrq;

+ (Fundfixed*) defaultInstance;
- (Fundfixed*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Fundfixed_Builder*) builder;
+ (Fundfixed_Builder*) builder;
+ (Fundfixed_Builder*) builderWithPrototype:(Fundfixed*) prototype;

+ (Fundfixed*) parseFromData:(NSData*) data;
+ (Fundfixed*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Fundfixed*) parseFromInputStream:(NSInputStream*) input;
+ (Fundfixed*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Fundfixed*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Fundfixed*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Fundfixed_Builder : PBGeneratedMessage_Builder {
@private
  Fundfixed* result;
}

- (Fundfixed*) defaultInstance;

- (Fundfixed_Builder*) clear;
- (Fundfixed_Builder*) clone;

- (Fundfixed*) build;
- (Fundfixed*) buildPartial;

- (Fundfixed_Builder*) mergeFrom:(Fundfixed*) other;
- (Fundfixed_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Fundfixed_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCode;
- (NSString*) code;
- (Fundfixed_Builder*) setCode:(NSString*) value;
- (Fundfixed_Builder*) clearCode;

- (BOOL) hasDthb1N;
- (NSString*) dthb1N;
- (Fundfixed_Builder*) setDthb1N:(NSString*) value;
- (Fundfixed_Builder*) clearDthb1N;

- (BOOL) hasDthb2N;
- (NSString*) dthb2N;
- (Fundfixed_Builder*) setDthb2N:(NSString*) value;
- (Fundfixed_Builder*) clearDthb2N;

- (BOOL) hasDthb3N;
- (NSString*) dthb3N;
- (Fundfixed_Builder*) setDthb3N:(NSString*) value;
- (Fundfixed_Builder*) clearDthb3N;

- (BOOL) hasDthb4N;
- (NSString*) dthb4N;
- (Fundfixed_Builder*) setDthb4N:(NSString*) value;
- (Fundfixed_Builder*) clearDthb4N;

- (BOOL) hasDthb5N;
- (NSString*) dthb5N;
- (Fundfixed_Builder*) setDthb5N:(NSString*) value;
- (Fundfixed_Builder*) clearDthb5N;

- (BOOL) hasJjjz;
- (NSString*) jjjz;
- (Fundfixed_Builder*) setJjjz:(NSString*) value;
- (Fundfixed_Builder*) clearJjjz;

- (BOOL) hasLjjz;
- (NSString*) ljjz;
- (Fundfixed_Builder*) setLjjz:(NSString*) value;
- (Fundfixed_Builder*) clearLjjz;

- (BOOL) hasJzrq;
- (NSString*) jzrq;
- (Fundfixed_Builder*) setJzrq:(NSString*) value;
- (Fundfixed_Builder*) clearJzrq;
@end

@interface FundFixedUpdate : PBGeneratedMessage {
@private
  BOOL hasSumPage_:1;
  BOOL hasCommon_:1;
  int32_t sumPage;
  Common* common;
  NSMutableArray* mutableFundfixedList;
}
- (BOOL) hasCommon;
- (BOOL) hasSumPage;
@property (readonly, retain) Common* common;
@property (readonly) int32_t sumPage;
- (NSArray*) fundfixedList;
- (Fundfixed*) fundfixedAtIndex:(int32_t) index;

+ (FundFixedUpdate*) defaultInstance;
- (FundFixedUpdate*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (FundFixedUpdate_Builder*) builder;
+ (FundFixedUpdate_Builder*) builder;
+ (FundFixedUpdate_Builder*) builderWithPrototype:(FundFixedUpdate*) prototype;

+ (FundFixedUpdate*) parseFromData:(NSData*) data;
+ (FundFixedUpdate*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundFixedUpdate*) parseFromInputStream:(NSInputStream*) input;
+ (FundFixedUpdate*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundFixedUpdate*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (FundFixedUpdate*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface FundFixedUpdate_Builder : PBGeneratedMessage_Builder {
@private
  FundFixedUpdate* result;
}

- (FundFixedUpdate*) defaultInstance;

- (FundFixedUpdate_Builder*) clear;
- (FundFixedUpdate_Builder*) clone;

- (FundFixedUpdate*) build;
- (FundFixedUpdate*) buildPartial;

- (FundFixedUpdate_Builder*) mergeFrom:(FundFixedUpdate*) other;
- (FundFixedUpdate_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (FundFixedUpdate_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCommon;
- (Common*) common;
- (FundFixedUpdate_Builder*) setCommon:(Common*) value;
- (FundFixedUpdate_Builder*) setCommonBuilder:(Common_Builder*) builderForValue;
- (FundFixedUpdate_Builder*) mergeCommon:(Common*) value;
- (FundFixedUpdate_Builder*) clearCommon;

- (BOOL) hasSumPage;
- (int32_t) sumPage;
- (FundFixedUpdate_Builder*) setSumPage:(int32_t) value;
- (FundFixedUpdate_Builder*) clearSumPage;

- (NSArray*) fundfixedList;
- (Fundfixed*) fundfixedAtIndex:(int32_t) index;
- (FundFixedUpdate_Builder*) replaceFundfixedAtIndex:(int32_t) index with:(Fundfixed*) value;
- (FundFixedUpdate_Builder*) addFundfixed:(Fundfixed*) value;
- (FundFixedUpdate_Builder*) addAllFundfixed:(NSArray*) values;
- (FundFixedUpdate_Builder*) clearFundfixedList;
@end

