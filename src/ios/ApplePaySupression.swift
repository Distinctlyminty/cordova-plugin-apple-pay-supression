/*
Notes: Use the @objc identifier to show that this class/function should be exposed to Objective-c (Cordova).

*/

@objc(TestPluginSwift) class PasskitHelper : CDVPlugin { // Declare the namespace you want to expose to cordova, when you call the Plugin 
  @objc(supressApplePay:) // Declare the function that you want to expose to cordova, when you call the function (plugin.functionName)
    @objc(enableApplePay:) // Declare the function that you want to expose to cordova, when you call the function (plugin.functionName)


  funct supressApplePay(command: CDVInvokedUrlCommand)){

        var pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR);

// logic goes here


 pluginResult = CDVPluginResult(status: CDVCommandStatus_OK); // Set the plugin result to send back to the client.js file.

    print("The TestPluginSwift test function ran correctly!"); // Just for giggles.
    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId); // Send the function result back to cordova.
 
  }


  funct enableApplePay(command: CDVInvokedUrlCommand)){

        var pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR);

// logic goes here


 pluginResult = CDVPluginResult(status: CDVCommandStatus_OK); // Set the plugin result to send back to the client.js file.

    print("The TestPluginSwift test function ran correctly!"); // Just for giggles.
    self.commandDelegate!.send(pluginResult, callbackId: command.callbackId); // Send the function result back to cordova.
 
  }
}