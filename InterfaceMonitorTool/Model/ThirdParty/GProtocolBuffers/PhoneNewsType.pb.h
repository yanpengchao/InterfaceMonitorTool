// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class PhoneNewsType;
@class PhoneNewsType_Builder;

@interface PhoneNewsTypeRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface PhoneNewsType : PBGeneratedMessage {
@private
  BOOL hasUid_:1;
  BOOL hasTypeName_:1;
  int32_t uid;
  NSString* typeName;
}
- (BOOL) hasUid;
- (BOOL) hasTypeName;
@property (readonly) int32_t uid;
@property (readonly, retain) NSString* typeName;

+ (PhoneNewsType*) defaultInstance;
- (PhoneNewsType*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PhoneNewsType_Builder*) builder;
+ (PhoneNewsType_Builder*) builder;
+ (PhoneNewsType_Builder*) builderWithPrototype:(PhoneNewsType*) prototype;

+ (PhoneNewsType*) parseFromData:(NSData*) data;
+ (PhoneNewsType*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PhoneNewsType*) parseFromInputStream:(NSInputStream*) input;
+ (PhoneNewsType*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PhoneNewsType*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PhoneNewsType*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PhoneNewsType_Builder : PBGeneratedMessage_Builder {
@private
  PhoneNewsType* result;
}

- (PhoneNewsType*) defaultInstance;

- (PhoneNewsType_Builder*) clear;
- (PhoneNewsType_Builder*) clone;

- (PhoneNewsType*) build;
- (PhoneNewsType*) buildPartial;

- (PhoneNewsType_Builder*) mergeFrom:(PhoneNewsType*) other;
- (PhoneNewsType_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PhoneNewsType_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasUid;
- (int32_t) uid;
- (PhoneNewsType_Builder*) setUid:(int32_t) value;
- (PhoneNewsType_Builder*) clearUid;

- (BOOL) hasTypeName;
- (NSString*) typeName;
- (PhoneNewsType_Builder*) setTypeName:(NSString*) value;
- (PhoneNewsType_Builder*) clearTypeName;
@end

