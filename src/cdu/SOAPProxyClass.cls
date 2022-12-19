Class cdu.SOAPProxyClass
{

Parameter DEFAULTURL = "http://auxxdev2022.iscinternal.com:58003/csp/healthshare/auxx-config-hmfsys/services/TC.hmf.System.Service.Inbound.SYSAPI.cls?wsdl=1";

ClassMethod GenerateProxyClasses(
	Url As %String = "",
	Package As %String = "CDUI.ws") As %Status
{
	set Url = $select(Url'="":Url,1:..#DEFAULTURL)
	set request = ##class(%Net.HttpRequest).%New()

	set wsdl = ##class(%SOAP.WSDL.Reader).%New()
	set wsdl.HttpRequest = request
		,wsdl.MakeService = 1
		,wsdl.MakeEnsembleClasses = 1
		,wsdl.OperationPackage = Package_".Operation"
		,wsdl.ServicePackage = Package_".Service"
		,wsdl.RequestPackage = Package_".Request"
		,wsdl.ResponsePackage = Package_".Response"
	set sc = wsdl.Process(Url,Package)
	break
	#; set wsdl.%SOAP.WS
}

}
