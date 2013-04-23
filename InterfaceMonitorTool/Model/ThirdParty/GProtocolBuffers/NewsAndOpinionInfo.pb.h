// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "NewsOpinion.pb.h"
#import "Common.pb.h"

@class Common;
@class Common_Builder;
@class NewsAndOpinionInfo;
@class NewsAndOpinionInfo_Builder;
@class NewsOpinion;
@class NewsOpinion_Builder;

@interface NewsAndOpinionInfoRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface NewsAndOpinionInfo : PBGeneratedMessage {
@private
  BOOL hasCommon_:1;
  BOOL hasTotalNum_:1;
  Common* common;
  int32_t totalNum;
  NSMutableArray* mutableContentListList;
}
- (BOOL) hasCommon;
- (BOOL) hasTotalNum;
@property (readonly, retain) Common* common;
@property (readonly) int32_t totalNum;
- (NSArray*) contentListList;
- (NewsOpinion*) contentListAtIndex:(int32_t) index;

+ (NewsAndOpinionInfo*) defaultInstance;
- (NewsAndOpinionInfo*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (NewsAndOpinionInfo_Builder*) builder;
+ (NewsAndOpinionInfo_Builder*) builder;
+ (NewsAndOpinionInfo_Builder*) builderWithPrototype:(NewsAndOpinionInfo*) prototype;

+ (NewsAndOpinionInfo*) parseFromData:(NSData*) data;
+ (NewsAndOpinionInfo*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (NewsAndOpinionInfo*) parseFromInputStream:(NSInputStream*) input;
+ (NewsAndOpinionInfo*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (NewsAndOpinionInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (NewsAndOpinionInfo*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface NewsAndOpinionInfo_Builder : PBGeneratedMessage_Builder {
@private
  NewsAndOpinionInfo* result;
}

- (NewsAndOpinionInfo*) defaultInstance;

- (NewsAndOpinionInfo_Builder*) clear;
- (NewsAndOpinionInfo_Builder*) clone;

- (NewsAndOpinionInfo*) build;
- (NewsAndOpinionInfo*) buildPartial;

- (NewsAndOpinionInfo_Builder*) mergeFrom:(NewsAndOpinionInfo*) other;
- (NewsAndOpinionInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (NewsAndOpinionInfo_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasCommon;
- (Common*) common;
- (NewsAndOpinionInfo_Builder*) setCommon:(Common*) value;
- (NewsAndOpinionInfo_Builder*) setCommonBuilder:(Common_Builder*) builderForValue;
- (NewsAndOpinionInfo_Builder*) mergeCommon:(Common*) value;
- (NewsAndOpinionInfo_Builder*) clearCommon;

- (BOOL) hasTotalNum;
- (int32_t) totalNum;
- (NewsAndOpinionInfo_Builder*) setTotalNum:(int32_t) value;
- (NewsAndOpinionInfo_Builder*) clearTotalNum;

- (NSArray*) contentListList;
- (NewsOpinion*) contentListAtIndex:(int32_t) index;
- (NewsAndOpinionInfo_Builder*) replaceContentListAtIndex:(int32_t) index with:(NewsOpinion*) value;
- (NewsAndOpinionInfo_Builder*) addContentList:(NewsOpinion*) value;
- (NewsAndOpinionInfo_Builder*) addAllContentList:(NSArray*) values;
- (NewsAndOpinionInfo_Builder*) clearContentListList;
@end
