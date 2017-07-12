//
//  RepoModel.h
//  stackView
//
//  Created by miquido on 11/07/2017.
//  Copyright © 2017 miquido. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RepoModel : NSObject
{
    NSString *repoName;
    NSString *repoLink;
    NSString *repoImage;
    NSString *repoForks;
}

@property (nonatomic, retain)NSString *repoName;
@property (nonatomic, retain)NSString *repoLink;
@property (nonatomic, retain)NSString *repoImage;
@property (nonatomic, retain)NSString *repoForks;

-(id)initWithDictionary:(NSDictionary *)sourceDictionary;

@end
