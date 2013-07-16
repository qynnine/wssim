
package edu.bis.webservice_client;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Classe Java pour operationPairSimilarity complex type.
 * 
 * <p>Le fragment de schéma suivant indique le contenu attendu figurant dans cette classe.
 * 
 * <pre>
 * &lt;complexType name="operationPairSimilarity">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Operation_1" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="Operation_2" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="similarity" type="{http://www.w3.org/2001/XMLSchema}float"/>
 *         &lt;element name="areSubstitutable" type="{http://www.w3.org/2001/XMLSchema}boolean"/>
 *         &lt;element name="areComposabe" type="{http://www.w3.org/2001/XMLSchema}boolean"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "operationPairSimilarity", propOrder = {
    "operation1",
    "operation2",
    "similarity",
    "areSubstitutable",
    "areComposabe"
})
public class OperationPairSimilarity {

    @XmlElement(name = "Operation_1")
    protected String operation1;
    @XmlElement(name = "Operation_2")
    protected String operation2;
    protected float similarity;
    protected boolean areSubstitutable;
    protected boolean areComposabe;

    /**
     * Obtient la valeur de la propriété operation1.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getOperation1() {
        return operation1;
    }

    /**
     * Définit la valeur de la propriété operation1.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setOperation1(String value) {
        this.operation1 = value;
    }

    /**
     * Obtient la valeur de la propriété operation2.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getOperation2() {
        return operation2;
    }

    /**
     * Définit la valeur de la propriété operation2.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setOperation2(String value) {
        this.operation2 = value;
    }

    /**
     * Obtient la valeur de la propriété similarity.
     * 
     */
    public float getSimilarity() {
        return similarity;
    }

    /**
     * Définit la valeur de la propriété similarity.
     * 
     */
    public void setSimilarity(float value) {
        this.similarity = value;
    }

    /**
     * Obtient la valeur de la propriété areSubstitutable.
     * 
     */
    public boolean isAreSubstitutable() {
        return areSubstitutable;
    }

    /**
     * Définit la valeur de la propriété areSubstitutable.
     * 
     */
    public void setAreSubstitutable(boolean value) {
        this.areSubstitutable = value;
    }

    /**
     * Obtient la valeur de la propriété areComposabe.
     * 
     */
    public boolean isAreComposabe() {
        return areComposabe;
    }

    /**
     * Définit la valeur de la propriété areComposabe.
     * 
     */
    public void setAreComposabe(boolean value) {
        this.areComposabe = value;
    }

}
