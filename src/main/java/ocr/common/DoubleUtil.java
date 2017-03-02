package ocr.common;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * Double算术工具类
 * @author haiwen.wang
 *
 */
public class DoubleUtil {

	private static final int DEF_DIV_SCALE = 20;

	/**
	 * * 两个Double数相加 *
	 * 
	 * @param v1
	 * *
	 * @param v2
	 * *
	 * @return Double
	 */
	public static Double add(Double v1, Double v2) {
		BigDecimal b1 = new BigDecimal(v1.toString());
		BigDecimal b2 = new BigDecimal(v2.toString());
		return new Double(b1.add(b2).doubleValue());
	}

	/**
	 * * 两个Double数相减 *
	 * 
	 * @param v1
	 * *
	 * @param v2
	 * *
	 * @return Double
	 */
	public static Double sub(Double v1, Double v2) {
		BigDecimal b1 = new BigDecimal(v1.toString());
		BigDecimal b2 = new BigDecimal(v2.toString());
		return new Double(b1.subtract(b2).doubleValue());
	}

	/**
	 * * 两个Double数相乘 *
	 * 
	 * @param v1
	 * *
	 * @param v2
	 * *
	 * @return Double
	 */
	public static Double mul(Double v1, Double v2) {
		if(v1==null||v2==null){
			return null;
		}
		BigDecimal b1 = new BigDecimal(v1.toString());
		BigDecimal b2 = new BigDecimal(v2.toString());
		return new Double(b1.multiply(b2).doubleValue());
	}

	/**
	 * * 两个Double数相除 *
	 * 
	 * @param v1
	 * *
	 * @param v2
	 * *
	 * @return Double
	 */
	public static Double div(Double v1, Double v2) {
		BigDecimal b1 = new BigDecimal(v1.toString());
		BigDecimal b2 = new BigDecimal(v2.toString());
		return new Double(b1.divide(b2, DEF_DIV_SCALE, BigDecimal.ROUND_HALF_UP).doubleValue());
	}

	/**
	 * * 两个Double数相除，并保留scale位小数 *
	 * 
	 * @param v1
	 * *
	 * @param v2
	 * *
	 * @param scale
	 * *
	 * @return Double
	 */
	public static Double div(Double v1, Double v2, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException("The scale must be a positive integer or zero");
		}
		BigDecimal b1 = new BigDecimal(v1.toString());
		BigDecimal b2 = new BigDecimal(v2.toString());
		return new Double(b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue());
	}
	
	/**
	 * 
	 * @Title: Round 四舍五入
	 * @Description: TODO
	 * @param value 原始值
	 * @param newScale 保留位数
	 * @param roundingMode 四舍五入方式
	 * @return    
	 */
	public static Double round(Double value, int newScale, int roundingMode){
		if(value == null){
			return 0.0;
		}
		BigDecimal dbvalue = new BigDecimal(value.toString());
		return new Double(dbvalue.setScale(newScale, roundingMode).doubleValue());
	}
}
