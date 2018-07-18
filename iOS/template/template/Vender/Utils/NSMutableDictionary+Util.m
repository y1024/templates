//
//  NSMutableDictionary+Util.m
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import "NSMutableDictionary+Util.h"

@implementation NSMutableDictionary (Util)

- (void)tp_setValue:(id)value
                key:(NSString*)key {
    if (value && [key isKindOfClass:[NSString class]]) {
        [self setValue:value forKey:key];
    }
}


@end
