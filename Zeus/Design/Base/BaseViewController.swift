//
//  BaseViewController.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

/// Use only for Nibless ViewControllers
open class BaseViewController<View: UIView>: UIViewController {
    // MARK: - Properties
    public lazy var customView = View(frame: UIScreen.main.bounds)
    
    public init() {
      super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable,
                message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
    )
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    @available(*, unavailable,
                message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection."
    )

    public required init?(coder aDecoder: NSCoder) {
      fatalError("Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    }
    
    // MARK: - Lifecycle
    open override func loadView() {
        self.view = customView
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
