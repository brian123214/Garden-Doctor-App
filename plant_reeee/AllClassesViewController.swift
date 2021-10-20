
import UIKit

class AllClassesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let alert = UIAlertController(title: "Information", message: "This app can classify 34 different classes of common plant diseases. To navigate the app, click the buttons in the tab bar on the bottom. To classify an image, click 'Classify Image'. Make sure to focus on the leaves and distinguishing chaacteristcis such as spots. Explore the other features, too!", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        self.present(alert, animated: true)
        print(class_names.count)
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func diagnosticLink(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.dec.ny.gov/lands/79716.html")!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return class_names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "class_name", for: indexPath)
        cell.textLabel?.text = class_names[indexPath.row]
        return cell
    }

}
