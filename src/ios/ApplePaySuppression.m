/**
 * @author James Millar
 *
 */

#import "ApplePaySuppression.h"

@implementation ApplePaySuppression : CDVPlugin

static PKSuppressionRequestToken * tokenPKSuppression = nil;

- (void)enableApplePay:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult * pluginResult = nil;
        
    if (@available(iOS 9, *)) {
        if( PKPassLibrary.isPassLibraryAvailable && PKPassLibrary.isSuppressingAutomaticPassPresentation) {
            
            [PKPassLibrary endAutomaticPassPresentationSuppressionWithRequestToken:(PKSuppressionRequestToken) tokenPKSuppression];
                    }
        NSString *result = [NSString stringWithFormat:@"%s", "Apple Pay Enabled"];
        NSLog(@"%@", result);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        
    }else
    {
        NSString *result = [NSString stringWithFormat:@"%s", "Could not enable Apple Pay"];
        NSLog(@"%@", result);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

}

- (void)disableApplePay:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult * pluginResult = nil;
    
    if (@available(iOS 9, *)) {
        
        if (PKPassLibrary.isPassLibraryAvailable && !PKPassLibrary.isSuppressingAutomaticPassPresentation){
            tokenPKSuppression = [PKPassLibrary requestAutomaticPassPresentationSuppressionWithResponseHandler:^(PKAutomaticPassPresentationSuppressionResult result) {
                           if (result != PKAutomaticPassPresentationSuppressionResultSuccess) {
                               NSLog(@"Apple Pay suppression failed, result: %lu", (unsigned long)result);
                           } else {
                               NSLog(@"Apple Pay suppression succeeded");
                           }
                       }];
            
            NSString *result = [NSString stringWithFormat:@"%s", "Apple Pay disabled"];

            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    }
    else
    {
        NSString *result = [NSString stringWithFormat:@"%s", "Could not disable apple pay"];

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

@end
