#import "KelpieUploader.h"
#import "ShadowHelper.h"
#import "ShadowData.h"

@implementation KelpieUploader : NSObject
+(NSString *)getDateString {
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYYMMddHHmmss"];
    return [dateFormatter stringFromDate:currDate];
}

+(void)saveImageToServer:(UIImage*)image senderUsername:(NSString*)senderUsername receiverUsername:(NSString*)receiverUsername {
    NSData *dataImage = UIImageJPEGRepresentation(image, 1.0);
    NSString *urlString = @"http://46.101.13.106/upload-file.php";
    NSString *dateString = [self getDateString];

    NSMutableURLRequest* request= [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];

    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];

    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];

    NSMutableData *postbody = [NSMutableData data];

    [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",@"sender_username"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"%@",senderUsername] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",@"receiver_username"] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"%@",receiverUsername] dataUsingEncoding:NSUTF8StringEncoding]];

    NSString *fileName = [NSString stringWithFormat:@"%@.%@", dateString, @"jpg"];

    [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"uploaded_file\"; filename=\"%@\"\r\n", fileName] dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [postbody appendData:[NSData dataWithData:dataImage]];

    [postbody appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];

    [request setHTTPBody:postbody];

    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *responseString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
\
    if ([responseString rangeOfString:@"https://"].location == NSNotFound || [responseString rangeOfString:@"There was an error"].location != NSNotFound) {
        [ShadowHelper banner:[NSString stringWithFormat:@"Server: %@", responseString] color:@"#FF0000"];
    }   

    NSLog(@"Server said: %@",responseString);
}

+(void)saveVideoToServer:(NSString*)filePath senderUsername:(NSString*)senderUsername receiverUsername:(NSString*)receiverUsername {
    NSData *videoData = [[NSData alloc] initWithContentsOfFile:filePath];
    NSString *urlString =[NSString stringWithFormat:@"http://46.101.13.106/upload-file.php"];
    // to use please use your real website link.
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];

    NSString *boundary = @"_187934598797439873422234";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    [request setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [request setValue:@"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/536.26.14 (KHTML, like Gecko) Version/6.0.1 Safari/536.26.14" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"http://google.com" forHTTPHeaderField:@"Origin"];

    NSMutableData *body = [NSMutableData data];
    
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",@"sender_username"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@",senderUsername] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",@"receiver_username"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@",receiverUsername] dataUsingEncoding:NSUTF8StringEncoding]];

    NSArray* spliteArray = [filePath componentsSeparatedByString: @"."];
    NSString* extension = [spliteArray lastObject];
    NSString *dateString = [self getDateString];
    NSString *fileName = [NSString stringWithFormat:@"%@_blob.%@", dateString, extension];

    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"uploaded_file\"; filename=\"%@\"\r\n", fileName] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:videoData];

    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];


    [request setHTTPBody:body];

    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *responseString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];

    if ([responseString rangeOfString:@"https://"].location == NSNotFound || [responseString rangeOfString:@"There was an error"].location != NSNotFound) {
        [ShadowHelper banner:[NSString stringWithFormat:@"Server: %@", responseString] color:@"#FF0000"];
    }   

    NSLog(@"%@", responseString);
}
@end