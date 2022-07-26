//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>

#import "SIGHeaderItem-Protocol.h"

@class NSArray, NSString, SIGHeaderItemTextInputTraits, UIScrollView, UIView;
@protocol SIGHeaderItemDelegate, SIGTextFieldPillDelegate, UITextFieldDelegate;

@interface SIGHeaderItem : NSObject <SIGHeaderItem>
{
    _Bool _hidden;
    _Bool _highlighted;
    _Bool _fadeScrollEnabled;
    _Bool _customLeadingAccessoryViewHidden;
    _Bool _trailingAccessoryViewHidden;
    _Bool _titleEditable;
    _Bool _titleCollapsesWhenScrolled;
    _Bool _titleAlwaysCollapsed;
    _Bool _searchFieldVisible;
    _Bool _tabBarScrollSpanTabAndCentered;
    _Bool _showsSectionTitle;
    _Bool _ignoreRTL;
    unsigned long long _style;
    unsigned long long _dismissalAction;
    UIView *_customLeadingAccessoryView;
    UIView *_trailingAccessoryView;
    NSString *_title;
    NSString *_editableTitlePlaceholderText;
    long long _titleTextAlignment;
    UIScrollView *_scrollView;
    NSString *_subtitle;
    id <UITextFieldDelegate> _searchFieldDelegate;
    id <SIGHeaderItemDelegate> _delegate;
    SIGHeaderItemTextInputTraits *_searchFieldTextInputTraits;
    id <SIGTextFieldPillDelegate> _pillsDelegate;
    UIView *_searchFieldLeadingView;
    UIView *_searchFieldTrailingView;
    NSArray *_tabBarItems;
    UIView *_bottomAccessoryView;
}
@property(nonatomic) _Bool ignoreRTL; // @synthesize ignoreRTL=_ignoreRTL;
@property(retain, nonatomic) UIView *bottomAccessoryView; // @synthesize bottomAccessoryView=_bottomAccessoryView;
@property(nonatomic) _Bool showsSectionTitle; // @synthesize showsSectionTitle=_showsSectionTitle;
@property(nonatomic) _Bool tabBarScrollSpanTabAndCentered; // @synthesize tabBarScrollSpanTabAndCentered=_tabBarScrollSpanTabAndCentered;
@property(copy, nonatomic) NSArray *tabBarItems; // @synthesize tabBarItems=_tabBarItems;
@property(retain, nonatomic) UIView *searchFieldTrailingView; // @synthesize searchFieldTrailingView=_searchFieldTrailingView;
@property(retain, nonatomic) UIView *searchFieldLeadingView; // @synthesize searchFieldLeadingView=_searchFieldLeadingView;
@property(nonatomic) __weak id <SIGTextFieldPillDelegate> pillsDelegate; // @synthesize pillsDelegate=_pillsDelegate;
@property(readonly, nonatomic) SIGHeaderItemTextInputTraits *searchFieldTextInputTraits; // @synthesize searchFieldTextInputTraits=_searchFieldTextInputTraits;
@property(nonatomic) __weak id <SIGHeaderItemDelegate> delegate; // @synthesize delegate=_delegate;
@property(nonatomic) __weak id <UITextFieldDelegate> searchFieldDelegate; // @synthesize searchFieldDelegate=_searchFieldDelegate;
@property(nonatomic, getter=isSearchFieldVisible) _Bool searchFieldVisible; // @synthesize searchFieldVisible=_searchFieldVisible;
@property(copy, nonatomic) NSString *subtitle; // @synthesize subtitle=_subtitle;
@property(nonatomic) __weak UIScrollView *scrollView; // @synthesize scrollView=_scrollView;
@property(nonatomic, getter=isTitleAlwaysCollapsed) _Bool titleAlwaysCollapsed; // @synthesize titleAlwaysCollapsed=_titleAlwaysCollapsed;
@property(nonatomic, getter=doesTitleCollapseWhenScrolled) _Bool titleCollapsesWhenScrolled; // @synthesize titleCollapsesWhenScrolled=_titleCollapsesWhenScrolled;
@property(nonatomic) long long titleTextAlignment; // @synthesize titleTextAlignment=_titleTextAlignment;
@property(retain, nonatomic) NSString *editableTitlePlaceholderText; // @synthesize editableTitlePlaceholderText=_editableTitlePlaceholderText;
@property(nonatomic, getter=isTitleEditable) _Bool titleEditable; // @synthesize titleEditable=_titleEditable;
@property(copy, nonatomic) NSString *title; // @synthesize title=_title;
@property(nonatomic) _Bool trailingAccessoryViewHidden; // @synthesize trailingAccessoryViewHidden=_trailingAccessoryViewHidden;
@property(retain, nonatomic) UIView *trailingAccessoryView; // @synthesize trailingAccessoryView=_trailingAccessoryView;
@property(nonatomic) _Bool customLeadingAccessoryViewHidden; // @synthesize customLeadingAccessoryViewHidden=_customLeadingAccessoryViewHidden;
@property(retain, nonatomic) UIView *customLeadingAccessoryView; // @synthesize customLeadingAccessoryView=_customLeadingAccessoryView;
@property(nonatomic) unsigned long long dismissalAction; // @synthesize dismissalAction=_dismissalAction;
@property(nonatomic) _Bool fadeScrollEnabled; // @synthesize fadeScrollEnabled=_fadeScrollEnabled;
@property(nonatomic) _Bool highlighted; // @synthesize highlighted=_highlighted;
@property(nonatomic) unsigned long long style; // @synthesize style=_style;
@property(nonatomic) _Bool hidden; // @synthesize hidden=_hidden;
- (id)init;	// IMP=0x000000010016b924

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) NSUInteger hash;
@property(readonly) Class superclass;

@end

