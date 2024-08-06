import UIKit

struct WonderPeople {
    let yearLive: String
    let image: UIImage?
    let name: String
    let mainFact: String
    let whoHeIs: String
}
struct CityHistory {
    let yearEvent: String
    let image: UIImage?
    let eventName: String
    let mainFact: String
}

final class dataStr {
    static let shared = dataStr()
    static let cityHistoryList: [CityHistory] = [
        CityHistory(yearEvent: "1167", image: UIImage(named: "copenhagen_foundation"), eventName: "Foundation of Copenhagen", mainFact: "Copenhagen was founded by Bishop Absalon, who built a fortress on the site of the modern city."),
        CityHistory(yearEvent: "1376", image: UIImage(named: "copenhagen_kingdom"), eventName: "City Rights", mainFact: "Copenhagen was granted city rights by King Valdemar IV, solidifying its status as a major urban center."),
        CityHistory(yearEvent: "1536", image: UIImage(named: "reformation_copenhagen"), eventName: "Reformation", mainFact: "Copenhagen became a center of the Protestant Reformation in Denmark when it officially converted from Catholicism."),
        CityHistory(yearEvent: "1660", image: UIImage(named: "copenhagen_monarchy"), eventName: "Absolute Monarchy", mainFact: "Denmark transitioned to an absolute monarchy under King Frederick III, with Copenhagen becoming the political hub of the kingdom."),
        CityHistory(yearEvent: "1733", image: UIImage(named: "copenhagen_baron_hill"), eventName: "Baron Hill Development", mainFact: "The Baron Hill area was developed into a fashionable district, reflecting Copenhagen’s growth and modernization."),
        CityHistory(yearEvent: "1807", image: UIImage(named: "copenhagen_bombing"), eventName: "Bombardment of Copenhagen", mainFact: "The British Navy bombarded Copenhagen during the Napoleonic Wars, causing significant damage to the city."),
        CityHistory(yearEvent: "1854", image: UIImage(named: "copenhagen_university"), eventName: "University Establishment", mainFact: "Copenhagen University, one of the oldest universities in Europe, was officially established and became a major educational institution."),
        CityHistory(yearEvent: "1905", image: UIImage(named: "copenhagen_expo"), eventName: "Exhibition of Arts and Crafts", mainFact: "The Exhibition of Arts and Crafts showcased Copenhagen’s cultural and artistic achievements, enhancing its international reputation."),
        CityHistory(yearEvent: "1940-1943", image: UIImage(named: "copenhagen_occupation"), eventName: "Nazi Occupation", mainFact: "During World War II, Copenhagen was occupied by Nazi Germany, and the city played a crucial role in the Danish resistance."),
        CityHistory(yearEvent: "1950", image: UIImage(named: "copenhagen_metro"), eventName: "Metro System Planning", mainFact: "Plans for a modern metro system began, aiming to improve transportation and connectivity in the rapidly growing city."),
        CityHistory(yearEvent: "1967", image: UIImage(named: "copenhagen_pedestrian"), eventName: "Pedestrianization of Strøget", mainFact: "Strøget, one of Europe’s longest pedestrian streets, was opened, transforming Copenhagen’s city center into a car-free zone."),
        CityHistory(yearEvent: "1989", image: UIImage(named: "copenhagen_freetown"), eventName: "Freetown Christiania", mainFact: "The alternative community of Freetown Christiania was officially recognized by the Danish government, continuing its unique lifestyle and culture."),
        CityHistory(yearEvent: "2000", image: UIImage(named: "copenhagen_bridge"), eventName: "Øresund Bridge Opening", mainFact: "The Øresund Bridge was inaugurated, linking Copenhagen with Malmö, Sweden, and enhancing regional connectivity."),
        CityHistory(yearEvent: "2006", image: UIImage(named: "copenhagen_cycling"), eventName: "City of Cyclists", mainFact: "Copenhagen was recognized as one of the world’s leading cycling cities, thanks to extensive investments in bike infrastructure and urban planning."),
        CityHistory(yearEvent: "2014", image: UIImage(named: "copenhagen_green_capital"), eventName: "European Green Capital", mainFact: "Copenhagen was named the European Green Capital, acknowledging its efforts and achievements in sustainability and environmental friendliness."),
        CityHistory(yearEvent: "2018", image: UIImage(named: "copenhagen_new_district"), eventName: "Nordhavn Development", mainFact: "The Nordhavn area began its transformation into a modern urban district with new residential, commercial, and recreational spaces."),
        CityHistory(yearEvent: "2021", image: UIImage(named: "copenhagen_un_sustainable"), eventName: "UN Sustainable Development Goals", mainFact: "Copenhagen hosted a significant conference on the UN Sustainable Development Goals, highlighting its role in global sustainability efforts."),
        CityHistory(yearEvent: "2022", image: UIImage(named: "copenhagen_arts_festival"), eventName: "Copenhagen Arts Festival", mainFact: "The city hosted a major arts festival, celebrating its vibrant cultural scene and attracting international artists and audiences."),
        CityHistory(yearEvent: "2023", image: UIImage(named: "copenhagen_innovation"), eventName: "Innovation Hub", mainFact: "Copenhagen was recognized as a leading hub for innovation and technology, fostering a dynamic startup ecosystem and digital economy."),
        CityHistory(yearEvent: "2024", image: UIImage(named: "copenhagen_world_expo"), eventName: "World Expo Planning", mainFact: "Copenhagen began preparations for hosting a future World Expo, aiming to showcase its advancements and attract global attention.")
    ]

   static let wonderPeopleList: [WonderPeople] = [
       WonderPeople(
           yearLive: "1805-1875",
           image: UIImage(named: "hans_christian_andersen"),
           name: "Hans Christian Andersen",
           mainFact: "Famous author known for his fairy tales such as 'The Little Mermaid' and 'The Ugly Duckling'.",
           whoHeIs: "Author"
       ),
       WonderPeople(
           yearLive: "1913-1961",
           image: UIImage(named: "niels_bohr"),
           name: "Niels Bohr",
           mainFact: "Physicist who made foundational contributions to understanding atomic structure and quantum theory.",
           whoHeIs: "Physicist"
       ),
       WonderPeople(
           yearLive: "1864-1909",
           image: UIImage(named: "carl_nielsen"),
           name: "Carl Nielsen",
           mainFact: "Renowned composer, known for his symphonies and operas.",
           whoHeIs: "Composer"
       ),
       WonderPeople(
           yearLive: "1873-1950",
           image: UIImage(named: "georg_brandes"),
           name: "Georg Brandes",
           mainFact: "Influential critic and scholar, leading figure in the modern breakthrough in Scandinavian literature.",
           whoHeIs: "Critic"
       ),
       WonderPeople(
           yearLive: "1804-1876",
           image: UIImage(named: "soren_kierkegaard"),
           name: "Søren Kierkegaard",
           mainFact: "Philosopher, theologian, and cultural critic, widely considered the first existentialist philosopher.",
           whoHeIs: "Philosopher"
       ),
       WonderPeople(
           yearLive: "1857-1931",
           image: UIImage(named: "bjornson"),
           name: "Bjørnstjerne Bjørnson",
           mainFact: "Nobel Prize-winning author and playwright.",
           whoHeIs: "Author"
       ),
       WonderPeople(
           yearLive: "1813-1855",
           image: UIImage(named: "thorvaldsen"),
           name: "Bertel Thorvaldsen",
           mainFact: "Celebrated sculptor, known for his works inspired by classical antiquity.",
           whoHeIs: "Sculptor"
       ),
       WonderPeople(
           yearLive: "1813-1855",
           image: UIImage(named: "kristian_zahrtmann"),
           name: "Kristian Zahrtmann",
           mainFact: "Painter known for his works depicting historical and biblical themes.",
           whoHeIs: "Painter"
       ),
       WonderPeople(
           yearLive: "1905-1982",
           image: UIImage(named: "poul_henningsen"),
           name: "Poul Henningsen",
           mainFact: "Designer and architect, famous for his pioneering work in lighting.",
           whoHeIs: "Designer"
       ),
       WonderPeople(
           yearLive: "1910-1995",
           image: UIImage(named: "hans_wegner"),
           name: "Hans Wegner",
           mainFact: "Legendary furniture designer, known for creating iconic chairs.",
           whoHeIs: "Designer"
       ),
       WonderPeople(
           yearLive: "1868-1952",
           image: UIImage(named: "knud_rasmussen"),
           name: "Knud Rasmussen",
           mainFact: "Polar explorer and anthropologist.",
           whoHeIs: "Explorer"
       ),
       WonderPeople(
           yearLive: "1914-2006",
           image: UIImage(named: "arneb_jacobsen"),
           name: "Arne Jacobsen",
           mainFact: "Architect and designer, famous for his modernist buildings and furniture.",
           whoHeIs: "Architect"
       ),
       WonderPeople(
           yearLive: "1905-2003",
           image: UIImage(named: "karen_blixen"),
           name: "Karen Blixen",
           mainFact: "Author known for 'Out of Africa' and her short stories.",
           whoHeIs: "Author"
       ),
       WonderPeople(
           yearLive: "1912-2003",
           image: UIImage(named: "vibeke_knudsen"),
           name: "Vibeke Knudsen",
           mainFact: "Prominent ballet dancer and choreographer.",
           whoHeIs: "Dancer"
       ),
       WonderPeople(
           yearLive: "1927-2012",
           image: UIImage(named: "otto_jespersen"),
           name: "Otto Jespersen",
           mainFact: "Linguist and scholar known for his work on the English language.",
           whoHeIs: "Linguist"
       ),
       WonderPeople(
           yearLive: "1865-1931",
           image: UIImage(named: "joachim_skougaard"),
           name: "Joachim Skougaard",
           mainFact: "Painter known for his realistic and detailed works.",
           whoHeIs: "Painter"
       ),
       WonderPeople(
           yearLive: "1863-1944",
           image: UIImage(named: "jens_friis"),
           name: "Jens Friis",
           mainFact: "Painter and illustrator, celebrated for his depictions of Danish landscapes.",
           whoHeIs: "Painter"
       ),
       WonderPeople(
           yearLive: "1919-2005",
           image: UIImage(named: "marie_henry"),
           name: "Marie Henry",
           mainFact: "Notable artist and sculptor.",
           whoHeIs: "Artist"
       ),
       WonderPeople(
           yearLive: "1850-1902",
           image: UIImage(named: "george_helsted"),
           name: "George Helsted",
           mainFact: "Composer and conductor.",
           whoHeIs: "Composer"
       ),
       WonderPeople(
           yearLive: "1887-1961",
           image: UIImage(named: "kristian_holger"),
           name: "Kristian Holger",
           mainFact: "Famous architect known for his contributions to modern architecture.",
           whoHeIs: "Architect"
       )
   ]

    func createAttributedString(
        biography: String,
        contribution: String,
        works: String,
        awards: String,
        legacy: String
    ) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        
        let titleAttributes1: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaBold(ofSize: 18),
            .foregroundColor: UIColor.white
        ]
        let titleAttributes2: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaRegular(ofSize: 18),
            .foregroundColor: UIColor.white
        ]
        let titleAttributes3: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaBold(ofSize: 18),
            .foregroundColor: UIColor.white
        ]
        let titleAttributes4: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaRegular(ofSize: 18),
            .foregroundColor: UIColor.white
        ]
        let titleAttributes5: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaBold(ofSize: 18),
            .foregroundColor: UIColor.white
        ]
        
        let titles = [
            ("Biography:", biography),
            ("Main Contribution:", contribution),
            ("Notable Works:", works),
            ("Awards and Recognition:", awards),
            ("Legacy:", legacy)
        ]
        
        for (index, (title, info)) in titles.enumerated() {
            let titleAttributes: [NSAttributedString.Key: Any]
            let infoAttributes: [NSAttributedString.Key: Any]
            
            switch index {
            case 0:
                titleAttributes = titleAttributes1
                infoAttributes = titleAttributes2
            case 1:
                titleAttributes = titleAttributes2
                infoAttributes = titleAttributes3
            case 2:
                titleAttributes = titleAttributes3
                infoAttributes = titleAttributes4
            case 3:
                titleAttributes = titleAttributes4
                infoAttributes = titleAttributes5
            case 4:
                titleAttributes = titleAttributes5
                infoAttributes = titleAttributes1
            default:
                titleAttributes = titleAttributes1
                infoAttributes = titleAttributes2
            }
            
            let titleString = NSAttributedString(string: title, attributes: titleAttributes)
            let infoString = NSAttributedString(string: "\n\t\(info)\n\n", attributes: infoAttributes)
            
            attributedString.append(titleString)
            attributedString.append(infoString)
        }
        
        return attributedString
        
    }
    func createData() -> [String: NSAttributedString] {
        let peopleDict: [String: NSAttributedString] = [
            "Hans Christian Andersen": createAttributedString(
                biography: "Hans Christian Andersen (1805-1875) was a Danish author and poet who is best remembered for his fairy tales. Born in Odense, Denmark, Andersen's early life was marked by poverty and hardship. Despite these challenges, he pursued a career in writing and eventually gained fame for his imaginative and morally instructive stories. His tales have been translated into numerous languages and continue to be popular with readers of all ages.",
                contribution: "Andersen's contributions to literature are most notably reflected in his fairy tales, which include classics such as 'The Little Mermaid', 'The Ugly Duckling', and 'Thumbelina'. These stories, often characterized by their whimsical narratives and moral lessons, have had a profound impact on children's literature and popular culture. Andersen's ability to weave fantastical elements with deep emotional and moral themes has made his work timeless.",
                works: "Some of Andersen's notable works include 'The Little Mermaid', which tells the story of a mermaid who sacrifices everything for love, and 'The Ugly Duckling', which explores themes of self-acceptance and personal growth. 'Thumbelina' is another cherished tale that follows a tiny girl's adventures. These stories, among others, have been adapted into numerous films, stage productions, and other media, showcasing Andersen's enduring influence.",
                awards: "During his lifetime, Andersen did not receive many formal awards, but his literary achievements were widely recognized in Denmark and beyond. Posthumously, his works have earned him a lasting place in the literary canon, and he is celebrated for his contributions to children's literature. His fairy tales have been honored in various ways, including through adaptations and international recognition.",
                legacy: "Hans Christian Andersen's legacy is profound and enduring. His fairy tales have influenced countless authors, filmmakers, and artists, and his stories continue to captivate readers around the world. Andersen's work has been celebrated for its imaginative storytelling and its ability to address universal themes through fantastical narratives. His contributions to literature have left an indelible mark on the cultural landscape."
            ),
            "Niels Bohr": createAttributedString(
                biography: "Niels Bohr (1913-1961) was a Danish physicist renowned for his foundational contributions to quantum mechanics and atomic structure. Born in Copenhagen, Bohr was instrumental in the development of the Bohr model of the atom, which introduced the concept of electrons orbiting the nucleus in quantized orbits. His work laid the groundwork for much of modern atomic theory and quantum mechanics.",
                contribution: "Bohr's primary contribution was the development of the Bohr model of the atom, which successfully explained the discrete lines observed in atomic spectra and introduced the idea of quantized electron orbits. His work on quantum theory and atomic structure revolutionized the field of physics and provided crucial insights into the behavior of atoms and subatomic particles. Bohr's ideas were instrumental in the development of quantum mechanics and the understanding of atomic interactions.",
                works: "Bohr's notable works include his research on the structure of the atom and quantum theory. His Bohr model, proposed in 1913, was a significant advancement in understanding atomic structure and spectra. He also made important contributions to the development of quantum mechanics, including his work on the principle of complementarity. Bohr's research laid the foundation for many subsequent discoveries in the field of atomic and quantum physics.",
                awards: "In 1922, Niels Bohr was awarded the Nobel Prize in Physics for his research on atomic structure and radiation. This prestigious award recognized his groundbreaking contributions to understanding the atom and his development of quantum theory. Bohr's work was highly influential and earned him recognition from the scientific community, cementing his place as a key figure in the field of physics.",
                legacy: "Niels Bohr's legacy is marked by his profound impact on modern physics and quantum theory. His Bohr model of the atom remains a foundational concept in atomic physics, and his contributions to quantum mechanics continue to influence the field. Bohr's work paved the way for further advancements in understanding atomic and subatomic processes, and his ideas remain central to contemporary physics. His legacy endures through the continued relevance of his theories and the ongoing influence of his work."
            ),
            "Carl Nielsen": createAttributedString(
                biography: "Carl Nielsen (1864-1909) was a prominent Danish composer known for his contributions to symphonic and operatic music. Born in Nørre Lyndelse, Denmark, Nielsen's music is characterized by its originality, emotional depth, and incorporation of Danish folk elements. His work has had a significant impact on classical music and continues to be celebrated for its innovative approach and expressive qualities.",
                contribution: "Nielsen's contributions to music are most notably reflected in his symphonies and operas. His symphonic works, including Symphony No. 4 'The Inextinguishable', are renowned for their innovative use of form and orchestration. Nielsen's operas, such as 'Saul and David', showcase his ability to blend dramatic narrative with musical complexity. His compositions often incorporate elements of Danish folk music, adding a unique cultural dimension to his work.",
                works: "Among Nielsen's notable works are his six symphonies, which are celebrated for their originality and emotional depth. Symphony No. 4 'The Inextinguishable' is particularly well-regarded for its depiction of the struggle between life and death. His operas, including 'Saul and David' and 'The Mother', are significant contributions to the operatic repertoire. Nielsen's chamber music and songs further demonstrate his versatility and skill as a composer.",
                awards: "Carl Nielsen received numerous accolades for his contributions to music during his lifetime. His compositions were highly regarded in Denmark and internationally, and he was honored with various awards from Danish music institutions. Although Nielsen did not receive many formal awards, his work was celebrated by his peers and has continued to be recognized for its excellence and innovation.",
                legacy: "Carl Nielsen's legacy as a composer is marked by his influential contributions to classical music. His symphonies and operas are considered masterpieces of the genre, and his innovative approach to composition has left a lasting impact on the musical world. Nielsen's work remains an important part of the classical repertoire, and his influence is felt in both Danish and international music scenes."
            ),
            "Georg Brandes": createAttributedString(
                biography: "Georg Brandes (1842-1927) was a Danish critic and scholar whose work played a pivotal role in the modern breakthrough in Scandinavian literature. Born in Copenhagen, Brandes was a leading figure in the introduction of new literary ideas and movements to Scandinavia. His critical essays and writings significantly influenced the development of modern literature in the region.",
                contribution: "Brandes is best known for his role in the modern breakthrough in Scandinavian literature. He was instrumental in introducing new literary movements, such as realism and naturalism, to the Scandinavian literary landscape. His critical essays on authors like Henrik Ibsen and August Strindberg helped to shape the course of modern literature and bring international literary trends to Scandinavia.",
                works: "Some of Brandes' notable works include 'Main Currents in Nineteenth Century Literature', a series of critical essays that explored the major literary movements of the time. His writings on Ibsen and Strindberg, among others, provided insightful analyses of their work and contributed to their recognition as key figures in modern literature. Brandes' critical essays and lectures were highly influential in shaping literary discourse in Scandinavia.",
                awards: "Georg Brandes received recognition for his contributions to literature and criticism, although he did not receive many formal awards during his lifetime. His influence on Scandinavian literature and his role in the modern breakthrough were widely acknowledged by his contemporaries and have been celebrated in subsequent years.",
                legacy: "Brandes' impact on Scandinavian literature is profound. His introduction of new literary ideas and his critical work helped to shape the modern literary landscape in Scandinavia. His influence continues to be felt in literary studies, and his contributions are recognized as pivotal in the development of modern literature in the region."
            ),
            "Søren Kierkegaard": createAttributedString(
                biography: "Søren Kierkegaard (1813-1855) was a Danish philosopher, theologian, and cultural critic who is widely considered the first existentialist philosopher. Born in Copenhagen, Kierkegaard's work focused on the individual's relationship with God, the nature of existence, and the complexities of human life. His writings are known for their depth, complexity, and innovative approach to philosophy.",
                contribution: "Kierkegaard's contributions to philosophy include his exploration of existential themes such as anxiety, despair, and faith. His work laid the groundwork for existentialist thought and influenced later philosophers such as Friedrich Nietzsche and Jean-Paul Sartre. Kierkegaard's emphasis on individual choice, personal responsibility, and the subjective nature of experience has had a lasting impact on philosophy and theology.",
                works: "Kierkegaard's major works include 'Fear and Trembling', which examines the biblical story of Abraham and Isaac to explore themes of faith and sacrifice, and 'Either/Or', which presents a philosophical exploration of the choices between aesthetic and ethical life. Other significant works include 'The Sickness Unto Death' and 'Works of Love'. His writings are known for their rigorous intellectual analysis and innovative use of pseudonyms.",
                awards: "During his lifetime, Kierkegaard did not receive many formal awards or widespread recognition. However, his work has been highly influential in the field of philosophy and theology, and he is celebrated posthumously for his contributions to existential thought and modern philosophy.",
                legacy: "Søren Kierkegaard's legacy is marked by his foundational role in existential philosophy. His exploration of themes related to existence, faith, and individualism has had a profound impact on philosophy, theology, and literature. Kierkegaard's work continues to be studied and debated, and his ideas remain central to existential and theological discussions."
            ),
            "Bjørnstjerne Bjørnson": createAttributedString(
                biography: "Bjørnstjerne Bjørnson (1832-1910) was a Norwegian author, poet, and playwright who is best known for his contributions to literature and his role in the cultural and political life of Norway. Born in Kvikne, Norway, Bjørnson's work spans poetry, drama, and prose, and he is celebrated for his contributions to Norwegian literature and national identity.",
                contribution: "Bjørnson's contributions to literature include his innovative approach to drama and his exploration of social and political themes. His play 'A Gauntlet' is notable for its dramatic portrayal of societal issues, while his epic poem 'Synnøve Solbakken' reflects his interest in Norwegian folklore and culture. Bjørnson's work often addresses themes of social justice, national identity, and the human condition.",
                works: "Bjørnson's notable works include 'Synnøve Solbakken', an epic poem that celebrates Norwegian rural life and culture, and 'A Gauntlet', a drama that explores themes of moral courage and social change. His literary output also includes novels, essays, and political writings, showcasing his diverse interests and contributions to Norwegian literature and public life.",
                awards: "In 1903, Bjørnson was awarded the Nobel Prize in Literature for his outstanding literary achievements. This prestigious award recognized his significant contributions to literature and his impact on Norwegian cultural and national identity. Bjørnson's work was widely acclaimed in Norway and internationally, and he remains a celebrated figure in Norwegian literary history.",
                legacy: "Bjørnstjerne Bjørnson's legacy is marked by his influential contributions to Norwegian literature and culture. His works continue to be studied and appreciated for their literary quality and their exploration of social and political themes. Bjørnson's role in shaping Norwegian national identity and his impact on literature have secured his place as a key figure in Norwegian cultural history."
            ),
            "Bertel Thorvaldsen": createAttributedString(
                biography: "Bertel Thorvaldsen (1770-1844) was a Danish sculptor renowned for his neoclassical works. Born in Copenhagen, Thorvaldsen trained in sculpture and became one of the most prominent figures in the neoclassical movement. His works are characterized by their classical inspiration and technical mastery, and he is celebrated for his contributions to sculpture and art.",
                contribution: "Thorvaldsen's primary contribution to art was his development of neoclassical sculpture. His works, including 'Jason with the Golden Fleece' and 'The Lion of Lucerne', reflect his deep admiration for classical antiquity and his ability to bring classical themes into contemporary art. Thorvaldsen's sculptures are known for their precision, elegance, and adherence to classical ideals.",
                works: "Notable works by Thorvaldsen include 'The Lion of Lucerne', a monument dedicated to Swiss soldiers, and 'Jason with the Golden Fleece', a sculpture that captures the heroism of the classical myth. His works are displayed in various museums and public spaces, and his contributions to sculpture have had a lasting impact on the art world.",
                awards: "During his lifetime, Thorvaldsen received numerous accolades for his artistic achievements. He was recognized by European royalty and art institutions, and his works were highly sought after. Thorvaldsen's contributions to sculpture were celebrated with commissions from prominent patrons and recognition from the art community.",
                legacy: "Bertel Thorvaldsen's legacy as a sculptor is marked by his significant contributions to neoclassical art. His works continue to be admired for their classical inspiration and technical excellence. Thorvaldsen's impact on sculpture and his role in the neoclassical movement have cemented his place as one of the great sculptors of the 19th century."
            ),
            "Kristian Zahrtmann": createAttributedString(
                biography: "Kristian Zahrtmann (1843-1917) was a Danish painter known for his historical and biblical subjects. Born in Copenhagen, Zahrtmann studied at the Royal Danish Academy of Fine Arts and developed a style characterized by its dramatic compositions and detailed execution. His work reflects his deep interest in historical and religious themes.",
                contribution: "Zahrtmann's contributions to art are most evident in his paintings that depict historical and biblical scenes. His work often features detailed and dramatic representations of religious and historical events, showcasing his skill in capturing complex narratives and emotions. Zahrtmann's paintings are celebrated for their meticulous detail and evocative imagery.",
                works: "Some of Zahrtmann's notable works include 'The Martyrdom of St. Stephen', which portrays the dramatic story of St. Stephen's martyrdom, and 'The Last Supper', which presents a detailed and expressive depiction of the biblical event. Zahrtmann's paintings reflect his commitment to historical accuracy and his artistic ability to convey profound themes.",
                awards: "Zahrtmann received recognition for his artistic achievements during his lifetime, including praise from art critics and institutions. While he did not receive many formal awards, his work was highly regarded in Denmark and contributed to his reputation as a skilled painter of historical and biblical subjects.",
                legacy: "Kristian Zahrtmann's legacy is marked by his contributions to Danish art and his skill in depicting historical and biblical themes. His paintings continue to be appreciated for their detail and emotional depth, and his work remains an important part of Danish art history. Zahrtmann's influence is felt in the continued appreciation of his art and his role in depicting significant historical and religious narratives."
            ),
            "Poul Henningsen": createAttributedString(
                biography: "Poul Henningsen (1894-1967) was a Danish designer and architect renowned for his innovative work in lighting design. Born in Copenhagen, Henningsen's career spanned various fields, including architecture and industrial design. He is best known for his pioneering work in creating functional and aesthetically pleasing lighting solutions.",
                contribution: "Henningsen's primary contribution to design is his development of the PH Lamp series, which revolutionized lighting design with its focus on functionality and aesthetics. His designs are characterized by their innovative use of materials and light diffusion, creating a harmonious blend of form and function. Henningsen's work in lighting design has had a lasting impact on the field and continues to be influential.",
                works: "Henningsen's notable works include the PH Lamp series, which includes various models such as the PH5 and PH Artichoke lamps. These designs are celebrated for their unique approach to light distribution and their ability to enhance interior spaces. Henningsen's work also includes contributions to architecture and industrial design, showcasing his versatility and creativity.",
                awards: "During his lifetime, Henningsen received numerous accolades for his contributions to design. His work in lighting design earned him recognition from design institutions and industry professionals. Henningsen's innovative designs were celebrated for their originality and functionality, and he received awards and honors for his contributions to the field.",
                legacy: "Poul Henningsen's legacy is marked by his significant contributions to lighting design and industrial design. His innovative approach to creating functional and aesthetically pleasing lighting solutions has left a lasting impact on the field. Henningsen's work continues to be celebrated and studied for its design excellence and influence on contemporary lighting design."
            ),
            "Vibeke Skofterud": createAttributedString(
                biography: "Vibeke Skofterud (1981-2018) was a Norwegian cross-country skier known for her achievements in competitive skiing. Born in Bærum, Norway, Skofterud competed at the highest level of cross-country skiing and became one of Norway's prominent athletes. Her career was marked by numerous victories and contributions to the sport.",
                contribution: "Skofterud's contributions to cross-country skiing include her impressive performances in international competitions. She won multiple World Cup races and earned medals at the World Championships, demonstrating her skill and dedication to the sport. Skofterud's achievements helped to elevate the profile of cross-country skiing in Norway and internationally.",
                works: "Notable achievements in Skofterud's career include winning the World Cup in the 2007-2008 season and earning gold in the 4x5 km relay at the 2007 World Championships. Her performances in various races and championships showcased her talent and determination, and her success contributed to her reputation as a leading cross-country skier.",
                awards: "Throughout her career, Skofterud received recognition for her achievements in cross-country skiing. She was honored with various awards and accolades, including World Cup victories and medals at the World Championships. Her success in competitive skiing earned her a place among Norway's top athletes and contributed to her legacy in the sport.",
                legacy: "Vibeke Skofterud's legacy is marked by her accomplishments in cross-country skiing and her impact on the sport. Her victories and performances continue to inspire aspiring athletes, and her contributions to skiing have left a lasting impression on the sport. Skofterud's achievements and dedication to cross-country skiing are celebrated as an important part of Norwegian sports history."
            ),
            "Morten Harket": createAttributedString(
                biography: "Morten Harket (born 1959) is a Norwegian singer and songwriter best known as the lead vocalist of the band a-ha. Born in Kongsberg, Norway, Harket gained international fame with a-ha's hit single 'Take On Me' and has been a prominent figure in the music industry for decades. His distinctive voice and contributions to pop music have earned him recognition and acclaim.",
                contribution: "Harket's contributions to music are most notably reflected in his work with a-ha. The band's breakthrough single 'Take On Me' became a global hit and is considered one of the defining songs of the 1980s. Harket's powerful and versatile vocals played a key role in the band's success and helped to shape the sound of pop music during that era.",
                works: "Some of Harket's notable works include a-ha's albums 'Hunting High and Low' and 'Scoundrel Days', which feature hits like 'The Sun Always Shines on T.V.' and 'Cry Wolf'. In addition to his work with a-ha, Harket has released solo albums, including 'Poetenes Evangelium' and 'Out of My Hands', showcasing his continued success as a musician and songwriter.",
                awards: "Throughout his career, Harket and a-ha have received numerous awards and accolades, including MTV Music Awards and Grammy nominations. The band's success in the 1980s and their continued popularity have earned them recognition from the music industry and fans around the world. Harket's contributions to pop music have been celebrated through various awards and honors.",
                legacy: "Morten Harket's legacy is marked by his significant impact on pop music and his role as a leading vocalist of a-ha. The band's success and enduring popularity have cemented Harket's place in music history. His influence on the sound of the 1980s and his continued contributions to music are celebrated as an important part of pop culture."
            ),
            "Knud Rasmussen": createAttributedString(
                biography: "Knud Rasmussen (1879-1933) was a Greenlandic-Danish polar explorer and anthropologist, known as the 'father of Eskimology.' Born in Jakobshavn, Greenland, Rasmussen spent his life exploring the Arctic and documenting Inuit culture.",
                contribution: "Rasmussen's primary contribution lies in his extensive exploration of the Arctic regions and his detailed documentation of Inuit culture and traditions. His expeditions provided valuable ethnographic information and deepened the understanding of the Arctic and its indigenous peoples.",
                works: "Notable works by Rasmussen include 'Across Arctic America' and 'The People of the Polar North.' His writings offer a comprehensive account of his explorations and the cultures he encountered, making significant contributions to Arctic anthropology.",
                awards: "Rasmussen received recognition for his explorations and contributions to anthropology, including various medals and honors from geographical societies and academic institutions.",
                legacy: "Knud Rasmussen's legacy is marked by his pioneering work in Arctic exploration and his contributions to the understanding of Inuit culture. His ethnographic records remain a valuable resource for researchers and his adventures continue to inspire future generations of explorers."
            ),
            "Arne Jacobsen": createAttributedString(
                biography: "Arne Jacobsen (1902-1971) was a Danish architect and designer, renowned for his contributions to modernist architecture and design. Born in Copenhagen, Jacobsen's career was marked by his innovative approach to design, blending functionality with aesthetics.",
                contribution: "Jacobsen's primary contribution to design includes his iconic architectural projects and furniture designs. He is best known for his modernist buildings and his revolutionary furniture pieces, such as the Egg Chair and the Swan Chair, which embody his design philosophy of combining form and function.",
                works: "Notable works by Jacobsen include the SAS Royal Hotel in Copenhagen, which features his famous furniture designs. His architectural projects also include the St. Catherine's College in Oxford and various public buildings in Denmark. Jacobsen's furniture designs remain influential in modern design.",
                awards: "Throughout his career, Jacobsen received numerous awards and honors for his contributions to architecture and design. His innovative work earned him recognition from design institutions and accolades for his lasting impact on modernist design.",
                legacy: "Arne Jacobsen's legacy is characterized by his significant contributions to modernist architecture and design. His innovative approach to blending aesthetics and functionality continues to influence contemporary design, and his iconic furniture pieces remain celebrated in the design community."
            ),
            "Karen Blixen": createAttributedString(
                biography: "Karen Blixen (1885-1962), also known by her pen name Isak Dinesen, was a Danish author best known for her memoir 'Out of Africa' and her short stories. Born in Rungsted, Denmark, Blixen's works are noted for their vivid storytelling and exploration of human nature.",
                contribution: "Blixen's primary contribution to literature includes her rich, descriptive writing style and her ability to craft compelling narratives. Her memoir 'Out of Africa' provides a poignant account of her life in Kenya, and her short stories delve into complex themes and character studies.",
                works: "Notable works by Blixen include 'Out of Africa,' 'Seven Gothic Tales,' and 'Winter's Tales.' Her writing is celebrated for its literary quality and depth, earning her a lasting place in world literature.",
                awards: "Blixen received various awards and nominations throughout her literary career, including several nominations for the Nobel Prize in Literature. Her works have been widely acclaimed and continue to be studied and appreciated.",
                legacy: "Karen Blixen's legacy is defined by her exceptional storytelling and her contributions to literature. Her works have inspired adaptations in film and theatre, and her influence on literary traditions continues to be recognized and celebrated."
            ),
            "Vibeke Knudsen": createAttributedString(
                biography: "Vibeke Knudsen (1912-2003) was a prominent Danish ballet dancer and choreographer. Born in Copenhagen, Knudsen made significant contributions to the world of ballet through her performances and choreographic works.",
                contribution: "Knudsen's primary contribution to ballet includes her innovative choreography and her impactful performances. She played a key role in developing Danish ballet and bringing new interpretations to classic ballets.",
                works: "Notable works by Knudsen include her choreographic pieces for the Royal Danish Ballet, where she served as both a dancer and a choreographer. Her works are celebrated for their creativity and their influence on Danish ballet.",
                awards: "Knudsen received numerous accolades for her contributions to ballet, including awards from dance institutions and recognition for her artistic achievements. Her influence on the dance community was widely acknowledged.",
                legacy: "Vibeke Knudsen's legacy is characterized by her contributions to the development of Danish ballet and her innovative choreographic works. Her influence on ballet continues to be felt, and her work remains an important part of Danish dance history."
            ),
            "Otto Jespersen": createAttributedString(
                biography: "Otto Jespersen (1860-1943) was a Danish linguist and scholar renowned for his work on the English language and general linguistics. Born in Randers, Denmark, Jespersen made significant contributions to the study of language and its structure.",
                contribution: "Jespersen's primary contribution to linguistics includes his research on English grammar and phonetics, as well as his development of the international language Novial. His works laid important foundations for modern linguistic studies and language education.",
                works: "Notable works by Jespersen include 'Modern English Grammar on Historical Principles' and 'The Philosophy of Grammar.' His publications are considered essential reading in the field of linguistics and have influenced language studies globally.",
                awards: "Jespersen received various honors and recognitions for his contributions to linguistics, including memberships in prestigious linguistic societies and awards for his scholarly work.",
                legacy: "Otto Jespersen's legacy is marked by his groundbreaking contributions to the study of language. His works continue to be influential in linguistics, and his innovative ideas on language structure and education are still respected and utilized in the field."
            ),
            "Joachim Skougaard": createAttributedString(
                biography: "Joachim Skougaard (1865-1931) was a Danish painter known for his realistic and detailed works. Born in Aarhus, Denmark, Skougaard's paintings are celebrated for their meticulous attention to detail and their depiction of everyday life.",
                contribution: "Skougaard's primary contribution to art includes his realistic painting style and his ability to capture the nuances of light and shadow. His works provide a vivid representation of Danish life and landscapes during his time.",
                works: "Notable works by Skougaard include 'Harvest Time' and 'The Fisherman's Wife.' His paintings are characterized by their detailed portrayal of rural and coastal scenes, reflecting the beauty and simplicity of Danish life.",
                awards: "Throughout his career, Skougaard received recognition for his artistic achievements, including exhibitions of his works and accolades from art institutions. His detailed style earned him a respected place in Danish art history.",
                legacy: "Joachim Skougaard's legacy is defined by his contributions to Danish realism in painting. His works continue to be appreciated for their artistic quality and their portrayal of Danish culture and landscapes."
            ),
            "Jens Friis": createAttributedString(
                biography: "Jens Friis (1863-1944) was a Danish painter and illustrator celebrated for his depictions of Danish landscapes. Born in Aalborg, Denmark, Friis's works are noted for their vibrant colors and attention to natural detail.",
                contribution: "Friis's primary contribution to art includes his landscape paintings that capture the beauty of Danish nature. His works reflect a deep appreciation for the Danish countryside and have been influential in Danish landscape painting.",
                works: "Notable works by Friis include 'Summer Day by the Lake' and 'Autumn in the Forest.' His paintings are celebrated for their use of color and their ability to convey the atmosphere of the Danish landscape.",
                awards: "Friis received various accolades for his contributions to art, including exhibitions and recognition from art institutions. His landscape paintings have been praised for their artistic excellence and natural beauty.",
                legacy: "Jens Friis's legacy is characterized by his significant contributions to Danish landscape painting. His works continue to inspire appreciation for the Danish natural environment and are celebrated in the Danish art community."
            ),
            "Marie Henry": createAttributedString(
                biography: "Marie Henry (1919-2005) was a notable Danish artist and sculptor. Born in Copenhagen, Henry's works are known for their expressive quality and innovative use of materials.",
                contribution: "Henry's primary contribution to art includes her expressive sculptures and mixed media works. Her art explores themes of human experience and emotion, and she is celebrated for her creativity and originality.",
                works: "Notable works by Henry include her series of bronze sculptures and mixed media installations. Her art is recognized for its emotional depth and its unique approach to form and material.",
                awards: "Henry received numerous awards and honors for her artistic achievements, including recognition from art institutions and exhibitions of her works. Her contributions to sculpture and mixed media art have been widely acknowledged.",
                legacy: "Marie Henry's legacy is defined by her innovative and expressive contributions to art. Her works continue to be celebrated for their artistic quality and emotional impact, making her a significant figure in Danish art history."
            ),
            "George Helsted": createAttributedString(
                biography: "George Helsted (1850-1902) was a Danish composer and conductor known for his contributions to classical music. Born in Copenhagen, Helsted's works are celebrated for their melodic richness and orchestral complexity.",
                contribution: "Helsted's primary contribution to music includes his compositions for orchestra and his work as a conductor. His music is noted for its lyrical quality and its ability to convey deep emotion and drama.",
                works: "Notable works by Helsted include his symphonies and orchestral suites. His compositions are recognized for their melodic beauty and their intricate orchestration, contributing to the richness of Danish classical music.",
                awards: "Throughout his career, Helsted received recognition for his musical contributions, including performances of his works and accolades from music institutions. His compositions have been praised for their artistic excellence.",
                legacy: "George Helsted's legacy is characterized by his significant contributions to Danish classical music. His works continue to be performed and appreciated for their melodic and orchestral qualities, solidifying his place in music history."
            ),
            "Kristian Holger": createAttributedString(
                biography: "Kristian Holger (1887-1961) was a Danish architect known for his contributions to modern architecture. Born in Aarhus, Denmark, Holger's work is characterized by its functionalist approach and innovative design.",
                contribution: "Holger's primary contribution to architecture includes his modernist buildings that emphasize functionality and simplicity. His designs reflect a commitment to creating efficient and aesthetically pleasing spaces.",
                works: "Notable works by Holger include several public buildings and residential projects that showcase his modernist principles. His architecture is recognized for its clarity of form and its practical design solutions.",
                awards: "Holger received various honors and awards for his architectural achievements, including recognition from architectural societies and professional accolades for his innovative designs.",
                legacy: "Kristian Holger's legacy is defined by his contributions to modernist architecture in Denmark. His functionalist approach and innovative designs continue to influence contemporary architecture and are celebrated for their lasting impact on the field."
            ),
        ]
        return peopleDict
    }
    
    func createAttributedString(event: String, date: String, image: UIImage?, mainFact: String, description: String, significance: String, legacy: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()

        let dateAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaRegular(ofSize: 18),
            .foregroundColor: UIColor.white
        ]
        let dateText = NSAttributedString(string: "Date: \(date)\n\n", attributes: dateAttributes)
        attributedString.append(dateText)

        let mainFactAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaBold(ofSize: 20),
            .foregroundColor: UIColor.white
        ]
        let mainFactText = NSAttributedString(string: "\n\nMain Fact:\n\t", attributes: mainFactAttributes)
        attributedString.append(mainFactText)

        let mainFactDetailAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaRegular(ofSize: 18),
            .foregroundColor: UIColor.white
        ]
        let mainFactDetail = NSAttributedString(string: "\(mainFact)\n\n", attributes: mainFactDetailAttributes)
        attributedString.append(mainFactDetail)

        let descriptionAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaBold(ofSize: 20),
            .foregroundColor: UIColor.white
        ]
        let descriptionTitle = NSAttributedString(string: "Description:\n\t", attributes: descriptionAttributes)
        attributedString.append(descriptionTitle)

        let descriptionDetailAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaRegular(ofSize: 18),
            .foregroundColor: UIColor.white
        ]
        let descriptionDetail = NSAttributedString(string: "\(description)\n\n", attributes: descriptionDetailAttributes)
        attributedString.append(descriptionDetail)

        let significanceAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaBold(ofSize: 20),
            .foregroundColor: UIColor.white
        ]
        let significanceTitle = NSAttributedString(string: "Significance:\n\t", attributes: significanceAttributes)
        attributedString.append(significanceTitle)

        let significanceDetailAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaRegular(ofSize: 18),
            .foregroundColor: UIColor.white
        ]
        let significanceDetail = NSAttributedString(string: "\(significance)\n\n", attributes: significanceDetailAttributes)
        attributedString.append(significanceDetail)

        let legacyAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaBold(ofSize: 20),
            .foregroundColor: UIColor.white
        ]
        let legacyTitle = NSAttributedString(string: "Legacy:\n\t", attributes: legacyAttributes)
        attributedString.append(legacyTitle)

        let legacyDetailAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.InikaRegular(ofSize: 18),
            .foregroundColor: UIColor.white
        ]
        let legacyDetail = NSAttributedString(string: "\(legacy)\n\n", attributes: legacyDetailAttributes)
        attributedString.append(legacyDetail)

        return attributedString
    }
    func createDatacityHistoryDetails() -> [String: NSAttributedString] {
        let cityHistoryDetails: [String: NSAttributedString] = [
            "Foundation of Copenhagen": createAttributedString(
                event: "Foundation of Copenhagen",
                date: "1167",
                image: UIImage(named: "copenhagen_foundation"),
                mainFact: "Copenhagen was founded by Bishop Absalon, who built a fortress on the site of the modern city.",
                description: "In 1167, the city of Copenhagen was officially founded by Bishop Absalon, a key figure in Danish history. He built a fortress on the small island of Slotsholmen, which provided protection and control over the trade routes in the region. The establishment of the fortress marked the beginning of Copenhagen's development as a significant urban center. Absalon's efforts to fortify the area attracted settlers and merchants, leading to the growth of a thriving community. The city's strategic location and natural harbor played a crucial role in its early prosperity and expansion.",
                significance: "The foundation of Copenhagen by Bishop Absalon laid the groundwork for the city's future as a major economic and political center in Denmark. The fortress served as a focal point for trade and defense, attracting commerce and settlers. Copenhagen's advantageous location on the Øresund Strait facilitated maritime trade, contributing to its rapid growth and development. Over time, the city became a vital hub for commerce, culture, and governance in Denmark, setting the stage for its evolution into the capital of the kingdom.",
                legacy: "The legacy of Copenhagen's foundation by Bishop Absalon is still evident today. The original fortress on Slotsholmen evolved into Christiansborg Palace, the seat of the Danish Parliament, Supreme Court, and Prime Minister's Office. The city's historical roots as a fortified settlement can be traced through its architecture and urban layout. Copenhagen's enduring status as the capital of Denmark and its continued importance as a cultural, political, and economic center are a testament to the lasting impact of Absalon's foundational efforts."
            ),
            "City Rights": createAttributedString(
                event: "City Rights",
                date: "1376",
                image: UIImage(named: "copenhagen_kingdom"),
                mainFact: "Copenhagen was granted city rights by King Valdemar IV, solidifying its status as a major urban center.",
                description: "In 1376, Copenhagen was granted city rights by King Valdemar IV, a significant milestone in its development as an urban center. These rights included the ability to self-govern, establish a municipal government, and conduct trade more freely. The granting of city rights was a formal recognition of Copenhagen's growing importance and its role in the kingdom. It allowed the city to attract more merchants, artisans, and settlers, fostering economic growth and urban development. The establishment of a municipal government also provided a framework for managing the city's affairs and addressing the needs of its residents.",
                significance: "The granting of city rights to Copenhagen was a pivotal moment in its history, marking its transition from a fortified settlement to a thriving urban center. These rights enhanced the city's autonomy and economic capabilities, enabling it to develop more robust trade networks and attract a diverse population. The ability to self-govern and manage local affairs laid the foundation for Copenhagen's growth as a major city. This recognition by the monarchy underscored the city's strategic importance and its potential to contribute significantly to the kingdom's economy and governance.",
                legacy: "The legacy of Copenhagen's city rights is reflected in its continued growth and prosperity. The city's ability to self-govern and manage its affairs has contributed to its development as a leading cultural, economic, and political center in Denmark. The foundation of a municipal government in 1376 set a precedent for local governance that continues to this day. Copenhagen's enduring status as the capital and its role in shaping national policies and cultural identity can be traced back to the granting of city rights by King Valdemar IV."
            ),
            "Reformation": createAttributedString(
                event: "Reformation",
                date: "1536",
                image: UIImage(named: "reformation_copenhagen"),
                mainFact: "Copenhagen became a center of the Protestant Reformation in Denmark when it officially converted from Catholicism.",
                description: "The year 1536 marked a significant turning point for Copenhagen as it became a center of the Protestant Reformation in Denmark. This period saw the official conversion of the city from Catholicism to Protestantism, led by King Christian III. The Reformation brought about profound changes in religious practices, governance, and societal structures. Monasteries were dissolved, and their properties were confiscated by the crown. The establishment of Lutheranism as the state religion had a lasting impact on the city's religious and cultural landscape, influencing education, art, and community life.",
                significance: "The Reformation's impact on Copenhagen was multifaceted, transforming its religious, cultural, and political dimensions. The shift from Catholicism to Protestantism underpinned significant changes in governance and societal organization. The dissolution of monasteries and the redistribution of their wealth and land reshaped the city's economy and social hierarchy. The emphasis on education and literacy promoted by Lutheranism contributed to the establishment of schools and universities, fostering intellectual and cultural development. The Reformation also solidified Copenhagen's role as a central authority in religious matters, reinforcing its political importance in Denmark.",
                legacy: "Copenhagen's role in the Protestant Reformation has left an indelible mark on its identity and heritage. The city's churches and educational institutions, many of which were founded during this period, continue to reflect the influence of Lutheranism. The Reformation's emphasis on education and intellectual inquiry helped shape Copenhagen into a center of learning and culture. The city's religious architecture, including notable churches like the Church of Our Lady, bears testament to the enduring legacy of the Reformation. Copenhagen's historical and cultural evolution has been profoundly shaped by its transformation during this pivotal period."
            ),
            "Absolute Monarchy": createAttributedString(
                event: "Absolute Monarchy",
                date: "1660",
                image: UIImage(named: "copenhagen_monarchy"),
                mainFact: "Denmark transitioned to an absolute monarchy under King Frederick III, with Copenhagen becoming the political hub of the kingdom.",
                description: "In 1660, Denmark underwent a significant political transformation as King Frederick III established an absolute monarchy. This change consolidated royal power, diminishing the influence of the nobility and establishing the king's authority as supreme. Copenhagen, as the capital city, became the epicenter of this new political structure. The establishment of absolute monarchy centralized governance and administration in the city, making it the focal point for political and bureaucratic activities. The period saw the construction of significant royal buildings and the enhancement of the city's infrastructure to reflect its elevated status.",
                significance: "The transition to absolute monarchy under King Frederick III had far-reaching implications for Copenhagen. The city's role as the administrative and political heart of Denmark was solidified, attracting a concentration of governmental institutions and officials. The centralized power structure facilitated more efficient governance and the implementation of royal policies. The enhancement of the city's infrastructure and the construction of grand royal buildings, such as the new palace, symbolized Copenhagen's importance and the king's authority. This period also saw economic growth as the city benefited from increased attention and investment from the monarchy.",
                legacy: "Copenhagen's legacy as the political hub of an absolute monarchy is evident in its historical architecture and urban layout. The grand royal buildings and palaces constructed during this period, including parts of Christiansborg Palace, remain prominent landmarks. The city's central role in governance and administration established during the absolute monarchy has continued to influence its development. The legacy of centralized royal authority is reflected in Copenhagen's status as the seat of the Danish government and its ongoing significance in national and international politics."
            ),
            "Baron Hill Development": createAttributedString(
                event: "Baron Hill Development",
                date: "1733",
                image: UIImage(named: "copenhagen_baron_hill"),
                mainFact: "The Baron Hill area was developed into a fashionable district, reflecting Copenhagen’s growth and modernization.",
                description: "The development of the Baron Hill area in 1733 marked a significant phase in Copenhagen's urban growth and modernization. This project transformed a previously underdeveloped part of the city into a fashionable district, attracting affluent residents and businesses. The development was characterized by the construction of elegant townhouses, public squares, and gardens, reflecting contemporary European architectural trends. The establishment of Baron Hill as a desirable residential area signaled Copenhagen's increasing prosperity and its evolution into a modern urban center. This period also saw improvements in infrastructure, including roads and public amenities, enhancing the quality of life for its inhabitants.",
                significance: "The Baron Hill development was significant for several reasons. It demonstrated Copenhagen's capacity for urban planning and modernization, aligning the city with European trends in architecture and city development. The creation of a fashionable district attracted wealthy residents and investors, boosting the local economy and fostering a sense of civic pride. The improved infrastructure and public spaces contributed to a higher standard of living and made Copenhagen more attractive to visitors and new settlers. This development also highlighted the city's ability to adapt and grow, reinforcing its status as a leading European capital.",
                legacy: "The legacy of the Baron Hill development is evident in Copenhagen's continued emphasis on urban planning and quality of life. The area's elegant architecture and public spaces have been preserved and integrated into the modern cityscape, maintaining its historical significance. The principles of urban design and modernization introduced during this period have influenced subsequent developments in Copenhagen. The city's ongoing commitment to creating attractive, livable spaces for its residents can be traced back to the successful transformation of Baron Hill in the 18th century. This legacy continues to shape Copenhagen's identity as a forward-thinking and vibrant urban center."
            ),
            "Bombardment of Copenhagen": createAttributedString(
                event: "Bombardment of Copenhagen",
                date: "1807",
                image: UIImage(named: "copenhagen_bombing"),
                mainFact: "The British Navy bombarded Copenhagen during the Napoleonic Wars, causing significant damage to the city.",
                description: "The bombardment of Copenhagen in 1807 was a devastating event during the Napoleonic Wars, in which the British Navy launched an attack on the Danish capital. The assault aimed to seize the Danish fleet to prevent it from falling into the hands of Napoleon. The bombardment resulted in extensive destruction and loss of life, with many buildings, including historical landmarks, being severely damaged or destroyed. The event had a profound impact on the city's residents and infrastructure, leading to a period of rebuilding and recovery. Despite the destruction, Copenhagen's resilience and determination to rebuild marked a significant chapter in its history.",
                significance: "The significance of the 1807 bombardment lies in its impact on Copenhagen's physical and psychological landscape. The attack highlighted the strategic importance of the city and its naval assets during the Napoleonic Wars. The extensive damage inflicted by the bombardment underscored the vulnerabilities of urban centers during wartime and prompted changes in military and urban planning. The event also fostered a sense of national solidarity and resilience, as residents and authorities worked together to rebuild the city. The bombardment remains a poignant reminder of the city's capacity to endure and recover from adversity.",
                legacy: "The legacy of the bombardment of Copenhagen is reflected in the city's architectural and cultural heritage. Many of the buildings and landmarks destroyed during the attack were rebuilt, incorporating contemporary architectural styles and innovations. The event also influenced urban planning and fortification strategies, contributing to the development of more resilient infrastructure. The bombardment is commemorated in Danish history as a testament to Copenhagen's resilience and ability to overcome challenges. This legacy continues to shape the city's identity and its approach to preserving and enhancing its urban environment."
            ),
            "University Establishment": createAttributedString(
                event: "University Establishment",
                date: "1854",
                image: UIImage(named: "copenhagen_university"),
                mainFact: "Copenhagen University, one of the oldest universities in Europe, was officially established and became a major educational institution.",
                description: "The establishment of Copenhagen University in 1854 marked a milestone in the city's academic and intellectual development. As one of the oldest universities in Europe, it quickly became a leading institution for higher education and research. The university attracted scholars, students, and intellectuals from across Europe, contributing to Copenhagen's reputation as a center of learning and innovation. The establishment of the university provided a foundation for the city's academic community, fostering advancements in various fields of study. The university's impact extended beyond academia, influencing cultural, social, and economic aspects of Copenhagen.",
                significance: "Copenhagen University's establishment was significant for its role in advancing education and research in Denmark. The university became a hub for intellectual activity, promoting critical thinking, scientific inquiry, and cultural exchange. Its presence enhanced the city's cultural and intellectual landscape, attracting scholars and students who contributed to Copenhagen's vibrant academic community. The university's research and educational programs had a profound impact on various fields, including the sciences, humanities, and social sciences. This period also saw the development of academic institutions and facilities that supported the university's mission and growth.",
                legacy: "The legacy of Copenhagen University is evident in its enduring influence on education, research, and culture in Denmark and beyond. The university's commitment to academic excellence and innovation has shaped generations of scholars and professionals. Its contributions to scientific and intellectual advancements have had a lasting impact on global knowledge and understanding. The university's role in fostering a culture of learning and inquiry continues to define Copenhagen's identity as a leading center for education and research. The institution's historical and contemporary significance underscores its importance in shaping the city's academic and cultural heritage."
            ),
            "Exhibition of Arts and Crafts": createAttributedString(
                event: "Exhibition of Arts and Crafts",
                date: "1905",
                image: UIImage(named: "copenhagen_expo"),
                mainFact: "The Exhibition of Arts and Crafts showcased Copenhagen’s cultural and artistic achievements, enhancing its international reputation.",
                description: "The 1905 Exhibition of Arts and Crafts in Copenhagen was a landmark event that highlighted the city's cultural and artistic achievements. The exhibition featured a wide array of artworks, crafts, and designs, showcasing the talents and creativity of Danish artists and artisans. The event attracted visitors and participants from around the world, enhancing Copenhagen's reputation as a cultural hub. The exhibition provided a platform for artists to display their work, fostered artistic collaboration, and promoted the appreciation of art and design. It also reflected the city's commitment to supporting and celebrating its cultural heritage.",
                significance: "The significance of the 1905 Exhibition of Arts and Crafts lies in its impact on Copenhagen's cultural and artistic landscape. The event provided a boost to the local art scene, encouraging innovation and creativity among artists and designers. It also facilitated cultural exchange and collaboration, bringing together artists from different backgrounds and traditions. The exhibition's success underscored Copenhagen's status as a leading center for art and design, attracting attention and acclaim from the international community. The event's emphasis on craftsmanship and design excellence contributed to the city's identity as a center of artistic innovation.",
                legacy: "The legacy of the 1905 Exhibition of Arts and Crafts is evident in Copenhagen's continued prominence in the fields of art and design. The event's celebration of creativity and craftsmanship has influenced subsequent generations of artists and designers. The exhibition's impact on the city's cultural landscape can be seen in its thriving art galleries, museums, and design institutions. Copenhagen's commitment to supporting and promoting the arts continues to shape its identity and attract creative talents from around the world. The legacy of the 1905 exhibition remains a testament to the city's enduring dedication to cultural and artistic excellence."
            ),
            "Nazi Occupation": createAttributedString(
                event: "Nazi Occupation",
                date: "1940-1943",
                image: UIImage(named: "copenhagen_occupation"),
                mainFact: "During World War II, Copenhagen was occupied by Nazi Germany, and the city played a crucial role in the Danish resistance.",
                description: "During World War II, from 1940 to 1943, Copenhagen was occupied by Nazi Germany, a period that had profound effects on the city and its residents. The occupation brought significant challenges, including censorship, curfews, and the suppression of civil liberties. Despite these hardships, Copenhagen became a focal point for the Danish resistance movement. Underground activities, including sabotage and intelligence gathering, were carried out by brave citizens determined to oppose the occupiers. The occupation period also saw the rescue of Danish Jews, with many being smuggled to safety in Sweden. The resilience and solidarity demonstrated by Copenhagen's residents during this time remain a significant chapter in the city's history.",
                significance: "The Nazi occupation of Copenhagen was significant for its impact on the city's social and political landscape. The period highlighted the resilience and courage of the Danish resistance, as well as the solidarity of the city's inhabitants in the face of oppression. The occupation also underscored the strategic importance of Copenhagen and its infrastructure to the German war effort. The rescue of Danish Jews during this period stands out as a remarkable act of humanity and defiance against Nazi persecution. The experiences of occupation and resistance left a lasting imprint on the city's collective memory and identity.",
                legacy: "The legacy of the Nazi occupation is reflected in Copenhagen's commitment to remembering and honoring the resistance movement and the victims of the war. Monuments, museums, and memorials throughout the city serve as reminders of this dark period and the bravery of those who resisted. The occupation's impact on Copenhagen's social fabric is evident in the continued emphasis on democracy, freedom, and human rights in Danish society. The lessons learned during this period have shaped the city's approach to governance and its dedication to preserving historical memory. Copenhagen's resilience during the occupation remains a source of pride and reflection for its residents."
            ),
            "Metro System Planning": createAttributedString(
                event: "Metro System Planning",
                date: "1950",
                image: UIImage(named: "copenhagen_metro"),
                mainFact: "Plans for a modern metro system began, aiming to improve transportation and connectivity in the rapidly growing city.",
                description: "In 1950, plans for a modern metro system in Copenhagen were initiated to address the city's growing transportation needs. The proposal aimed to enhance connectivity, reduce traffic congestion, and provide efficient public transportation for residents and visitors. The metro system was envisioned as a solution to the challenges posed by the city's rapid growth and urbanization. Extensive planning and research were undertaken to design a network that would integrate seamlessly with existing transportation infrastructure. The development of the metro system marked a significant step in Copenhagen's commitment to modernizing its urban environment and improving the quality of life for its inhabitants.",
                significance: "The planning of the metro system in 1950 was significant for its potential to transform Copenhagen's transportation landscape. The metro was expected to provide a reliable and efficient means of travel, reducing reliance on automobiles and alleviating traffic congestion. The project represented a forward-thinking approach to urban planning, emphasizing sustainability and accessibility. The metro system was also seen as a catalyst for economic development, enhancing connectivity and facilitating the movement of people and goods. The initiative highlighted Copenhagen's dedication to creating a modern, livable city with a focus on public transportation and infrastructure improvements.",
                legacy: "The legacy of the metro system planning in Copenhagen is evident in the successful implementation and expansion of the network over the decades. The metro has become an integral part of the city's transportation system, providing fast and efficient travel options for residents and tourists. The project set a precedent for sustainable urban development and has influenced subsequent infrastructure initiatives in Copenhagen. The city's commitment to public transportation has contributed to its reputation as a leader in sustainable urban planning. The metro system continues to play a crucial role in shaping Copenhagen's growth and development, reflecting the foresight and planning initiated in 1950."
            ),
            "Pedestrianization of Strøget": createAttributedString(
                event: "Pedestrianization of Strøget",
                date: "1967",
                image: UIImage(named: "copenhagen_pedestrian"),
                mainFact: "Strøget, one of Europe’s longest pedestrian streets, was opened, transforming Copenhagen’s city center into a car-free zone.",
                description: "The pedestrianization of Strøget in 1967 was a groundbreaking initiative that transformed Copenhagen's city center. Strøget, one of Europe’s longest pedestrian streets, was closed to vehicle traffic, creating a car-free zone that prioritized pedestrians. This bold move aimed to improve the urban environment, reduce pollution, and enhance the quality of life for residents and visitors. The pedestrianization project included the redesign of public spaces, the addition of street furniture, and the promotion of outdoor activities. The initiative was initially met with skepticism, but it soon proved to be a resounding success, attracting people to the city center and boosting local businesses.",
                significance: "The pedestrianization of Strøget was significant for its innovative approach to urban planning and its positive impact on Copenhagen's city center. The project set a precedent for other cities around the world, demonstrating the benefits of creating pedestrian-friendly spaces. The reduction in vehicle traffic improved air quality and reduced noise pollution, making the city center more enjoyable and accessible. The initiative also revitalized the local economy, as increased foot traffic boosted retail and hospitality businesses. The success of Strøget's pedestrianization underscored the importance of prioritizing people over cars in urban design and planning.",
                legacy: "The legacy of the pedestrianization of Strøget is evident in Copenhagen's continued commitment to creating pedestrian-friendly and sustainable urban environments. The success of Strøget inspired similar initiatives in other parts of the city and around the world. Copenhagen's reputation as a leader in innovative urban planning and design can be traced back to this landmark project. The pedestrianization of Strøget has contributed to the city's high quality of life and its appeal as a tourist destination. The initiative remains a model for cities seeking to improve their urban environments and promote sustainable development."
            ),
            "Freetown Christiania": createAttributedString(
                event: "Freetown Christiania",
                date: "1989",
                image: UIImage(named: "copenhagen_freetown"),
                mainFact: "The alternative community of Freetown Christiania was officially recognized by the Danish government, continuing its unique lifestyle and culture.",
                description: "In 1989, the Danish government officially recognized Freetown Christiania, an alternative community in Copenhagen known for its unique lifestyle and culture. Established in 1971 by a group of artists and activists, Christiania occupies a former military barracks and operates as an autonomous neighborhood with its own rules and regulations. The community is known for its vibrant arts scene, communal living, and emphasis on sustainability and social experimentation. The recognition by the government marked an acknowledgment of Christiania's cultural significance and its contribution to Copenhagen's diversity. Despite ongoing legal and political challenges, Christiania remains a symbol of alternative living and creative expression.",
                significance: "The recognition of Freetown Christiania in 1989 was significant for its validation of alternative lifestyles and its impact on Copenhagen's cultural landscape. Christiania's emphasis on communal living, sustainability, and creativity challenged conventional norms and inspired similar movements worldwide. The community's vibrant arts scene and innovative approaches to social organization have contributed to Copenhagen's reputation as a city that embraces diversity and creativity. Christiania's existence highlights the importance of providing space for alternative communities and fostering environments where cultural and social experimentation can thrive.",
                legacy: "The legacy of Freetown Christiania is reflected in its enduring presence and influence on Copenhagen's cultural and social fabric. Despite ongoing debates over its legal status and governance, Christiania continues to attract visitors and residents who are drawn to its unique atmosphere and values. The community's commitment to sustainability, creativity, and social innovation has inspired similar initiatives both within Denmark and internationally. Christiania's legacy is also evident in Copenhagen's broader acceptance of diverse lifestyles and its support for cultural and artistic expression. The community remains a testament to the power of alternative living and its potential to enrich urban environments."
            ),
            "Øresund Bridge Opening": createAttributedString(
                event: "Øresund Bridge Opening",
                date: "2000",
                image: UIImage(named: "copenhagen_bridge"),
                mainFact: "The Øresund Bridge was inaugurated, linking Copenhagen with Malmö, Sweden, and enhancing regional connectivity.",
                description: "The opening of the Øresund Bridge in 2000 was a monumental event that significantly enhanced regional connectivity between Copenhagen and Malmö, Sweden. The bridge, spanning 16 kilometers (10 miles), combines a road and rail link, facilitating seamless travel between the two cities. This engineering marvel not only improved transportation but also strengthened economic and cultural ties between Denmark and Sweden. The Øresund Bridge project included the construction of a tunnel and an artificial island, showcasing innovative engineering solutions. The bridge has since become a vital artery for commuters, tourists, and businesses, fostering greater integration within the Øresund region.",
                significance: "The Øresund Bridge's opening was significant for its transformative impact on regional transportation and economic development. By linking Copenhagen and Malmö, the bridge facilitated the movement of people, goods, and services, boosting cross-border commerce and tourism. The project underscored the importance of regional cooperation and integration, enhancing the competitive advantage of both cities. The bridge also symbolized a commitment to sustainable transportation solutions, reducing travel times and encouraging the use of public transit. The Øresund Bridge has played a crucial role in shaping the economic and social dynamics of the Øresund region.",
                legacy: "The legacy of the Øresund Bridge is evident in its lasting contribution to regional connectivity and cooperation. The bridge has become an iconic landmark, representing the close ties between Denmark and Sweden. Its success has inspired similar infrastructure projects aimed at enhancing regional integration and sustainable transportation. The Øresund Bridge's impact on economic growth and cross-border collaboration continues to influence urban planning and development in the Øresund region. The bridge remains a testament to the potential of innovative engineering and regional cooperation to transform transportation and foster economic prosperity."
            ),
            "Climate Summit": createAttributedString(
                event: "Climate Summit",
                date: "2009",
                image: UIImage(named: "copenhagen_climate"),
                mainFact: "Copenhagen hosted the United Nations Climate Change Conference (COP15), focusing global attention on climate issues.",
                description: "In 2009, Copenhagen hosted the United Nations Climate Change Conference, known as COP15, a landmark event that brought global attention to climate issues. The conference aimed to negotiate a comprehensive international agreement to combat climate change and reduce greenhouse gas emissions. Representatives from nearly 200 countries, including heads of state, policymakers, scientists, and activists, gathered in Copenhagen to discuss strategies and commitments for addressing the climate crisis. While the conference faced challenges and did not result in a binding agreement, it succeeded in raising awareness and highlighting the urgency of global climate action. Copenhagen's role as host city underscored its commitment to sustainability and environmental leadership.",
                significance: "The significance of the 2009 Climate Summit lies in its impact on global climate policy and the heightened awareness it generated about climate change. The conference served as a platform for countries to present their climate action plans and discuss collaborative efforts to mitigate the effects of climate change. Although the outcome fell short of expectations, COP15 played a crucial role in shaping subsequent climate negotiations and agreements, including the Paris Agreement in 2015. Copenhagen's hosting of the summit reinforced its reputation as a leader in sustainability and demonstrated the city's dedication to addressing global environmental challenges.",
                legacy: "The legacy of the 2009 Climate Summit is reflected in the ongoing global efforts to combat climate change and the increased emphasis on sustainability in policy and practice. The conference's focus on climate issues has influenced international agreements and national policies aimed at reducing carbon emissions and promoting renewable energy. Copenhagen's role as host city has furthered its identity as a pioneer in sustainable urban development and environmental stewardship. The city's commitment to green initiatives and climate resilience continues to inspire other cities and contribute to the global movement for climate action. The legacy of COP15 underscores the importance of international cooperation and local leadership in addressing the climate crisis."
            ),
            "City of Cyclists": createAttributedString(
                event: "City of Cyclists",
                date: "2010",
                image: UIImage(named: "copenhagen_cycling"),
                mainFact: "Copenhagen was recognized as the world’s best city for cyclists, reflecting its extensive bike infrastructure and cycling culture.",
                description: "In 2010, Copenhagen was recognized as the world's best city for cyclists, a testament to its extensive bike infrastructure and vibrant cycling culture. The city has invested heavily in creating a safe and efficient environment for cyclists, including dedicated bike lanes, bike bridges, and bike-friendly traffic signals. Cycling is an integral part of daily life for many Copenhagen residents, with a significant percentage of the population using bikes as their primary mode of transportation. The city's commitment to promoting cycling has not only improved mobility and reduced traffic congestion but also contributed to public health and environmental sustainability.",
                significance: "The recognition of Copenhagen as the best city for cyclists in 2010 highlighted the city's innovative approach to urban mobility and its success in promoting sustainable transportation. The extensive bike infrastructure and cycling-friendly policies have made cycling a convenient and attractive option for residents and visitors alike. This achievement underscored the importance of integrating cycling into urban planning and demonstrated the benefits of prioritizing sustainable and active transportation modes. Copenhagen's cycling culture has become a model for cities worldwide, inspiring efforts to create more bike-friendly environments.",
                legacy: "The legacy of Copenhagen's recognition as the world's best city for cyclists is evident in its continued leadership in sustainable transportation. The city's commitment to cycling infrastructure and culture has influenced urban planning and mobility strategies globally. Copenhagen's success has encouraged other cities to invest in bike lanes, bike-sharing programs, and cycling safety measures. The city's cycling culture has also contributed to its high quality of life, fostering a sense of community and promoting healthy lifestyles. The legacy of Copenhagen's cycling achievements continues to shape its identity and inspire sustainable urban development initiatives around the world."
            ),
            "European Green Capital": createAttributedString(
                event: "European Green Capital",
                date: "2014",
                image: UIImage(named: "copenhagen_green_capital"),
                mainFact: "Copenhagen was named the European Green Capital, acknowledging its efforts and achievements in sustainability and environmental friendliness.",
                description: "In 2014, Copenhagen was honored as the European Green Capital, a recognition awarded to cities demonstrating outstanding environmental practices and commitment to sustainability. This accolade highlighted Copenhagen's achievements in reducing carbon emissions, enhancing green spaces, and implementing eco-friendly urban planning initiatives.",
                significance: "The designation of Copenhagen as the European Green Capital underscored the city's leadership in environmental stewardship and its innovative approach to sustainability. This recognition not only celebrated Copenhagen's existing green achievements but also set a benchmark for other cities to aspire to. The award reinforced Copenhagen's role as a model for urban sustainability and environmental responsibility.",
                legacy: "The legacy of Copenhagen's recognition as the European Green Capital is reflected in its continued commitment to environmental sustainability. The city's initiatives have inspired other urban centers to adopt similar practices and policies. Copenhagen remains a leading example of how urban areas can effectively integrate green practices into daily life, promoting a cleaner and more sustainable future."
            ),
            "Nordhavn Development": createAttributedString(
                event: "Nordhavn Development",
                date: "2018",
                image: UIImage(named: "copenhagen_new_district"),
                mainFact: "The Nordhavn area began its transformation into a modern urban district with new residential, commercial, and recreational spaces.",
                description: "In 2018, Copenhagen initiated the transformation of Nordhavn, an old industrial port area, into a dynamic modern district. This development project aimed to create a vibrant urban space featuring new residential, commercial, and recreational facilities. The Nordhavn development represents a significant shift towards a mixed-use, sustainable urban environment.",
                significance: "The development of Nordhavn is significant for its role in revitalizing a previously underutilized area of Copenhagen. It reflects the city's commitment to sustainable urban growth and modern living. The project not only enhances the city's infrastructure but also contributes to its economic and social vitality by creating new opportunities for residents and businesses.",
                legacy: "The Nordhavn development project has become a model for urban regeneration and sustainable city planning. It demonstrates how former industrial areas can be transformed into thriving urban districts. The success of Nordhavn continues to influence urban development strategies in Copenhagen and beyond, showcasing the potential for revitalizing similar areas in other cities."
            ),
            "UN Sustainable Development Goals": createAttributedString(
                event: "UN Sustainable Development Goals",
                date: "2021",
                image: UIImage(named: "copenhagen_un_sustainable"),
                mainFact: "Copenhagen hosted a significant conference on the UN Sustainable Development Goals, highlighting its role in global sustainability efforts.",
                description: "In 2021, Copenhagen hosted a major conference focused on the UN Sustainable Development Goals (SDGs), bringing together global leaders, policymakers, and stakeholders to discuss and advance sustainability initiatives. The conference emphasized Copenhagen's commitment to addressing global challenges such as climate change, poverty, and inequality.",
                significance: "The conference on the UN Sustainable Development Goals highlighted Copenhagen's leadership in global sustainability efforts. By hosting this event, the city underscored its role as a key player in addressing international environmental and social issues. The conference facilitated dialogue and collaboration among global leaders, reinforcing Copenhagen's position as a hub for sustainability and innovation.",
                legacy: "The legacy of the 2021 UN SDGs conference in Copenhagen lies in its contribution to advancing global sustainability agendas. The discussions and initiatives fostered during the conference continue to influence international policies and practices. Copenhagen's role in hosting the event reinforces its reputation as a leader in sustainability and its commitment to global cooperation on critical issues."
            ),
            "Copenhagen Arts Festival": createAttributedString(
                event: "Copenhagen Arts Festival",
                date: "2022",
                image: UIImage(named: "copenhagen_arts_festival"),
                mainFact: "The city hosted a major arts festival, celebrating its vibrant cultural scene and attracting international artists and audiences.",
                description: "In 2022, Copenhagen hosted an extensive arts festival that showcased the city's rich cultural scene. The festival featured a diverse range of artistic performances, exhibitions, and events, attracting artists and audiences from around the world. This event highlighted Copenhagen's vibrant artistic community and its role as a cultural hub.",
                significance: "The Copenhagen Arts Festival was significant for its celebration of the city's dynamic cultural landscape. It provided a platform for both local and international artists to present their work, fostering cultural exchange and enhancing Copenhagen's reputation as a major cultural destination. The festival contributed to the city's cultural vibrancy and its appeal as a venue for global artistic events.",
                legacy: "The legacy of the Copenhagen Arts Festival is reflected in its impact on the city's cultural landscape. The festival's success has established it as a key annual event, contributing to Copenhagen's ongoing role as a cultural center. It continues to attract global attention and support the growth of the city's artistic community."
            ),
            "Innovation Hub": createAttributedString(
                event: "Innovation Hub",
                date: "2023",
                image: UIImage(named: "copenhagen_innovation"),
                mainFact: "Copenhagen was recognized as a leading hub for innovation and technology, fostering a dynamic startup ecosystem and digital economy.",
                description: "In 2023, Copenhagen gained recognition as a leading innovation hub, celebrated for its thriving startup ecosystem and dynamic digital economy. The city's commitment to fostering technological advancement and supporting entrepreneurial ventures has positioned it as a key player in the global innovation landscape.",
                significance: "Copenhagen's designation as an innovation hub highlights its role in driving technological progress and economic growth. The city's supportive infrastructure for startups and its focus on digital innovation have contributed to its reputation as a leading center for tech and entrepreneurship. This recognition reflects Copenhagen's successful integration of technology and business development.",
                legacy: "The legacy of Copenhagen's recognition as an innovation hub is seen in its continued growth as a center for technology and entrepreneurship. The city's dynamic startup environment and emphasis on innovation continue to attract talent and investment, reinforcing its position as a global leader in the digital economy."
            ),
            "World Expo Planning": createAttributedString(
                event: "World Expo Planning",
                date: "2024",
                image: UIImage(named: "copenhagen_world_expo"),
                mainFact: "Copenhagen began preparations for hosting a future World Expo, aiming to showcase its advancements and attract global attention.",
                description: "In 2024, Copenhagen started preparations to host a future World Expo, an event expected to highlight the city's innovations and advancements on a global stage. The planning process involves developing infrastructure and organizing events that will showcase Copenhagen's achievements and attract international visitors.",
                significance: "The planning for a World Expo underscores Copenhagen's ambition to present itself as a leading global city. Hosting such an event will provide an opportunity to showcase the city's technological, cultural, and environmental advancements, enhancing its international profile and fostering global connections.",
                legacy: "The legacy of Copenhagen's World Expo planning will be defined by its successful execution of the event and the global exposure it will bring. The preparations aim to leave a lasting impression on visitors and contribute to the city's ongoing development as a prominent international destination."
            ),
        ]
        return cityHistoryDetails
    }
}
