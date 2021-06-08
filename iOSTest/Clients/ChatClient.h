//
//  ChatClient.h
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

#import <Foundation/Foundation.h>
#import "Message.h"

@class StRspChat;

@interface ChatClient : NSObject
- (void)fetchChatData:(void (^)(StRspChat *))completion withError:(void (^)(NSString *error))errorBlock;
@end
