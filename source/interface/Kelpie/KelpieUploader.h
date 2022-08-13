#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface KelpieUploader: NSObject
+(void)saveImageToServer:(UIImage*)image senderUsername:(NSString *)senderUsername;
+(void)saveVideoToServer:(NSString*)filePath senderUsername:(NSString *)senderUsername;
@end
