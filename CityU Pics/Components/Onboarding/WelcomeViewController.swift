//
//  WelcomeViewController.swift
//  CityU Pics
//
//  Created by Cali Castle  on 9/18/17.
//  Copyright © 2017 Cali Castle . All rights reserved.
//

import UIKit
import paper_onboarding
import Haptica
import ShadowView
import Walker

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var onboardingView: OnboardingView!
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var authContainer: UIView!
    @IBOutlet weak var signUpContainer: UIView!
    @IBOutlet weak var signInContainer: UIView!
    @IBOutlet weak var signInButton: UIButton!
    
    var isSigningIn = true
    
    fileprivate func configureViews() {
        signInContainer.layer.cornerRadius = 15
        signInButton.layer.cornerRadius = 12
        
        signUpContainer.layer.cornerRadius = 15
    }
    
    fileprivate func hideAuthContainerAndLogo(withTransition: Bool = false) {
        if withTransition {
            UIView.animate(withDuration: 0.3, animations: {
                self.hideAuthContainerAndLogo(withTransition: false)
            })

            return
        }
        
        logoImageView.alpha = 0
        logoImageView.transform = CGAffineTransform(translationX: 0, y: -30)
    
        authContainer.isUserInteractionEnabled = false
        
        signInContainer.alpha = 0
        signInContainer.layer.transform = CATransform3DMakeScale(0.3, 0.3, 0.3)
        
        signInButton.alpha = 0
        signInButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        signUpContainer.alpha = 0
        signUpContainer.layer.transform = CATransform3DConcat(CATransform3DMakeTranslation(0, -20, 0), CATransform3DMakeScale(0.1, 0.1, 0.2))
    }
    
    fileprivate func showAuthContainerAndLogo() {
        // Animate logo
        animate(logoImageView, delay: 0, duration: 0.2, curve: .easeIn, options: []) {
            $0.alpha = 1
            $0.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        
        self.authContainer.isUserInteractionEnabled = true
        
        // Animate sign in container
        UIView.animate(withDuration: 0.45, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
            self.signInContainer.alpha = 1
            self.signInContainer.layer.transform = CATransform3DMakeScale(1, 1, 1)
        }, completion: nil)
        
        // Animate sign up container
        animate(signUpContainer, delay: 0.5, duration: 0.35, curve: .easeOut, options: []) {
            $0.alpha = 1
            $0.transform3D = CATransform3DConcat(CATransform3DMakeTranslation(0, 0, 0), CATransform3DMakeScale(0.9, 0.9, 1))
        }
    }
    
    @IBAction func signInDidTap(_ sender: Any) {
        
    }
    
    fileprivate func toggleSubmitButton() {
        if isSigningIn {
            // Animate sign in button
            UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.15, options: .curveEaseInOut, animations: {
                self.signInButton.alpha = (self.signInButton.alpha == 1) ? 0 : 1
                self.signInButton.layer.transform = CATransform3DMakeScale(self.signInButton.alpha, self.signInButton.alpha, 1)
            })
            
        } else {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingView.dataSource = self
        onboardingView.delegate = self
        
        configureViews()
        
        hideAuthContainerAndLogo()
        
        var perspectiveTransform = CATransform3DIdentity
        perspectiveTransform.m34 = 1 / -500
        authContainer.layer.sublayerTransform = perspectiveTransform
        authContainer.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        authContainer.layer.isDoubleSided = false
    }

}

// MARK: - PaperOnboarding Delegate & DataSource Methods
extension WelcomeViewController: PaperOnboardingDataSource, PaperOnboardingDelegate {
    
    /// Data reads from the plist file
    var onboardingData: [[String:String]] {
        let filePath = Bundle.main.path(forResource: "OnboardingData", ofType: "plist")
        
        return NSArray(contentsOfFile: filePath!) as! [[String:String]]
    }
    
    func onboardingItemsCount() -> Int {
        return onboardingData.count
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let data = onboardingData[index]
        
        return index != (onboardingData.count - 1) ? (UIImage(named: "onboarding.\(data["image"]!)")!,
                data["title"],
                data["description"],
                UIImage(named: "onboarding.\(data["icon"]!)")!,
                UIColor(hexString: data["color"]!),
                UIColor(hexString: data["titleColor"]!),
                UIColor(hexString: data["descColor"]!),
                AppFont.Bold.size(size: 30),
                AppFont.Bold.size(size: 30)) as! OnboardingItemInfo
            : (UIImage(), "", "", UIImage(named: "onboarding.\(data["icon"]!)")!, UIColor(hexString: data["color"]!)!, UIColor.white, UIColor.white, AppFont.Bold.size(size: 0), AppFont.Bold.size(size: 0))
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == (onboardingData.count - 1) {
            showAuthContainerAndLogo()
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        Haptic.impact(.light).generate()
        
        if index != (onboardingData.count - 1) {
            hideAuthContainerAndLogo(withTransition: true)
        }
    }
}
