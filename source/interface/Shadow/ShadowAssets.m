#import "ShadowAssets.h"

@implementation ShadowAssets
- (id)init{
    self = [super init];
    NSString *resourcePath = @"/Library/Application Support/Kelpie/resources/icons";

    self.save = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/save.png"]];
    self.radd = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/boot.png"]];
    self.upload = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/upload.png"]];
    self.seen = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/seen.png"]];
    self.seened = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/seened.png"]];
    self.saved = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/saved.png"]];
    self.screenshot = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/screenshot.png"]];
    self.toolbar = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/toolbar.png"]];
    
    self.pull_normal = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/pull.normal.png"]];
    self.pull_wink = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/pull.wink.png"]];
    self.pull_shocked = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/pull.shocked.png"]];
    self.pull_rainbow = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/pull.rainbow.png"]];
    self.pull_hands = [UIImage imageWithContentsOfFile:[resourcePath stringByAppendingString:@"/pull.hands.png"]];
    
    return self;
}

+ (UIImage *)download:(NSString*)url{
    return [UIImage imageWithData: [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: url]]];
}

+ (instancetype)sharedInstance{
    static ShadowAssets *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ShadowAssets alloc] init];
    });
    return sharedInstance;
}

@end

