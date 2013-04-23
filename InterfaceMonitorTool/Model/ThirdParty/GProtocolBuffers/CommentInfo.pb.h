// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class CommentInfo;
@class CommentInfo_Builder;

@interface CommentInfoRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface CommentInfo : PBGeneratedMessage {
@private
  BOOL hasCommentId_:1;
  BOOL hasUserName_:1;
  BOOL hasComments_:1;
  BOOL hasPostTime_:1;
  BOOL hasRefUserName_:1;
  BOOL hasRefComments_:1;
  NSString* commentId;
  NSString* userName;
  NSString* comments;
  NSString* postTime;
  NSString* refUserName;
  NSString* refComments;
}
- (BOOL) hasCommentId;
- (BOOL) hasUserName;
- (BOOL) hasComments;
- (BOOL) hasPostTime;
- (BOOL) hasRefUserName;
- (BOOL) hasRefComments;
@property (readonly, retain) NSString* commentId;
@property (readonly, retain) NSString* userName;
@property (readonly, retain) NSString* comments;
@property (readonly, retain) NSString* postTime;
@property (readonly, retain) NSString* refUserName;
@property (readonly, retain) NSString* refComments;

+ (CommentInfo*) defaultInstance;
- (CommentInfo*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (CommentInfo_Builder*) builder;
+ (CommentInfo_Builder*) builder;
+ (CommentInfo_Builder*) builderWithPrototype:(CommentInfo*) prototype;

+ (CommentInfo*) parseFromData:(NSData*) data;
+ (CommentInfo*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CommentInfo*) parseFromInputStream:(NSInputStream*) input;
+ (CommentInfo*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CommentInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (CommentInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface CommentInfo_Builder : PBGeneratedMessage_Builder {
@private
  CommentInfo* result;
}

- (CommentInfo*) defaultInstance;

- (CommentInfo_Builder*) clear;
- (CommentInfo_Builder*) clone;

- (CommentInfo*) build;
- (CommentInfo*) buildPartial;

- (CommentInfo_Builder*) mergeFrom:(CommentInfo*) other;
- (CommentInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (CommentInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCommentId;
- (NSString*) commentId;
- (CommentInfo_Builder*) setCommentId:(NSString*) value;
- (CommentInfo_Builder*) clearCommentId;

- (BOOL) hasUserName;
- (NSString*) userName;
- (CommentInfo_Builder*) setUserName:(NSString*) value;
- (CommentInfo_Builder*) clearUserName;

- (BOOL) hasComments;
- (NSString*) comments;
- (CommentInfo_Builder*) setComments:(NSString*) value;
- (CommentInfo_Builder*) clearComments;

- (BOOL) hasPostTime;
- (NSString*) postTime;
- (CommentInfo_Builder*) setPostTime:(NSString*) value;
- (CommentInfo_Builder*) clearPostTime;

- (BOOL) hasRefUserName;
- (NSString*) refUserName;
- (CommentInfo_Builder*) setRefUserName:(NSString*) value;
- (CommentInfo_Builder*) clearRefUserName;

- (BOOL) hasRefComments;
- (NSString*) refComments;
- (CommentInfo_Builder*) setRefComments:(NSString*) value;
- (CommentInfo_Builder*) clearRefComments;
@end
