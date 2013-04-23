// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "PhoneOpinionType.pb.h"

@implementation PhoneOpinionTypeRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [PhoneOpinionTypeRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface PhoneOpinionType ()
@property int32_t uid;
@property (retain) NSString* typeName;
@end

@implementation PhoneOpinionType

- (BOOL) hasUid {
  return !!hasUid_;
}
- (void) setHasUid:(BOOL) value {
  hasUid_ = !!value;
}
@synthesize uid;
- (BOOL) hasTypeName {
  return !!hasTypeName_;
}
- (void) setHasTypeName:(BOOL) value {
  hasTypeName_ = !!value;
}
@synthesize typeName;
- (void) dealloc {
  self.typeName = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.uid = 0;
    self.typeName = @"";
  }
  return self;
}
static PhoneOpinionType* defaultPhoneOpinionTypeInstance = nil;
+ (void) initialize {
  if (self == [PhoneOpinionType class]) {
    defaultPhoneOpinionTypeInstance = [[PhoneOpinionType alloc] init];
  }
}
+ (PhoneOpinionType*) defaultInstance {
  return defaultPhoneOpinionTypeInstance;
}
- (PhoneOpinionType*) defaultInstance {
  return defaultPhoneOpinionTypeInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasUid) {
    [output writeInt32:1 value:self.uid];
  }
  if (self.hasTypeName) {
    [output writeString:2 value:self.typeName];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasUid) {
    size += computeInt32Size(1, self.uid);
  }
  if (self.hasTypeName) {
    size += computeStringSize(2, self.typeName);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (PhoneOpinionType*) parseFromData:(NSData*) data {
  return (PhoneOpinionType*)[[[PhoneOpinionType builder] mergeFromData:data] build];
}
+ (PhoneOpinionType*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PhoneOpinionType*)[[[PhoneOpinionType builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (PhoneOpinionType*) parseFromInputStream:(NSInputStream*) input {
  return (PhoneOpinionType*)[[[PhoneOpinionType builder] mergeFromInputStream:input] build];
}
+ (PhoneOpinionType*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PhoneOpinionType*)[[[PhoneOpinionType builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PhoneOpinionType*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (PhoneOpinionType*)[[[PhoneOpinionType builder] mergeFromCodedInputStream:input] build];
}
+ (PhoneOpinionType*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (PhoneOpinionType*)[[[PhoneOpinionType builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (PhoneOpinionType_Builder*) builder {
  return [[[PhoneOpinionType_Builder alloc] init] autorelease];
}
+ (PhoneOpinionType_Builder*) builderWithPrototype:(PhoneOpinionType*) prototype {
  return [[PhoneOpinionType builder] mergeFrom:prototype];
}
- (PhoneOpinionType_Builder*) builder {
  return [PhoneOpinionType builder];
}
@end

@interface PhoneOpinionType_Builder()
@property (retain) PhoneOpinionType* result;
@end

@implementation PhoneOpinionType_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[PhoneOpinionType alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (PhoneOpinionType_Builder*) clear {
  self.result = [[[PhoneOpinionType alloc] init] autorelease];
  return self;
}
- (PhoneOpinionType_Builder*) clone {
  return [PhoneOpinionType builderWithPrototype:result];
}
- (PhoneOpinionType*) defaultInstance {
  return [PhoneOpinionType defaultInstance];
}
- (PhoneOpinionType*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (PhoneOpinionType*) buildPartial {
  PhoneOpinionType* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (PhoneOpinionType_Builder*) mergeFrom:(PhoneOpinionType*) other {
  if (other == [PhoneOpinionType defaultInstance]) {
    return self;
  }
  if (other.hasUid) {
    [self setUid:other.uid];
  }
  if (other.hasTypeName) {
    [self setTypeName:other.typeName];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (PhoneOpinionType_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (PhoneOpinionType_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 8: {
        [self setUid:[input readInt32]];
        break;
      }
      case 18: {
        [self setTypeName:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasUid {
  return result.hasUid;
}
- (int32_t) uid {
  return result.uid;
}
- (PhoneOpinionType_Builder*) setUid:(int32_t) value {
  result.hasUid = YES;
  result.uid = value;
  return self;
}
- (PhoneOpinionType_Builder*) clearUid {
  result.hasUid = NO;
  result.uid = 0;
  return self;
}
- (BOOL) hasTypeName {
  return result.hasTypeName;
}
- (NSString*) typeName {
  return result.typeName;
}
- (PhoneOpinionType_Builder*) setTypeName:(NSString*) value {
  result.hasTypeName = YES;
  result.typeName = value;
  return self;
}
- (PhoneOpinionType_Builder*) clearTypeName {
  result.hasTypeName = NO;
  result.typeName = @"";
  return self;
}
@end

