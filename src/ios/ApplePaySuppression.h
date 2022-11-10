
/**
 * @author James Millar
 *
 */

#import <Cordova/CDV.h>
#import <PassKit/PassKit.h>

@interface ApplePaySuppression : CDVPlugin

- (void)enableApplePay:(CDVInvokedUrlCommand*)command;
- (void)disableApplePay:(CDVInvokedUrlCommand*)command;

@end
