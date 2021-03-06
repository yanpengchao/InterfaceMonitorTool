// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "MoneysOfPage.pb.h"

@implementation MoneysOfPageRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [MoneysOfPageRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface MoneysOfPage ()
@property (retain) NSString* jjdm;
@property (retain) NSString* jjjc;
@property (retain) NSString* jzrq;
@property (retain) NSString* wfsy;
@property (retain) NSString* qrsy;
@property (retain) NSString* zfxz;
@property (retain) NSString* hb1Y;
@property (retain) NSString* hbjn;
@property (retain) NSString* order;
@property (retain) NSString* jjfl;
@property (retain) NSString* hb3Y;
@property (retain) NSString* hb6Y;
@property (retain) NSString* hb1N;
@end

@implementation MoneysOfPage

- (BOOL) hasJjdm {
  return !!hasJjdm_;
}
- (void) setHasJjdm:(BOOL) value {
  hasJjdm_ = !!value;
}
@synthesize jjdm;
- (BOOL) hasJjjc {
  return !!hasJjjc_;
}
- (void) setHasJjjc:(BOOL) value {
  hasJjjc_ = !!value;
}
@synthesize jjjc;
- (BOOL) hasJzrq {
  return !!hasJzrq_;
}
- (void) setHasJzrq:(BOOL) value {
  hasJzrq_ = !!value;
}
@synthesize jzrq;
- (BOOL) hasWfsy {
  return !!hasWfsy_;
}
- (void) setHasWfsy:(BOOL) value {
  hasWfsy_ = !!value;
}
@synthesize wfsy;
- (BOOL) hasQrsy {
  return !!hasQrsy_;
}
- (void) setHasQrsy:(BOOL) value {
  hasQrsy_ = !!value;
}
@synthesize qrsy;
- (BOOL) hasZfxz {
  return !!hasZfxz_;
}
- (void) setHasZfxz:(BOOL) value {
  hasZfxz_ = !!value;
}
@synthesize zfxz;
- (BOOL) hasHb1Y {
  return !!hasHb1Y_;
}
- (void) setHasHb1Y:(BOOL) value {
  hasHb1Y_ = !!value;
}
@synthesize hb1Y;
- (BOOL) hasHbjn {
  return !!hasHbjn_;
}
- (void) setHasHbjn:(BOOL) value {
  hasHbjn_ = !!value;
}
@synthesize hbjn;
- (BOOL) hasOrder {
  return !!hasOrder_;
}
- (void) setHasOrder:(BOOL) value {
  hasOrder_ = !!value;
}
@synthesize order;
- (BOOL) hasJjfl {
  return !!hasJjfl_;
}
- (void) setHasJjfl:(BOOL) value {
  hasJjfl_ = !!value;
}
@synthesize jjfl;
- (BOOL) hasHb3Y {
  return !!hasHb3Y_;
}
- (void) setHasHb3Y:(BOOL) value {
  hasHb3Y_ = !!value;
}
@synthesize hb3Y;
- (BOOL) hasHb6Y {
  return !!hasHb6Y_;
}
- (void) setHasHb6Y:(BOOL) value {
  hasHb6Y_ = !!value;
}
@synthesize hb6Y;
- (BOOL) hasHb1N {
  return !!hasHb1N_;
}
- (void) setHasHb1N:(BOOL) value {
  hasHb1N_ = !!value;
}
@synthesize hb1N;
- (void) dealloc {
  self.jjdm = nil;
  self.jjjc = nil;
  self.jzrq = nil;
  self.wfsy = nil;
  self.qrsy = nil;
  self.zfxz = nil;
  self.hb1Y = nil;
  self.hbjn = nil;
  self.order = nil;
  self.jjfl = nil;
  self.hb3Y = nil;
  self.hb6Y = nil;
  self.hb1N = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.jjdm = @"";
    self.jjjc = @"";
    self.jzrq = @"";
    self.wfsy = @"";
    self.qrsy = @"";
    self.zfxz = @"";
    self.hb1Y = @"";
    self.hbjn = @"";
    self.order = @"";
    self.jjfl = @"";
    self.hb3Y = @"";
    self.hb6Y = @"";
    self.hb1N = @"";
  }
  return self;
}
static MoneysOfPage* defaultMoneysOfPageInstance = nil;
+ (void) initialize {
  if (self == [MoneysOfPage class]) {
    defaultMoneysOfPageInstance = [[MoneysOfPage alloc] init];
  }
}
+ (MoneysOfPage*) defaultInstance {
  return defaultMoneysOfPageInstance;
}
- (MoneysOfPage*) defaultInstance {
  return defaultMoneysOfPageInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasJjdm) {
    [output writeString:1 value:self.jjdm];
  }
  if (self.hasJjjc) {
    [output writeString:2 value:self.jjjc];
  }
  if (self.hasJzrq) {
    [output writeString:3 value:self.jzrq];
  }
  if (self.hasWfsy) {
    [output writeString:4 value:self.wfsy];
  }
  if (self.hasQrsy) {
    [output writeString:5 value:self.qrsy];
  }
  if (self.hasZfxz) {
    [output writeString:6 value:self.zfxz];
  }
  if (self.hasHb1Y) {
    [output writeString:7 value:self.hb1Y];
  }
  if (self.hasHbjn) {
    [output writeString:8 value:self.hbjn];
  }
  if (self.hasOrder) {
    [output writeString:9 value:self.order];
  }
  if (self.hasJjfl) {
    [output writeString:10 value:self.jjfl];
  }
  if (self.hasHb3Y) {
    [output writeString:11 value:self.hb3Y];
  }
  if (self.hasHb6Y) {
    [output writeString:12 value:self.hb6Y];
  }
  if (self.hasHb1N) {
    [output writeString:13 value:self.hb1N];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasJjdm) {
    size += computeStringSize(1, self.jjdm);
  }
  if (self.hasJjjc) {
    size += computeStringSize(2, self.jjjc);
  }
  if (self.hasJzrq) {
    size += computeStringSize(3, self.jzrq);
  }
  if (self.hasWfsy) {
    size += computeStringSize(4, self.wfsy);
  }
  if (self.hasQrsy) {
    size += computeStringSize(5, self.qrsy);
  }
  if (self.hasZfxz) {
    size += computeStringSize(6, self.zfxz);
  }
  if (self.hasHb1Y) {
    size += computeStringSize(7, self.hb1Y);
  }
  if (self.hasHbjn) {
    size += computeStringSize(8, self.hbjn);
  }
  if (self.hasOrder) {
    size += computeStringSize(9, self.order);
  }
  if (self.hasJjfl) {
    size += computeStringSize(10, self.jjfl);
  }
  if (self.hasHb3Y) {
    size += computeStringSize(11, self.hb3Y);
  }
  if (self.hasHb6Y) {
    size += computeStringSize(12, self.hb6Y);
  }
  if (self.hasHb1N) {
    size += computeStringSize(13, self.hb1N);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (MoneysOfPage*) parseFromData:(NSData*) data {
  return (MoneysOfPage*)[[[MoneysOfPage builder] mergeFromData:data] build];
}
+ (MoneysOfPage*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MoneysOfPage*)[[[MoneysOfPage builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (MoneysOfPage*) parseFromInputStream:(NSInputStream*) input {
  return (MoneysOfPage*)[[[MoneysOfPage builder] mergeFromInputStream:input] build];
}
+ (MoneysOfPage*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MoneysOfPage*)[[[MoneysOfPage builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (MoneysOfPage*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (MoneysOfPage*)[[[MoneysOfPage builder] mergeFromCodedInputStream:input] build];
}
+ (MoneysOfPage*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (MoneysOfPage*)[[[MoneysOfPage builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (MoneysOfPage_Builder*) builder {
  return [[[MoneysOfPage_Builder alloc] init] autorelease];
}
+ (MoneysOfPage_Builder*) builderWithPrototype:(MoneysOfPage*) prototype {
  return [[MoneysOfPage builder] mergeFrom:prototype];
}
- (MoneysOfPage_Builder*) builder {
  return [MoneysOfPage builder];
}
@end

@interface MoneysOfPage_Builder()
@property (retain) MoneysOfPage* result;
@end

@implementation MoneysOfPage_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[MoneysOfPage alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (MoneysOfPage_Builder*) clear {
  self.result = [[[MoneysOfPage alloc] init] autorelease];
  return self;
}
- (MoneysOfPage_Builder*) clone {
  return [MoneysOfPage builderWithPrototype:result];
}
- (MoneysOfPage*) defaultInstance {
  return [MoneysOfPage defaultInstance];
}
- (MoneysOfPage*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (MoneysOfPage*) buildPartial {
  MoneysOfPage* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (MoneysOfPage_Builder*) mergeFrom:(MoneysOfPage*) other {
  if (other == [MoneysOfPage defaultInstance]) {
    return self;
  }
  if (other.hasJjdm) {
    [self setJjdm:other.jjdm];
  }
  if (other.hasJjjc) {
    [self setJjjc:other.jjjc];
  }
  if (other.hasJzrq) {
    [self setJzrq:other.jzrq];
  }
  if (other.hasWfsy) {
    [self setWfsy:other.wfsy];
  }
  if (other.hasQrsy) {
    [self setQrsy:other.qrsy];
  }
  if (other.hasZfxz) {
    [self setZfxz:other.zfxz];
  }
  if (other.hasHb1Y) {
    [self setHb1Y:other.hb1Y];
  }
  if (other.hasHbjn) {
    [self setHbjn:other.hbjn];
  }
  if (other.hasOrder) {
    [self setOrder:other.order];
  }
  if (other.hasJjfl) {
    [self setJjfl:other.jjfl];
  }
  if (other.hasHb3Y) {
    [self setHb3Y:other.hb3Y];
  }
  if (other.hasHb6Y) {
    [self setHb6Y:other.hb6Y];
  }
  if (other.hasHb1N) {
    [self setHb1N:other.hb1N];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (MoneysOfPage_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (MoneysOfPage_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setJjdm:[input readString]];
        break;
      }
      case 18: {
        [self setJjjc:[input readString]];
        break;
      }
      case 26: {
        [self setJzrq:[input readString]];
        break;
      }
      case 34: {
        [self setWfsy:[input readString]];
        break;
      }
      case 42: {
        [self setQrsy:[input readString]];
        break;
      }
      case 50: {
        [self setZfxz:[input readString]];
        break;
      }
      case 58: {
        [self setHb1Y:[input readString]];
        break;
      }
      case 66: {
        [self setHbjn:[input readString]];
        break;
      }
      case 74: {
        [self setOrder:[input readString]];
        break;
      }
      case 82: {
        [self setJjfl:[input readString]];
        break;
      }
      case 90: {
        [self setHb3Y:[input readString]];
        break;
      }
      case 98: {
        [self setHb6Y:[input readString]];
        break;
      }
      case 106: {
        [self setHb1N:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasJjdm {
  return result.hasJjdm;
}
- (NSString*) jjdm {
  return result.jjdm;
}
- (MoneysOfPage_Builder*) setJjdm:(NSString*) value {
  result.hasJjdm = YES;
  result.jjdm = value;
  return self;
}
- (MoneysOfPage_Builder*) clearJjdm {
  result.hasJjdm = NO;
  result.jjdm = @"";
  return self;
}
- (BOOL) hasJjjc {
  return result.hasJjjc;
}
- (NSString*) jjjc {
  return result.jjjc;
}
- (MoneysOfPage_Builder*) setJjjc:(NSString*) value {
  result.hasJjjc = YES;
  result.jjjc = value;
  return self;
}
- (MoneysOfPage_Builder*) clearJjjc {
  result.hasJjjc = NO;
  result.jjjc = @"";
  return self;
}
- (BOOL) hasJzrq {
  return result.hasJzrq;
}
- (NSString*) jzrq {
  return result.jzrq;
}
- (MoneysOfPage_Builder*) setJzrq:(NSString*) value {
  result.hasJzrq = YES;
  result.jzrq = value;
  return self;
}
- (MoneysOfPage_Builder*) clearJzrq {
  result.hasJzrq = NO;
  result.jzrq = @"";
  return self;
}
- (BOOL) hasWfsy {
  return result.hasWfsy;
}
- (NSString*) wfsy {
  return result.wfsy;
}
- (MoneysOfPage_Builder*) setWfsy:(NSString*) value {
  result.hasWfsy = YES;
  result.wfsy = value;
  return self;
}
- (MoneysOfPage_Builder*) clearWfsy {
  result.hasWfsy = NO;
  result.wfsy = @"";
  return self;
}
- (BOOL) hasQrsy {
  return result.hasQrsy;
}
- (NSString*) qrsy {
  return result.qrsy;
}
- (MoneysOfPage_Builder*) setQrsy:(NSString*) value {
  result.hasQrsy = YES;
  result.qrsy = value;
  return self;
}
- (MoneysOfPage_Builder*) clearQrsy {
  result.hasQrsy = NO;
  result.qrsy = @"";
  return self;
}
- (BOOL) hasZfxz {
  return result.hasZfxz;
}
- (NSString*) zfxz {
  return result.zfxz;
}
- (MoneysOfPage_Builder*) setZfxz:(NSString*) value {
  result.hasZfxz = YES;
  result.zfxz = value;
  return self;
}
- (MoneysOfPage_Builder*) clearZfxz {
  result.hasZfxz = NO;
  result.zfxz = @"";
  return self;
}
- (BOOL) hasHb1Y {
  return result.hasHb1Y;
}
- (NSString*) hb1Y {
  return result.hb1Y;
}
- (MoneysOfPage_Builder*) setHb1Y:(NSString*) value {
  result.hasHb1Y = YES;
  result.hb1Y = value;
  return self;
}
- (MoneysOfPage_Builder*) clearHb1Y {
  result.hasHb1Y = NO;
  result.hb1Y = @"";
  return self;
}
- (BOOL) hasHbjn {
  return result.hasHbjn;
}
- (NSString*) hbjn {
  return result.hbjn;
}
- (MoneysOfPage_Builder*) setHbjn:(NSString*) value {
  result.hasHbjn = YES;
  result.hbjn = value;
  return self;
}
- (MoneysOfPage_Builder*) clearHbjn {
  result.hasHbjn = NO;
  result.hbjn = @"";
  return self;
}
- (BOOL) hasOrder {
  return result.hasOrder;
}
- (NSString*) order {
  return result.order;
}
- (MoneysOfPage_Builder*) setOrder:(NSString*) value {
  result.hasOrder = YES;
  result.order = value;
  return self;
}
- (MoneysOfPage_Builder*) clearOrder {
  result.hasOrder = NO;
  result.order = @"";
  return self;
}
- (BOOL) hasJjfl {
  return result.hasJjfl;
}
- (NSString*) jjfl {
  return result.jjfl;
}
- (MoneysOfPage_Builder*) setJjfl:(NSString*) value {
  result.hasJjfl = YES;
  result.jjfl = value;
  return self;
}
- (MoneysOfPage_Builder*) clearJjfl {
  result.hasJjfl = NO;
  result.jjfl = @"";
  return self;
}
- (BOOL) hasHb3Y {
  return result.hasHb3Y;
}
- (NSString*) hb3Y {
  return result.hb3Y;
}
- (MoneysOfPage_Builder*) setHb3Y:(NSString*) value {
  result.hasHb3Y = YES;
  result.hb3Y = value;
  return self;
}
- (MoneysOfPage_Builder*) clearHb3Y {
  result.hasHb3Y = NO;
  result.hb3Y = @"";
  return self;
}
- (BOOL) hasHb6Y {
  return result.hasHb6Y;
}
- (NSString*) hb6Y {
  return result.hb6Y;
}
- (MoneysOfPage_Builder*) setHb6Y:(NSString*) value {
  result.hasHb6Y = YES;
  result.hb6Y = value;
  return self;
}
- (MoneysOfPage_Builder*) clearHb6Y {
  result.hasHb6Y = NO;
  result.hb6Y = @"";
  return self;
}
- (BOOL) hasHb1N {
  return result.hasHb1N;
}
- (NSString*) hb1N {
  return result.hb1N;
}
- (MoneysOfPage_Builder*) setHb1N:(NSString*) value {
  result.hasHb1N = YES;
  result.hb1N = value;
  return self;
}
- (MoneysOfPage_Builder*) clearHb1N {
  result.hasHb1N = NO;
  result.hb1N = @"";
  return self;
}
@end

