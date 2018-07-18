//
//  NSString+Crypto.m
//  template
//
//  Created by Cole on 2018/7/18.
//  Copyright © 2018年 Cole. All rights reserved.
//

#import "NSString+Crypto.h"
#import "CocoaSecurity.h"

@implementation NSString (Crypto)

#pragma mark - MD5

- (NSString*)tp_MD5 {
    return [self MD5Result].hex;
}

- (NSString*)tp_MD5Lower {
    return [self MD5Result].hexLower;
}

- (CocoaSecurityResult*)MD5Result {
    CocoaSecurityResult *result = [CocoaSecurity md5:self];
    return result;
}


#pragma mark - AES
- (NSString *)encryAESWitKey:(NSString *)keyString
                    ivString:(NSString *)ivString {
    NSString *keyHexString = [self hexASIIWithString:keyString];
    NSString *ivHexString = [self hexASIIWithString:ivString];
    CocoaSecurityDecoder *keyHexDecoder = [CocoaSecurityDecoder new];
    
    NSData *keyHexStringData = [keyHexDecoder hex:keyHexString];
    NSData *ivHexStringData = [keyHexDecoder hex:ivHexString];
    
    NSData *encryptKeyHexStringData =
    [keyHexStringData subdataWithRange:NSMakeRange(0, 16)];
    NSData *encryptIvHexStringData =
    [ivHexStringData subdataWithRange:NSMakeRange(0, 16)];
    CocoaSecurityResult *encryptResult =
    [CocoaSecurity aesEncrypt:self
                          key:encryptKeyHexStringData
                           iv:encryptIvHexStringData];
    return encryptResult.base64;
}
- (NSString*)dencryAESWithKey:(NSString*)keyString
                     ivString:(NSString*)ivString {
    NSString *keyHexString = [self hexASIIWithString:keyString];
    NSString *ivHexString = [self hexASIIWithString:ivString];
    CocoaSecurityDecoder *keyHexDecoder = [CocoaSecurityDecoder new];
    
    NSData *keyHexStringData = [keyHexDecoder hex:keyHexString];
    NSData *ivHexStringData = [keyHexDecoder hex:ivHexString];
    
    NSData *encryptKeyHexStringData =
    [keyHexStringData subdataWithRange:NSMakeRange(0, 16)];
    NSData *encryptIvHexStringData =
    [ivHexStringData subdataWithRange:NSMakeRange(0, 16)];
    CocoaSecurityResult *decryptResult = [CocoaSecurity aesDecryptWithBase64:self key:encryptKeyHexStringData iv:encryptIvHexStringData];
    return decryptResult.utf8String;
}

- (NSString *)hexASIIWithString:(NSString *)string {
    NSString *iv = @"";
    for (int i = 0; i < string.length; i++) {
        iv = [iv stringByAppendingString:
              [NSString
               stringWithFormat:@"%x",
               [string characterAtIndex:i]]];
    };
    return iv;
}

#pragma mark - AESDemo

/*
 
 - (NSString*)hexASIIWithString:(NSString*)string {
 NSString *iv = @"";
 for (int i = 0 ; i < string.length; i ++) {
 iv = [iv stringByAppendingString:[NSString stringWithFormat:@"%x",[string characterAtIndex:i]]];
 };
 return iv;
 }
 
 NSString *src = @"VERIFYCODE_KEY|1459911352|13907550001";
 NSString *keyString = @"P)KSU0JNU&D=&^Dyuu^DB!#D";
 NSString *ivString  = @"AGS1WIG!IE*IQ9UW";
 
 NSString *keyHexString = [self hexASIIWithString:keyString];
 NSString *ivHexString  = [self hexASIIWithString:ivString];
 
 CocoaSecurityDecoder *keyHexDecoder = [CocoaSecurityDecoder new];
 
 NSData *keyHexStringData = [keyHexDecoder hex:keyHexString];
 NSData *ivHexStringData = [keyHexDecoder hex:ivHexString];
 
 NSData *encryptKeyHexStringData = [keyHexStringData subdataWithRange:NSMakeRange(0, 16)];
 NSData *encryptIvHexStringData = [ivHexStringData subdataWithRange:NSMakeRange(0, 16)];
 
 CocoaSecurityResult *encryptResult = [CocoaSecurity aesEncrypt:src key:encryptKeyHexStringData iv:encryptIvHexStringData];
 
 NSLog(@"encryptResult:%@",encryptResult.base64);
 CocoaSecurityResult *decryptResult = [CocoaSecurity aesDecryptWithBase64:encryptResult.base64 key:encryptKeyHexStringData iv:encryptIvHexStringData];
 NSLog(@"decryptResult:%@",decryptResult.utf8String);
 
 */



@end
