// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "Common.pb.h"
#import "PhoneNewsType.pb.h"
#import "PhoneOpinionType.pb.h"

@class Common;
@class Common_Builder;
@class HostDistribution;
@class HostDistribution_Builder;
@class PhoneNewsType;
@class PhoneNewsType_Builder;
@class PhoneOpinionType;
@class PhoneOpinionType_Builder;

@interface HostDistributionRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface HostDistribution : PBGeneratedMessage {
@private
  BOOL hasServerTime_:1;
  BOOL hasUpdateDesc_:1;
  BOOL hasDtNeedUpdate_:1;
  BOOL hasSmNeedUpdate_:1;
  BOOL hasHbsNeedUpdate_:1;
  BOOL hasFbsNeedUpdate_:1;
  BOOL hasKfsNeedUpdate_:1;
  BOOL hasOpinionTypeNeedUpdate_:1;
  BOOL hasNewsTypeNeedUpdate_:1;
  BOOL hasCompanyNeedUpdate_:1;
  BOOL hasManagerNeedUpdate_:1;
  BOOL hasBasicInfoNeedUpdate_:1;
  BOOL hasUpdateUrl_:1;
  BOOL hasVersionNeedUpdate_:1;
  BOOL hasCommon_:1;
  int64_t serverTime;
  NSString* updateDesc;
  NSString* dtNeedUpdate;
  NSString* smNeedUpdate;
  NSString* hbsNeedUpdate;
  NSString* fbsNeedUpdate;
  NSString* kfsNeedUpdate;
  NSString* opinionTypeNeedUpdate;
  NSString* newsTypeNeedUpdate;
  NSString* companyNeedUpdate;
  NSString* managerNeedUpdate;
  NSString* basicInfoNeedUpdate;
  NSString* updateUrl;
  NSString* versionNeedUpdate;
  Common* common;
  NSMutableArray* mutablePhoneNewsTypeList;
  NSMutableArray* mutablePhoneOpinionTypeList;
}
- (BOOL) hasVersionNeedUpdate;
- (BOOL) hasUpdateUrl;
- (BOOL) hasServerTime;
- (BOOL) hasBasicInfoNeedUpdate;
- (BOOL) hasManagerNeedUpdate;
- (BOOL) hasCompanyNeedUpdate;
- (BOOL) hasNewsTypeNeedUpdate;
- (BOOL) hasOpinionTypeNeedUpdate;
- (BOOL) hasCommon;
- (BOOL) hasKfsNeedUpdate;
- (BOOL) hasFbsNeedUpdate;
- (BOOL) hasHbsNeedUpdate;
- (BOOL) hasSmNeedUpdate;
- (BOOL) hasDtNeedUpdate;
- (BOOL) hasUpdateDesc;
@property (readonly, retain) NSString* versionNeedUpdate;
@property (readonly, retain) NSString* updateUrl;
@property (readonly) int64_t serverTime;
@property (readonly, retain) NSString* basicInfoNeedUpdate;
@property (readonly, retain) NSString* managerNeedUpdate;
@property (readonly, retain) NSString* companyNeedUpdate;
@property (readonly, retain) NSString* newsTypeNeedUpdate;
@property (readonly, retain) NSString* opinionTypeNeedUpdate;
@property (readonly, retain) Common* common;
@property (readonly, retain) NSString* kfsNeedUpdate;
@property (readonly, retain) NSString* fbsNeedUpdate;
@property (readonly, retain) NSString* hbsNeedUpdate;
@property (readonly, retain) NSString* smNeedUpdate;
@property (readonly, retain) NSString* dtNeedUpdate;
@property (readonly, retain) NSString* updateDesc;
- (NSArray*) phoneNewsTypeList;
- (PhoneNewsType*) phoneNewsTypeAtIndex:(int32_t) index;
- (NSArray*) phoneOpinionTypeList;
- (PhoneOpinionType*) phoneOpinionTypeAtIndex:(int32_t) index;

+ (HostDistribution*) defaultInstance;
- (HostDistribution*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (HostDistribution_Builder*) builder;
+ (HostDistribution_Builder*) builder;
+ (HostDistribution_Builder*) builderWithPrototype:(HostDistribution*) prototype;

+ (HostDistribution*) parseFromData:(NSData*) data;
+ (HostDistribution*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (HostDistribution*) parseFromInputStream:(NSInputStream*) input;
+ (HostDistribution*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (HostDistribution*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (HostDistribution*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface HostDistribution_Builder : PBGeneratedMessage_Builder {
@private
  HostDistribution* result;
}

- (HostDistribution*) defaultInstance;

- (HostDistribution_Builder*) clear;
- (HostDistribution_Builder*) clone;

- (HostDistribution*) build;
- (HostDistribution*) buildPartial;

- (HostDistribution_Builder*) mergeFrom:(HostDistribution*) other;
- (HostDistribution_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (HostDistribution_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasVersionNeedUpdate;
- (NSString*) versionNeedUpdate;
- (HostDistribution_Builder*) setVersionNeedUpdate:(NSString*) value;
- (HostDistribution_Builder*) clearVersionNeedUpdate;

- (BOOL) hasUpdateUrl;
- (NSString*) updateUrl;
- (HostDistribution_Builder*) setUpdateUrl:(NSString*) value;
- (HostDistribution_Builder*) clearUpdateUrl;

- (BOOL) hasServerTime;
- (int64_t) serverTime;
- (HostDistribution_Builder*) setServerTime:(int64_t) value;
- (HostDistribution_Builder*) clearServerTime;

- (BOOL) hasBasicInfoNeedUpdate;
- (NSString*) basicInfoNeedUpdate;
- (HostDistribution_Builder*) setBasicInfoNeedUpdate:(NSString*) value;
- (HostDistribution_Builder*) clearBasicInfoNeedUpdate;

- (BOOL) hasManagerNeedUpdate;
- (NSString*) managerNeedUpdate;
- (HostDistribution_Builder*) setManagerNeedUpdate:(NSString*) value;
- (HostDistribution_Builder*) clearManagerNeedUpdate;

- (BOOL) hasCompanyNeedUpdate;
- (NSString*) companyNeedUpdate;
- (HostDistribution_Builder*) setCompanyNeedUpdate:(NSString*) value;
- (HostDistribution_Builder*) clearCompanyNeedUpdate;

- (BOOL) hasNewsTypeNeedUpdate;
- (NSString*) newsTypeNeedUpdate;
- (HostDistribution_Builder*) setNewsTypeNeedUpdate:(NSString*) value;
- (HostDistribution_Builder*) clearNewsTypeNeedUpdate;

- (BOOL) hasOpinionTypeNeedUpdate;
- (NSString*) opinionTypeNeedUpdate;
- (HostDistribution_Builder*) setOpinionTypeNeedUpdate:(NSString*) value;
- (HostDistribution_Builder*) clearOpinionTypeNeedUpdate;

- (BOOL) hasCommon;
- (Common*) common;
- (HostDistribution_Builder*) setCommon:(Common*) value;
- (HostDistribution_Builder*) setCommonBuilder:(Common_Builder*) builderForValue;
- (HostDistribution_Builder*) mergeCommon:(Common*) value;
- (HostDistribution_Builder*) clearCommon;

- (NSArray*) phoneNewsTypeList;
- (PhoneNewsType*) phoneNewsTypeAtIndex:(int32_t) index;
- (HostDistribution_Builder*) replacePhoneNewsTypeAtIndex:(int32_t) index with:(PhoneNewsType*) value;
- (HostDistribution_Builder*) addPhoneNewsType:(PhoneNewsType*) value;
- (HostDistribution_Builder*) addAllPhoneNewsType:(NSArray*) values;
- (HostDistribution_Builder*) clearPhoneNewsTypeList;

- (NSArray*) phoneOpinionTypeList;
- (PhoneOpinionType*) phoneOpinionTypeAtIndex:(int32_t) index;
- (HostDistribution_Builder*) replacePhoneOpinionTypeAtIndex:(int32_t) index with:(PhoneOpinionType*) value;
- (HostDistribution_Builder*) addPhoneOpinionType:(PhoneOpinionType*) value;
- (HostDistribution_Builder*) addAllPhoneOpinionType:(NSArray*) values;
- (HostDistribution_Builder*) clearPhoneOpinionTypeList;

- (BOOL) hasKfsNeedUpdate;
- (NSString*) kfsNeedUpdate;
- (HostDistribution_Builder*) setKfsNeedUpdate:(NSString*) value;
- (HostDistribution_Builder*) clearKfsNeedUpdate;

- (BOOL) hasFbsNeedUpdate;
- (NSString*) fbsNeedUpdate;
- (HostDistribution_Builder*) setFbsNeedUpdate:(NSString*) value;
- (HostDistribution_Builder*) clearFbsNeedUpdate;

- (BOOL) hasHbsNeedUpdate;
- (NSString*) hbsNeedUpdate;
- (HostDistribution_Builder*) setHbsNeedUpdate:(NSString*) value;
- (HostDistribution_Builder*) clearHbsNeedUpdate;

- (BOOL) hasSmNeedUpdate;
- (NSString*) smNeedUpdate;
- (HostDistribution_Builder*) setSmNeedUpdate:(NSString*) value;
- (HostDistribution_Builder*) clearSmNeedUpdate;

- (BOOL) hasDtNeedUpdate;
- (NSString*) dtNeedUpdate;
- (HostDistribution_Builder*) setDtNeedUpdate:(NSString*) value;
- (HostDistribution_Builder*) clearDtNeedUpdate;

- (BOOL) hasUpdateDesc;
- (NSString*) updateDesc;
- (HostDistribution_Builder*) setUpdateDesc:(NSString*) value;
- (HostDistribution_Builder*) clearUpdateDesc;
@end
