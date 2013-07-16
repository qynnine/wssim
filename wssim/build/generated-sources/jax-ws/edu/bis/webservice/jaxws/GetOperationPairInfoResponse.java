
package edu.bis.webservice.jaxws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import edu.bis.webservice.OperationPairSimilarity;

@XmlRootElement(name = "GetOperationPairInfoResponse", namespace = "http://webservice.bis.edu/")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GetOperationPairInfoResponse", namespace = "http://webservice.bis.edu/")
public class GetOperationPairInfoResponse {

    @XmlElement(name = "return", namespace = "")
    private OperationPairSimilarity _return;

    /**
     * 
     * @return
     *     returns OperationPairSimilarity
     */
    public OperationPairSimilarity getReturn() {
        return this._return;
    }

    /**
     * 
     * @param _return
     *     the value for the _return property
     */
    public void setReturn(OperationPairSimilarity _return) {
        this._return = _return;
    }

}
