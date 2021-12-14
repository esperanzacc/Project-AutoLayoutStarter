//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?

  
   
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
      
      
    //create a purple box
    let purpleBox = UIView()
      purpleBox.backgroundColor = .purple
      purpleBox.translatesAutoresizingMaskIntoConstraints = false
    //always need to addsubview first and add other constraints
      mainView.addSubview(purpleBox)
        
      //set up layout
        //1. bottoms margin
        purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
        //2. right margin
        purpleBox.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20).isActive = true
        //3. height
        purpleBox.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //4. width relative to the greenView's width
        purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7).isActive = true
        
      
    //create a vertical stack view
    let blueBoxContainer = UIStackView()
      blueBoxContainer.axis = .vertical
      blueBoxContainer.alignment = .center
      blueBoxContainer.distribution = .equalCentering
      blueBoxContainer.translatesAutoresizingMaskIntoConstraints = false
      mainView.addSubview(blueBoxContainer)
    
      //I searched how I can set up stackview in Horizontally and Vertically in container from stackoverflow https://stackoverflow.com/questions/27624133/programmatically-add-centerx-centery-constraints
      
      //set up layout
        //1. left margin
        blueBoxContainer.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 150).isActive = true
        //2. right margin
        blueBoxContainer.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -150).isActive = true
        //3. height relative to the greenView's height
        blueBoxContainer.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.5).isActive = true
        //4. horizontally in container
        blueBoxContainer.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        //5. vertically in container
        blueBoxContainer.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
    
    //create three blueBoxes inside the vertical stackView
    let blueBox1 = UIView()
      blueBox1.backgroundColor = .blue
      blueBox1.translatesAutoresizingMaskIntoConstraints = false
      //I search how to add buttons or something else to stackview from developer.apple.com https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/LayoutUsingStackViews.html#//apple_ref/doc/uid/TP40010853-CH11-SW1
      blueBoxContainer.addArrangedSubview(blueBox1)
      
      //set up layout
        //1. height
        blueBox1.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //2. width
        blueBox1.widthAnchor.constraint(equalToConstant: 60).isActive = true

      
      
    let blueBox2 = UIView()
      blueBox2.backgroundColor = .blue
      blueBox2.translatesAutoresizingMaskIntoConstraints = false
      blueBoxContainer.addArrangedSubview(blueBox2)
      
      //set up layout
        //1. height
        blueBox2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //2. width
        blueBox2.widthAnchor.constraint(equalToConstant: 60).isActive = true


    let blueBox3 = UIView()
      blueBox3.backgroundColor = .blue
      blueBox3.translatesAutoresizingMaskIntoConstraints = false
      blueBoxContainer.addArrangedSubview(blueBox3)
      
      //set up layout
        //1. height
        blueBox3.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //2. width
        blueBox3.widthAnchor.constraint(equalToConstant: 60).isActive = true

      
      
    //create one red box and add two orange boxes to it
    let redBox = UIView()
      redBox.backgroundColor = .red
      redBox.translatesAutoresizingMaskIntoConstraints = false
      mainView.addSubview(redBox)
        
      //set up layout
        //1. top margin
        redBox.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
        //2. right margin
        redBox.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20).isActive = true
        //3. height
        redBox.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //4. width
        redBox.widthAnchor.constraint(equalToConstant: 170).isActive = true
      
    //create two orange boxes
    let orangeBox1 = UIView()
      orangeBox1.backgroundColor = .orange
      orangeBox1.translatesAutoresizingMaskIntoConstraints = false
      mainView.addSubview(orangeBox1)
    
      //set up layout
        //1. top margin
        orangeBox1.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30).isActive = true
        //2. right margin
        orangeBox1.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -30).isActive = true
        //3. height
        orangeBox1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //4. width
        orangeBox1.widthAnchor.constraint(equalToConstant: 53).isActive = true
      
      
    let orangeBox2 = UIView()
      orangeBox2.backgroundColor = .orange
      orangeBox2.translatesAutoresizingMaskIntoConstraints = false
      mainView.addSubview(orangeBox2)
    
      //set up layout
        //1. top margin
        orangeBox2.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30).isActive = true
        //2. right margin
        orangeBox2.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -95).isActive = true
        //3. height
        orangeBox2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //4. width
        orangeBox2.widthAnchor.constraint(equalToConstant: 80).isActive = true
    
      
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

