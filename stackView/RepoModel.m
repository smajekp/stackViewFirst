//
//  RepoModel.m
//  stackView
//
//  Created by miquido on 11/07/2017.
//  Copyright © 2017 miquido. All rights reserved.
//

#import "RepoModel.h"

@implementation RepoModel
@synthesize repoName,repoLink,repoImage,repoForks;

-(id)initWithDictionary:(NSDictionary *)sourceDictionary
{
    self = [super init];
    if (self != nil)
    {
        self.repoName=[sourceDictionary valueForKey:@"full_name"];
        self.repoLink=[sourceDictionary valueForKey:@"git_url"];
        self.repoForks=[sourceDictionary valueForKey:@"forks_count"];
        
        if(sourceDictionary[@"owner"]){
            NSDictionary *owner = sourceDictionary[@"owner"];
            if(owner[@"avatar_url"]){
                self.repoImage = owner[@"avatar_url"];
            }
            
        }
        
    }
    return self;
    
}
@end
