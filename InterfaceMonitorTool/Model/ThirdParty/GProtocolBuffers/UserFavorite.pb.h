// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class UserFavorite;
@class UserFavorite_Builder;

@interface UserFavoriteRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface UserFavorite : PBGeneratedMessage {
@private
  BOOL hasFavoriteObject_:1;
  NSString* favoriteObject;
}
- (BOOL) hasFavoriteObject;
@property (readonly, retain) NSString* favoriteObject;

+ (UserFavorite*) defaultInstance;
- (UserFavorite*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (UserFavorite_Builder*) builder;
+ (UserFavorite_Builder*) builder;
+ (UserFavorite_Builder*) builderWithPrototype:(UserFavorite*) prototype;

+ (UserFavorite*) parseFromData:(NSData*) data;
+ (UserFavorite*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (UserFavorite*) parseFromInputStream:(NSInputStream*) input;
+ (UserFavorite*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (UserFavorite*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (UserFavorite*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface UserFavorite_Builder : PBGeneratedMessage_Builder {
@private
  UserFavorite* result;
}

- (UserFavorite*) defaultInstance;

- (UserFavorite_Builder*) clear;
- (UserFavorite_Builder*) clone;

- (UserFavorite*) build;
- (UserFavorite*) buildPartial;

- (UserFavorite_Builder*) mergeFrom:(UserFavorite*) other;
- (UserFavorite_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (UserFavorite_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasFavoriteObject;
- (NSString*) favoriteObject;
- (UserFavorite_Builder*) setFavoriteObject:(NSString*) value;
- (UserFavorite_Builder*) clearFavoriteObject;
@end
