//
//  HBAutoSaver.h
//  StoreAndShare
//
//  Created by 彭超 鄢 on 12-5-27.
//  Copyright (c) 2012年 好买财富. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HBAutoSaverDelegate <NSObject>

- (void)saveOnExit;
- (void)memoryWarning;

@end

@interface HBAutoSaver : NSObject
{
    NSMutableArray* _itemsNeedToSave;
}

@property (nonatomic, retain)NSMutableArray* itemsNeedToSave;

+ (HBAutoSaver*)getInstance;
- (void)INeedAutoSave:(id<HBAutoSaverDelegate>)saveMeItem;
- (void)IDontNeedAutoSave:(id<HBAutoSaverDelegate>)notSaveMeIte;
@end
