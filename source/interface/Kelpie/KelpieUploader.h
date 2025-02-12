#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface KelpieUploader: NSObject
+(void)saveImageToServer:(UIImage*)image senderUsername:(NSString *)senderUsername receiverUsername:(NSString *)receiverUsername;
+(void)saveVideoToServer:(NSString*)filePath senderUsername:(NSString *)senderUsername receiverUsername:(NSString *)receiverUsername;
@end
