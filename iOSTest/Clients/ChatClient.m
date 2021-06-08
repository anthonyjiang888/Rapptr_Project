//
//  ChatClient.m
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

#import "ChatClient.h"
#import <iOSTest-Swift.h>

@interface ChatClient ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation ChatClient

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 **/

- (void)fetchChatData:(void (^)(StRspChat*))completion withError:(void (^)(NSString *error))errorBlock
{
    [[[API alloc] init] chatLogWithCompletion:^(StRspChat *stRspChat) {
        if (stRspChat == nil) {
            errorBlock(@"Error while fecting chat");
        }
        completion(stRspChat);
    }];
}

@end
