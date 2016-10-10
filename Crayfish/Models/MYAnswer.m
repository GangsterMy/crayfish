//
//  MYAnswer.m
//  crayfish
//
//  Created by 赵麦 on 10/10/16.
//  Copyright © 2016 Zmy. All rights reserved.
//

#import "MYAnswer.h"

@interface MYAnswer ()

@property (strong, nonatomic) NSNumber *sequence;
@property (copy, nonatomic) NSString *content;

@end

@implementation MYAnswer

- (instancetype)initWithObject:(id)object {
    self = [super init];
    if (self) {
        self.sequence = [object objectForKey:@"sequence"];
        self.content = [object objectForKey:@"content"];
    }
    return self;
}

@end
