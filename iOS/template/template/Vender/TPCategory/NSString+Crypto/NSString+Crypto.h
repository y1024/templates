//
//  NSString+Crypto.h
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Crypto)

- (NSString *)encryAESWitKey:(NSString *)keyString
                    ivString:(NSString *)ivString;

- (NSString*)dencryAESWithKey:(NSString*)keyString
                     ivString:(NSString*)ivString;


- (NSString *)tp_MD5;

- (NSString *)tp_MD5Lower;

@end
