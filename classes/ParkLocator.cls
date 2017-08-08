public class ParkLocator {
	
    public static List<String> country(String paramCountry){
        ParkService.ParksImplPort calculator = new ParkService.ParksImplPort();
        return calculator.byCountry(paramCountry);
    }
}