// Jonathan Pham
// Intro to iOS Summer 2019
// Project 2

import UIKit

class GameViewController: UIViewController {
    
    let model = GameModel()
    
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var eventLogLabel: UILabel!
    
    @IBOutlet weak var northButton: UIButton!
    @IBOutlet weak var eastButton: UIButton!
    @IBOutlet weak var southButton: UIButton!
    @IBOutlet weak var westButton: UIButton!
    
    @IBOutlet weak var moveCounterLabel: UILabel!
    @IBOutlet weak var specEventLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentLocation = model.currentLocation()
        currentLocationLabel.text = "(x: \(currentLocation.x), y: \(currentLocation.y))"
    }
    
    @IBAction func northButtonPushed(_ sender: UIButton) {
        model.move(direction: .north)
        updateLabelsAndButtons(direction: "Moved North")
    }
    @IBAction func eastButtonPushed(_ sender: UIButton) {
        model.move(direction: .east)
        updateLabelsAndButtons(direction: "Moved East")
    }
    @IBAction func southButtonPushed(_ sender: UIButton) {
        model.move(direction: .south)
        updateLabelsAndButtons(direction: "Moved South")
    }
    @IBAction func westButtonPushed(_ sender: UIButton) {
        model.move(direction: .west)
        updateLabelsAndButtons(direction: "Moved West")
    }
    @IBAction func resetButtonPushed(_ sender: UIButton) {
        model.restart()
        updateLabelsAndButtons()
    }

    // Method section
    func updateButtons () {
        if !model.currentLocation().allowedDirections.contains(.north) {
            northButton.isHidden = true
        } else {
            northButton.isHidden = false
            
        }
        if !model.currentLocation().allowedDirections.contains(.south) {
            southButton.isHidden = true
        } else {
            southButton.isHidden = false
            
        }
        if !model.currentLocation().allowedDirections.contains(.east) {
            eastButton.isHidden = true
        } else {
            eastButton.isHidden = false
        }
        if !model.currentLocation().allowedDirections.contains(.west) {
            westButton.isHidden = true
        } else {
            westButton.isHidden = false
        }
    }
    
    func updateEventLogLabel (direction: String? = nil) {
        if let movedDirection = direction {
            eventLogLabel.text = "\(movedDirection)"
        } else {
            eventLogLabel.text = "Game reset"
        }
    }
    func updateCurrentLocationLabel () {
        currentLocationLabel.text = "(x: \(model.currentLocation().x), y: \(model.currentLocation().y))"
    }
    
    func moveCounter() {
        moveCounterLabel.text = "You've made \(model.numberOfMoves) moves!"
    }
    
    func updateSpecialEventLabel (specialEvent: String) {
        specEventLabel.isHidden = false
        specEventLabel.text = "\(specialEvent) @ \(currentLocationLabel.text!)"
        model.restart()
        updateLabelsAndButtons()
    }
    
    func updateLabelsAndButtons (direction:String? = nil){
        updateButtons()
        updateEventLogLabel(direction: direction)
        updateCurrentLocationLabel()
        moveCounter()
        if let specialEvent = model.currentLocation().event {
            updateSpecialEventLabel(specialEvent: specialEvent)
        }
    }
    
}

