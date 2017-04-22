#import "CDVSettings.h"
#import <Cordova/CDV.h>

@implementation CDVSettings

- (void)openSettings:(CDVInvokedUrlCommand*)command {
    
    CDVPluginResult* pluginResult = nil;
    NSString* key = [command.arguments objectAtIndex:0];
    NSString* prefix = @"App-Prefs:";
    
    if(SYSTEM_VERSION_LESS_THAN(@"10.0")){
        prefix = @"prefs:";
    }
    
    BOOL canOpenSettings = (&UIApplicationOpenSettingsURLString != NULL);
    if (canOpenSettings) {
        if ([key isEqualToString:@"account"]) {
            
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:url];
        }else if ([key isEqualToString:@"about"]) {
            
            NSURL *url = [NSURL URLWithString: @"App-Prefs:root=About"];
            [[UIApplication sharedApplication] openURL:url];
        }else if ([key isEqualToString:@"touchid"]) {
            
            NSURL *url = [NSURL URLWithString:@"App-Prefs:root=TOUCHID_PASSCODE"];
            [[UIApplication sharedApplication] openURL:url];
        }else if ([key isEqualToString:@"location"]) {
            
            NSURL *url = [NSURL URLWithString:@"App-Prefs:root=General&path=Restrictions"];
            [[UIApplication sharedApplication] openURL:url];
        }else if ([key isEqualToString:@"application_details"]) {
            
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:url];
        }else if ([key isEqualToString:@"wifi"]) {
            
            NSURL *url = [NSURL URLWithString:@"App-Prefs:root=WIFI"];
            [[UIApplication sharedApplication] openURL:url];
        }
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];}

@end