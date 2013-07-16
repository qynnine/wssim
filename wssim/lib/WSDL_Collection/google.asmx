<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://service.ecocoma.com/marketing/google" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="http://service.ecocoma.com/marketing/google" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Cocoma Google Web Services.</wsdl:documentation>
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://service.ecocoma.com/marketing/google">
      <s:element name="GetSiteCount">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="KeyID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DomainID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Url" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSiteCountResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetSiteCountResult" type="tns:GoogleCount" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GoogleCount">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Url" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Count" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetLinkCount">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="KeyID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DomainID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Url" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetLinkCountResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetLinkCountResult" type="tns:GoogleCount" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetRelatedCount">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="KeyID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DomainID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Url" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetRelatedCountResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetRelatedCountResult" type="tns:GoogleCount" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetKeywordRankding">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="KeyID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DomainID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Keyword" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Url" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetKeywordRankdingResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetKeywordRankdingResult" type="tns:GoogleKeywordRanking" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GoogleKeywordRanking">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Url" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Keyword" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Page" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetKeywordSuggest">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="KeyID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="DomainID" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Keyword" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetKeywordSuggestResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetKeywordSuggestResult" type="tns:GoogleKeywordSuggest" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GoogleKeywordSuggest">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Result" type="s:string" />
        </s:sequence>
      </s:complexType>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetSiteCountSoapIn">
    <wsdl:part name="parameters" element="tns:GetSiteCount" />
  </wsdl:message>
  <wsdl:message name="GetSiteCountSoapOut">
    <wsdl:part name="parameters" element="tns:GetSiteCountResponse" />
  </wsdl:message>
  <wsdl:message name="GetLinkCountSoapIn">
    <wsdl:part name="parameters" element="tns:GetLinkCount" />
  </wsdl:message>
  <wsdl:message name="GetLinkCountSoapOut">
    <wsdl:part name="parameters" element="tns:GetLinkCountResponse" />
  </wsdl:message>
  <wsdl:message name="GetRelatedCountSoapIn">
    <wsdl:part name="parameters" element="tns:GetRelatedCount" />
  </wsdl:message>
  <wsdl:message name="GetRelatedCountSoapOut">
    <wsdl:part name="parameters" element="tns:GetRelatedCountResponse" />
  </wsdl:message>
  <wsdl:message name="GetKeywordRankdingSoapIn">
    <wsdl:part name="parameters" element="tns:GetKeywordRankding" />
  </wsdl:message>
  <wsdl:message name="GetKeywordRankdingSoapOut">
    <wsdl:part name="parameters" element="tns:GetKeywordRankdingResponse" />
  </wsdl:message>
  <wsdl:message name="GetKeywordSuggestSoapIn">
    <wsdl:part name="parameters" element="tns:GetKeywordSuggest" />
  </wsdl:message>
  <wsdl:message name="GetKeywordSuggestSoapOut">
    <wsdl:part name="parameters" element="tns:GetKeywordSuggestResponse" />
  </wsdl:message>
  <wsdl:portType name="Google_ServiceSoap">
    <wsdl:operation name="GetSiteCount">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Indexed pages in your site.</wsdl:documentation>
      <wsdl:input message="tns:GetSiteCountSoapIn" />
      <wsdl:output message="tns:GetSiteCountSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetLinkCount">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Pages that link to your site's front page.</wsdl:documentation>
      <wsdl:input message="tns:GetLinkCountSoapIn" />
      <wsdl:output message="tns:GetLinkCountSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetRelatedCount">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Pages that are similar to your site.</wsdl:documentation>
      <wsdl:input message="tns:GetRelatedCountSoapIn" />
      <wsdl:output message="tns:GetRelatedCountSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetKeywordRankding">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Check your search engine placement and page ranking.</wsdl:documentation>
      <wsdl:input message="tns:GetKeywordRankdingSoapIn" />
      <wsdl:output message="tns:GetKeywordRankdingSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetKeywordSuggest">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Provide suggestions for keywords related to the submitted keyword.</wsdl:documentation>
      <wsdl:input message="tns:GetKeywordSuggestSoapIn" />
      <wsdl:output message="tns:GetKeywordSuggestSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="Google_ServiceSoap" type="tns:Google_ServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetSiteCount">
      <soap:operation soapAction="http://service.ecocoma.com/marketing/google/GetSiteCount" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetLinkCount">
      <soap:operation soapAction="http://service.ecocoma.com/marketing/google/GetLinkCount" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetRelatedCount">
      <soap:operation soapAction="http://service.ecocoma.com/marketing/google/GetRelatedCount" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetKeywordRankding">
      <soap:operation soapAction="http://service.ecocoma.com/marketing/google/GetKeywordRankding" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetKeywordSuggest">
      <soap:operation soapAction="http://service.ecocoma.com/marketing/google/GetKeywordSuggest" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="Google_ServiceSoap12" type="tns:Google_ServiceSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetSiteCount">
      <soap12:operation soapAction="http://service.ecocoma.com/marketing/google/GetSiteCount" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetLinkCount">
      <soap12:operation soapAction="http://service.ecocoma.com/marketing/google/GetLinkCount" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetRelatedCount">
      <soap12:operation soapAction="http://service.ecocoma.com/marketing/google/GetRelatedCount" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetKeywordRankding">
      <soap12:operation soapAction="http://service.ecocoma.com/marketing/google/GetKeywordRankding" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetKeywordSuggest">
      <soap12:operation soapAction="http://service.ecocoma.com/marketing/google/GetKeywordSuggest" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="Google_Service">
    <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Cocoma Google Web Services.</wsdl:documentation>
    <wsdl:port name="Google_ServiceSoap" binding="tns:Google_ServiceSoap">
      <soap:address location="http://service.ecocoma.com/marketing/google.asmx" />
    </wsdl:port>
    <wsdl:port name="Google_ServiceSoap12" binding="tns:Google_ServiceSoap12">
      <soap12:address location="http://service.ecocoma.com/marketing/google.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>