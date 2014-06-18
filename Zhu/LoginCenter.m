//
//  LoginCenter.m
//  Zhu
//
//  Created by Albert Mao on 6/18/14.
//
//

#import "LoginCenter.h"

@implementation LoginCenter
+ (id) sharedInstance
{
    static LoginCenter *shared  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[LoginCenter alloc]init];
    });
    return shared;
}

#define KEY_LOGIN @"login"

- (void) login
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:YES] forKey:KEY_LOGIN];
    [defaults synchronize];
}

- (void) logout
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:KEY_LOGIN];
    [defaults synchronize];
}

- (BOOL) isLogin
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *num = [defaults objectForKey:KEY_LOGIN];
    return [num boolValue];
}
@end
