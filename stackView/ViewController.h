//
//  ViewController.h
//  stackView
//
//  Created by miquido on 11/07/2017.
//  Copyright © 2017 miquido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIStackView *stackVew;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@end

