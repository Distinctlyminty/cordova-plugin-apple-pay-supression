/*
Notes: Use the @objc identifier to show that this class/function should be exposed to Objective-c (Cordova).

*/
import Foundation
import PassKit

@objc(TestPluginSwift) class PasskitHelper : CDVPlugin { // Declare the namespace you want to expose to cordova, when you call the Plugin 

  private static var tokenPKSuppresion:PKSuppressionRequestToken!;

  @objc func supressApplePay(command: CDVInvokedUrlCommand){

        var pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR);

  if #available(iOS 9, *) {
            if( PKPassLibrary.isPassLibraryAvailable() && !PKPassLibrary.isSuppressingAutomaticPassPresentation()) {
                tokenPKSuppresion = PKPassLibrary.requestAutomaticPassPresentationSuppression(responseHandler: { (result) in
                    if result == PKAutomaticPassPresentationSuppressionResult.success {
                        print("Automatic Pass Presentation suppressed")
                    }
                    else {
                        print("Could not suppress Automatic Pass Presentation")
                    }
                })
            }
        }


 pluginResult = CDVPluginResult(status: CDVCommandStatus_OK); // Set the plugin result to send back to the client.js file.

    print("The Apple Pay Supression - supress apple pay function ran correctly!"); 
    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId); // Send the function result back to cordova.
 
  }


  @objc func enableApplePay(command: CDVInvokedUrlCommand){

        var pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR);
 if #available(iOS 9, *) {
            if( PKPassLibrary.isPassLibraryAvailable() && PKPassLibrary.isSuppressingAutomaticPassPresentation()) {
                PKPassLibrary.endAutomaticPassPresentationSuppression(withRequestToken: tokenPKSuppresion)
                print("Automatic Pass Presentation enabled")
            }
        }

 pluginResult = CDVPluginResult(status: CDVCommandStatus_OK); // Set the plugin result to send back to the client.js file.

    print("The Apple Pay Supression - enable apple pay function ran correctly!");
    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId); // Send the function result back to cordova.
 
  }
}