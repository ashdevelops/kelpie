#import "KelpieSessionData.h"

@implementation KelpieSessionData

NSString *userId;
NSString *username;
NSString *authToken;
NSUInteger blockedCount;
NSUInteger friendCount;

static KelpieSessionData *sharedInstance = nil;

+ (instancetype)sharedInstanceMethod
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [KelpieSessionData new];
        }
    }

    return sharedInstance;
}

@end