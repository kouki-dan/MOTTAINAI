//
//  Mottainai.m
//  MOTTAINAI
//
//  Created by Kouki Saito on 2014/05/11.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "Mottainai.h"


@implementation Mottainai

@dynamic created;
@dynamic group;
@dynamic sync;
@dynamic text;

- (NSComparisonResult) compareDateAsc:(Mottainai *)mottainai {
    return [mottainai.created compare:self.created];
}

@end
