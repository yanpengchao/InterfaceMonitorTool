// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ContactInfoList.pb.h"

@implementation ContactInfoListRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [ContactInfoListRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    [ContactInfoRoot registerAllExtensions:registry];
    [CommonRoot registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface ContactInfoList ()
@property (retain) NSString* version;
@property (retain) NSString* channelId;
@property (retain) NSString* productId;
@property (retain) NSString* parPhoneModel;
@property (retain) NSString* subPhoneModel;
@property (retain) NSString* token;
@property (retain) NSString* iVer;
@property (retain) NSMutableArray* mutableContactInfoList;
@end

@implementation ContactInfoList

- (BOOL) hasVersion {
  return !!hasVersion_;
}
- (void) setHasVersion:(BOOL) value {
  hasVersion_ = !!value;
}
@synthesize version;
- (BOOL) hasChannelId {
  return !!hasChannelId_;
}
- (void) setHasChannelId:(BOOL) value {
  hasChannelId_ = !!value;
}
@synthesize channelId;
- (BOOL) hasProductId {
  return !!hasProductId_;
}
- (void) setHasProductId:(BOOL) value {
  hasProductId_ = !!value;
}
@synthesize productId;
- (BOOL) hasParPhoneModel {
  return !!hasParPhoneModel_;
}
- (void) setHasParPhoneModel:(BOOL) value {
  hasParPhoneModel_ = !!value;
}
@synthesize parPhoneModel;
- (BOOL) hasSubPhoneModel {
  return !!hasSubPhoneModel_;
}
- (void) setHasSubPhoneModel:(BOOL) value {
  hasSubPhoneModel_ = !!value;
}
@synthesize subPhoneModel;
- (BOOL) hasToken {
  return !!hasToken_;
}
- (void) setHasToken:(BOOL) value {
  hasToken_ = !!value;
}
@synthesize token;
- (BOOL) hasIVer {
  return !!hasIVer_;
}
- (void) setHasIVer:(BOOL) value {
  hasIVer_ = !!value;
}
@synthesize iVer;
@synthesize mutableContactInfoList;
- (void) dealloc {
  self.version = nil;
  self.channelId = nil;
  self.productId = nil;
  self.parPhoneModel = nil;
  self.subPhoneModel = nil;
  self.token = nil;
  self.iVer = nil;
  self.mutableContactInfoList = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.version = @"";
    self.channelId = @"";
    self.productId = @"";
    self.parPhoneModel = @"";
    self.subPhoneModel = @"";
    self.token = @"";
    self.iVer = @"";
  }
  return self;
}
static ContactInfoList* defaultContactInfoListInstance = nil;
+ (void) initialize {
  if (self == [ContactInfoList class]) {
    defaultContactInfoListInstance = [[ContactInfoList alloc] init];
  }
}
+ (ContactInfoList*) defaultInstance {
  return defaultContactInfoListInstance;
}
- (ContactInfoList*) defaultInstance {
  return defaultContactInfoListInstance;
}
- (NSArray*) contactInfoList {
  return mutableContactInfoList;
}
- (ContactInfo*) contactInfoAtIndex:(int32_t) index {
  id value = [mutableContactInfoList objectAtIndex:index];
  return value;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasVersion) {
    [output writeString:1 value:self.version];
  }
  if (self.hasChannelId) {
    [output writeString:2 value:self.channelId];
  }
  if (self.hasProductId) {
    [output writeString:3 value:self.productId];
  }
  if (self.hasParPhoneModel) {
    [output writeString:4 value:self.parPhoneModel];
  }
  if (self.hasSubPhoneModel) {
    [output writeString:5 value:self.subPhoneModel];
  }
  if (self.hasToken) {
    [output writeString:6 value:self.token];
  }
  if (self.hasIVer) {
    [output writeString:7 value:self.iVer];
  }
  for (ContactInfo* element in self.contactInfoList) {
    [output writeMessage:8 value:element];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasVersion) {
    size += computeStringSize(1, self.version);
  }
  if (self.hasChannelId) {
    size += computeStringSize(2, self.channelId);
  }
  if (self.hasProductId) {
    size += computeStringSize(3, self.productId);
  }
  if (self.hasParPhoneModel) {
    size += computeStringSize(4, self.parPhoneModel);
  }
  if (self.hasSubPhoneModel) {
    size += computeStringSize(5, self.subPhoneModel);
  }
  if (self.hasToken) {
    size += computeStringSize(6, self.token);
  }
  if (self.hasIVer) {
    size += computeStringSize(7, self.iVer);
  }
  for (ContactInfo* element in self.contactInfoList) {
    size += computeMessageSize(8, element);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (ContactInfoList*) parseFromData:(NSData*) data {
  return (ContactInfoList*)[[[ContactInfoList builder] mergeFromData:data] build];
}
+ (ContactInfoList*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ContactInfoList*)[[[ContactInfoList builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (ContactInfoList*) parseFromInputStream:(NSInputStream*) input {
  return (ContactInfoList*)[[[ContactInfoList builder] mergeFromInputStream:input] build];
}
+ (ContactInfoList*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ContactInfoList*)[[[ContactInfoList builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (ContactInfoList*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (ContactInfoList*)[[[ContactInfoList builder] mergeFromCodedInputStream:input] build];
}
+ (ContactInfoList*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ContactInfoList*)[[[ContactInfoList builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (ContactInfoList_Builder*) builder {
  return [[[ContactInfoList_Builder alloc] init] autorelease];
}
+ (ContactInfoList_Builder*) builderWithPrototype:(ContactInfoList*) prototype {
  return [[ContactInfoList builder] mergeFrom:prototype];
}
- (ContactInfoList_Builder*) builder {
  return [ContactInfoList builder];
}
@end

@interface ContactInfoList_Builder()
@property (retain) ContactInfoList* result;
@end

@implementation ContactInfoList_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[ContactInfoList alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (ContactInfoList_Builder*) clear {
  self.result = [[[ContactInfoList alloc] init] autorelease];
  return self;
}
- (ContactInfoList_Builder*) clone {
  return [ContactInfoList builderWithPrototype:result];
}
- (ContactInfoList*) defaultInstance {
  return [ContactInfoList defaultInstance];
}
- (ContactInfoList*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (ContactInfoList*) buildPartial {
  ContactInfoList* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (ContactInfoList_Builder*) mergeFrom:(ContactInfoList*) other {
  if (other == [ContactInfoList defaultInstance]) {
    return self;
  }
  if (other.hasVersion) {
    [self setVersion:other.version];
  }
  if (other.hasChannelId) {
    [self setChannelId:other.channelId];
  }
  if (other.hasProductId) {
    [self setProductId:other.productId];
  }
  if (other.hasParPhoneModel) {
    [self setParPhoneModel:other.parPhoneModel];
  }
  if (other.hasSubPhoneModel) {
    [self setSubPhoneModel:other.subPhoneModel];
  }
  if (other.hasToken) {
    [self setToken:other.token];
  }
  if (other.hasIVer) {
    [self setIVer:other.iVer];
  }
  if (other.mutableContactInfoList.count > 0) {
    if (result.mutableContactInfoList == nil) {
      result.mutableContactInfoList = [NSMutableArray array];
    }
    [result.mutableContactInfoList addObjectsFromArray:other.mutableContactInfoList];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (ContactInfoList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (ContactInfoList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setVersion:[input readString]];
        break;
      }
      case 18: {
        [self setChannelId:[input readString]];
        break;
      }
      case 26: {
        [self setProductId:[input readString]];
        break;
      }
      case 34: {
        [self setParPhoneModel:[input readString]];
        break;
      }
      case 42: {
        [self setSubPhoneModel:[input readString]];
        break;
      }
      case 50: {
        [self setToken:[input readString]];
        break;
      }
      case 58: {
        [self setIVer:[input readString]];
        break;
      }
      case 66: {
        ContactInfo_Builder* subBuilder = [ContactInfo builder];
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self addContactInfo:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (BOOL) hasVersion {
  return result.hasVersion;
}
- (NSString*) version {
  return result.version;
}
- (ContactInfoList_Builder*) setVersion:(NSString*) value {
  result.hasVersion = YES;
  result.version = value;
  return self;
}
- (ContactInfoList_Builder*) clearVersion {
  result.hasVersion = NO;
  result.version = @"";
  return self;
}
- (BOOL) hasChannelId {
  return result.hasChannelId;
}
- (NSString*) channelId {
  return result.channelId;
}
- (ContactInfoList_Builder*) setChannelId:(NSString*) value {
  result.hasChannelId = YES;
  result.channelId = value;
  return self;
}
- (ContactInfoList_Builder*) clearChannelId {
  result.hasChannelId = NO;
  result.channelId = @"";
  return self;
}
- (BOOL) hasProductId {
  return result.hasProductId;
}
- (NSString*) productId {
  return result.productId;
}
- (ContactInfoList_Builder*) setProductId:(NSString*) value {
  result.hasProductId = YES;
  result.productId = value;
  return self;
}
- (ContactInfoList_Builder*) clearProductId {
  result.hasProductId = NO;
  result.productId = @"";
  return self;
}
- (BOOL) hasParPhoneModel {
  return result.hasParPhoneModel;
}
- (NSString*) parPhoneModel {
  return result.parPhoneModel;
}
- (ContactInfoList_Builder*) setParPhoneModel:(NSString*) value {
  result.hasParPhoneModel = YES;
  result.parPhoneModel = value;
  return self;
}
- (ContactInfoList_Builder*) clearParPhoneModel {
  result.hasParPhoneModel = NO;
  result.parPhoneModel = @"";
  return self;
}
- (BOOL) hasSubPhoneModel {
  return result.hasSubPhoneModel;
}
- (NSString*) subPhoneModel {
  return result.subPhoneModel;
}
- (ContactInfoList_Builder*) setSubPhoneModel:(NSString*) value {
  result.hasSubPhoneModel = YES;
  result.subPhoneModel = value;
  return self;
}
- (ContactInfoList_Builder*) clearSubPhoneModel {
  result.hasSubPhoneModel = NO;
  result.subPhoneModel = @"";
  return self;
}
- (BOOL) hasToken {
  return result.hasToken;
}
- (NSString*) token {
  return result.token;
}
- (ContactInfoList_Builder*) setToken:(NSString*) value {
  result.hasToken = YES;
  result.token = value;
  return self;
}
- (ContactInfoList_Builder*) clearToken {
  result.hasToken = NO;
  result.token = @"";
  return self;
}
- (BOOL) hasIVer {
  return result.hasIVer;
}
- (NSString*) iVer {
  return result.iVer;
}
- (ContactInfoList_Builder*) setIVer:(NSString*) value {
  result.hasIVer = YES;
  result.iVer = value;
  return self;
}
- (ContactInfoList_Builder*) clearIVer {
  result.hasIVer = NO;
  result.iVer = @"";
  return self;
}
- (NSArray*) contactInfoList {
  if (result.mutableContactInfoList == nil) { return [NSArray array]; }
  return result.mutableContactInfoList;
}
- (ContactInfo*) contactInfoAtIndex:(int32_t) index {
  return [result contactInfoAtIndex:index];
}
- (ContactInfoList_Builder*) replaceContactInfoAtIndex:(int32_t) index with:(ContactInfo*) value {
  [result.mutableContactInfoList replaceObjectAtIndex:index withObject:value];
  return self;
}
- (ContactInfoList_Builder*) addAllContactInfo:(NSArray*) values {
  if (result.mutableContactInfoList == nil) {
    result.mutableContactInfoList = [NSMutableArray array];
  }
  [result.mutableContactInfoList addObjectsFromArray:values];
  return self;
}
- (ContactInfoList_Builder*) clearContactInfoList {
  result.mutableContactInfoList = nil;
  return self;
}
- (ContactInfoList_Builder*) addContactInfo:(ContactInfo*) value {
  if (result.mutableContactInfoList == nil) {
    result.mutableContactInfoList = [NSMutableArray array];
  }
  [result.mutableContactInfoList addObject:value];
  return self;
}
@end

