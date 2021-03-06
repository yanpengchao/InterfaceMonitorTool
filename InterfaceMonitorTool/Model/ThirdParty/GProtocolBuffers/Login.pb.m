// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Login.pb.h"

@implementation LoginRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [LoginRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    [CommonRoot registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface Login ()
@property (retain) Common* common;
@property (retain) NSString* custNo;
@end

@implementation Login

- (BOOL) hasCommon {
  return !!hasCommon_;
}
- (void) setHasCommon:(BOOL) value {
  hasCommon_ = !!value;
}
@synthesize common;
- (BOOL) hasCustNo {
  return !!hasCustNo_;
}
- (void) setHasCustNo:(BOOL) value {
  hasCustNo_ = !!value;
}
@synthesize custNo;
- (void) dealloc {
  self.common = nil;
  self.custNo = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.common = [Common defaultInstance];
    self.custNo = @"";
  }
  return self;
}
static Login* defaultLoginInstance = nil;
+ (void) initialize {
  if (self == [Login class]) {
    defaultLoginInstance = [[Login alloc] init];
  }
}
+ (Login*) defaultInstance {
  return defaultLoginInstance;
}
- (Login*) defaultInstance {
  return defaultLoginInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasCommon) {
    [output writeMessage:1 value:self.common];
  }
  if (self.hasCustNo) {
    [output writeString:2 value:self.custNo];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasCommon) {
    size += computeMessageSize(1, self.common);
  }
  if (self.hasCustNo) {
    size += computeStringSize(2, self.custNo);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (Login*) parseFromData:(NSData*) data {
  return (Login*)[[[Login builder] mergeFromData:data] build];
}
+ (Login*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Login*)[[[Login builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (Login*) parseFromInputStream:(NSInputStream*) input {
  return (Login*)[[[Login builder] mergeFromInputStream:input] build];
}
+ (Login*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Login*)[[[Login builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Login*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (Login*)[[[Login builder] mergeFromCodedInputStream:input] build];
}
+ (Login*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Login*)[[[Login builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Login_Builder*) builder {
  return [[[Login_Builder alloc] init] autorelease];
}
+ (Login_Builder*) builderWithPrototype:(Login*) prototype {
  return [[Login builder] mergeFrom:prototype];
}
- (Login_Builder*) builder {
  return [Login builder];
}
@end

@interface Login_Builder()
@property (retain) Login* result;
@end

@implementation Login_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[Login alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (Login_Builder*) clear {
  self.result = [[[Login alloc] init] autorelease];
  return self;
}
- (Login_Builder*) clone {
  return [Login builderWithPrototype:result];
}
- (Login*) defaultInstance {
  return [Login defaultInstance];
}
- (Login*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (Login*) buildPartial {
  Login* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (Login_Builder*) mergeFrom:(Login*) other {
  if (other == [Login defaultInstance]) {
    return self;
  }
  if (other.hasCommon) {
    [self mergeCommon:other.common];
  }
  if (other.hasCustNo) {
    [self setCustNo:other.custNo];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (Login_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (Login_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
      case 10: {
        Common_Builder* subBuilder = [Common builder];
        if (self.hasCommon) {
          [subBuilder mergeFrom:self.common];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setCommon:[subBuilder buildPartial]];
        break;
      }
      case 18: {
        [self setCustNo:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasCommon {
  return result.hasCommon;
}
- (Common*) common {
  return result.common;
}
- (Login_Builder*) setCommon:(Common*) value {
  result.hasCommon = YES;
  result.common = value;
  return self;
}
- (Login_Builder*) setCommonBuilder:(Common_Builder*) builderForValue {
  return [self setCommon:[builderForValue build]];
}
- (Login_Builder*) mergeCommon:(Common*) value {
  if (result.hasCommon &&
      result.common != [Common defaultInstance]) {
    result.common =
      [[[Common builderWithPrototype:result.common] mergeFrom:value] buildPartial];
  } else {
    result.common = value;
  }
  result.hasCommon = YES;
  return self;
}
- (Login_Builder*) clearCommon {
  result.hasCommon = NO;
  result.common = [Common defaultInstance];
  return self;
}
- (BOOL) hasCustNo {
  return result.hasCustNo;
}
- (NSString*) custNo {
  return result.custNo;
}
- (Login_Builder*) setCustNo:(NSString*) value {
  result.hasCustNo = YES;
  result.custNo = value;
  return self;
}
- (Login_Builder*) clearCustNo {
  result.hasCustNo = NO;
  result.custNo = @"";
  return self;
}
@end

