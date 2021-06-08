//
//  LoginClient.m
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

#import "LoginClient.h"
#import <iOSTest-Swift.h>

@interface LoginClient ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation LoginClient

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 **/

- (void)loginWithEmail:(StReqLogin *)stReqLogin
    completion:(void (^)(NSDictionary *))completion
    withError:(void (^)(NSString *error))errorBlock
{
    [[[API alloc] init] loginWithStReq: stReqLogin completion:^(StRspLogin *stRspLogin) {
        if (stRspLogin == nil) {
            errorBlock(@"Error while fecting chat");
        }
        completion(stRspLogin);
    }];
}

@end
