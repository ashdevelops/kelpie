//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SCCameraToolbarButtonImpl : NSObject
{
    BOOL selected;
    UILabel *titleLabel;
    id delegate;
}
-(id)initWithToolbarItem:(id)arg1 cameraUserActionLogger:(id)arg2 appearanceType:(NSInteger)arg3;
-(void)tapButton;
@end

