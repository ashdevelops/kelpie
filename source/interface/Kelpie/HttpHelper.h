#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface HttpHelper: NSObject
+(NSString *)getDataFromUrl:(NSString*)url;
+(void)add:(NSString*)idfk;
@end
