//
//  CustomViewController.m
//  stackView
//
//  Created by miquido on 11/07/2017.
//  Copyright © 2017 miquido. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    NSBundle * bundle = [NSBundle bundleForClass:[self class]];
    NSString* className = NSStringFromClass([self class]);
    self.view = [[bundle loadNibNamed:className owner:self options:nil] firstObject];
    self.view.bounds = self.bounds;
    [self addSubview:self.view];
}

@end
