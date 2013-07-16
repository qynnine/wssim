<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tns="http://www.27seconds.com/Holidays/GBSCT/Dates/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" targetNamespace="http://www.27seconds.com/Holidays/GBSCT/Dates/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://www.27seconds.com/Holidays/GBSCT/Dates/">
      <s:element name="GetNewYear">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNewYearResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetNewYearResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSecondJanuary">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSecondJanuaryResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetSecondJanuaryResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetGoodFriday">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetGoodFridayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetGoodFridayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetEasterMonday">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetEasterMondayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetEasterMondayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetMayDay">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetMayDayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetMayDayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSpringBankHoliday">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSpringBankHolidayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetSpringBankHolidayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSummerBankHoliday">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSummerBankHolidayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetSummerBankHolidayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetChristmas">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetChristmasResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetChristmasResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetBoxingDay">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetBoxingDayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetBoxingDayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNewYearsEve">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetNewYearsEveResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetNewYearsEveResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetBurnsNight">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetBurnsNightResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetBurnsNightResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetHolocaustMemorial">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetHolocaustMemorialResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetHolocaustMemorialResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetShroveTues">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetShroveTuesResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetShroveTuesResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAshWeds">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAshWedsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetAshWedsResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetValentines">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetValentinesResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetValentinesResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSaintDavids">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSaintDavidsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetSaintDavidsResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetMothers">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetMothersResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetMothersResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSaintPatricksDay">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSaintPatricksDayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetSaintPatricksDayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetPalmSunday">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetPalmSundayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetPalmSundayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetMaundyThursday">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetMaundyThursdayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetMaundyThursdayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetEaster">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetEasterResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetEasterResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetBritishSummertimeBegins">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetBritishSummertimeBeginsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetBritishSummertimeBeginsResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAprilFools">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAprilFoolsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetAprilFoolsResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetQueenElizabethsBirthday">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetQueenElizabethsBirthdayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetQueenElizabethsBirthdayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSaintGeorgesDay">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSaintGeorgesDayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetSaintGeorgesDayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetTroopingTheColour">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetTroopingTheColourResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetTroopingTheColourResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetFathers">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetFathersResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetFathersResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetEmmelinePankhurst">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetEmmelinePankhurstResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetEmmelinePankhurstResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSaintSwithuns">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSaintSwithunsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetSaintSwithunsResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetBritishSummertimeEnds">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetBritishSummertimeEndsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetBritishSummertimeEndsResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetHalloween">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetHalloweenResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetHalloweenResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAllSaints">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAllSaintsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetAllSaintsResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetGuyFawkesNight">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetGuyFawkesNightResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetGuyFawkesNightResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetRemembrance">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetRemembranceResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetRemembranceResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSaintAndrews">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetSaintAndrewsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetSaintAndrewsResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetHogmanay">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="year" type="s:int" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetHogmanayResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetHogmanayResult" type="s:dateTime" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="dateTime" type="s:dateTime" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetNewYearSoapIn">
    <wsdl:part name="parameters" element="tns:GetNewYear" />
  </wsdl:message>
  <wsdl:message name="GetNewYearSoapOut">
    <wsdl:part name="parameters" element="tns:GetNewYearResponse" />
  </wsdl:message>
  <wsdl:message name="GetSecondJanuarySoapIn">
    <wsdl:part name="parameters" element="tns:GetSecondJanuary" />
  </wsdl:message>
  <wsdl:message name="GetSecondJanuarySoapOut">
    <wsdl:part name="parameters" element="tns:GetSecondJanuaryResponse" />
  </wsdl:message>
  <wsdl:message name="GetGoodFridaySoapIn">
    <wsdl:part name="parameters" element="tns:GetGoodFriday" />
  </wsdl:message>
  <wsdl:message name="GetGoodFridaySoapOut">
    <wsdl:part name="parameters" element="tns:GetGoodFridayResponse" />
  </wsdl:message>
  <wsdl:message name="GetEasterMondaySoapIn">
    <wsdl:part name="parameters" element="tns:GetEasterMonday" />
  </wsdl:message>
  <wsdl:message name="GetEasterMondaySoapOut">
    <wsdl:part name="parameters" element="tns:GetEasterMondayResponse" />
  </wsdl:message>
  <wsdl:message name="GetMayDaySoapIn">
    <wsdl:part name="parameters" element="tns:GetMayDay" />
  </wsdl:message>
  <wsdl:message name="GetMayDaySoapOut">
    <wsdl:part name="parameters" element="tns:GetMayDayResponse" />
  </wsdl:message>
  <wsdl:message name="GetSpringBankHolidaySoapIn">
    <wsdl:part name="parameters" element="tns:GetSpringBankHoliday" />
  </wsdl:message>
  <wsdl:message name="GetSpringBankHolidaySoapOut">
    <wsdl:part name="parameters" element="tns:GetSpringBankHolidayResponse" />
  </wsdl:message>
  <wsdl:message name="GetSummerBankHolidaySoapIn">
    <wsdl:part name="parameters" element="tns:GetSummerBankHoliday" />
  </wsdl:message>
  <wsdl:message name="GetSummerBankHolidaySoapOut">
    <wsdl:part name="parameters" element="tns:GetSummerBankHolidayResponse" />
  </wsdl:message>
  <wsdl:message name="GetChristmasSoapIn">
    <wsdl:part name="parameters" element="tns:GetChristmas" />
  </wsdl:message>
  <wsdl:message name="GetChristmasSoapOut">
    <wsdl:part name="parameters" element="tns:GetChristmasResponse" />
  </wsdl:message>
  <wsdl:message name="GetBoxingDaySoapIn">
    <wsdl:part name="parameters" element="tns:GetBoxingDay" />
  </wsdl:message>
  <wsdl:message name="GetBoxingDaySoapOut">
    <wsdl:part name="parameters" element="tns:GetBoxingDayResponse" />
  </wsdl:message>
  <wsdl:message name="GetNewYearsEveSoapIn">
    <wsdl:part name="parameters" element="tns:GetNewYearsEve" />
  </wsdl:message>
  <wsdl:message name="GetNewYearsEveSoapOut">
    <wsdl:part name="parameters" element="tns:GetNewYearsEveResponse" />
  </wsdl:message>
  <wsdl:message name="GetBurnsNightSoapIn">
    <wsdl:part name="parameters" element="tns:GetBurnsNight" />
  </wsdl:message>
  <wsdl:message name="GetBurnsNightSoapOut">
    <wsdl:part name="parameters" element="tns:GetBurnsNightResponse" />
  </wsdl:message>
  <wsdl:message name="GetHolocaustMemorialSoapIn">
    <wsdl:part name="parameters" element="tns:GetHolocaustMemorial" />
  </wsdl:message>
  <wsdl:message name="GetHolocaustMemorialSoapOut">
    <wsdl:part name="parameters" element="tns:GetHolocaustMemorialResponse" />
  </wsdl:message>
  <wsdl:message name="GetShroveTuesSoapIn">
    <wsdl:part name="parameters" element="tns:GetShroveTues" />
  </wsdl:message>
  <wsdl:message name="GetShroveTuesSoapOut">
    <wsdl:part name="parameters" element="tns:GetShroveTuesResponse" />
  </wsdl:message>
  <wsdl:message name="GetAshWedsSoapIn">
    <wsdl:part name="parameters" element="tns:GetAshWeds" />
  </wsdl:message>
  <wsdl:message name="GetAshWedsSoapOut">
    <wsdl:part name="parameters" element="tns:GetAshWedsResponse" />
  </wsdl:message>
  <wsdl:message name="GetValentinesSoapIn">
    <wsdl:part name="parameters" element="tns:GetValentines" />
  </wsdl:message>
  <wsdl:message name="GetValentinesSoapOut">
    <wsdl:part name="parameters" element="tns:GetValentinesResponse" />
  </wsdl:message>
  <wsdl:message name="GetSaintDavidsSoapIn">
    <wsdl:part name="parameters" element="tns:GetSaintDavids" />
  </wsdl:message>
  <wsdl:message name="GetSaintDavidsSoapOut">
    <wsdl:part name="parameters" element="tns:GetSaintDavidsResponse" />
  </wsdl:message>
  <wsdl:message name="GetMothersSoapIn">
    <wsdl:part name="parameters" element="tns:GetMothers" />
  </wsdl:message>
  <wsdl:message name="GetMothersSoapOut">
    <wsdl:part name="parameters" element="tns:GetMothersResponse" />
  </wsdl:message>
  <wsdl:message name="GetSaintPatricksDaySoapIn">
    <wsdl:part name="parameters" element="tns:GetSaintPatricksDay" />
  </wsdl:message>
  <wsdl:message name="GetSaintPatricksDaySoapOut">
    <wsdl:part name="parameters" element="tns:GetSaintPatricksDayResponse" />
  </wsdl:message>
  <wsdl:message name="GetPalmSundaySoapIn">
    <wsdl:part name="parameters" element="tns:GetPalmSunday" />
  </wsdl:message>
  <wsdl:message name="GetPalmSundaySoapOut">
    <wsdl:part name="parameters" element="tns:GetPalmSundayResponse" />
  </wsdl:message>
  <wsdl:message name="GetMaundyThursdaySoapIn">
    <wsdl:part name="parameters" element="tns:GetMaundyThursday" />
  </wsdl:message>
  <wsdl:message name="GetMaundyThursdaySoapOut">
    <wsdl:part name="parameters" element="tns:GetMaundyThursdayResponse" />
  </wsdl:message>
  <wsdl:message name="GetEasterSoapIn">
    <wsdl:part name="parameters" element="tns:GetEaster" />
  </wsdl:message>
  <wsdl:message name="GetEasterSoapOut">
    <wsdl:part name="parameters" element="tns:GetEasterResponse" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeBeginsSoapIn">
    <wsdl:part name="parameters" element="tns:GetBritishSummertimeBegins" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeBeginsSoapOut">
    <wsdl:part name="parameters" element="tns:GetBritishSummertimeBeginsResponse" />
  </wsdl:message>
  <wsdl:message name="GetAprilFoolsSoapIn">
    <wsdl:part name="parameters" element="tns:GetAprilFools" />
  </wsdl:message>
  <wsdl:message name="GetAprilFoolsSoapOut">
    <wsdl:part name="parameters" element="tns:GetAprilFoolsResponse" />
  </wsdl:message>
  <wsdl:message name="GetQueenElizabethsBirthdaySoapIn">
    <wsdl:part name="parameters" element="tns:GetQueenElizabethsBirthday" />
  </wsdl:message>
  <wsdl:message name="GetQueenElizabethsBirthdaySoapOut">
    <wsdl:part name="parameters" element="tns:GetQueenElizabethsBirthdayResponse" />
  </wsdl:message>
  <wsdl:message name="GetSaintGeorgesDaySoapIn">
    <wsdl:part name="parameters" element="tns:GetSaintGeorgesDay" />
  </wsdl:message>
  <wsdl:message name="GetSaintGeorgesDaySoapOut">
    <wsdl:part name="parameters" element="tns:GetSaintGeorgesDayResponse" />
  </wsdl:message>
  <wsdl:message name="GetTroopingTheColourSoapIn">
    <wsdl:part name="parameters" element="tns:GetTroopingTheColour" />
  </wsdl:message>
  <wsdl:message name="GetTroopingTheColourSoapOut">
    <wsdl:part name="parameters" element="tns:GetTroopingTheColourResponse" />
  </wsdl:message>
  <wsdl:message name="GetFathersSoapIn">
    <wsdl:part name="parameters" element="tns:GetFathers" />
  </wsdl:message>
  <wsdl:message name="GetFathersSoapOut">
    <wsdl:part name="parameters" element="tns:GetFathersResponse" />
  </wsdl:message>
  <wsdl:message name="GetEmmelinePankhurstSoapIn">
    <wsdl:part name="parameters" element="tns:GetEmmelinePankhurst" />
  </wsdl:message>
  <wsdl:message name="GetEmmelinePankhurstSoapOut">
    <wsdl:part name="parameters" element="tns:GetEmmelinePankhurstResponse" />
  </wsdl:message>
  <wsdl:message name="GetSaintSwithunsSoapIn">
    <wsdl:part name="parameters" element="tns:GetSaintSwithuns" />
  </wsdl:message>
  <wsdl:message name="GetSaintSwithunsSoapOut">
    <wsdl:part name="parameters" element="tns:GetSaintSwithunsResponse" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeEndsSoapIn">
    <wsdl:part name="parameters" element="tns:GetBritishSummertimeEnds" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeEndsSoapOut">
    <wsdl:part name="parameters" element="tns:GetBritishSummertimeEndsResponse" />
  </wsdl:message>
  <wsdl:message name="GetHalloweenSoapIn">
    <wsdl:part name="parameters" element="tns:GetHalloween" />
  </wsdl:message>
  <wsdl:message name="GetHalloweenSoapOut">
    <wsdl:part name="parameters" element="tns:GetHalloweenResponse" />
  </wsdl:message>
  <wsdl:message name="GetAllSaintsSoapIn">
    <wsdl:part name="parameters" element="tns:GetAllSaints" />
  </wsdl:message>
  <wsdl:message name="GetAllSaintsSoapOut">
    <wsdl:part name="parameters" element="tns:GetAllSaintsResponse" />
  </wsdl:message>
  <wsdl:message name="GetGuyFawkesNightSoapIn">
    <wsdl:part name="parameters" element="tns:GetGuyFawkesNight" />
  </wsdl:message>
  <wsdl:message name="GetGuyFawkesNightSoapOut">
    <wsdl:part name="parameters" element="tns:GetGuyFawkesNightResponse" />
  </wsdl:message>
  <wsdl:message name="GetRemembranceSoapIn">
    <wsdl:part name="parameters" element="tns:GetRemembrance" />
  </wsdl:message>
  <wsdl:message name="GetRemembranceSoapOut">
    <wsdl:part name="parameters" element="tns:GetRemembranceResponse" />
  </wsdl:message>
  <wsdl:message name="GetSaintAndrewsSoapIn">
    <wsdl:part name="parameters" element="tns:GetSaintAndrews" />
  </wsdl:message>
  <wsdl:message name="GetSaintAndrewsSoapOut">
    <wsdl:part name="parameters" element="tns:GetSaintAndrewsResponse" />
  </wsdl:message>
  <wsdl:message name="GetHogmanaySoapIn">
    <wsdl:part name="parameters" element="tns:GetHogmanay" />
  </wsdl:message>
  <wsdl:message name="GetHogmanaySoapOut">
    <wsdl:part name="parameters" element="tns:GetHogmanayResponse" />
  </wsdl:message>
  <wsdl:message name="GetNewYearHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNewYearHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSecondJanuaryHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSecondJanuaryHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetGoodFridayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetGoodFridayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetEasterMondayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetEasterMondayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetMayDayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetMayDayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSpringBankHolidayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSpringBankHolidayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSummerBankHolidayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSummerBankHolidayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetChristmasHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetChristmasHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetBoxingDayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetBoxingDayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetNewYearsEveHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNewYearsEveHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetBurnsNightHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetBurnsNightHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetHolocaustMemorialHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetHolocaustMemorialHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetShroveTuesHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetShroveTuesHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetAshWedsHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetAshWedsHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetValentinesHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetValentinesHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSaintDavidsHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSaintDavidsHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetMothersHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetMothersHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSaintPatricksDayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSaintPatricksDayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetPalmSundayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetPalmSundayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetMaundyThursdayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetMaundyThursdayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetEasterHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetEasterHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeBeginsHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeBeginsHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetAprilFoolsHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetAprilFoolsHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetQueenElizabethsBirthdayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetQueenElizabethsBirthdayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSaintGeorgesDayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSaintGeorgesDayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetTroopingTheColourHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetTroopingTheColourHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetFathersHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetFathersHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetEmmelinePankhurstHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetEmmelinePankhurstHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSaintSwithunsHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSaintSwithunsHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeEndsHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeEndsHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetHalloweenHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetHalloweenHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetAllSaintsHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetAllSaintsHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetGuyFawkesNightHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetGuyFawkesNightHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetRemembranceHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetRemembranceHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSaintAndrewsHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSaintAndrewsHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetHogmanayHttpGetIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetHogmanayHttpGetOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetNewYearHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNewYearHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSecondJanuaryHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSecondJanuaryHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetGoodFridayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetGoodFridayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetEasterMondayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetEasterMondayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetMayDayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetMayDayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSpringBankHolidayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSpringBankHolidayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSummerBankHolidayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSummerBankHolidayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetChristmasHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetChristmasHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetBoxingDayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetBoxingDayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetNewYearsEveHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetNewYearsEveHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetBurnsNightHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetBurnsNightHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetHolocaustMemorialHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetHolocaustMemorialHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetShroveTuesHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetShroveTuesHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetAshWedsHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetAshWedsHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetValentinesHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetValentinesHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSaintDavidsHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSaintDavidsHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetMothersHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetMothersHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSaintPatricksDayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSaintPatricksDayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetPalmSundayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetPalmSundayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetMaundyThursdayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetMaundyThursdayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetEasterHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetEasterHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeBeginsHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeBeginsHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetAprilFoolsHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetAprilFoolsHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetQueenElizabethsBirthdayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetQueenElizabethsBirthdayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSaintGeorgesDayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSaintGeorgesDayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetTroopingTheColourHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetTroopingTheColourHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetFathersHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetFathersHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetEmmelinePankhurstHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetEmmelinePankhurstHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSaintSwithunsHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSaintSwithunsHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeEndsHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetBritishSummertimeEndsHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetHalloweenHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetHalloweenHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetAllSaintsHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetAllSaintsHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetGuyFawkesNightHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetGuyFawkesNightHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetRemembranceHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetRemembranceHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetSaintAndrewsHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetSaintAndrewsHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:message name="GetHogmanayHttpPostIn">
    <wsdl:part name="year" type="s:string" />
  </wsdl:message>
  <wsdl:message name="GetHogmanayHttpPostOut">
    <wsdl:part name="Body" element="tns:dateTime" />
  </wsdl:message>
  <wsdl:portType name="GBSCTHolidayDatesSoap">
    <wsdl:operation name="GetNewYear">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of New Year.</documentation>
      <wsdl:input message="tns:GetNewYearSoapIn" />
      <wsdl:output message="tns:GetNewYearSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSecondJanuary">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of January 2nd Day.</documentation>
      <wsdl:input message="tns:GetSecondJanuarySoapIn" />
      <wsdl:output message="tns:GetSecondJanuarySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetGoodFriday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Good Friday.</documentation>
      <wsdl:input message="tns:GetGoodFridaySoapIn" />
      <wsdl:output message="tns:GetGoodFridaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetEasterMonday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Easter Monday.</documentation>
      <wsdl:input message="tns:GetEasterMondaySoapIn" />
      <wsdl:output message="tns:GetEasterMondaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetMayDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of May Day.</documentation>
      <wsdl:input message="tns:GetMayDaySoapIn" />
      <wsdl:output message="tns:GetMayDaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSpringBankHoliday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Spring Bank Holiday.</documentation>
      <wsdl:input message="tns:GetSpringBankHolidaySoapIn" />
      <wsdl:output message="tns:GetSpringBankHolidaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSummerBankHoliday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Summer Bank Holiday.</documentation>
      <wsdl:input message="tns:GetSummerBankHolidaySoapIn" />
      <wsdl:output message="tns:GetSummerBankHolidaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetChristmas">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Christmas Day.</documentation>
      <wsdl:input message="tns:GetChristmasSoapIn" />
      <wsdl:output message="tns:GetChristmasSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBoxingDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Boxing Day.</documentation>
      <wsdl:input message="tns:GetBoxingDaySoapIn" />
      <wsdl:output message="tns:GetBoxingDaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNewYearsEve">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of New Year's Eve.</documentation>
      <wsdl:input message="tns:GetNewYearsEveSoapIn" />
      <wsdl:output message="tns:GetNewYearsEveSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBurnsNight">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Burns Night.</documentation>
      <wsdl:input message="tns:GetBurnsNightSoapIn" />
      <wsdl:output message="tns:GetBurnsNightSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetHolocaustMemorial">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of the Holocaust Memorial.</documentation>
      <wsdl:input message="tns:GetHolocaustMemorialSoapIn" />
      <wsdl:output message="tns:GetHolocaustMemorialSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetShroveTues">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of ShroveTuesday (Pancake Day).</documentation>
      <wsdl:input message="tns:GetShroveTuesSoapIn" />
      <wsdl:output message="tns:GetShroveTuesSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAshWeds">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Ash Wednesday.</documentation>
      <wsdl:input message="tns:GetAshWedsSoapIn" />
      <wsdl:output message="tns:GetAshWedsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetValentines">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Valentines Day.</documentation>
      <wsdl:input message="tns:GetValentinesSoapIn" />
      <wsdl:output message="tns:GetValentinesSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintDavids">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Davids Day.</documentation>
      <wsdl:input message="tns:GetSaintDavidsSoapIn" />
      <wsdl:output message="tns:GetSaintDavidsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetMothers">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Mothering Sunday (Mothers Day).</documentation>
      <wsdl:input message="tns:GetMothersSoapIn" />
      <wsdl:output message="tns:GetMothersSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintPatricksDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Patrick's Day.</documentation>
      <wsdl:input message="tns:GetSaintPatricksDaySoapIn" />
      <wsdl:output message="tns:GetSaintPatricksDaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPalmSunday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Palm Sunday.</documentation>
      <wsdl:input message="tns:GetPalmSundaySoapIn" />
      <wsdl:output message="tns:GetPalmSundaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetMaundyThursday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Maundy Thursday.</documentation>
      <wsdl:input message="tns:GetMaundyThursdaySoapIn" />
      <wsdl:output message="tns:GetMaundyThursdaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetEaster">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Easter Sunday.</documentation>
      <wsdl:input message="tns:GetEasterSoapIn" />
      <wsdl:output message="tns:GetEasterSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeBegins">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date British Summertime Begins.</documentation>
      <wsdl:input message="tns:GetBritishSummertimeBeginsSoapIn" />
      <wsdl:output message="tns:GetBritishSummertimeBeginsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAprilFools">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of April Fools Day.</documentation>
      <wsdl:input message="tns:GetAprilFoolsSoapIn" />
      <wsdl:output message="tns:GetAprilFoolsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetQueenElizabethsBirthday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Queen Elizabeth's Birthday.</documentation>
      <wsdl:input message="tns:GetQueenElizabethsBirthdaySoapIn" />
      <wsdl:output message="tns:GetQueenElizabethsBirthdaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintGeorgesDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St George's Day.</documentation>
      <wsdl:input message="tns:GetSaintGeorgesDaySoapIn" />
      <wsdl:output message="tns:GetSaintGeorgesDaySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetTroopingTheColour">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Trooping the Colour.</documentation>
      <wsdl:input message="tns:GetTroopingTheColourSoapIn" />
      <wsdl:output message="tns:GetTroopingTheColourSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetFathers">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Fathers Day.</documentation>
      <wsdl:input message="tns:GetFathersSoapIn" />
      <wsdl:output message="tns:GetFathersSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetEmmelinePankhurst">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Emmeline Pankhurst Day.</documentation>
      <wsdl:input message="tns:GetEmmelinePankhurstSoapIn" />
      <wsdl:output message="tns:GetEmmelinePankhurstSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintSwithuns">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Swithuns Day.</documentation>
      <wsdl:input message="tns:GetSaintSwithunsSoapIn" />
      <wsdl:output message="tns:GetSaintSwithunsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeEnds">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date British Summertime Ends.</documentation>
      <wsdl:input message="tns:GetBritishSummertimeEndsSoapIn" />
      <wsdl:output message="tns:GetBritishSummertimeEndsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetHalloween">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Halloween.</documentation>
      <wsdl:input message="tns:GetHalloweenSoapIn" />
      <wsdl:output message="tns:GetHalloweenSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAllSaints">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of All Saints.</documentation>
      <wsdl:input message="tns:GetAllSaintsSoapIn" />
      <wsdl:output message="tns:GetAllSaintsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetGuyFawkesNight">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Guy Fawkes Night.</documentation>
      <wsdl:input message="tns:GetGuyFawkesNightSoapIn" />
      <wsdl:output message="tns:GetGuyFawkesNightSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetRemembrance">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Remembrance Sunday.</documentation>
      <wsdl:input message="tns:GetRemembranceSoapIn" />
      <wsdl:output message="tns:GetRemembranceSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintAndrews">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Andrews Day.</documentation>
      <wsdl:input message="tns:GetSaintAndrewsSoapIn" />
      <wsdl:output message="tns:GetSaintAndrewsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetHogmanay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Hogmanay.</documentation>
      <wsdl:input message="tns:GetHogmanaySoapIn" />
      <wsdl:output message="tns:GetHogmanaySoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="GBSCTHolidayDatesHttpGet">
    <wsdl:operation name="GetNewYear">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of New Year.</documentation>
      <wsdl:input message="tns:GetNewYearHttpGetIn" />
      <wsdl:output message="tns:GetNewYearHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSecondJanuary">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of January 2nd Day.</documentation>
      <wsdl:input message="tns:GetSecondJanuaryHttpGetIn" />
      <wsdl:output message="tns:GetSecondJanuaryHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetGoodFriday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Good Friday.</documentation>
      <wsdl:input message="tns:GetGoodFridayHttpGetIn" />
      <wsdl:output message="tns:GetGoodFridayHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetEasterMonday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Easter Monday.</documentation>
      <wsdl:input message="tns:GetEasterMondayHttpGetIn" />
      <wsdl:output message="tns:GetEasterMondayHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetMayDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of May Day.</documentation>
      <wsdl:input message="tns:GetMayDayHttpGetIn" />
      <wsdl:output message="tns:GetMayDayHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSpringBankHoliday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Spring Bank Holiday.</documentation>
      <wsdl:input message="tns:GetSpringBankHolidayHttpGetIn" />
      <wsdl:output message="tns:GetSpringBankHolidayHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSummerBankHoliday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Summer Bank Holiday.</documentation>
      <wsdl:input message="tns:GetSummerBankHolidayHttpGetIn" />
      <wsdl:output message="tns:GetSummerBankHolidayHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetChristmas">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Christmas Day.</documentation>
      <wsdl:input message="tns:GetChristmasHttpGetIn" />
      <wsdl:output message="tns:GetChristmasHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBoxingDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Boxing Day.</documentation>
      <wsdl:input message="tns:GetBoxingDayHttpGetIn" />
      <wsdl:output message="tns:GetBoxingDayHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNewYearsEve">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of New Year's Eve.</documentation>
      <wsdl:input message="tns:GetNewYearsEveHttpGetIn" />
      <wsdl:output message="tns:GetNewYearsEveHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBurnsNight">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Burns Night.</documentation>
      <wsdl:input message="tns:GetBurnsNightHttpGetIn" />
      <wsdl:output message="tns:GetBurnsNightHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetHolocaustMemorial">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of the Holocaust Memorial.</documentation>
      <wsdl:input message="tns:GetHolocaustMemorialHttpGetIn" />
      <wsdl:output message="tns:GetHolocaustMemorialHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetShroveTues">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of ShroveTuesday (Pancake Day).</documentation>
      <wsdl:input message="tns:GetShroveTuesHttpGetIn" />
      <wsdl:output message="tns:GetShroveTuesHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAshWeds">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Ash Wednesday.</documentation>
      <wsdl:input message="tns:GetAshWedsHttpGetIn" />
      <wsdl:output message="tns:GetAshWedsHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetValentines">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Valentines Day.</documentation>
      <wsdl:input message="tns:GetValentinesHttpGetIn" />
      <wsdl:output message="tns:GetValentinesHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintDavids">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Davids Day.</documentation>
      <wsdl:input message="tns:GetSaintDavidsHttpGetIn" />
      <wsdl:output message="tns:GetSaintDavidsHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetMothers">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Mothering Sunday (Mothers Day).</documentation>
      <wsdl:input message="tns:GetMothersHttpGetIn" />
      <wsdl:output message="tns:GetMothersHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintPatricksDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Patrick's Day.</documentation>
      <wsdl:input message="tns:GetSaintPatricksDayHttpGetIn" />
      <wsdl:output message="tns:GetSaintPatricksDayHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPalmSunday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Palm Sunday.</documentation>
      <wsdl:input message="tns:GetPalmSundayHttpGetIn" />
      <wsdl:output message="tns:GetPalmSundayHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetMaundyThursday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Maundy Thursday.</documentation>
      <wsdl:input message="tns:GetMaundyThursdayHttpGetIn" />
      <wsdl:output message="tns:GetMaundyThursdayHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetEaster">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Easter Sunday.</documentation>
      <wsdl:input message="tns:GetEasterHttpGetIn" />
      <wsdl:output message="tns:GetEasterHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeBegins">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date British Summertime Begins.</documentation>
      <wsdl:input message="tns:GetBritishSummertimeBeginsHttpGetIn" />
      <wsdl:output message="tns:GetBritishSummertimeBeginsHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAprilFools">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of April Fools Day.</documentation>
      <wsdl:input message="tns:GetAprilFoolsHttpGetIn" />
      <wsdl:output message="tns:GetAprilFoolsHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetQueenElizabethsBirthday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Queen Elizabeth's Birthday.</documentation>
      <wsdl:input message="tns:GetQueenElizabethsBirthdayHttpGetIn" />
      <wsdl:output message="tns:GetQueenElizabethsBirthdayHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintGeorgesDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St George's Day.</documentation>
      <wsdl:input message="tns:GetSaintGeorgesDayHttpGetIn" />
      <wsdl:output message="tns:GetSaintGeorgesDayHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetTroopingTheColour">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Trooping the Colour.</documentation>
      <wsdl:input message="tns:GetTroopingTheColourHttpGetIn" />
      <wsdl:output message="tns:GetTroopingTheColourHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetFathers">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Fathers Day.</documentation>
      <wsdl:input message="tns:GetFathersHttpGetIn" />
      <wsdl:output message="tns:GetFathersHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetEmmelinePankhurst">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Emmeline Pankhurst Day.</documentation>
      <wsdl:input message="tns:GetEmmelinePankhurstHttpGetIn" />
      <wsdl:output message="tns:GetEmmelinePankhurstHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintSwithuns">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Swithuns Day.</documentation>
      <wsdl:input message="tns:GetSaintSwithunsHttpGetIn" />
      <wsdl:output message="tns:GetSaintSwithunsHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeEnds">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date British Summertime Ends.</documentation>
      <wsdl:input message="tns:GetBritishSummertimeEndsHttpGetIn" />
      <wsdl:output message="tns:GetBritishSummertimeEndsHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetHalloween">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Halloween.</documentation>
      <wsdl:input message="tns:GetHalloweenHttpGetIn" />
      <wsdl:output message="tns:GetHalloweenHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAllSaints">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of All Saints.</documentation>
      <wsdl:input message="tns:GetAllSaintsHttpGetIn" />
      <wsdl:output message="tns:GetAllSaintsHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetGuyFawkesNight">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Guy Fawkes Night.</documentation>
      <wsdl:input message="tns:GetGuyFawkesNightHttpGetIn" />
      <wsdl:output message="tns:GetGuyFawkesNightHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetRemembrance">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Remembrance Sunday.</documentation>
      <wsdl:input message="tns:GetRemembranceHttpGetIn" />
      <wsdl:output message="tns:GetRemembranceHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintAndrews">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Andrews Day.</documentation>
      <wsdl:input message="tns:GetSaintAndrewsHttpGetIn" />
      <wsdl:output message="tns:GetSaintAndrewsHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetHogmanay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Hogmanay.</documentation>
      <wsdl:input message="tns:GetHogmanayHttpGetIn" />
      <wsdl:output message="tns:GetHogmanayHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="GBSCTHolidayDatesHttpPost">
    <wsdl:operation name="GetNewYear">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of New Year.</documentation>
      <wsdl:input message="tns:GetNewYearHttpPostIn" />
      <wsdl:output message="tns:GetNewYearHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSecondJanuary">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of January 2nd Day.</documentation>
      <wsdl:input message="tns:GetSecondJanuaryHttpPostIn" />
      <wsdl:output message="tns:GetSecondJanuaryHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetGoodFriday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Good Friday.</documentation>
      <wsdl:input message="tns:GetGoodFridayHttpPostIn" />
      <wsdl:output message="tns:GetGoodFridayHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetEasterMonday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Easter Monday.</documentation>
      <wsdl:input message="tns:GetEasterMondayHttpPostIn" />
      <wsdl:output message="tns:GetEasterMondayHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetMayDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of May Day.</documentation>
      <wsdl:input message="tns:GetMayDayHttpPostIn" />
      <wsdl:output message="tns:GetMayDayHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSpringBankHoliday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Spring Bank Holiday.</documentation>
      <wsdl:input message="tns:GetSpringBankHolidayHttpPostIn" />
      <wsdl:output message="tns:GetSpringBankHolidayHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSummerBankHoliday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Summer Bank Holiday.</documentation>
      <wsdl:input message="tns:GetSummerBankHolidayHttpPostIn" />
      <wsdl:output message="tns:GetSummerBankHolidayHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetChristmas">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Christmas Day.</documentation>
      <wsdl:input message="tns:GetChristmasHttpPostIn" />
      <wsdl:output message="tns:GetChristmasHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBoxingDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Boxing Day.</documentation>
      <wsdl:input message="tns:GetBoxingDayHttpPostIn" />
      <wsdl:output message="tns:GetBoxingDayHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetNewYearsEve">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of New Year's Eve.</documentation>
      <wsdl:input message="tns:GetNewYearsEveHttpPostIn" />
      <wsdl:output message="tns:GetNewYearsEveHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBurnsNight">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Burns Night.</documentation>
      <wsdl:input message="tns:GetBurnsNightHttpPostIn" />
      <wsdl:output message="tns:GetBurnsNightHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetHolocaustMemorial">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of the Holocaust Memorial.</documentation>
      <wsdl:input message="tns:GetHolocaustMemorialHttpPostIn" />
      <wsdl:output message="tns:GetHolocaustMemorialHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetShroveTues">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of ShroveTuesday (Pancake Day).</documentation>
      <wsdl:input message="tns:GetShroveTuesHttpPostIn" />
      <wsdl:output message="tns:GetShroveTuesHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAshWeds">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Ash Wednesday.</documentation>
      <wsdl:input message="tns:GetAshWedsHttpPostIn" />
      <wsdl:output message="tns:GetAshWedsHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetValentines">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Valentines Day.</documentation>
      <wsdl:input message="tns:GetValentinesHttpPostIn" />
      <wsdl:output message="tns:GetValentinesHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintDavids">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Davids Day.</documentation>
      <wsdl:input message="tns:GetSaintDavidsHttpPostIn" />
      <wsdl:output message="tns:GetSaintDavidsHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetMothers">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Mothering Sunday (Mothers Day).</documentation>
      <wsdl:input message="tns:GetMothersHttpPostIn" />
      <wsdl:output message="tns:GetMothersHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintPatricksDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Patrick's Day.</documentation>
      <wsdl:input message="tns:GetSaintPatricksDayHttpPostIn" />
      <wsdl:output message="tns:GetSaintPatricksDayHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetPalmSunday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Palm Sunday.</documentation>
      <wsdl:input message="tns:GetPalmSundayHttpPostIn" />
      <wsdl:output message="tns:GetPalmSundayHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetMaundyThursday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Maundy Thursday.</documentation>
      <wsdl:input message="tns:GetMaundyThursdayHttpPostIn" />
      <wsdl:output message="tns:GetMaundyThursdayHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetEaster">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Easter Sunday.</documentation>
      <wsdl:input message="tns:GetEasterHttpPostIn" />
      <wsdl:output message="tns:GetEasterHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeBegins">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date British Summertime Begins.</documentation>
      <wsdl:input message="tns:GetBritishSummertimeBeginsHttpPostIn" />
      <wsdl:output message="tns:GetBritishSummertimeBeginsHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAprilFools">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of April Fools Day.</documentation>
      <wsdl:input message="tns:GetAprilFoolsHttpPostIn" />
      <wsdl:output message="tns:GetAprilFoolsHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetQueenElizabethsBirthday">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Queen Elizabeth's Birthday.</documentation>
      <wsdl:input message="tns:GetQueenElizabethsBirthdayHttpPostIn" />
      <wsdl:output message="tns:GetQueenElizabethsBirthdayHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintGeorgesDay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St George's Day.</documentation>
      <wsdl:input message="tns:GetSaintGeorgesDayHttpPostIn" />
      <wsdl:output message="tns:GetSaintGeorgesDayHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetTroopingTheColour">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Trooping the Colour.</documentation>
      <wsdl:input message="tns:GetTroopingTheColourHttpPostIn" />
      <wsdl:output message="tns:GetTroopingTheColourHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetFathers">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Fathers Day.</documentation>
      <wsdl:input message="tns:GetFathersHttpPostIn" />
      <wsdl:output message="tns:GetFathersHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetEmmelinePankhurst">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Emmeline Pankhurst Day.</documentation>
      <wsdl:input message="tns:GetEmmelinePankhurstHttpPostIn" />
      <wsdl:output message="tns:GetEmmelinePankhurstHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintSwithuns">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Swithuns Day.</documentation>
      <wsdl:input message="tns:GetSaintSwithunsHttpPostIn" />
      <wsdl:output message="tns:GetSaintSwithunsHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeEnds">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date British Summertime Ends.</documentation>
      <wsdl:input message="tns:GetBritishSummertimeEndsHttpPostIn" />
      <wsdl:output message="tns:GetBritishSummertimeEndsHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetHalloween">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Halloween.</documentation>
      <wsdl:input message="tns:GetHalloweenHttpPostIn" />
      <wsdl:output message="tns:GetHalloweenHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAllSaints">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of All Saints.</documentation>
      <wsdl:input message="tns:GetAllSaintsHttpPostIn" />
      <wsdl:output message="tns:GetAllSaintsHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetGuyFawkesNight">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Guy Fawkes Night.</documentation>
      <wsdl:input message="tns:GetGuyFawkesNightHttpPostIn" />
      <wsdl:output message="tns:GetGuyFawkesNightHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetRemembrance">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Remembrance Sunday.</documentation>
      <wsdl:input message="tns:GetRemembranceHttpPostIn" />
      <wsdl:output message="tns:GetRemembranceHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetSaintAndrews">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of St Andrews Day.</documentation>
      <wsdl:input message="tns:GetSaintAndrewsHttpPostIn" />
      <wsdl:output message="tns:GetSaintAndrewsHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetHogmanay">
      <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Get the date of Hogmanay.</documentation>
      <wsdl:input message="tns:GetHogmanayHttpPostIn" />
      <wsdl:output message="tns:GetHogmanayHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="GBSCTHolidayDatesSoap" type="tns:GBSCTHolidayDatesSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" style="document" />
    <wsdl:operation name="GetNewYear">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetNewYear" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSecondJanuary">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetSecondJanuary" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGoodFriday">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetGoodFriday" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetEasterMonday">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetEasterMonday" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetMayDay">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetMayDay" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSpringBankHoliday">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetSpringBankHoliday" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSummerBankHoliday">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetSummerBankHoliday" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetChristmas">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetChristmas" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBoxingDay">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetBoxingDay" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNewYearsEve">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetNewYearsEve" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBurnsNight">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetBurnsNight" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetHolocaustMemorial">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetHolocaustMemorial" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetShroveTues">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetShroveTues" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAshWeds">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetAshWeds" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetValentines">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetValentines" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintDavids">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetSaintDavids" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetMothers">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetMothers" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintPatricksDay">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetSaintPatricksDay" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPalmSunday">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetPalmSunday" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetMaundyThursday">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetMaundyThursday" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetEaster">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetEaster" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeBegins">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetBritishSummertimeBegins" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAprilFools">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetAprilFools" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetQueenElizabethsBirthday">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetQueenElizabethsBirthday" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintGeorgesDay">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetSaintGeorgesDay" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetTroopingTheColour">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetTroopingTheColour" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetFathers">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetFathers" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetEmmelinePankhurst">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetEmmelinePankhurst" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintSwithuns">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetSaintSwithuns" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeEnds">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetBritishSummertimeEnds" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetHalloween">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetHalloween" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAllSaints">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetAllSaints" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGuyFawkesNight">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetGuyFawkesNight" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetRemembrance">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetRemembrance" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintAndrews">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetSaintAndrews" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetHogmanay">
      <soap:operation soapAction="http://www.27seconds.com/Holidays/GBSCT/Dates/GetHogmanay" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="GBSCTHolidayDatesHttpGet" type="tns:GBSCTHolidayDatesHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="GetNewYear">
      <http:operation location="/GetNewYear" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSecondJanuary">
      <http:operation location="/GetSecondJanuary" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGoodFriday">
      <http:operation location="/GetGoodFriday" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetEasterMonday">
      <http:operation location="/GetEasterMonday" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetMayDay">
      <http:operation location="/GetMayDay" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSpringBankHoliday">
      <http:operation location="/GetSpringBankHoliday" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSummerBankHoliday">
      <http:operation location="/GetSummerBankHoliday" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetChristmas">
      <http:operation location="/GetChristmas" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBoxingDay">
      <http:operation location="/GetBoxingDay" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNewYearsEve">
      <http:operation location="/GetNewYearsEve" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBurnsNight">
      <http:operation location="/GetBurnsNight" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetHolocaustMemorial">
      <http:operation location="/GetHolocaustMemorial" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetShroveTues">
      <http:operation location="/GetShroveTues" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAshWeds">
      <http:operation location="/GetAshWeds" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetValentines">
      <http:operation location="/GetValentines" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintDavids">
      <http:operation location="/GetSaintDavids" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetMothers">
      <http:operation location="/GetMothers" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintPatricksDay">
      <http:operation location="/GetSaintPatricksDay" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPalmSunday">
      <http:operation location="/GetPalmSunday" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetMaundyThursday">
      <http:operation location="/GetMaundyThursday" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetEaster">
      <http:operation location="/GetEaster" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeBegins">
      <http:operation location="/GetBritishSummertimeBegins" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAprilFools">
      <http:operation location="/GetAprilFools" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetQueenElizabethsBirthday">
      <http:operation location="/GetQueenElizabethsBirthday" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintGeorgesDay">
      <http:operation location="/GetSaintGeorgesDay" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetTroopingTheColour">
      <http:operation location="/GetTroopingTheColour" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetFathers">
      <http:operation location="/GetFathers" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetEmmelinePankhurst">
      <http:operation location="/GetEmmelinePankhurst" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintSwithuns">
      <http:operation location="/GetSaintSwithuns" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeEnds">
      <http:operation location="/GetBritishSummertimeEnds" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetHalloween">
      <http:operation location="/GetHalloween" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAllSaints">
      <http:operation location="/GetAllSaints" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGuyFawkesNight">
      <http:operation location="/GetGuyFawkesNight" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetRemembrance">
      <http:operation location="/GetRemembrance" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintAndrews">
      <http:operation location="/GetSaintAndrews" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetHogmanay">
      <http:operation location="/GetHogmanay" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="GBSCTHolidayDatesHttpPost" type="tns:GBSCTHolidayDatesHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="GetNewYear">
      <http:operation location="/GetNewYear" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSecondJanuary">
      <http:operation location="/GetSecondJanuary" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGoodFriday">
      <http:operation location="/GetGoodFriday" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetEasterMonday">
      <http:operation location="/GetEasterMonday" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetMayDay">
      <http:operation location="/GetMayDay" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSpringBankHoliday">
      <http:operation location="/GetSpringBankHoliday" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSummerBankHoliday">
      <http:operation location="/GetSummerBankHoliday" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetChristmas">
      <http:operation location="/GetChristmas" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBoxingDay">
      <http:operation location="/GetBoxingDay" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetNewYearsEve">
      <http:operation location="/GetNewYearsEve" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBurnsNight">
      <http:operation location="/GetBurnsNight" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetHolocaustMemorial">
      <http:operation location="/GetHolocaustMemorial" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetShroveTues">
      <http:operation location="/GetShroveTues" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAshWeds">
      <http:operation location="/GetAshWeds" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetValentines">
      <http:operation location="/GetValentines" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintDavids">
      <http:operation location="/GetSaintDavids" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetMothers">
      <http:operation location="/GetMothers" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintPatricksDay">
      <http:operation location="/GetSaintPatricksDay" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetPalmSunday">
      <http:operation location="/GetPalmSunday" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetMaundyThursday">
      <http:operation location="/GetMaundyThursday" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetEaster">
      <http:operation location="/GetEaster" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeBegins">
      <http:operation location="/GetBritishSummertimeBegins" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAprilFools">
      <http:operation location="/GetAprilFools" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetQueenElizabethsBirthday">
      <http:operation location="/GetQueenElizabethsBirthday" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintGeorgesDay">
      <http:operation location="/GetSaintGeorgesDay" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetTroopingTheColour">
      <http:operation location="/GetTroopingTheColour" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetFathers">
      <http:operation location="/GetFathers" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetEmmelinePankhurst">
      <http:operation location="/GetEmmelinePankhurst" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintSwithuns">
      <http:operation location="/GetSaintSwithuns" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetBritishSummertimeEnds">
      <http:operation location="/GetBritishSummertimeEnds" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetHalloween">
      <http:operation location="/GetHalloween" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAllSaints">
      <http:operation location="/GetAllSaints" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetGuyFawkesNight">
      <http:operation location="/GetGuyFawkesNight" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetRemembrance">
      <http:operation location="/GetRemembrance" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetSaintAndrews">
      <http:operation location="/GetSaintAndrews" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetHogmanay">
      <http:operation location="/GetHogmanay" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="GBSCTHolidayDates">
    <documentation xmlns="http://schemas.xmlsoap.org/wsdl/">Web service that calculates specific national holidays for Scotland (UK).</documentation>
    <wsdl:port name="GBSCTHolidayDatesSoap" binding="tns:GBSCTHolidayDatesSoap">
      <soap:address location="http://www.holidaywebservice.com/Holidays/GBSCT/Dates/GBSCTHolidayDates.asmx" />
    </wsdl:port>
    <wsdl:port name="GBSCTHolidayDatesHttpGet" binding="tns:GBSCTHolidayDatesHttpGet">
      <http:address location="http://www.holidaywebservice.com/Holidays/GBSCT/Dates/GBSCTHolidayDates.asmx" />
    </wsdl:port>
    <wsdl:port name="GBSCTHolidayDatesHttpPost" binding="tns:GBSCTHolidayDatesHttpPost">
      <http:address location="http://www.holidaywebservice.com/Holidays/GBSCT/Dates/GBSCTHolidayDates.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>