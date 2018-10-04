//
//  DataViewController.swift
//  TestAddFlutter
//
//  Created by Dan Field on 9/18/18.
//  Copyright © 2018 Dan Field. All rights reserved.
//

import UIKit
import Flutter

class DataViewController: UIViewController {

  @IBOutlet weak var dataLabel: UILabel!;
  var dataObject: String = "";
  var flutterEngine = FlutterEngine(name: "io.dan.test", andProject: nil)!;

    override func viewDidLoad() {
        super.viewDidLoad()
      flutterEngine.run(withEntrypoint: "main");
      
        let button = UIButton()
        button.addTarget(self, action: #selector(handleButtonAction(sender:)), for: .touchUpInside)
        button.setTitle("Go Flutter", for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    @objc func handleButtonAction(sender: UIButton!) {
      
      let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)!
//      flutterEngine.launch();
      flutterEngine.setViewController(flutterViewController);
      // let flutterViewController =
      //    FlutterViewController()
      self.showDetailViewController(flutterViewController, sender : self);

//      DispatchQueue.main.asyncAfter(deadline :.now() + 6) {
//        flutterViewController.dismiss(animated: false);
//        flutterEngine.setViewController(nil);
//        DispatchQueue.main.asyncAfter(deadline :.now() + 3) {
//          let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)!
//          flutterEngine.setViewController(flutterViewController);
//          self.showDetailViewController(flutterViewController, sender : self);
//        }
//      };
    }

    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }


}

