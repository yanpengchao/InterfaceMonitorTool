// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "CommentInfo.pb.h"
#import "Common.pb.h"

@class CommentInfo;
@class CommentInfoList;
@class CommentInfoList_Builder;
@class CommentInfo_Builder;
@class Common;
@class Common_Builder;

@interface CommentInfoListRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface CommentInfoList : PBGeneratedMessage {
@private
  BOOL hasCommon_:1;
  BOOL hasTotalNum_:1;
  Common* common;
  int32_t totalNum;
  NSMutableArray* mutableCommentInfoList;
}
- (BOOL) hasCommon;
- (BOOL) hasTotalNum;
@property (readonly, retain) Common* common;
@property (readonly) int32_t totalNum;
- (NSArray*) commentInfoList;
- (CommentInfo*) commentInfoAtIndex:(int32_t) index;

+ (CommentInfoList*) defaultInstance;
- (CommentInfoList*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (CommentInfoList_Builder*) builder;
+ (CommentInfoList_Builder*) builder;
+ (CommentInfoList_Builder*) builderWithPrototype:(CommentInfoList*) prototype;

+ (CommentInfoList*) parseFromData:(NSData*) data;
+ (CommentInfoList*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CommentInfoList*) parseFromInputStream:(NSInputStream*) input;
+ (CommentInfoList*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (CommentInfoList*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (CommentInfoList*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface CommentInfoList_Builder : PBGeneratedMessage_Builder {
@private
  CommentInfoList* result;
}

- (CommentInfoList*) defaultInstance;

- (CommentInfoList_Builder*) clear;
- (CommentInfoList_Builder*) clone;

- (CommentInfoList*) build;
- (CommentInfoList*) buildPartial;

- (CommentInfoList_Builder*) mergeFrom:(CommentInfoList*) other;
- (CommentInfoList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (CommentInfoList_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCommon;
- (Common*) common;
- (CommentInfoList_Builder*) setCommon:(Common*) value;
- (CommentInfoList_Builder*) setCommonBuilder:(Common_Builder*) builderForValue;
- (CommentInfoList_Builder*) mergeCommon:(Common*) value;
- (CommentInfoList_Builder*) clearCommon;

- (BOOL) hasTotalNum;
- (int32_t) totalNum;
- (CommentInfoList_Builder*) setTotalNum:(int32_t) value;
- (CommentInfoList_Builder*) clearTotalNum;

- (NSArray*) commentInfoList;
- (CommentInfo*) commentInfoAtIndex:(int32_t) index;
- (CommentInfoList_Builder*) replaceCommentInfoAtIndex:(int32_t) index with:(CommentInfo*) value;
- (CommentInfoList_Builder*) addCommentInfo:(CommentInfo*) value;
- (CommentInfoList_Builder*) addAllCommentInfo:(NSArray*) values;
- (CommentInfoList_Builder*) clearCommentInfoList;
@end

