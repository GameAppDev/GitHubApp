//
//  Contractable.swift
//  GitHubApp
//
//  Created by Oguzhan Yalcin on 21.01.2023.
//

import UIKit

// MARK: - PresenterToView
@objc protocol PresenterToView: AnyObject {
    func showIndicatorView()
    func hideIndicatorView()
    func showAlert(message: String)
}

extension UIViewController: PresenterToView {
    
    func showIndicatorView() {
        ActivityIndicatorManager.shared.showIndicator()
    }
    
    func hideIndicatorView() {
        ActivityIndicatorManager.shared.hideIndicator()
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Warning",
                                                message: message,
                                                preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: UIAlertAction.Style.cancel,
                                                handler: nil))
        self.present(alertController, animated: false)
    }
}

// MARK: - ViewToPresenter
@objc protocol ViewToPresenter: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    @objc optional func viewWillDisappear()
}

// MARK: - PresenterToInteractor
protocol PresenterToInteractor: AnyObject {
    func fetchData<T>(request: T)
}

// MARK: - InteractorToPresenter
protocol InteractorToPresenter: AnyObject {
    func setData<T>(data: T)
    func setError(error: BaseError)
}

// MARK: - PresenterToRouter
@objc protocol PresenterToRouter: AnyObject { }

// MARK: - ConnectorToPresenter
@objc protocol ConnectorToPresenter: AnyObject { }
