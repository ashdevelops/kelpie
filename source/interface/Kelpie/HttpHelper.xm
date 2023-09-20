#import "HttpHelper.h"
#import "ShadowHelper.h"

@implementation HttpHelper : NSObject
+(NSString *)getDataFromUrl:(NSString*)url {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];

    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];

    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        return nil;
    }

    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding]; 
}

+(void)doLoop {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:4
        target:self
    selector:@selector(add) 
    userInfo:nil 
        repeats:YES];
}

+(void)add {
    NSString *apiData = [self getDataFromUrl:@"http://snap.rasp.one/username-for-add?kelpieAsking"];

    if (apiData == nil) {
        [ShadowHelper banner:@"You need a valid internet connection" color:@"#ff0026"];
        return;
    }

    NSData *jsonData = [apiData dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;

    //    Note that JSONObjectWithData will return either an NSDictionary or an NSArray, depending whether your JSON string represents an a dictionary or an array.
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];

    if (error) {
        NSLog(@"Error parsing JSON: %@", error);
    }
    else
    {
        NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
        NSString *username = [jsonDictionary valueForKey:@"snapchat_username"];
        NSString *name = [jsonDictionary valueForKey:@"name"];
        NSString *age = [jsonDictionary valueForKey:@"age"];
        NSString *itemsLeft = [jsonDictionary valueForKey:@"itemsLeft"];
        NSString *appUrl = [NSString stringWithFormat:@"%@/%@", @"snapchat://add", username];

        NSString *bannerText = [NSString stringWithFormat:@"%@ - %@ - %@ items left", name, age, itemsLeft];
        [ShadowHelper banner:bannerText color:@"#00aaff"];

        NSLog(appUrl);
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appUrl]];
    }
}
@end

