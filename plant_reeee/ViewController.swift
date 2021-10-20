
import CoreML
import Vision
import UIKit

var all_classified = [[String()]]

let class_names:Array = [
    "Apple___Apple_scab", "Apple___Black_rot", "Apple___Cedar_apple_rust", "Apple___healthy", "Cherry___healthy",
    "Cherry___Powdery_mildew", "Corn___Cercospora_leaf_spot Gray_leaf_spot", "Corn___Common_rust",
    "Corn___healthy", "Corn___Northern_Leaf_Blight", "Grape___Black_rot", "Grape___Esca_(Black Measles)", "Grape___healthy",
    "Grape___Leaf_blight_(Isariopsis Leaf Spot)", "Orange___Haunglongbing_(Citrus greening)", "Peach___Bacterial_spot", "Peach___healthy",
    "Pepper,_bell___Bacterial spot", "Pepper,_bell___healthy", "Potato___Early_blight", "Potato___healthy", "Potato___Late_blight",
    "Squash___Powdery_mildew", "Strawberry___healthy", "Strawberry___Leaf_scorch",
    "Tomato___Bacterial_spot", "Tomato___Early_blight", "Tomato___healthy", "Tomato___Late_blight", "Tomato___Leaf_Mold",
    "Tomato___Septoria_leaf_spot", "Tomato___Spider_mites Two-spotted_spider_mite", "Tomato___Tomato_mosaic_virus",
    "Tomato___Tomato_Yellow_Leaf_Curl_Virus"
]
// fdsffsdf


class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var request = VNRecognizeTextRequest(completionHandler: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func takeImage(_ sender: Any) {
    
    //    @IBAction func takeImage(_ sender: Any) {
//        print("bruh")
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = true
            //imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }

    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            imageView.image = pickedImage
        } else if let pickedImage = info[.originalImage] as? UIImage {
            imageView.image = pickedImage
        }
        self.dismiss(animated: true)
        updateClassifications(for: imageView.image!)

    }
    
    lazy var classificationRequest: VNCoreMLRequest = {
        do {

            let config = MLModelConfiguration()
            config.computeUnits = .cpuOnly
            let model = try VNCoreMLModel(for: mobileNet3().model)
            let ml_request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in self?.processClassifications(for: request)
            })
            ml_request.imageCropAndScaleOption = .centerCrop
            return ml_request

        } catch {
            fatalError()
        }
    }()

    func updateClassifications(for image: UIImage) {
        let handler = VNImageRequestHandler(ciImage: CIImage(image: image)!, orientation: .up)
        do {
            try handler.perform([self.classificationRequest])
        } catch {
            print(error)
        }
    }

    func processClassifications(for request: VNRequest) {
        let classifications = request.results as! [VNClassificationObservation]
        print(classifications)
        let firstDetected = String(classifications[0].identifier)
        let firstConfidence = String(classifications[0].confidence)
        let secondDetected = String(classifications[1].identifier)
        let secondConfidence = String(classifications[1].confidence)
        let thirdDetected = String(classifications[2].identifier)
        let thirdConfidence = String(classifications[2].confidence)
        all_classified = [[firstDetected, firstConfidence], [secondDetected, secondConfidence], [thirdDetected, thirdConfidence]]
        print(all_classified)
        
        var sum = 0.0
        for i in 0...33 {
            print(String(Double((classifications[i].confidence))))
        }
        print(Double(classifications[0].confidence) / sum)
        
        let vc = self.storyboard!.instantiateViewController(identifier: "classification")
        self.present(vc, animated: true, completion: nil)
    }
}

