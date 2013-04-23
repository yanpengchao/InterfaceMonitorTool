// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class Opinion;
@class Opinion_Builder;

@interface OpinionRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface Opinion : PBGeneratedMessage {
@private
  BOOL hasTitle_:1;
  BOOL hasLabel_:1;
  BOOL hasTagName_:1;
  BOOL hasInterviewDate_:1;
  BOOL hasOpinionType_:1;
  BOOL hasPublishTime_:1;
  BOOL hasUid_:1;
  NSString* title;
  NSString* label;
  NSString* tagName;
  NSString* interviewDate;
  int32_t opinionType;
  int64_t publishTime;
  int64_t uid;
}
- (BOOL) hasTitle;
- (BOOL) hasLabel;
- (BOOL) hasPublishTime;
- (BOOL) hasOpinionType;
- (BOOL) hasUid;
- (BOOL) hasTagName;
- (BOOL) hasInterviewDate;
@property (readonly, retain) NSString* title;
@property (readonly, retain) NSString* label;
@property (readonly) int64_t publishTime;
@property (readonly) int32_t opinionType;
@property (readonly) int64_t uid;
@property (readonly, retain) NSString* tagName;
@property (readonly, retain) NSString* interviewDate;

+ (Opinion*) defaultInstance;
- (Opinion*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Opinion_Builder*) builder;
+ (Opinion_Builder*) builder;
+ (Opinion_Builder*) builderWithPrototype:(Opinion*) prototype;

+ (Opinion*) parseFromData:(NSData*) data;
+ (Opinion*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Opinion*) parseFromInputStream:(NSInputStream*) input;
+ (Opinion*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Opinion*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Opinion*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Opinion_Builder : PBGeneratedMessage_Builder {
@private
  Opinion* result;
}

- (Opinion*) defaultInstance;

- (Opinion_Builder*) clear;
- (Opinion_Builder*) clone;

- (Opinion*) build;
- (Opinion*) buildPartial;

- (Opinion_Builder*) mergeFrom:(Opinion*) other;
- (Opinion_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Opinion_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasTitle;
- (NSString*) title;
- (Opinion_Builder*) setTitle:(NSString*) value;
- (Opinion_Builder*) clearTitle;

- (BOOL) hasLabel;
- (NSString*) label;
- (Opinion_Builder*) setLabel:(NSString*) value;
- (Opinion_Builder*) clearLabel;

- (BOOL) hasPublishTime;
- (int64_t) publishTime;
- (Opinion_Builder*) setPublishTime:(int64_t) value;
- (Opinion_Builder*) clearPublishTime;

- (BOOL) hasOpinionType;
- (int32_t) opinionType;
- (Opinion_Builder*) setOpinionType:(int32_t) value;
- (Opinion_Builder*) clearOpinionType;

- (BOOL) hasUid;
- (int64_t) uid;
- (Opinion_Builder*) setUid:(int64_t) value;
- (Opinion_Builder*) clearUid;

- (BOOL) hasTagName;
- (NSString*) tagName;
- (Opinion_Builder*) setTagName:(NSString*) value;
- (Opinion_Builder*) clearTagName;

- (BOOL) hasInterviewDate;
- (NSString*) interviewDate;
- (Opinion_Builder*) setInterviewDate:(NSString*) value;
- (Opinion_Builder*) clearInterviewDate;
@end

