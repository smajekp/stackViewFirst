//
//  ViewController.m
//  stackView
//
//  Created by miquido on 11/07/2017.
//  Copyright © 2017 miquido. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "AFNetworking.h"
#import "RepoModel.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray *tableData;
NSMutableArray *itemsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getItemsList];
    
//    UIScrollView *scrollVew = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:scrollVew];
//    
//    [scrollVew setContentSize:CGSizeMake(scrollVew.bounds.size.width, 78*20)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getItemsList
{
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
    [self.view addSubview: activityIndicator];
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [activityIndicator startAnimating];
    
    [manager GET:@"https://api.github.com/search/repositories?q=language:swift&per_page=30" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        activityIndicator.hidden = YES;
        [activityIndicator stopAnimating];
        
        //we will add Modal class objects of users in this array
        
        itemsArray=[[NSMutableArray alloc]init];
        
        //getting result dictionary from response
        NSDictionary *resultDictinary = [responseObject objectForKey:@"items"];
        for (NSDictionary *itemDictionary in resultDictinary)
        {
            //allocating new user from the dictionary
            RepoModel *newItem=[[RepoModel alloc]initWithDictionary:itemDictionary];
            [itemsArray addObject:newItem];
        }
        
        for (RepoModel *item in itemsArray)
        {
            CustomView *customView = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75)];
            customView.labelView.text = item.repoName;
            
            customView.translatesAutoresizingMaskIntoConstraints = NO;
            
            //Height to be fixed for SubView same as AdHeight
            NSLayoutConstraint *height = [NSLayoutConstraint
                                          constraintWithItem:customView
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:nil
                                          attribute:NSLayoutAttributeNotAnAttribute
                                          multiplier:0
                                          constant:75];
            
            
            //Add height constraint to the subview, as subview owns it.
            [customView addConstraint:height];
            
            
            NSURL *url = [NSURL URLWithString:item.repoImage];
            NSData *data = [NSData dataWithContentsOfURL:url];
            customView.imageView.image = [UIImage imageWithData:data];
            
            [self.stackVew addArrangedSubview:customView];
        }
        
        CGFloat height = CGRectGetHeight(self.view.bounds);
        self.heightConstraint.constant = (75*[itemsArray count]-height);
        
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
        
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}



@end
