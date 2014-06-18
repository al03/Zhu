//
//  LoginCenter.h
//  Zhu
//
//  Created by Albert Mao on 6/18/14.
//
//

#import <Foundation/Foundation.h>

@interface LoginCenter : NSObject
+ (id) sharedInstance;
- (void) login;
- (void) logout;
- (BOOL) isLogin;
@end
