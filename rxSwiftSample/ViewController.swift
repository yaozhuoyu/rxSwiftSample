//
//  ViewController.swift
//  rxSwiftSample
//
//  Created by 姚卓禹 on 15/8/17.
//  Copyright (c) 2015年 姚卓禹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //startWithMethodSample()
        throttleMethodSample()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startWithMethodSample() {
        let observable = just(3)
        >- startWith(2)
        
        observable
            >- subscribeNext{ result in
                println("startWith sub next \(result)")
            }
    }
    
    func throttleMethodSample(){
        let throttleObservable = concat([just(1), never()])
        >- throttle(5, MainScheduler.sharedInstance)
        >- startWith(0)
        
        println("begin")
        throttleObservable
            >- subscribeNext{ result in
                println("throttle result \(result)")
            }
    }

}

