// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class FundManagerInfo;
@class FundManagerInfo_Builder;

@interface FundManagerInfoRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface FundManagerInfo : PBGeneratedMessage {
@private
  BOOL hasRydm_:1;
  BOOL hasXmpy_:1;
  BOOL hasStatus_:1;
  BOOL hasRyxm_:1;
  BOOL hasType_:1;
  NSString* rydm;
  NSString* xmpy;
  NSString* status;
  NSString* ryxm;
  NSString* type;
}
- (BOOL) hasRydm;
- (BOOL) hasXmpy;
- (BOOL) hasStatus;
- (BOOL) hasRyxm;
- (BOOL) hasType;
@property (readonly, retain) NSString* rydm;
@property (readonly, retain) NSString* xmpy;
@property (readonly, retain) NSString* status;
@property (readonly, retain) NSString* ryxm;
@property (readonly, retain) NSString* type;

+ (FundManagerInfo*) defaultInstance;
- (FundManagerInfo*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (FundManagerInfo_Builder*) builder;
+ (FundManagerInfo_Builder*) builder;
+ (FundManagerInfo_Builder*) builderWithPrototype:(FundManagerInfo*) prototype;

+ (FundManagerInfo*) parseFromData:(NSData*) data;
+ (FundManagerInfo*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundManagerInfo*) parseFromInputStream:(NSInputStream*) input;
+ (FundManagerInfo*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (FundManagerInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (FundManagerInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface FundManagerInfo_Builder : PBGeneratedMessage_Builder {
@private
  FundManagerInfo* result;
}

- (FundManagerInfo*) defaultInstance;

- (FundManagerInfo_Builder*) clear;
- (FundManagerInfo_Builder*) clone;

- (FundManagerInfo*) build;
- (FundManagerInfo*) buildPartial;

- (FundManagerInfo_Builder*) mergeFrom:(FundManagerInfo*) other;
- (FundManagerInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (FundManagerInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasRydm;
- (NSString*) rydm;
- (FundManagerInfo_Builder*) setRydm:(NSString*) value;
- (FundManagerInfo_Builder*) clearRydm;

- (BOOL) hasXmpy;
- (NSString*) xmpy;
- (FundManagerInfo_Builder*) setXmpy:(NSString*) value;
- (FundManagerInfo_Builder*) clearXmpy;

- (BOOL) hasStatus;
- (NSString*) status;
- (FundManagerInfo_Builder*) setStatus:(NSString*) value;
- (FundManagerInfo_Builder*) clearStatus;

- (BOOL) hasRyxm;
- (NSString*) ryxm;
- (FundManagerInfo_Builder*) setRyxm:(NSString*) value;
- (FundManagerInfo_Builder*) clearRyxm;

- (BOOL) hasType;
- (NSString*) type;
- (FundManagerInfo_Builder*) setType:(NSString*) value;
- (FundManagerInfo_Builder*) clearType;
@end

