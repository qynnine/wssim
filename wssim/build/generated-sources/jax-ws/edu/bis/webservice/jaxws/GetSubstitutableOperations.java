
package edu.bis.webservice.jaxws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement(name = "getSubstitutableOperations", namespace = "http://webservice.bis.edu/")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "getSubstitutableOperations", namespace = "http://webservice.bis.edu/", propOrder = {
    "firstServiceURI",
    "secondServiceURI"
})
public class GetSubstitutableOperations {

    @XmlElement(name = "firstServiceURI", namespace = "")
    private String firstServiceURI;
    @XmlElement(name = "secondServiceURI", namespace = "")
    private String secondServiceURI;

    /**
     * 
     * @return
     *     returns String
     */
    public String getFirstServiceURI() {
        return this.firstServiceURI;
    }

    /**
     * 
     * @param firstServiceURI
     *     the value for the firstServiceURI property
     */
    public void setFirstServiceURI(String firstServiceURI) {
        this.firstServiceURI = firstServiceURI;
    }

    /**
     * 
     * @return
     *     returns String
     */
    public String getSecondServiceURI() {
        return this.secondServiceURI;
    }

    /**
     * 
     * @param secondServiceURI
     *     the value for the secondServiceURI property
     */
    public void setSecondServiceURI(String secondServiceURI) {
        this.secondServiceURI = secondServiceURI;
    }

}
