// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "FundAnnoList.pb.h"

@implementation FundAnnoListRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [FundAnnoListRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    [CommonRoot registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface FundAnnoList ()
@property (retain) Common* common;
@property int32_t totalNum;
@property (retain) NSMutableArray* mutableFndAnnoList;
@end

@implementation FundAnnoList

- (BOOL) hasCommon {
  return !!hasCommon_;
}
- (void) setHasCommon:(BOOL) value {
  hasCommon_ = !!value;
}
@synthesize common;
- (BOOL) hasTotalNum {
  return !!hasTotalNum_;
}
- (void) setHasTotalNum:(BOOL) value {
  hasTotalNum_ = !!value;
}
@synthesize totalNum;
@synthesize mutableFndAnnoList;
- (void) dealloc {
  self.common = nil;
  self.mutableFndAnnoList = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.common = [Common defaultInstance];
    self.totalNum = 0;
  }
  return self;
}
static FundAnnoList* defaultFundAnnoListInstance = nil;
+ (void) initialize {
  if (self == [FundAnnoList class]) {
    defaultFundAnnoListInstance = [[FundAnnoList alloc] init];
  }
}
+ (FundAnnoList*) defaultInstance {
  return defaultFundAnnoListInstance;
}
- (FundAnnoList*) defaultInstance {
  return defaultFundAnnoListInstance;
}
- (NSArray*) fndAnnoList {
  return mutableFndAnnoList;
}
- (FundAnno*) fndAnnoAtIndex:(int32_t) index {
  id value = [mutableFndAnnoList objectAtIndex:index];
  return value;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasCommon) {
    [output writeMessage:1 value:self.common];
  }
  if (self.hasTotalNum) {
    [output writeSInt32:2 value:self.totalNum];
  }
  for (FundAnno* element in self.fndAnnoList) {
    [output writeMessage:3 value:element];
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
  if (self.hasTotalNum) {
    size += computeSInt32Size(2, self.totalNum);
  }
  for (FundAnno* element in self.fndAnnoList) {
    size += computeMessageSize(3, element);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (FundAnnoList*) parseFromData:(NSData*) data {
  return (FundAnnoList*)[[[FundAnnoList builder] mergeFromData:data] build];
}
+ (FundAnnoList*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (FundAnnoList*)[[[FundAnnoList builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (FundAnnoList*) parseFromInputStream:(NSInputStream*) input {
  return (FundAnnoList*)[[[FundAnnoList builder] mergeFromInputStream:input] build];
}
+ (FundAnnoList*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (FundAnnoList*)[[[FundAnnoList builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (FundAnnoList*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (FundAnnoList*)[[[FundAnnoList builder] mergeFromCodedInputStream:input] build];
}
+ (FundAnnoList*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (FundAnnoList*)[[[FundAnnoList builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (FundAnnoList_Builder*) builder {
  return [[[FundAnnoList_Builder alloc] init] autorelease];
}
+ (FundAnnoList_Builder*) builderWithPrototype:(FundAnnoList*) prototype {
  return [[FundAnnoList builder] mergeFrom:prototype];
}
- (FundAnnoList_Builder*) builder {
  return [FundAnnoList builder];
}
@end

@interface FundAnnoList_Builder()
@property (retain) FundAnnoList* result;
@end

@implementation FundAnnoList_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[FundAnnoList alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (FundAnnoList_Builder*) clear {
  self.result = [[[FundAnnoList alloc] init] autorelease];
  return self;
}
- (FundAnnoList_Builder*) clone {
  return [FundAnnoList builderWithPrototype:result];
}
- (FundAnnoList*) defaultInstance {
  return [FundAnnoList defaultInstance];
}
- (FundAnnoList*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (FundAnnoList*) buildPartial {
  FundAnnoList* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (FundAnnoList_Builder*) mergeFrom:(FundAnnoList*) other {
  if (other == [FundAnnoList defaultInstance]) {
    return self;
  }
  if (other.hasCommon) {
    [self mergeCommon:other.common];
  }
  if (other.hasTotalNum) {
    [self setTotalNum:other.totalNum];
  }
  if (other.mutableFndAnnoList.count > 0) {
    if (result.mutableFndAnnoList == nil) {
      result.mutableFndAnnoList = [NSMutableArray array];
    }
    [result.mutableFndAnnoList addObjectsFromArray:other.mutableFndAnnoList];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (FundAnnoList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (FundAnnoList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
      case 16: {
        [self setTotalNum:[input readSInt32]];
        break;
      }
      case 26: {
        FundAnno_Builder* subBuilder = [FundAnno builder];
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self addFndAnno:[subBuilder buildPartial]];
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
- (FundAnnoList_Builder*) setCommon:(Common*) value {
  result.hasCommon = YES;
  result.common = value;
  return self;
}
- (FundAnnoList_Builder*) setCommonBuilder:(Common_Builder*) builderForValue {
  return [self setCommon:[builderForValue build]];
}
- (FundAnnoList_Builder*) mergeCommon:(Common*) value {
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
- (FundAnnoList_Builder*) clearCommon {
  result.hasCommon = NO;
  result.common = [Common defaultInstance];
  return self;
}
- (BOOL) hasTotalNum {
  return result.hasTotalNum;
}
- (int32_t) totalNum {
  return result.totalNum;
}
- (FundAnnoList_Builder*) setTotalNum:(int32_t) value {
  result.hasTotalNum = YES;
  result.totalNum = value;
  return self;
}
- (FundAnnoList_Builder*) clearTotalNum {
  result.hasTotalNum = NO;
  result.totalNum = 0;
  return self;
}
- (NSArray*) fndAnnoList {
  if (result.mutableFndAnnoList == nil) { return [NSArray array]; }
  return result.mutableFndAnnoList;
}
- (FundAnno*) fndAnnoAtIndex:(int32_t) index {
  return [result fndAnnoAtIndex:index];
}
- (FundAnnoList_Builder*) replaceFndAnnoAtIndex:(int32_t) index with:(FundAnno*) value {
  [result.mutableFndAnnoList replaceObjectAtIndex:index withObject:value];
  return self;
}
- (FundAnnoList_Builder*) addAllFndAnno:(NSArray*) values {
  if (result.mutableFndAnnoList == nil) {
    result.mutableFndAnnoList = [NSMutableArray array];
  }
  [result.mutableFndAnnoList addObjectsFromArray:values];
  return self;
}
- (FundAnnoList_Builder*) clearFndAnnoList {
  result.mutableFndAnnoList = nil;
  return self;
}
- (FundAnnoList_Builder*) addFndAnno:(FundAnno*) value {
  if (result.mutableFndAnnoList == nil) {
    result.mutableFndAnnoList = [NSMutableArray array];
  }
  [result.mutableFndAnnoList addObject:value];
  return self;
}
@end

@interface FundAnno ()
@property (retain) NSString* ggbt;
@property (retain) NSString* jlzj;
@property (retain) NSString* ggrq;
@end

@implementation FundAnno

- (BOOL) hasGgbt {
  return !!hasGgbt_;
}
- (void) setHasGgbt:(BOOL) value {
  hasGgbt_ = !!value;
}
@synthesize ggbt;
- (BOOL) hasJlzj {
  return !!hasJlzj_;
}
- (void) setHasJlzj:(BOOL) value {
  hasJlzj_ = !!value;
}
@synthesize jlzj;
- (BOOL) hasGgrq {
  return !!hasGgrq_;
}
- (void) setHasGgrq:(BOOL) value {
  hasGgrq_ = !!value;
}
@synthesize ggrq;
- (void) dealloc {
  self.ggbt = nil;
  self.jlzj = nil;
  self.ggrq = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.ggbt = @"";
    self.jlzj = @"";
    self.ggrq = @"";
  }
  return self;
}
static FundAnno* defaultFundAnnoInstance = nil;
+ (void) initialize {
  if (self == [FundAnno class]) {
    defaultFundAnnoInstance = [[FundAnno alloc] init];
  }
}
+ (FundAnno*) defaultInstance {
  return defaultFundAnnoInstance;
}
- (FundAnno*) defaultInstance {
  return defaultFundAnnoInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasGgbt) {
    [output writeString:1 value:self.ggbt];
  }
  if (self.hasJlzj) {
    [output writeString:2 value:self.jlzj];
  }
  if (self.hasGgrq) {
    [output writeString:3 value:self.ggrq];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasGgbt) {
    size += computeStringSize(1, self.ggbt);
  }
  if (self.hasJlzj) {
    size += computeStringSize(2, self.jlzj);
  }
  if (self.hasGgrq) {
    size += computeStringSize(3, self.ggrq);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (FundAnno*) parseFromData:(NSData*) data {
  return (FundAnno*)[[[FundAnno builder] mergeFromData:data] build];
}
+ (FundAnno*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (FundAnno*)[[[FundAnno builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (FundAnno*) parseFromInputStream:(NSInputStream*) input {
  return (FundAnno*)[[[FundAnno builder] mergeFromInputStream:input] build];
}
+ (FundAnno*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (FundAnno*)[[[FundAnno builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (FundAnno*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (FundAnno*)[[[FundAnno builder] mergeFromCodedInputStream:input] build];
}
+ (FundAnno*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (FundAnno*)[[[FundAnno builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (FundAnno_Builder*) builder {
  return [[[FundAnno_Builder alloc] init] autorelease];
}
+ (FundAnno_Builder*) builderWithPrototype:(FundAnno*) prototype {
  return [[FundAnno builder] mergeFrom:prototype];
}
- (FundAnno_Builder*) builder {
  return [FundAnno builder];
}
@end

@interface FundAnno_Builder()
@property (retain) FundAnno* result;
@end

@implementation FundAnno_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[FundAnno alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (FundAnno_Builder*) clear {
  self.result = [[[FundAnno alloc] init] autorelease];
  return self;
}
- (FundAnno_Builder*) clone {
  return [FundAnno builderWithPrototype:result];
}
- (FundAnno*) defaultInstance {
  return [FundAnno defaultInstance];
}
- (FundAnno*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (FundAnno*) buildPartial {
  FundAnno* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (FundAnno_Builder*) mergeFrom:(FundAnno*) other {
  if (other == [FundAnno defaultInstance]) {
    return self;
  }
  if (other.hasGgbt) {
    [self setGgbt:other.ggbt];
  }
  if (other.hasJlzj) {
    [self setJlzj:other.jlzj];
  }
  if (other.hasGgrq) {
    [self setGgrq:other.ggrq];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (FundAnno_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (FundAnno_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setGgbt:[input readString]];
        break;
      }
      case 18: {
        [self setJlzj:[input readString]];
        break;
      }
      case 26: {
        [self setGgrq:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasGgbt {
  return result.hasGgbt;
}
- (NSString*) ggbt {
  return result.ggbt;
}
- (FundAnno_Builder*) setGgbt:(NSString*) value {
  result.hasGgbt = YES;
  result.ggbt = value;
  return self;
}
- (FundAnno_Builder*) clearGgbt {
  result.hasGgbt = NO;
  result.ggbt = @"";
  return self;
}
- (BOOL) hasJlzj {
  return result.hasJlzj;
}
- (NSString*) jlzj {
  return result.jlzj;
}
- (FundAnno_Builder*) setJlzj:(NSString*) value {
  result.hasJlzj = YES;
  result.jlzj = value;
  return self;
}
- (FundAnno_Builder*) clearJlzj {
  result.hasJlzj = NO;
  result.jlzj = @"";
  return self;
}
- (BOOL) hasGgrq {
  return result.hasGgrq;
}
- (NSString*) ggrq {
  return result.ggrq;
}
- (FundAnno_Builder*) setGgrq:(NSString*) value {
  result.hasGgrq = YES;
  result.ggrq = value;
  return self;
}
- (FundAnno_Builder*) clearGgrq {
  result.hasGgrq = NO;
  result.ggrq = @"";
  return self;
}
@end

