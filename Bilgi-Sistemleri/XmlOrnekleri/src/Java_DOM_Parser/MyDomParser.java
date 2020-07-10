package Java_DOM_Parser;

import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import org.xml.sax.SAXException;

public class MyDomParser {

    public static void main(String[] args) {
        
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try 
        {
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse("Students.xml");
            NodeList personList = doc.getElementsByTagName("student");
            for (int i = 0; i < personList.getLength(); i++) 
            {
                Node p = personList.item(i);
                if (p.getNodeType() == Node.ELEMENT_NODE) 
                {
                    Element person = (Element) p;
                    String id = person.getAttribute("id");
                    NodeList nameList = person.getChildNodes();
                    for (int j = 0; j < nameList.getLength(); j++) 
                    {
                        Node n = nameList.item(j);
                        if (n.getNodeType() == Node.ELEMENT_NODE) 
                        {
                            Element name = (Element) n;
                            System.out.println("Student " + id + ":" + name.getTextContent() + "=" + name.getTagName());
                        }
                    }
                }
            }
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
