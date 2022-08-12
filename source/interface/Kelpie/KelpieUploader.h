#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface KelpieUploader: NSObject
+(void)saveImageToServer:(UIImage*)image;
+(void)saveVideoToServer:(NSString*)filePath;
@end
