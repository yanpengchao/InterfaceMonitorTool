// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class Issue;
@class Issue_Builder;

@interface IssueRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface Issue : PBGeneratedMessage {
@private
  BOOL hasJlzj_:1;
  BOOL hasWzbt_:1;
  BOOL hasFbrq_:1;
  NSString* jlzj;
  NSString* wzbt;
  NSString* fbrq;
}
- (BOOL) hasJlzj;
- (BOOL) hasWzbt;
- (BOOL) hasFbrq;
@property (readonly, retain) NSString* jlzj;
@property (readonly, retain) NSString* wzbt;
@property (readonly, retain) NSString* fbrq;

+ (Issue*) defaultInstance;
- (Issue*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Issue_Builder*) builder;
+ (Issue_Builder*) builder;
+ (Issue_Builder*) builderWithPrototype:(Issue*) prototype;

+ (Issue*) parseFromData:(NSData*) data;
+ (Issue*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Issue*) parseFromInputStream:(NSInputStream*) input;
+ (Issue*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Issue*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Issue*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Issue_Builder : PBGeneratedMessage_Builder {
@private
  Issue* result;
}

- (Issue*) defaultInstance;

- (Issue_Builder*) clear;
- (Issue_Builder*) clone;

- (Issue*) build;
- (Issue*) buildPartial;

- (Issue_Builder*) mergeFrom:(Issue*) other;
- (Issue_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Issue_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasJlzj;
- (NSString*) jlzj;
- (Issue_Builder*) setJlzj:(NSString*) value;
- (Issue_Builder*) clearJlzj;

- (BOOL) hasWzbt;
- (NSString*) wzbt;
- (Issue_Builder*) setWzbt:(NSString*) value;
- (Issue_Builder*) clearWzbt;

- (BOOL) hasFbrq;
- (NSString*) fbrq;
- (Issue_Builder*) setFbrq:(NSString*) value;
- (Issue_Builder*) clearFbrq;
@end
