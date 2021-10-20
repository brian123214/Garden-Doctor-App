
import UIKit

class InformationViewController: UIViewController {

    @IBOutlet weak var most_likley_label: UILabel!
    
    @IBOutlet weak var description_label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

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
    // Sources
    // https://extension.umn.edu/plant-diseases/apple-scab#:~:text=Apple%20scab%20is%20the%20most,olive%20green%20to%20brown%20spots.
    // https://www.gardeningknowhow.com/edible/fruits/apples/black-rot-on-apple-trees.htm#:~:text=Black%20rot%20is%20a%20disease,dead%20tissues%20in%20other%20plants.
    // https://extension.umn.edu/plant-diseases/cedar-apple-rust#:~:text=Cedar%20apple%20rust%20projections%20In,several%20times%20in%20one%20spring.
    // http://treefruit.wsu.edu/crop-protection/disease-management/cherry-powdery-mildew/#:~:text=Powdery%20mildew%20of%20sweet%20and,on%20the%20cherry%20surface%20(Fig.
    // http://bulletin.ipm.illinois.edu/pastpest/articles/200316e.html#:~:text=Gray%20leaf%20spot%20(caused%20by,remaining%20from%20the%20previous%20year.
    // https://extension.umn.edu/corn-pest-management/common-rust-corn#:~:text=Common%20rust%20produces%20rust%2Dcolored,as%20sheaths%2C%20can%20be%20infected.
    // https://extension.umn.edu/corn-pest-management/northern-corn-leaf-blight#:~:text=Typical%20symptoms%20of%20northern%20corn,dark%20areas%20of%20fungal%20sporulation.
    // https://en.wikipedia.org/wiki/Black_rot_(grape_disease)#:~:text=Grape%20black%20rot%20is%20a,%2C%20South%20America%2C%20and%20Asia.
    // https://grapes.extension.org/grapevine-measles/
    // http://www.uky.edu/Ag/PAT/cat1/leafdis.htm
    // https://www.gardeningknowhow.com/edible/fruits/citrus/citrus-greening-disease.htm#:~:text=Citrus%20greening%20disease%20symptoms%20vary,aborted%20seeds%20and%20bitter%20juice.
    // https://www.canr.msu.edu/news/management_of_bacterial_spot_on_peaches_and_nectarines#:~:text=Leaf%20symptoms%20of%20bacterial%20spot,branch%20tips%2C%20and%20diseased%20twigs.
    // https://en.wikipedia.org/wiki/Xanthomonas_campestris_pv._vesicatoria#:~:text=vesicatoria%20is%20a%20bacterium%20that,fruit%20spots%20and%20stem%20cankers.
    // https://www.ag.ndsu.edu/publications/crops/early-blight-in-potato#:~:text=Early%20blight%20of%20potato%20is,and%20marketability%20of%20the%20crop.
    // https://en.wikipedia.org/wiki/Phytophthora_infestans#:~:text=Phytophthora%20infestans%20is%20an%20oomycete,late%20blight%20or%20potato%20blight.&text=Late%20blight%20was%20a%20major,the%201846%20Highland%20potato%20famines.
    // https://extension.umn.edu/diseases/powdery-mildew-cucurbits#:~:text=Powdery%20mildew%2C%20mainly%20caused%20by,reduce%20yield%20and%20fruit%20quality.
    // https://mortonarb.org/plant-and-protect/tree-plant-care/plant-care-resources/leaf-scorch/
    // https://en.wikipedia.org/wiki/Xanthomonas_campestris_pv._vesicatoria#:~:text=vesicatoria%20is%20a%20bacterium%20that,fruit%20spots%20and%20stem%20cankers.
    // https://en.wikipedia.org/wiki/Alternaria_solani#:~:text=Alternaria%20solani%20is%20a%20fungal,and%20tuber%20blight%20on%20potato.
    // https://en.wikipedia.org/wiki/Phytophthora_infestans#:~:text=Phytophthora%20infestans%20is%20an%20oomycete,often%20called%20%22potato%20blight%22.
    // https://en.wikipedia.org/wiki/Tomato_leaf_mold#:~:text=Cladosporium%20fulvum%20is%20an%20Ascomycete,also%20occur%20in%20the%20field.
    // https://en.wikipedia.org/wiki/Septoria
    // https://en.wikipedia.org/wiki/Tetranychus_urticae
    // https://en.wikipedia.org/wiki/Tomato_mosaic_virus
    // https://en.wikipedia.org/wiki/Tomato_yellow_leaf_curl_virus#:~:text=Tomato%20yellow%20leaf%20curl%20virus%20(TYLCV)%20is%20a%20DNA%20virus,regions%20causing%20severe%20economic%20losses.
    
    
    
    let descriptions:Array = [
        "Apple Scab is a fungal disease which can affect the leaves, fruit, and twigs of flowering, ornamental trees such as crabapple, hawthorn (Venturia inequalis) and pear (V. pirina). Infection on newly emerging leaves is favored by wet and cool spring conditions.",
        "Black rot is a disease of apples that infects fruit, leaves, and bark caused by the fungus Botryosphaeria obtusa. ... Over time, the spots expand and heavily infected leaves drop from the tree. Infected branches or limbs will show characteristic red-brown sunken areas that expand each year",
        "Cedar apple rust projections In wet spring weather, these galls produce orange, gummy, tentacle-like projections that are 1/2 to 3/4 inch long. When dry, the gummy orange structures shrivel to a dry, reddish-brown.",
        "",
        "",
        "Powdery mildew of sweet and sour cherry is caused by Podosphaera clandestina, an obligate biotrophic fungus. ... Mid- and late-season sweet cherry (Prunus avium) cultivars are commonly affected, rendering them unmarketable due to the covering of white fungal growth on the cherry surface",
        "Gray leaf spot (GLS) is a common fungal disease in the United States caused by the pathogen Cercospora zeae-maydis in corn. Disease development is favored by warm temperatures, 80°F or 27 °C; and high humidity, relative humidity of 90% or higher for 12 hours or more.",
        "Common rust produces rust-colored to dark brown, elongated pustules on both leaf surfaces. The pustules contain rust spores (urediniospores) that are cinnamon brown in color. Pustules darken as they age. Leaves, as well as sheaths, can be infected.",
        "",
        "Typical symptoms of northern corn leaf blight are canoe-shaped lesions 1 inch to 6 inches long. The lesions are initially bordered by gray-green margins. They eventually turn tan colored and may contain dark areas of fungal sporulation.",
        "Grape black rot is a fungal disease caused by an ascomycetous fungus, Guignardia bidwellii, that attacks grape vines during hot and humid weather. ... The disease also attacks other parts of the plant, “all green parts of the vine: the shoots, leaf and fruit stems, tendrils, and fruit.",
        "Grapevine measles, also called esca, black measles or Spanish measles, has long plagued grape growers with its cryptic expression of symptoms and, for a long time, a lack of identifiable causal organism(s). The name 'measles' refers to the superficial spots found on the fruit",
        "",
        "On leaf surface we will see lesions which are irregularly shaped (2 to 25 mm in diameter). Initially lesions are dull red to brown in color turn black later. If disease is severe this lesions may coalesce.",
        "Symptoms of citrus greening often appear on the leaves of orange trees with yellow spotting and veins. Unlike the yellowing that can result from a lack of nutrients, citrus greening-affected leaves have irregular splotches and the fruit can become misshapen and bitter",
        "Leaf symptoms of bacterial spot on peaches and nectarines are generally dark, small lesions, often clustered at the leaf tip where water collects during dews and rain. Leaf tissue around lesions can turn yellow. The pathogen overwinters in dark, gummy branch tips, and diseased twigs",
        "",
        "Bacterial leaf spot, caused by Xanthomonas campestris pv. vesicatoria, is the most common and destructive disease for peppers in the eastern United States. It is a gram-negative, rod-shaped bacterium that can survive in seeds and plant debris from one season to another",
        "",
        "Early blight of potato is caused by the fungal pathogen Alternaria solani. The disease affects leaves, stems and tubers and can reduce yield, tuber size, storability of tubers, quality of fresh-market and processing tubers and marketability of the crop",
        "",
        "Phytophthora infestans is an oomycete or water mold, a fungus-like microorganism that causes the serious potato and tomato disease known as late blight or potato blight.",
        "Powdery mildew, mainly caused by the fungus Podosphaera xanthii, infects all cucurbits, including muskmelons, squash, cucumbers, gourds, watermelons and pumpkins. In severe cases, powdery mildew can cause premature death of leaves, and reduce yield and fruit quality.",
        "",
        "Leaf scorch is caused by the fungus Diplocarpon earliana. Symptoms of leaf scorch consist of numerous small, irregular, purplish spots or “blotches” that develop on the upper surface of leaves. The centers of the blotches become brownish.",
        "vesicatoria is a bacterium that causes bacterial leaf spot (BLS) on peppers and tomatoes. It is a gram-negative and rod-shaped. It causes symptoms throughout the above-ground portion of the plant including leaf spots, fruit spots and stem cankers.",
        "Alternaria solani is a fungal pathogen that produces a disease in tomato and potato plants called early blight. The pathogen produces distinctive bullseye patterned leaf spots and can also cause stem lesions and fruit rot on tomato and tuber blight on potato.",
        "",
        "Phytophthora infestans is an oomycete or water mold, a fungus-like microorganism that causes the serious potato and tomato disease known as late blight or potato blight.",
        "Cladosporium fulvum is an Ascomycete called Passalora fulva, a non-obligate pathogen that causes the disease on tomato known as the Tomato leaf mold.",
        "Septoria are ascomycete pycnidia-producing fungi that cause numerous leaf spot diseases on field crops, forages and many vegetables including tomatoes which are known to contract Septoria musiva from nearby cottonwood trees, and is responsible for yield losses.",
        "Tetranychus urticae (common names include red spider mite and two-spotted spider mite) is a species of plant-feeding mite generally considered to be a pest. It is the most widely known member of the family Tetranychidae or spider mites.",
        "tomato mosaic virus (ToMV) is a plant pathogenic virus. It is found worldwide and affects tomatoes and many other plants.",
        "Tomato yellow leaf curl virus (TYLCV) is a DNA virus from the genus Begomovirus and the family Geminiviridae."

    ]

    

    
    override func viewDidAppear(_ animated: Bool) {

        let top_choice_idx: Int = class_names.firstIndex(of: all_classified[0][0])!
        
        print(all_classified[0][0])
        print(top_choice_idx)
//        most_likley_label.text = all_classified[0][0] + " " + all_classified[0][1] + " confidence" + "\n" + all_classified[1][0] + " " + all_classified[1][1] + " confidence" + "\n" + all_classified[2][0] + " " + all_classified[2][1] + " confidence"
        most_likley_label.text = "Most Likley: " + all_classified[0][0]
        let description: String = "Description: " + descriptions[top_choice_idx]
        print(description)
        description_label.text = description
        

    }
    
}
