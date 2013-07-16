
package edu.bis.webservice.jaxws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement(name = "GetOperationPairInfo", namespace = "http://webservice.bis.edu/")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GetOperationPairInfo", namespace = "http://webservice.bis.edu/", propOrder = {
    "firstServiceURI",
    "firstOperationName",
    "secondServiceURI",
    "secondOperationName"
})
public class GetOperationPairInfo {

    @XmlElement(name = "firstServiceURI", namespace = "")
    private String firstServiceURI;
    @XmlElement(name = "firstOperationName", namespace = "")
    private String firstOperationName;
    @XmlElement(name = "secondServiceURI", namespace = "")
    private String secondServiceURI;
    @XmlElement(name = "secondOperationName", namespace = "")
    private String secondOperationName;

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
    public String getFirstOperationName() {
        return this.firstOperationName;
    }

    /**
     * 
     * @param firstOperationName
     *     the value for the firstOperationName property
     */
    public void setFirstOperationName(String firstOperationName) {
        this.firstOperationName = firstOperationName;
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

    /**
     * 
     * @return
     *     returns String
     */
    public String getSecondOperationName() {
        return this.secondOperationName;
    }

    /**
     * 
     * @param secondOperationName
     *     the value for the secondOperationName property
     */
    public void setSecondOperationName(String secondOperationName) {
        this.secondOperationName = secondOperationName;
    }

}
