// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "TrustDetailInfo.pb.h"

@implementation TrustDetailInfoRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [TrustDetailInfoRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    [CommonRoot registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface TrustDetailInfo ()
@property (retain) Common* common;
@property (retain) NSString* fullname;
@property (retain) NSString* str;
@property (retain) NSString* yqnhsysm;
@property (retain) NSString* yjfxgm;
@property (retain) NSString* zdrgzj;
@property (retain) NSString* dp;
@end

@implementation TrustDetailInfo

- (BOOL) hasCommon {
  return !!hasCommon_;
}
- (void) setHasCommon:(BOOL) value {
  hasCommon_ = !!value;
}
@synthesize common;
- (BOOL) hasFullname {
  return !!hasFullname_;
}
- (void) setHasFullname:(BOOL) value {
  hasFullname_ = !!value;
}
@synthesize fullname;
- (BOOL) hasStr {
  return !!hasStr_;
}
- (void) setHasStr:(BOOL) value {
  hasStr_ = !!value;
}
@synthesize str;
- (BOOL) hasYqnhsysm {
  return !!hasYqnhsysm_;
}
- (void) setHasYqnhsysm:(BOOL) value {
  hasYqnhsysm_ = !!value;
}
@synthesize yqnhsysm;
- (BOOL) hasYjfxgm {
  return !!hasYjfxgm_;
}
- (void) setHasYjfxgm:(BOOL) value {
  hasYjfxgm_ = !!value;
}
@synthesize yjfxgm;
- (BOOL) hasZdrgzj {
  return !!hasZdrgzj_;
}
- (void) setHasZdrgzj:(BOOL) value {
  hasZdrgzj_ = !!value;
}
@synthesize zdrgzj;
- (BOOL) hasDp {
  return !!hasDp_;
}
- (void) setHasDp:(BOOL) value {
  hasDp_ = !!value;
}
@synthesize dp;
- (void) dealloc {
  self.common = nil;
  self.fullname = nil;
  self.str = nil;
  self.yqnhsysm = nil;
  self.yjfxgm = nil;
  self.zdrgzj = nil;
  self.dp = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.common = [Common defaultInstance];
    self.fullname = @"";
    self.str = @"";
    self.yqnhsysm = @"";
    self.yjfxgm = @"";
    self.zdrgzj = @"";
    self.dp = @"";
  }
  return self;
}
static TrustDetailInfo* defaultTrustDetailInfoInstance = nil;
+ (void) initialize {
  if (self == [TrustDetailInfo class]) {
    defaultTrustDetailInfoInstance = [[TrustDetailInfo alloc] init];
  }
}
+ (TrustDetailInfo*) defaultInstance {
  return defaultTrustDetailInfoInstance;
}
- (TrustDetailInfo*) defaultInstance {
  return defaultTrustDetailInfoInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasCommon) {
    [output writeMessage:1 value:self.common];
  }
  if (self.hasFullname) {
    [output writeString:2 value:self.fullname];
  }
  if (self.hasStr) {
    [output writeString:3 value:self.str];
  }
  if (self.hasYqnhsysm) {
    [output writeString:4 value:self.yqnhsysm];
  }
  if (self.hasYjfxgm) {
    [output writeString:5 value:self.yjfxgm];
  }
  if (self.hasZdrgzj) {
    [output writeString:6 value:self.zdrgzj];
  }
  if (self.hasDp) {
    [output writeString:7 value:self.dp];
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
  if (self.hasFullname) {
    size += computeStringSize(2, self.fullname);
  }
  if (self.hasStr) {
    size += computeStringSize(3, self.str);
  }
  if (self.hasYqnhsysm) {
    size += computeStringSize(4, self.yqnhsysm);
  }
  if (self.hasYjfxgm) {
    size += computeStringSize(5, self.yjfxgm);
  }
  if (self.hasZdrgzj) {
    size += computeStringSize(6, self.zdrgzj);
  }
  if (self.hasDp) {
    size += computeStringSize(7, self.dp);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TrustDetailInfo*) parseFromData:(NSData*) data {
  return (TrustDetailInfo*)[[[TrustDetailInfo builder] mergeFromData:data] build];
}
+ (TrustDetailInfo*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TrustDetailInfo*)[[[TrustDetailInfo builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TrustDetailInfo*) parseFromInputStream:(NSInputStream*) input {
  return (TrustDetailInfo*)[[[TrustDetailInfo builder] mergeFromInputStream:input] build];
}
+ (TrustDetailInfo*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TrustDetailInfo*)[[[TrustDetailInfo builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TrustDetailInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TrustDetailInfo*)[[[TrustDetailInfo builder] mergeFromCodedInputStream:input] build];
}
+ (TrustDetailInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TrustDetailInfo*)[[[TrustDetailInfo builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TrustDetailInfo_Builder*) builder {
  return [[[TrustDetailInfo_Builder alloc] init] autorelease];
}
+ (TrustDetailInfo_Builder*) builderWithPrototype:(TrustDetailInfo*) prototype {
  return [[TrustDetailInfo builder] mergeFrom:prototype];
}
- (TrustDetailInfo_Builder*) builder {
  return [TrustDetailInfo builder];
}
@end

@interface TrustDetailInfo_Builder()
@property (retain) TrustDetailInfo* result;
@end

@implementation TrustDetailInfo_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[TrustDetailInfo alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (TrustDetailInfo_Builder*) clear {
  self.result = [[[TrustDetailInfo alloc] init] autorelease];
  return self;
}
- (TrustDetailInfo_Builder*) clone {
  return [TrustDetailInfo builderWithPrototype:result];
}
- (TrustDetailInfo*) defaultInstance {
  return [TrustDetailInfo defaultInstance];
}
- (TrustDetailInfo*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (TrustDetailInfo*) buildPartial {
  TrustDetailInfo* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (TrustDetailInfo_Builder*) mergeFrom:(TrustDetailInfo*) other {
  if (other == [TrustDetailInfo defaultInstance]) {
    return self;
  }
  if (other.hasCommon) {
    [self mergeCommon:other.common];
  }
  if (other.hasFullname) {
    [self setFullname:other.fullname];
  }
  if (other.hasStr) {
    [self setStr:other.str];
  }
  if (other.hasYqnhsysm) {
    [self setYqnhsysm:other.yqnhsysm];
  }
  if (other.hasYjfxgm) {
    [self setYjfxgm:other.yjfxgm];
  }
  if (other.hasZdrgzj) {
    [self setZdrgzj:other.zdrgzj];
  }
  if (other.hasDp) {
    [self setDp:other.dp];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TrustDetailInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TrustDetailInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setFullname:[input readString]];
        break;
      }
      case 26: {
        [self setStr:[input readString]];
        break;
      }
      case 34: {
        [self setYqnhsysm:[input readString]];
        break;
      }
      case 42: {
        [self setYjfxgm:[input readString]];
        break;
      }
      case 50: {
        [self setZdrgzj:[input readString]];
        break;
      }
      case 58: {
        [self setDp:[input readString]];
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
- (TrustDetailInfo_Builder*) setCommon:(Common*) value {
  result.hasCommon = YES;
  result.common = value;
  return self;
}
- (TrustDetailInfo_Builder*) setCommonBuilder:(Common_Builder*) builderForValue {
  return [self setCommon:[builderForValue build]];
}
- (TrustDetailInfo_Builder*) mergeCommon:(Common*) value {
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
- (TrustDetailInfo_Builder*) clearCommon {
  result.hasCommon = NO;
  result.common = [Common defaultInstance];
  return self;
}
- (BOOL) hasFullname {
  return result.hasFullname;
}
- (NSString*) fullname {
  return result.fullname;
}
- (TrustDetailInfo_Builder*) setFullname:(NSString*) value {
  result.hasFullname = YES;
  result.fullname = value;
  return self;
}
- (TrustDetailInfo_Builder*) clearFullname {
  result.hasFullname = NO;
  result.fullname = @"";
  return self;
}
- (BOOL) hasStr {
  return result.hasStr;
}
- (NSString*) str {
  return result.str;
}
- (TrustDetailInfo_Builder*) setStr:(NSString*) value {
  result.hasStr = YES;
  result.str = value;
  return self;
}
- (TrustDetailInfo_Builder*) clearStr {
  result.hasStr = NO;
  result.str = @"";
  return self;
}
- (BOOL) hasYqnhsysm {
  return result.hasYqnhsysm;
}
- (NSString*) yqnhsysm {
  return result.yqnhsysm;
}
- (TrustDetailInfo_Builder*) setYqnhsysm:(NSString*) value {
  result.hasYqnhsysm = YES;
  result.yqnhsysm = value;
  return self;
}
- (TrustDetailInfo_Builder*) clearYqnhsysm {
  result.hasYqnhsysm = NO;
  result.yqnhsysm = @"";
  return self;
}
- (BOOL) hasYjfxgm {
  return result.hasYjfxgm;
}
- (NSString*) yjfxgm {
  return result.yjfxgm;
}
- (TrustDetailInfo_Builder*) setYjfxgm:(NSString*) value {
  result.hasYjfxgm = YES;
  result.yjfxgm = value;
  return self;
}
- (TrustDetailInfo_Builder*) clearYjfxgm {
  result.hasYjfxgm = NO;
  result.yjfxgm = @"";
  return self;
}
- (BOOL) hasZdrgzj {
  return result.hasZdrgzj;
}
- (NSString*) zdrgzj {
  return result.zdrgzj;
}
- (TrustDetailInfo_Builder*) setZdrgzj:(NSString*) value {
  result.hasZdrgzj = YES;
  result.zdrgzj = value;
  return self;
}
- (TrustDetailInfo_Builder*) clearZdrgzj {
  result.hasZdrgzj = NO;
  result.zdrgzj = @"";
  return self;
}
- (BOOL) hasDp {
  return result.hasDp;
}
- (NSString*) dp {
  return result.dp;
}
- (TrustDetailInfo_Builder*) setDp:(NSString*) value {
  result.hasDp = YES;
  result.dp = value;
  return self;
}
- (TrustDetailInfo_Builder*) clearDp {
  result.hasDp = NO;
  result.dp = @"";
  return self;
}
@end

