//
//  AViewController.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

class AViewController: UIViewController, INavigationVCDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if presentedViewController != nil, let style = UIApplication.topVC()?.preferredStatusBarStyle {
            return style
        }
        return .default
    }
    
    override var prefersStatusBarHidden: Bool {
        false
    }
    
    //MARK: - Navigation
    
    var isShowBackButton: Bool {
        hasPreviousControllers
    }
    
    var isShowCloseButton: Bool {
        if presentingViewController == nil {
            return false
        }
        return !hasPreviousControllers
    }
    
    var isSwipeBackEnabled: Bool {
        if !hasPreviousControllers || !isShowBackButton {
            return false
        }
        return true
    }
    
    final var hasPreviousControllers: Bool {
        if !clearPreviousControllersAfterAppear, let ind = navigationController?.viewControllers.firstIndex(of: self), ind > 0 {
            return true
        }
        return false
    }
    
    var clearPreviousControllersAfterAppear: Bool {
        false
    }
    
    //MARK: - NavBar
    
    var hiddenNavBar: Bool {
        false
    }
    
    var isTranslucentNavBar: Bool {
        false
    }
    
    lazy var backBarButton: UIBarButtonItem? = initBackBarButton()
    
    func initBackBarButton() -> UIBarButtonItem? {
        nil
    }
    
    lazy var closeBarButton: UIBarButtonItem? = initCloseBarButton()
    
    func initCloseBarButton() -> UIBarButtonItem? {
        nil
    }
    
    //MARK: - Initiate
    
    deinit {
        #if DEBUG
        print("\(type(of: self)) deinit")
        #endif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        if clearPreviousControllersAfterAppear, let vcs = navigationController?.viewControllers, vcs.first != self {
            navigationController?.viewControllers = [self]
        }
        
        style()
        fill()
    }
    
    // Стилизуем view
    func style() -> Void {
        
    }
    
    // Заполняем view данными
    func fill() -> Void {
        
    }
    
    var isVisible = false
    var isFirstWillAppear = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        styleNavigationBar()
        
        isVisible = true
        
        if isFirstWillAppear {
            firstViewWillAppear()
        } else {
            repeatedViewWillAppear()
        }
        isFirstWillAppear = false
    }
    
    func firstViewWillAppear() {
        setBackButton()
        setCloseButton()
    }
    
    func repeatedViewWillAppear() { }
    
    var isFirstDidAppear = true
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        Metrix.shared.sendViewWillAppearEvent(for: self)
        
        if isFirstDidAppear {
            firstViewDidAppear()
        } else {
            repeatedViewDidAppear()
        }
        isFirstDidAppear = false
    }
    
    func firstViewDidAppear() { }
    func repeatedViewDidAppear() { }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        isVisible = false
    }
    
    //MARK: - NavBar
    
    func hideBackButton() {
        navigationItem.hidesBackButton = true
    }
    
    func styleNavigationBar() {
        
    }
    
    func setBackButton() {
        if isShowBackButton && !isShowCloseButton {
            navigationItem.setLeftBarButton(backBarButton, animated: false)
        }
    }
    
    func setCloseButton() {
        if isShowCloseButton {
            navigationItem.setRightBarButton(closeBarButton, animated: false)
        }
    }
    
    //MARK: - Navigation
    
    @objc func pushBack() {
        navigationController?.popViewController(animated: true)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        
        #if swift(>=5.1)
        let pc = navigationController?.presentationController ?? presentationController
        let delegate = pc?.delegate
        
        if #available(iOS 13.0, *), let pc = pc {
            delegate?.presentationControllerWillDismiss?(pc)
        }
        #endif
        
        super.dismiss(animated: flag) { [unowned self] in
            #if swift(>=5.1)
            if #available(iOS 13.0, *), let pc = pc {
                delegate?.presentationControllerDidDismiss?(pc)
            }
            #endif
            self.dismissCompletion()
            completion?()
        }
    }
    
    func dismissCompletion() { }
    
    @objc func close() {
        dismiss(animated: true)
    }
    
    // MARK: -
    
    func configuratePresentedView(_ delegate: UIGestureRecognizerDelegate?) {
        (navigationController ?? self)?.presentationController?.presentedView?.gestureRecognizers?.forEach {
            $0.delegate = delegate
        }
    }
}

extension AViewController: UIAdaptivePresentationControllerDelegate {
    
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        viewWillAppear(true)
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        viewDidAppear(true)
        setNeedsStatusBarAppearanceUpdate()
    }
}
