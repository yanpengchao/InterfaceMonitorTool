//
//  UIImage+HBCategory.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-11-23.
//
//

#import "UIImage+HBCategory.h"

@implementation UIImage (HBCategory)

+ (UIImage*)imageNamedHB:(NSString*)imageName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
    return [UIImage imageWithContentsOfFile:path];
//    NSString *pathForImageFile = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
//	NSData *imageData = [[NSData alloc] initWithContentsOfFile:pathForImageFile];
//    
//	UIImage *image = [[UIImage alloc] initWithData:imageData];
//	[imageData release];
//    return [image autorelease];
}

@end
