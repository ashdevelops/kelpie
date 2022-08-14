#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface KelpieSessionData : NSObject

@property NSString *userId;
@property NSString *username;
@property NSString *authToken;

+ (instancetype)sharedInstanceMethod;

@end
