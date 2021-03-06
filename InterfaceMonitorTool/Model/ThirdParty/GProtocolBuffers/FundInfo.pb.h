// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class FundInfo;
@class FundInfo_Builder;

@interface FundInfoRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface FundInfo : PBGeneratedMessage {
@private
  BOOL hasJjdm_:1;
  BOOL hasJjjc_:1;
  BOOL hasRyxm_:1;
  NSString* jjdm;
  NSString* jjjc;
  NSString* ryxm;
}
- (BOOL) hasJjdm;
- (BOOL) hasJjjc;
- (BOOL) hasRyxm;
@property (readonly, retain) NSString* jjdm;
@property (readonly, retain) NSString* jjjc;
@property (readonly, retain) NSString* ryxm;

+ (FundInfo*) defaultInstance;
- (FundInfo*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (FundInfo_Builder*) builder;
+ (FundInfo_Builder*) builder;
+ (FundInfo_Builder*) builderWithPrototype:(FundInfo*) prototype;

+ (FundInfo*) parseFromData:(NSData*) data;
+ (FundInfo*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundInfo*) parseFromInputStream:(NSInputStream*) input;
+ (FundInfo*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (FundInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface FundInfo_Builder : PBGeneratedMessage_Builder {
@private
  FundInfo* result;
}

- (FundInfo*) defaultInstance;

- (FundInfo_Builder*) clear;
- (FundInfo_Builder*) clone;

- (FundInfo*) build;
- (FundInfo*) buildPartial;

- (FundInfo_Builder*) mergeFrom:(FundInfo*) other;
- (FundInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (FundInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasJjdm;
- (NSString*) jjdm;
- (FundInfo_Builder*) setJjdm:(NSString*) value;
- (FundInfo_Builder*) clearJjdm;

- (BOOL) hasJjjc;
- (NSString*) jjjc;
- (FundInfo_Builder*) setJjjc:(NSString*) value;
- (FundInfo_Builder*) clearJjjc;

- (BOOL) hasRyxm;
- (NSString*) ryxm;
- (FundInfo_Builder*) setRyxm:(NSString*) value;
- (FundInfo_Builder*) clearRyxm;
@end

