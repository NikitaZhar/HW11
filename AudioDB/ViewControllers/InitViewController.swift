//
//  InitViewController.swift
//  AudioDB
//
//  Created by Nikita Zharinov on 07/03/2021.
//

import UIKit
import Alamofire

class InitViewController: UIViewController {

    var spinnerView: UIActivityIndicatorView?
    var trackList: Loved = Loved(loved: [])

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapButton() {
        spinnerView = showSpinner(in: view)
        spinnerView?.startAnimating()
        
        NetworkManager.shared.fetchData { (trackList) in
            DispatchQueue.main.async {
                self.trackList = trackList
                self.performSegue(withIdentifier: "initSegue", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let tableVC = navigationVC.topViewController as? TrackListTableViewController else { return }
        tableVC.trackList = trackList
    }
}

func showSpinner(in view: UIView) -> UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    activityIndicator.startAnimating()
    activityIndicator.center = view.center
    activityIndicator.hidesWhenStopped = true
    view.addSubview(activityIndicator)
    return activityIndicator
}

