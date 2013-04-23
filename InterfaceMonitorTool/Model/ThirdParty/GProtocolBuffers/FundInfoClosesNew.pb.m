// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "FundInfoClosesNew.pb.h"

@implementation FundInfoClosesNewRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [FundInfoClosesNewRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    [ClosesNewRoot registerAllExtensions:registry];
    [CommonRoot registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface FundInfoClosesNew ()
@property (retain) Common* common;
@property int64_t serverTime;
@property (retain) NSMutableArray* mutableClosesNewList;
@property int64_t dateVersion;
@end

@implementation FundInfoClosesNew

- (BOOL) hasCommon {
  return !!hasCommon_;
}
- (void) setHasCommon:(BOOL) value {
  hasCommon_ = !!value;
}
@synthesize common;
- (BOOL) hasServerTime {
  return !!hasServerTime_;
}
- (void) setHasServerTime:(BOOL) value {
  hasServerTime_ = !!value;
}
@synthesize serverTime;
@synthesize mutableClosesNewList;
- (BOOL) hasDateVersion {
  return !!hasDateVersion_;
}
- (void) setHasDateVersion:(BOOL) value {
  hasDateVersion_ = !!value;
}
@synthesize dateVersion;
- (void) dealloc {
  self.common = nil;
  self.mutableClosesNewList = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.common = [Common defaultInstance];
    self.serverTime = 0L;
    self.dateVersion = 0L;
  }
  return self;
}
static FundInfoClosesNew* defaultFundInfoClosesNewInstance = nil;
+ (void) initialize {
  if (self == [FundInfoClosesNew class]) {
    defaultFundInfoClosesNewInstance = [[FundInfoClosesNew alloc] init];
  }
}
+ (FundInfoClosesNew*) defaultInstance {
  return defaultFundInfoClosesNewInstance;
}
- (FundInfoClosesNew*) defaultInstance {
  return defaultFundInfoClosesNewInstance;
}
- (NSArray*) closesNewList {
  return mutableClosesNewList;
}
- (ClosesNew*) closesNewAtIndex:(int32_t) index {
  id value = [mutableClosesNewList objectAtIndex:index];
  return value;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasCommon) {
    [output writeMessage:1 value:self.common];
  }
  if (self.hasServerTime) {
    [output writeFixed64:2 value:self.serverTime];
  }
  for (ClosesNew* element in self.closesNewList) {
    [output writeMessage:3 value:element];
  }
  if (self.hasDateVersion) {
    [output writeFixed64:4 value:self.dateVersion];
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
  if (self.hasServerTime) {
    size += computeFixed64Size(2, self.serverTime);
  }
  for (ClosesNew* element in self.closesNewList) {
    size += computeMessageSize(3, element);
  }
  if (self.hasDateVersion) {
    size += computeFixed64Size(4, self.dateVersion);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (FundInfoClosesNew*) parseFromData:(NSData*) data {
  return (FundInfoClosesNew*)[[[FundInfoClosesNew builder] mergeFromData:data] build];
}
+ (FundInfoClosesNew*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (FundInfoClosesNew*)[[[FundInfoClosesNew builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (FundInfoClosesNew*) parseFromInputStream:(NSInputStream*) input {
  return (FundInfoClosesNew*)[[[FundInfoClosesNew builder] mergeFromInputStream:input] build];
}
+ (FundInfoClosesNew*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (FundInfoClosesNew*)[[[FundInfoClosesNew builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (FundInfoClosesNew*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (FundInfoClosesNew*)[[[FundInfoClosesNew builder] mergeFromCodedInputStream:input] build];
}
+ (FundInfoClosesNew*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (FundInfoClosesNew*)[[[FundInfoClosesNew builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (FundInfoClosesNew_Builder*) builder {
  return [[[FundInfoClosesNew_Builder alloc] init] autorelease];
}
+ (FundInfoClosesNew_Builder*) builderWithPrototype:(FundInfoClosesNew*) prototype {
  return [[FundInfoClosesNew builder] mergeFrom:prototype];
}
- (FundInfoClosesNew_Builder*) builder {
  return [FundInfoClosesNew builder];
}
@end

@interface FundInfoClosesNew_Builder()
@property (retain) FundInfoClosesNew* result;
@end

@implementation FundInfoClosesNew_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[FundInfoClosesNew alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (FundInfoClosesNew_Builder*) clear {
  self.result = [[[FundInfoClosesNew alloc] init] autorelease];
  return self;
}
- (FundInfoClosesNew_Builder*) clone {
  return [FundInfoClosesNew builderWithPrototype:result];
}
- (FundInfoClosesNew*) defaultInstance {
  return [FundInfoClosesNew defaultInstance];
}
- (FundInfoClosesNew*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (FundInfoClosesNew*) buildPartial {
  FundInfoClosesNew* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (FundInfoClosesNew_Builder*) mergeFrom:(FundInfoClosesNew*) other {
  if (other == [FundInfoClosesNew defaultInstance]) {
    return self;
  }
  if (other.hasCommon) {
    [self mergeCommon:other.common];
  }
  if (other.hasServerTime) {
    [self setServerTime:other.serverTime];
  }
  if (other.mutableClosesNewList.count > 0) {
    if (result.mutableClosesNewList == nil) {
      result.mutableClosesNewList = [NSMutableArray array];
    }
    [result.mutableClosesNewList addObjectsFromArray:other.mutableClosesNewList];
  }
  if (other.hasDateVersion) {
    [self setDateVersion:other.dateVersion];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (FundInfoClosesNew_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (FundInfoClosesNew_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
      case 17: {
        [self setServerTime:[input readFixed64]];
        break;
      }
      case 26: {
        ClosesNew_Builder* subBuilder = [ClosesNew builder];
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self addClosesNew:[subBuilder buildPartial]];
        break;
      }
      case 33: {
        [self setDateVersion:[input readFixed64]];
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
- (FundInfoClosesNew_Builder*) setCommon:(Common*) value {
  result.hasCommon = YES;
  result.common = value;
  return self;
}
- (FundInfoClosesNew_Builder*) setCommonBuilder:(Common_Builder*) builderForValue {
  return [self setCommon:[builderForValue build]];
}
- (FundInfoClosesNew_Builder*) mergeCommon:(Common*) value {
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
- (FundInfoClosesNew_Builder*) clearCommon {
  result.hasCommon = NO;
  result.common = [Common defaultInstance];
  return self;
}
- (BOOL) hasServerTime {
  return result.hasServerTime;
}
- (int64_t) serverTime {
  return result.serverTime;
}
- (FundInfoClosesNew_Builder*) setServerTime:(int64_t) value {
  result.hasServerTime = YES;
  result.serverTime = value;
  return self;
}
- (FundInfoClosesNew_Builder*) clearServerTime {
  result.hasServerTime = NO;
  result.serverTime = 0L;
  return self;
}
- (NSArray*) closesNewList {
  if (result.mutableClosesNewList == nil) { return [NSArray array]; }
  return result.mutableClosesNewList;
}
- (ClosesNew*) closesNewAtIndex:(int32_t) index {
  return [result closesNewAtIndex:index];
}
- (FundInfoClosesNew_Builder*) replaceClosesNewAtIndex:(int32_t) index with:(ClosesNew*) value {
  [result.mutableClosesNewList replaceObjectAtIndex:index withObject:value];
  return self;
}
- (FundInfoClosesNew_Builder*) addAllClosesNew:(NSArray*) values {
  if (result.mutableClosesNewList == nil) {
    result.mutableClosesNewList = [NSMutableArray array];
  }
  [result.mutableClosesNewList addObjectsFromArray:values];
  return self;
}
- (FundInfoClosesNew_Builder*) clearClosesNewList {
  result.mutableClosesNewList = nil;
  return self;
}
- (FundInfoClosesNew_Builder*) addClosesNew:(ClosesNew*) value {
  if (result.mutableClosesNewList == nil) {
    result.mutableClosesNewList = [NSMutableArray array];
  }
  [result.mutableClosesNewList addObject:value];
  return self;
}
- (BOOL) hasDateVersion {
  return result.hasDateVersion;
}
- (int64_t) dateVersion {
  return result.dateVersion;
}
- (FundInfoClosesNew_Builder*) setDateVersion:(int64_t) value {
  result.hasDateVersion = YES;
  result.dateVersion = value;
  return self;
}
- (FundInfoClosesNew_Builder*) clearDateVersion {
  result.hasDateVersion = NO;
  result.dateVersion = 0L;
  return self;
}
@end
