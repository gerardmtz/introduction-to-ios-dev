//
//  MacWindowView.h
//  AppSwitching2
//
//  Created by geralduwu on 2025-05-02.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MacWindowView : UIView

// Property to hold the main content view (where you'll add your image or other UI)
@property (nonatomic, strong, readonly) UIView *contentAreaView;

// Property to customize the title
@property (nonatomic, copy) NSString *windowTitle;

// Designated initializer (optional, but good practice)
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;


@end

NS_ASSUME_NONNULL_END
