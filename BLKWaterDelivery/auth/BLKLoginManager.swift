//
//  LoginManager.swift
//  BLKWaterDelivery
//
//  Created by black9 on 16/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import UIKit
import ParseUI
import Parse
import Bolts

typealias BLKLoginManagerLoginCompletion = (succeeded:Bool,error:NSError?) -> ()
typealias BLKLoginManagerSignUpCompletion = (succeded:Bool,error:NSError?) -> ()

class BLKLoginManager: NSObject {
    var loginCompletion:BLKLoginManagerLoginCompletion?
    var signUpCompletion:BLKLoginManagerSignUpCompletion?
    
    var viewController:UIViewController?
    
    class var sharedInstance: BLKLoginManager {
        struct Static {
            static let instance: BLKLoginManager = BLKLoginManager()
        }
        return Static.instance
    }

    func showLoginScreenOnViewController(viewController:UIViewController,completion:BLKLoginManagerLoginCompletion)
    {
        let logInController = PFLogInViewController()
        logInController.delegate = self
        logInController.facebookPermissions = [ "friends_about_me" ]
        self.loginCompletion = completion
        viewController.presentViewController(logInController, animated:true, completion:nil)
    }

    func showSignUpScrenOnViewController(viewController:UIViewController,completion:BLKLoginManagerSignUpCompletion)
    {
        let signUpController = PFSignUpViewController()
        signUpController.delegate = self
        self.viewController = viewController
        self.signUpCompletion = completion
        self.viewController?.presentViewController(signUpController, animated: true, completion: nil)
    }
    
}

extension BLKLoginManager:PFLogInViewControllerDelegate
{
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser)
    {
        if let completion = self.loginCompletion {
            completion(succeeded:true,error:nil)
        }
        hideLogInController(logInController)
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?)
    {
        if let completion = self.loginCompletion {
            completion(succeeded: false, error: error)
        }
        hideLogInController(logInController)
    }
    
    func hideLogInController(logInController:PFLogInViewController)
    {
        logInController.dismissViewControllerAnimated(true, completion: nil)
        self.loginCompletion = nil
    }
}

extension BLKLoginManager:PFSignUpViewControllerDelegate
{
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        hideSignUpController(signUpController)
    }
    func hideSignUpController(signUpController:PFSignUpViewController)
    {
        signUpController.dismissViewControllerAnimated(true, completion: nil)
        signUpCompletion = nil
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        hideSignUpController(signUpController)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        hideSignUpController(signUpController)
    }
}
