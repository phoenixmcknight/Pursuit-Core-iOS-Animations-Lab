//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var buttonStackView: UIStackView = {
        let buttonStack = UIStackView(arrangedSubviews: [self.upButton,self.downButton])
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 30
        return buttonStack
    }()
    
    lazy var secondButtonStackView: UIStackView = {
          let buttonStack = UIStackView(arrangedSubviews: [self.leftButton,self.rightButton])
          buttonStack.axis = .horizontal
          buttonStack.alignment = .center
          buttonStack.distribution = .equalSpacing
          buttonStack.spacing = 30
          return buttonStack
      }()
    
    lazy var upButton: UIButton = {
       let button = UIButton()
        button.setTitle("Move square up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(moveUpButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    lazy var stepperAction:UIStepper = {
          let stepper = UIStepper(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
           stepper.value = 1
           stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(showdurationTime), for: .valueChanged)
           return stepper
           
       }()
    
    lazy var downButton: UIButton = {
       let button = UIButton()
        button.setTitle("Move square down", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(moveDownButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var settingsButton:UIButton = {
        let frame = UIScreen.main.bounds
        let button = UIButton(frame: CGRect(x: frame.minX + 150, y: frame.minY + 100, width: 75, height: 50))
        button.setTitle("Settings", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        return button
    }()
    
    lazy var actionButton:UIButton = {
        let frame = UIScreen.main.bounds
               let button = UIButton(frame: CGRect(x: frame.minX + 150, y: frame.minY + 150, width: 75, height: 50))
               button.setTitle("Action", for: .normal)
               button.tintColor = .black
               button.backgroundColor = .black
               button.addTarget(self, action: #selector(changeSetting), for: .touchUpInside)
               return button
    }()
    
    lazy var blueSquareHeightConstaint: NSLayoutConstraint = {
        blueSquare.heightAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareWidthConstraint: NSLayoutConstraint = {
        blueSquare.widthAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareCenterXConstraint: NSLayoutConstraint = {
        blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()
    
    lazy var blueSquareCenterYConstraint: NSLayoutConstraint = {
        blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    
    lazy var durationLabel:UILabel = {
        let label = UILabel()
        label.text = "Duration Value \(self.stepperAction.value)"
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
   
    lazy var leftButton:UIButton = {
        let button = UIButton()
    button.setTitle("Move square Left", for: .normal)
               button.setTitleColor(.black, for: .normal)
               button.backgroundColor = .cyan
               button.addTarget(self, action: #selector(moveLeftButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var rightButton:UIButton = {

       let button = UIButton()
        button.setTitle("Move square right", for: .normal)
                   button.setTitleColor(.black, for: .normal)
                   button.backgroundColor = .cyan
                   button.addTarget(self, action: #selector(moveRightButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
    }
    
  
    
    private func addSubviews() {
        view.addSubview(actionButton)
        view.addSubview(settingsButton)
        view.addSubview(blueSquare)
       view.addSubview(secondButtonStackView)
        view.addSubview(buttonStackView)
        view.addSubview(stepperAction)
        view.addSubview(durationLabel)
    }
    
    @objc func showdurationTime() {
        durationLabel.text = "Duration Value \(self.stepperAction.value)"
    }
    @objc func showSettings() {
let animationVC = animationPicker()
        present(animationVC,animated: true)
        
    }
    @objc func changeSetting() {
        if UserDefaultsWrapper.shared.getOption() != nil {
          
        
        
        switch UserDefaultsWrapper.shared.getOption() {
        case "Repeat":
            UIView.animate(withDuration: self.stepperAction.value, delay: 0.0, options: [.repeat], animations: {
                  self.blueSquare.center = CGPoint(x: self.blueSquare.center.x + 100 , y: self.blueSquare.center.y + 100)
            }) { (_) in
                  self.blueSquare.center = CGPoint(x: self.blueSquare.center.x - 100 , y: self.blueSquare.center.y - 100)
            }
        case "AutoReverse":
            UIView.animate(withDuration: self.stepperAction.value, delay: 0.0, options: [.autoreverse], animations: {
                             self.blueSquare.center = CGPoint(x: self.blueSquare.center.x + 100 , y: self.blueSquare.center.y + 100)
                       }) { (_) in
                             self.blueSquare.center = CGPoint(x: self.blueSquare.center.x - 100 , y: self.blueSquare.center.y - 100)
                       }
        case "AllowAnimatedContent":
            UIView.animate(withDuration: self.stepperAction.value, delay: 0.0, options: [.allowAnimatedContent], animations: {
                             self.blueSquare.center = CGPoint(x: self.blueSquare.center.x + 100 , y: self.blueSquare.center.y + 100)
                       }) { (_) in
                             self.blueSquare.center = CGPoint(x: self.blueSquare.center.x - 100 , y: self.blueSquare.center.y - 100)
                       }
        case "Curve Ease Out":
            UIView.animate(withDuration: self.stepperAction.value, delay: 0.0, options: [.curveEaseOut], animations: {
                             self.blueSquare.center = CGPoint(x: self.blueSquare.center.x + 100 , y: self.blueSquare.center.y + 100)
                       }) { (_) in
                             self.blueSquare.center = CGPoint(x: self.blueSquare.center.x - 100 , y: self.blueSquare.center.y - 100)
                       }
        case "Curve Ease In":
            UIView.animate(withDuration: self.stepperAction.value, delay: 0.0, options: [.curveEaseIn], animations: {
                             self.blueSquare.center = CGPoint(x: self.blueSquare.center.x + 100 , y: self.blueSquare.center.y + 100)
                       }) { (_) in
                             self.blueSquare.center = CGPoint(x: self.blueSquare.center.x - 100 , y: self.blueSquare.center.y - 100)
                       }
            
        default:
            return
        }
        } else {
            return
        }
    }
    
    private func configureConstraints() {
        constrainBlueSquare()
constrainStepper()
        constrainButtonStackView()
        constrainsecondButtonStackView()
    }
    
   
    

    func constrainStepper() {
        stepperAction.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([ stepperAction.topAnchor.constraint(equalTo: blueSquare.bottomAnchor, constant: 25),
               stepperAction.centerXAnchor.constraint(equalTo: blueSquare.centerXAnchor)
        
        ])
       
    }
    
    
    private func constrainBlueSquare() {
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueSquareHeightConstaint,
            blueSquareWidthConstraint,
            blueSquareCenterXConstraint,
            blueSquareCenterYConstraint,
            durationLabel.centerXAnchor.constraint(equalTo: blueSquare.centerXAnchor),
            durationLabel.centerYAnchor.constraint(equalTo: blueSquare.centerYAnchor)
        ])
    }
    
    private func constrainButtonStackView() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func constrainsecondButtonStackView() {
          secondButtonStackView.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
            secondButtonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            secondButtonStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            secondButtonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
          ])
      }
    @objc func moveDownButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: self.stepperAction.value, delay: 0, options: .curveEaseInOut, animations: {
            self.blueSquare.center = CGPoint(x: self.blueSquare.center.x , y: self.blueSquare.center.y + 30)
            self.durationLabel.center = CGPoint(x: self.blueSquare.center.x , y: self.blueSquare.center.y + 30)
        }, completion: nil)
    }
    @objc func moveUpButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: self.stepperAction.value, delay: 0, options: .curveEaseInOut, animations: {
            self.blueSquare.center = CGPoint(x: self.blueSquare.center.x , y: self.blueSquare.center.y - 30)
            self.durationLabel.center = CGPoint(x: self.blueSquare.center.x , y: self.blueSquare.center.y - 30)
        }, completion: nil)
    }
    @objc func moveLeftButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: self.stepperAction.value, delay: 0, options: .curveEaseInOut, animations: {
            self.blueSquare.center = CGPoint(x: self.blueSquare.center.x - 30 , y: self.blueSquare.center.y )
            self.durationLabel.center = CGPoint(x: self.blueSquare.center.x - 30 , y: self.blueSquare.center.y )
        }, completion: nil)
    }
    @objc func moveRightButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: self.stepperAction.value, delay: 0, options: .curveEaseInOut, animations: {
            self.blueSquare.center = CGPoint(x: self.blueSquare.center.x + 20 , y: self.blueSquare.center.y)
             self.durationLabel.center = CGPoint(x: self.blueSquare.center.x + 30 , y: self.blueSquare.center.y )
        }, completion: nil)
    }
}


