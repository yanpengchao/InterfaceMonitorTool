// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ManagerInfo.pb.h"

@implementation ManagerInfoRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [ManagerInfoRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface ManagerInfo ()
@property (retain) NSString* ryxm;
@property (retain) NSString* rydm;
@property (retain) NSString* type;
@end

@implementation ManagerInfo

- (BOOL) hasRyxm {
  return !!hasRyxm_;
}
- (void) setHasRyxm:(BOOL) value {
  hasRyxm_ = !!value;
}
@synthesize ryxm;
- (BOOL) hasRydm {
  return !!hasRydm_;
}
- (void) setHasRydm:(BOOL) value {
  hasRydm_ = !!value;
}
@synthesize rydm;
- (BOOL) hasType {
  return !!hasType_;
}
- (void) setHasType:(BOOL) value {
  hasType_ = !!value;
}
@synthesize type;
- (void) dealloc {
  self.ryxm = nil;
  self.rydm = nil;
  self.type = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.ryxm = @"";
    self.rydm = @"";
    self.type = @"";
  }
  return self;
}
static ManagerInfo* defaultManagerInfoInstance = nil;
+ (void) initialize {
  if (self == [ManagerInfo class]) {
    defaultManagerInfoInstance = [[ManagerInfo alloc] init];
  }
}
+ (ManagerInfo*) defaultInstance {
  return defaultManagerInfoInstance;
}
- (ManagerInfo*) defaultInstance {
  return defaultManagerInfoInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasRyxm) {
    [output writeString:1 value:self.ryxm];
  }
  if (self.hasRydm) {
    [output writeString:2 value:self.rydm];
  }
  if (self.hasType) {
    [output writeString:3 value:self.type];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasRyxm) {
    size += computeStringSize(1, self.ryxm);
  }
  if (self.hasRydm) {
    size += computeStringSize(2, self.rydm);
  }
  if (self.hasType) {
    size += computeStringSize(3, self.type);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (ManagerInfo*) parseFromData:(NSData*) data {
  return (ManagerInfo*)[[[ManagerInfo builder] mergeFromData:data] build];
}
+ (ManagerInfo*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ManagerInfo*)[[[ManagerInfo builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (ManagerInfo*) parseFromInputStream:(NSInputStream*) input {
  return (ManagerInfo*)[[[ManagerInfo builder] mergeFromInputStream:input] build];
}
+ (ManagerInfo*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ManagerInfo*)[[[ManagerInfo builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (ManagerInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (ManagerInfo*)[[[ManagerInfo builder] mergeFromCodedInputStream:input] build];
}
+ (ManagerInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ManagerInfo*)[[[ManagerInfo builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (ManagerInfo_Builder*) builder {
  return [[[ManagerInfo_Builder alloc] init] autorelease];
}
+ (ManagerInfo_Builder*) builderWithPrototype:(ManagerInfo*) prototype {
  return [[ManagerInfo builder] mergeFrom:prototype];
}
- (ManagerInfo_Builder*) builder {
  return [ManagerInfo builder];
}
@end

@interface ManagerInfo_Builder()
@property (retain) ManagerInfo* result;
@end

@implementation ManagerInfo_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[ManagerInfo alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (ManagerInfo_Builder*) clear {
  self.result = [[[ManagerInfo alloc] init] autorelease];
  return self;
}
- (ManagerInfo_Builder*) clone {
  return [ManagerInfo builderWithPrototype:result];
}
- (ManagerInfo*) defaultInstance {
  return [ManagerInfo defaultInstance];
}
- (ManagerInfo*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (ManagerInfo*) buildPartial {
  ManagerInfo* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (ManagerInfo_Builder*) mergeFrom:(ManagerInfo*) other {
  if (other == [ManagerInfo defaultInstance]) {
    return self;
  }
  if (other.hasRyxm) {
    [self setRyxm:other.ryxm];
  }
  if (other.hasRydm) {
    [self setRydm:other.rydm];
  }
  if (other.hasType) {
    [self setType:other.type];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (ManagerInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (ManagerInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setRyxm:[input readString]];
        break;
      }
      case 18: {
        [self setRydm:[input readString]];
        break;
      }
      case 26: {
        [self setType:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasRyxm {
  return result.hasRyxm;
}
- (NSString*) ryxm {
  return result.ryxm;
}
- (ManagerInfo_Builder*) setRyxm:(NSString*) value {
  result.hasRyxm = YES;
  result.ryxm = value;
  return self;
}
- (ManagerInfo_Builder*) clearRyxm {
  result.hasRyxm = NO;
  result.ryxm = @"";
  return self;
}
- (BOOL) hasRydm {
  return result.hasRydm;
}
- (NSString*) rydm {
  return result.rydm;
}
- (ManagerInfo_Builder*) setRydm:(NSString*) value {
  result.hasRydm = YES;
  result.rydm = value;
  return self;
}
- (ManagerInfo_Builder*) clearRydm {
  result.hasRydm = NO;
  result.rydm = @"";
  return self;
}
- (BOOL) hasType {
  return result.hasType;
}
- (NSString*) type {
  return result.type;
}
- (ManagerInfo_Builder*) setType:(NSString*) value {
  result.hasType = YES;
  result.type = value;
  return self;
}
- (ManagerInfo_Builder*) clearType {
  result.hasType = NO;
  result.type = @"";
  return self;
}
@end

