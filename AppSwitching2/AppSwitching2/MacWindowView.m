//
//  MacWindowView.m
//  AppSwitching2
//
//  Created by geralduwu on 2025-05-02.
//

#import "MacWindowView.h"

@interface MacWindowView ()

@property (nonatomic, strong) UIView *titleBarView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *closeButton;
@property (nonatomic, strong) UIView *minimizeButton;
@property (nonatomic, strong) UIView *zoomButton;
@property (nonatomic, strong, readwrite) UIView *contentAreaView; // Make writable internally

@end

@implementation MacWindowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// Constants for easy tweaking
static const CGFloat kCornerRadius = 8.0;
static const CGFloat kTitleBarHeight = 28.0;
static const CGFloat kButtonDiameter = 12.0;
static const CGFloat kButtonSpacing = 8.0;
static const CGFloat kButtonMargin = 10.0;

// Initialize with frame and title
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        _windowTitle = [title copy];
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

// Override initWithFrame for general use
- (instancetype)initWithFrame:(CGRect)frame {
    // Provide a default title or handle as needed
    return [self initWithFrame:frame title:@"Window"];
}

// Override initWithCoder if you might use it in Storyboard/XIB later
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        // Initialize with default title or load from properties set in IB
        _windowTitle = @"Window"; // Or some default
        [self setupViews];
        [self setupConstraints];
        // If you add inspectable properties for title, load it here
    }
    return self;
}

- (void)setupViews {
    // --- Main Window Appearance ---
    self.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1.0]; // Window border/frame color
    self.layer.cornerRadius = kCornerRadius;
    self.layer.masksToBounds = YES; // Clip subviews to rounded corners

    // --- Title Bar ---
    self.titleBarView = [[UIView alloc] init];
    self.titleBarView.backgroundColor = [UIColor colorWithWhite:0.75 alpha:1.0]; // Title bar color
    self.titleBarView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.titleBarView];

    // --- Traffic Lights ---
    self.closeButton = [self createTrafficLightButtonWithColor:[UIColor systemRedColor]];
    self.minimizeButton = [self createTrafficLightButtonWithColor:[UIColor systemOrangeColor]]; // Often yellow/orange
    self.zoomButton = [self createTrafficLightButtonWithColor:[UIColor systemGreenColor]];

    [self.titleBarView addSubview:self.closeButton];
    [self.titleBarView addSubview:self.minimizeButton];
    [self.titleBarView addSubview:self.zoomButton];

    // --- Title Label ---
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = self.windowTitle;
    self.titleLabel.font = [UIFont systemFontOfSize:13.0 weight:UIFontWeightSemibold];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.titleBarView addSubview:self.titleLabel];

    // --- Content Area ---
    self.contentAreaView = [[UIView alloc] init];
    self.contentAreaView.backgroundColor = [UIColor whiteColor]; // Content background
    self.contentAreaView.translatesAutoresizingMaskIntoConstraints = NO;
    // You might want rounded corners here too if the main container doesn't maskToBounds
    // self.contentAreaView.layer.cornerRadius = kCornerRadius;
    // self.contentAreaView.layer.maskedCorners = kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner; // Only bottom corners
    // self.contentAreaView.layer.masksToBounds = YES;
    [self addSubview:self.contentAreaView];
}

- (UIView *)createTrafficLightButtonWithColor:(UIColor *)color {
    UIView *buttonView = [[UIView alloc] init];
    buttonView.backgroundColor = color;
    buttonView.translatesAutoresizingMaskIntoConstraints = NO;
    buttonView.layer.cornerRadius = kButtonDiameter / 2.0;
    buttonView.layer.masksToBounds = YES;
    return buttonView;
}

- (void)setupConstraints {
    // --- Title Bar Constraints ---
    [NSLayoutConstraint activateConstraints:@[
        [self.titleBarView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.titleBarView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.titleBarView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.titleBarView.heightAnchor constraintEqualToConstant:kTitleBarHeight]
    ]];

    // --- Traffic Light Constraints ---
    // Close Button (Red)
    [NSLayoutConstraint activateConstraints:@[
        [self.closeButton.leadingAnchor constraintEqualToAnchor:self.titleBarView.leadingAnchor constant:kButtonMargin],
        [self.closeButton.centerYAnchor constraintEqualToAnchor:self.titleBarView.centerYAnchor],
        [self.closeButton.widthAnchor constraintEqualToConstant:kButtonDiameter],
        [self.closeButton.heightAnchor constraintEqualToConstant:kButtonDiameter]
    ]];

    // Minimize Button (Yellow/Orange)
    [NSLayoutConstraint activateConstraints:@[
        [self.minimizeButton.leadingAnchor constraintEqualToAnchor:self.closeButton.trailingAnchor constant:kButtonSpacing],
        [self.minimizeButton.centerYAnchor constraintEqualToAnchor:self.titleBarView.centerYAnchor],
        [self.minimizeButton.widthAnchor constraintEqualToConstant:kButtonDiameter],
        [self.minimizeButton.heightAnchor constraintEqualToConstant:kButtonDiameter]
    ]];

    // Zoom Button (Green)
    [NSLayoutConstraint activateConstraints:@[
        [self.zoomButton.leadingAnchor constraintEqualToAnchor:self.minimizeButton.trailingAnchor constant:kButtonSpacing],
        [self.zoomButton.centerYAnchor constraintEqualToAnchor:self.titleBarView.centerYAnchor],
        [self.zoomButton.widthAnchor constraintEqualToConstant:kButtonDiameter],
        [self.zoomButton.heightAnchor constraintEqualToConstant:kButtonDiameter]
    ]];

    // --- Title Label Constraints ---
    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.titleBarView.centerXAnchor],
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.titleBarView.centerYAnchor],
        // Optional: Constrain width to prevent overlapping buttons if title is too long
        [self.titleLabel.leadingAnchor constraintGreaterThanOrEqualToAnchor:self.zoomButton.trailingAnchor constant:kButtonSpacing],
        [self.titleLabel.trailingAnchor constraintLessThanOrEqualToAnchor:self.titleBarView.trailingAnchor constant:-kButtonMargin]
    ]];


    // --- Content Area Constraints ---
    [NSLayoutConstraint activateConstraints:@[
        [self.contentAreaView.topAnchor constraintEqualToAnchor:self.titleBarView.bottomAnchor],
        [self.contentAreaView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.contentAreaView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.contentAreaView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
}

// Allow changing the title dynamically
- (void)setWindowTitle:(NSString *)windowTitle {
    _windowTitle = [windowTitle copy];
    self.titleLabel.text = _windowTitle;
}

@end
