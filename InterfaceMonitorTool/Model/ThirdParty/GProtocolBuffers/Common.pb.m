// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Common.pb.h"

@implementation CommonRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [CommonRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface Common ()
@property (retain) NSString* responseCode;
@property (retain) NSString* responseContent;
@end

@implementation Common

- (BOOL) hasResponseCode {
  return !!hasResponseCode_;
}
- (void) setHasResponseCode:(BOOL) value {
  hasResponseCode_ = !!value;
}
@synthesize responseCode;
- (BOOL) hasResponseContent {
  return !!hasResponseContent_;
}
- (void) setHasResponseContent:(BOOL) value {
  hasResponseContent_ = !!value;
}
@synthesize responseContent;
- (void) dealloc {
  self.responseCode = nil;
  self.responseContent = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.responseCode = @"";
    self.responseContent = @"";
  }
  return self;
}
static Common* defaultCommonInstance = nil;
+ (void) initialize {
  if (self == [Common class]) {
    defaultCommonInstance = [[Common alloc] init];
  }
}
+ (Common*) defaultInstance {
  return defaultCommonInstance;
}
- (Common*) defaultInstance {
  return defaultCommonInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasResponseCode) {
    [output writeString:1 value:self.responseCode];
  }
  if (self.hasResponseContent) {
    [output writeString:2 value:self.responseContent];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasResponseCode) {
    size += computeStringSize(1, self.responseCode);
  }
  if (self.hasResponseContent) {
    size += computeStringSize(2, self.responseContent);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (Common*) parseFromData:(NSData*) data {
  return (Common*)[[[Common builder] mergeFromData:data] build];
}
+ (Common*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Common*)[[[Common builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (Common*) parseFromInputStream:(NSInputStream*) input {
  return (Common*)[[[Common builder] mergeFromInputStream:input] build];
}
+ (Common*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Common*)[[[Common builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Common*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (Common*)[[[Common builder] mergeFromCodedInputStream:input] build];
}
+ (Common*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Common*)[[[Common builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Common_Builder*) builder {
  return [[[Common_Builder alloc] init] autorelease];
}
+ (Common_Builder*) builderWithPrototype:(Common*) prototype {
  return [[Common builder] mergeFrom:prototype];
}
- (Common_Builder*) builder {
  return [Common builder];
}
@end

@interface Common_Builder()
@property (retain) Common* result;
@end

@implementation Common_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[Common alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (Common_Builder*) clear {
  self.result = [[[Common alloc] init] autorelease];
  return self;
}
- (Common_Builder*) clone {
  return [Common builderWithPrototype:result];
}
- (Common*) defaultInstance {
  return [Common defaultInstance];
}
- (Common*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (Common*) buildPartial {
  Common* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (Common_Builder*) mergeFrom:(Common*) other {
  if (other == [Common defaultInstance]) {
    return self;
  }
  if (other.hasResponseCode) {
    [self setResponseCode:other.responseCode];
  }
  if (other.hasResponseContent) {
    [self setResponseContent:other.responseContent];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (Common_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (Common_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setResponseCode:[input readString]];
        break;
      }
      case 18: {
        [self setResponseContent:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasResponseCode {
  return result.hasResponseCode;
}
- (NSString*) responseCode {
  return result.responseCode;
}
- (Common_Builder*) setResponseCode:(NSString*) value {
  result.hasResponseCode = YES;
  result.responseCode = value;
  return self;
}
- (Common_Builder*) clearResponseCode {
  result.hasResponseCode = NO;
  result.responseCode = @"";
  return self;
}
- (BOOL) hasResponseContent {
  return result.hasResponseContent;
}
- (NSString*) responseContent {
  return result.responseContent;
}
- (Common_Builder*) setResponseContent:(NSString*) value {
  result.hasResponseContent = YES;
  result.responseContent = value;
  return self;
}
- (Common_Builder*) clearResponseContent {
  result.hasResponseContent = NO;
  result.responseContent = @"";
  return self;
}
@end

