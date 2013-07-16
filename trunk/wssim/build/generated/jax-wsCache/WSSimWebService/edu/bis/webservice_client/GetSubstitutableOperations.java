
package edu.bis.webservice_client;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Classe Java pour getSubstitutableOperations complex type.
 * 
 * <p>Le fragment de schéma suivant indique le contenu attendu figurant dans cette classe.
 * 
 * <pre>
 * &lt;complexType name="getSubstitutableOperations">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="firstServiceURI" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="secondServiceURI" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "getSubstitutableOperations", propOrder = {
    "firstServiceURI",
    "secondServiceURI"
})
public class GetSubstitutableOperations {

    protected String firstServiceURI;
    protected String secondServiceURI;

    /**
     * Obtient la valeur de la propriété firstServiceURI.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFirstServiceURI() {
        return firstServiceURI;
    }

    /**
     * Définit la valeur de la propriété firstServiceURI.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFirstServiceURI(String value) {
        this.firstServiceURI = value;
    }

    /**
     * Obtient la valeur de la propriété secondServiceURI.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSecondServiceURI() {
        return secondServiceURI;
    }

    /**
     * Définit la valeur de la propriété secondServiceURI.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSecondServiceURI(String value) {
        this.secondServiceURI = value;
    }

}
