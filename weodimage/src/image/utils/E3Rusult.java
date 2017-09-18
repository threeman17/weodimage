package image.utils;

import java.util.HashMap;
import java.util.Map;


public class E3Rusult {
	private static Map data=new HashMap<>();
	public static Map ok(){

		data.put("status", 200);
		return data;
	}
}
