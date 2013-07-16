
package edu.bis.webservice.jaxws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement(name = "getServiceSimilarityResponse", namespace = "http://webservice.bis.edu/")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "getServiceSimilarityResponse", namespace = "http://webservice.bis.edu/")
public class GetServiceSimilarityResponse {

    @XmlElement(name = "return", namespace = "")
    private Float _return;

    /**
     * 
     * @return
     *     returns Float
     */
    public Float getReturn() {
        return this._return;
    }

    /**
     * 
     * @param _return
     *     the value for the _return property
     */
    public void setReturn(Float _return) {
        this._return = _return;
    }

}
