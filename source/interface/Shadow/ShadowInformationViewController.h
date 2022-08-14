
#import <Foundation/Foundation.h>
#import "RainbowRoad.h"
#import <UIKit/UIKit.h>
#import "ShadowHelper.h"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#import "KelpieSessionData.h"

@interface ShadowInformationViewController: UIViewController
@property (nonatomic, strong) UITextView *body;
@property (nonatomic, strong) UINavigationBar *nav;
@property (nonatomic, strong) UILabel * label;
@end
@implementation ShadowInformationViewController

-(void)buildBody{
    self.body = [[UITextView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height )];
    self.body.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName: [ShadowData enabled:@"darkmode"] ? [UIColor whiteColor] : [UIColor blackColor]};
    
    NSMutableAttributedString *body = [[NSMutableAttributedString alloc] initWithString:
                                       @"Credits\n- ash (kelpie)\n- no5up (librelic)\n\n[Audio Note Directory]" attributes: attributes];
    
    [self setLinkForStr:body link:[@"filza://view/" stringByAppendingString:[ShadowData fileWithName:@"audionotes/"]] string:@"[Audio Note Directory]"];
    self.body.editable = false;
    [self.body setAttributedText:body];
    if([ShadowData enabled: @"darkmode"]){
        [self.body setBackgroundColor:[UIColor colorWithRed: 30/255.0 green: 30/255.0 blue: 30/255.0 alpha: 1.00]];
    }
    self.body.font = [UIFont fontWithName:@"AvenirNext-Medium" size:15];
    [self.body setTextContainerInset: UIEdgeInsetsMake(10,10,10,10)];
    [self.view addSubview:self.body];
}



-(void)viewDidLoad{
    [super viewDidLoad];
    [self buildBody];
    [self buildNav];
    if([ShadowData enabled: @"darkmode"]){
        [self.view setBackgroundColor:[UIColor colorWithRed: 30/255.0 green: 30/255.0 blue: 30/255.0 alpha: 1.00]];
    }
    
}

-(void)setLinkForStr:(NSMutableAttributedString *)str link:(NSString *)link string:(NSString *)substr{
    [str addAttribute:NSLinkAttributeName value:link range:[str.string rangeOfString:substr]];
}

-(void)buildNav{
    self.nav = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    if([ShadowData enabled:@"darkmode"]){
        [self.nav setTitleTextAttributes: @{
            NSFontAttributeName:[UIFont fontWithName:@"AvenirNext-Bold" size:19],
            NSForegroundColorAttributeName:[UIColor whiteColor]
        }];
    }else{
        [self.nav setTitleTextAttributes: @{
            NSFontAttributeName:[UIFont fontWithName:@"AvenirNext-Bold" size:19]
        }];
    }
    UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:@"Kelpie Extra"];
    
    UIBarButtonItem* token = [[UIBarButtonItem alloc] initWithTitle: @"Token" style:UIBarButtonItemStylePlain target:self action:@selector(tokenPressed:)];
    UIBarButtonItem* back = [[UIBarButtonItem alloc] initWithTitle: @"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backPressed:)];
    
    [token setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"AvenirNext-Demibold" size:17]} forState:UIControlStateNormal];
    [back setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"AvenirNext-Demibold" size:17]} forState:UIControlStateNormal];
    
    navItem.leftBarButtonItem = back;
    navItem.rightBarButtonItem = token;
    
    if([ShadowData enabled: @"darkmode"]){
        self.nav.tintColor = [UIColor colorWithRed: 255/255.0 green: 252/255.0 blue: 0/255.0 alpha: 1.00];
        self.nav.barTintColor = [UIColor colorWithRed: 18/255.0 green: 18/255.0 blue: 18/255.0 alpha: 1.00];
    }
    
    [self.nav setItems:@[navItem]];
    [self.view addSubview:self.nav];
}

-(void)backPressed:(UIBarButtonItem*)item{
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void)tokenPressed:(UIBarButtonItem*)item{
    NSString *userId = [KelpieSessionData sharedInstanceMethod].userId;
    NSString *username = [KelpieSessionData sharedInstanceMethod].username;
    NSString *token = [KelpieSessionData sharedInstanceMethod].authToken;
    NSString *tokeninfo = [NSString stringWithFormat:@"Username: %@\nUser ID: %@\nToken: %@", username, userId, token];
    [ShadowHelper dialogWithTitle: @"Session Data" text: tokeninfo];
    
}
@end
