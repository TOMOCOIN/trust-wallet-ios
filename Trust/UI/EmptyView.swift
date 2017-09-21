// Copyright SIX DAY LLC, Inc. All rights reserved.

import Foundation
import UIKit

class EmptyView: UIView {
    
    let label = UILabel()
    let imageView = UIImageView()
    let button = Button(size: .normal, style: .solid)
    
    var onRetry: (() -> Void)? = .none
    
    init(message: String = "Empty", image: UIImage? = .none) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = message
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Refresh", for: .normal)
        button.addTarget(self, action: #selector(retry), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [label, imageView, button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 10
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    func retry() {
        onRetry?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}