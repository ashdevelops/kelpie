#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface HttpHelper: NSObject
+(NSString *)getDataFromUrl:(NSString*)url;
+(void)doLoop;
+(void)add;
@end
