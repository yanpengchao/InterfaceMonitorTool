//
//  HBAutoSaver.m
//  StoreAndShare
//
//  Created by 彭超 鄢 on 12-5-27.
//  Copyright (c) 2012年 好买财富. All rights reserved.
//

#import "HBAutoSaver.h"
#import "HBTools.h"

static HBAutoSaver* sHBAutoSaverInstance = nil;
@implementation HBAutoSaver
@synthesize itemsNeedToSave = _itemsNeedToSave;

+(HBAutoSaver*)getInstance
{
    if (sHBAutoSaverInstance == nil) {
        @synchronized(self)
        {
            if (sHBAutoSaverInstance == nil) {
                sHBAutoSaverInstance = [[self alloc] init];
                sHBAutoSaverInstance.itemsNeedToSave = [NSMutableArray array];
            }
        }
    }
    
    return sHBAutoSaverInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        if ([HBTools isOSMultiTaskEnable]) {//4.0 available
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillTerminNotify:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        } else {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillTerminNotify:) name:UIApplicationWillTerminateNotification object:nil];
        }
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidReceiveMemoryWarning:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
	}
	return self;
}

-(void)INeedAutoSave:(id<HBAutoSaverDelegate>)saveMeItem
{
    @synchronized (_itemsNeedToSave)
    {
        [_itemsNeedToSave addObject:saveMeItem];
    }
}

-(void)IDontNeedAutoSave:(id<HBAutoSaverDelegate>)notSaveMeIte
{
    @synchronized (_itemsNeedToSave)
    {
        [_itemsNeedToSave removeObject:notSaveMeIte];
    }
}

#pragma mark -
#pragma mark saveOnExit
- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}

- (void)appWillTerminNotify:(NSNotification *)notification
{
    @synchronized (_itemsNeedToSave)
    {
        for (id delegate in _itemsNeedToSave) {
            if ([delegate respondsToSelector:@selector(saveOnExit)])
            {
                [delegate saveOnExit];
            }
        }
    }
}

- (void)appDidReceiveMemoryWarning:(NSNotification *)notification
{
    @synchronized (_itemsNeedToSave)
    {
        for (id delegate in _itemsNeedToSave) {
            if ([delegate respondsToSelector:@selector(memoryWarning)])
            {
                [delegate memoryWarning];
            }
        }
    }
}
@end
