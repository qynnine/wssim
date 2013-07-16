package edu.bis;

import edu.bis.wsmodel.ComponentBuilder;
import edu.bis.wsmodel.ServiceInfo;

public class serviceBuilder {

		
	public static ServiceInfo BuildServiceInfo(ServiceInfo serviceinfo, String wsdlLocation )
	{
		try
		{
		ComponentBuilder builder = new ComponentBuilder();
		String wsdllocation = wsdlLocation;
		serviceinfo.setWsdllocation(wsdllocation);
		serviceinfo = builder.buildserviceinformation(serviceinfo);
		
		}
		catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	return serviceinfo;
        }
        
}
