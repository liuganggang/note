dd = Savon.client(wsdl: 'http://www.webservicex.net/globalweather.asmx?WSDL')
dd = Savon.client(wsdl: 'http://220.178.102.10:9090/pkiservice.wsdl', proxy: 'http://220.178.102.10:9090/soap')

dd.operations

dd.call(:get_cities_by_country, message: {:CountryName => 'china'})