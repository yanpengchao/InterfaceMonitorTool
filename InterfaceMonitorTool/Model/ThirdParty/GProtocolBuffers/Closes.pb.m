// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Closes.pb.h"

@implementation ClosesRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [ClosesRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

@interface Closes ()
@property (retain) NSString* jjdm;
@property (retain) NSString* jzrq;
@property (retain) NSString* jjjz;
@property (retain) NSString* ljjz;
@property (retain) NSString* zyjl;
@property (retain) NSString* zfxz;
@property (retain) NSString* dqrq;
@end

@implementation Closes

- (BOOL) hasJjdm {
  return !!hasJjdm_;
}
- (void) setHasJjdm:(BOOL) value {
  hasJjdm_ = !!value;
}
@synthesize jjdm;
- (BOOL) hasJzrq {
  return !!hasJzrq_;
}
- (void) setHasJzrq:(BOOL) value {
  hasJzrq_ = !!value;
}
@synthesize jzrq;
- (BOOL) hasJjjz {
  return !!hasJjjz_;
}
- (void) setHasJjjz:(BOOL) value {
  hasJjjz_ = !!value;
}
@synthesize jjjz;
- (BOOL) hasLjjz {
  return !!hasLjjz_;
}
- (void) setHasLjjz:(BOOL) value {
  hasLjjz_ = !!value;
}
@synthesize ljjz;
- (BOOL) hasZyjl {
  return !!hasZyjl_;
}
- (void) setHasZyjl:(BOOL) value {
  hasZyjl_ = !!value;
}
@synthesize zyjl;
- (BOOL) hasZfxz {
  return !!hasZfxz_;
}
- (void) setHasZfxz:(BOOL) value {
  hasZfxz_ = !!value;
}
@synthesize zfxz;
- (BOOL) hasDqrq {
  return !!hasDqrq_;
}
- (void) setHasDqrq:(BOOL) value {
  hasDqrq_ = !!value;
}
@synthesize dqrq;
- (void) dealloc {
  self.jjdm = nil;
  self.jzrq = nil;
  self.jjjz = nil;
  self.ljjz = nil;
  self.zyjl = nil;
  self.zfxz = nil;
  self.dqrq = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.jjdm = @"";
    self.jzrq = @"";
    self.jjjz = @"";
    self.ljjz = @"";
    self.zyjl = @"";
    self.zfxz = @"";
    self.dqrq = @"";
  }
  return self;
}
static Closes* defaultClosesInstance = nil;
+ (void) initialize {
  if (self == [Closes class]) {
    defaultClosesInstance = [[Closes alloc] init];
  }
}
+ (Closes*) defaultInstance {
  return defaultClosesInstance;
}
- (Closes*) defaultInstance {
  return defaultClosesInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasJjdm) {
    [output writeString:1 value:self.jjdm];
  }
  if (self.hasJzrq) {
    [output writeString:2 value:self.jzrq];
  }
  if (self.hasJjjz) {
    [output writeString:3 value:self.jjjz];
  }
  if (self.hasLjjz) {
    [output writeString:4 value:self.ljjz];
  }
  if (self.hasZyjl) {
    [output writeString:5 value:self.zyjl];
  }
  if (self.hasZfxz) {
    [output writeString:6 value:self.zfxz];
  }
  if (self.hasDqrq) {
    [output writeString:7 value:self.dqrq];
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
  if (self.hasJzrq) {
    size += computeStringSize(2, self.jzrq);
  }
  if (self.hasJjjz) {
    size += computeStringSize(3, self.jjjz);
  }
  if (self.hasLjjz) {
    size += computeStringSize(4, self.ljjz);
  }
  if (self.hasZyjl) {
    size += computeStringSize(5, self.zyjl);
  }
  if (self.hasZfxz) {
    size += computeStringSize(6, self.zfxz);
  }
  if (self.hasDqrq) {
    size += computeStringSize(7, self.dqrq);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (Closes*) parseFromData:(NSData*) data {
  return (Closes*)[[[Closes builder] mergeFromData:data] build];
}
+ (Closes*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Closes*)[[[Closes builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (Closes*) parseFromInputStream:(NSInputStream*) input {
  return (Closes*)[[[Closes builder] mergeFromInputStream:input] build];
}
+ (Closes*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Closes*)[[[Closes builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Closes*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (Closes*)[[[Closes builder] mergeFromCodedInputStream:input] build];
}
+ (Closes*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (Closes*)[[[Closes builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (Closes_Builder*) builder {
  return [[[Closes_Builder alloc] init] autorelease];
}
+ (Closes_Builder*) builderWithPrototype:(Closes*) prototype {
  return [[Closes builder] mergeFrom:prototype];
}
- (Closes_Builder*) builder {
  return [Closes builder];
}
@end

@interface Closes_Builder()
@property (retain) Closes* result;
@end

@implementation Closes_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[Closes alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (Closes_Builder*) clear {
  self.result = [[[Closes alloc] init] autorelease];
  return self;
}
- (Closes_Builder*) clone {
  return [Closes builderWithPrototype:result];
}
- (Closes*) defaultInstance {
  return [Closes defaultInstance];
}
- (Closes*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (Closes*) buildPartial {
  Closes* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (Closes_Builder*) mergeFrom:(Closes*) other {
  if (other == [Closes defaultInstance]) {
    return self;
  }
  if (other.hasJjdm) {
    [self setJjdm:other.jjdm];
  }
  if (other.hasJzrq) {
    [self setJzrq:other.jzrq];
  }
  if (other.hasJjjz) {
    [self setJjjz:other.jjjz];
  }
  if (other.hasLjjz) {
    [self setLjjz:other.ljjz];
  }
  if (other.hasZyjl) {
    [self setZyjl:other.zyjl];
  }
  if (other.hasZfxz) {
    [self setZfxz:other.zfxz];
  }
  if (other.hasDqrq) {
    [self setDqrq:other.dqrq];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (Closes_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (Closes_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setJzrq:[input readString]];
        break;
      }
      case 26: {
        [self setJjjz:[input readString]];
        break;
      }
      case 34: {
        [self setLjjz:[input readString]];
        break;
      }
      case 42: {
        [self setZyjl:[input readString]];
        break;
      }
      case 50: {
        [self setZfxz:[input readString]];
        break;
      }
      case 58: {
        [self setDqrq:[input readString]];
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
- (Closes_Builder*) setJjdm:(NSString*) value {
  result.hasJjdm = YES;
  result.jjdm = value;
  return self;
}
- (Closes_Builder*) clearJjdm {
  result.hasJjdm = NO;
  result.jjdm = @"";
  return self;
}
- (BOOL) hasJzrq {
  return result.hasJzrq;
}
- (NSString*) jzrq {
  return result.jzrq;
}
- (Closes_Builder*) setJzrq:(NSString*) value {
  result.hasJzrq = YES;
  result.jzrq = value;
  return self;
}
- (Closes_Builder*) clearJzrq {
  result.hasJzrq = NO;
  result.jzrq = @"";
  return self;
}
- (BOOL) hasJjjz {
  return result.hasJjjz;
}
- (NSString*) jjjz {
  return result.jjjz;
}
- (Closes_Builder*) setJjjz:(NSString*) value {
  result.hasJjjz = YES;
  result.jjjz = value;
  return self;
}
- (Closes_Builder*) clearJjjz {
  result.hasJjjz = NO;
  result.jjjz = @"";
  return self;
}
- (BOOL) hasLjjz {
  return result.hasLjjz;
}
- (NSString*) ljjz {
  return result.ljjz;
}
- (Closes_Builder*) setLjjz:(NSString*) value {
  result.hasLjjz = YES;
  result.ljjz = value;
  return self;
}
- (Closes_Builder*) clearLjjz {
  result.hasLjjz = NO;
  result.ljjz = @"";
  return self;
}
- (BOOL) hasZyjl {
  return result.hasZyjl;
}
- (NSString*) zyjl {
  return result.zyjl;
}
- (Closes_Builder*) setZyjl:(NSString*) value {
  result.hasZyjl = YES;
  result.zyjl = value;
  return self;
}
- (Closes_Builder*) clearZyjl {
  result.hasZyjl = NO;
  result.zyjl = @"";
  return self;
}
- (BOOL) hasZfxz {
  return result.hasZfxz;
}
- (NSString*) zfxz {
  return result.zfxz;
}
- (Closes_Builder*) setZfxz:(NSString*) value {
  result.hasZfxz = YES;
  result.zfxz = value;
  return self;
}
- (Closes_Builder*) clearZfxz {
  result.hasZfxz = NO;
  result.zfxz = @"";
  return self;
}
- (BOOL) hasDqrq {
  return result.hasDqrq;
}
- (NSString*) dqrq {
  return result.dqrq;
}
- (Closes_Builder*) setDqrq:(NSString*) value {
  result.hasDqrq = YES;
  result.dqrq = value;
  return self;
}
- (Closes_Builder*) clearDqrq {
  result.hasDqrq = NO;
  result.dqrq = @"";
  return self;
}
@end

