//
//  LoginClient.h
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

#import <Foundation/Foundation.h>

@class StReqLogin;
@class StRspLogin;

@interface LoginClient : NSObject
- (void)loginWithEmail:(StReqLogin *)stReqLogin
    completion:(void (^)(StRspLogin *))completion
    withError:(void (^)(NSString *error))errorBlock;
@end
