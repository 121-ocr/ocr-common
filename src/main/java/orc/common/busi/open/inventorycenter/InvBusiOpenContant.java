package orc.common.busi.open.inventorycenter;

/**
 * 业务组，公开对外常量类
 * 
 * @author LCL
 *
 */
public class InvBusiOpenContant {
	// invfacility-mgr 对外提供查询货架

	public static final String FACILITYCOMPONTENNAME = "invfacility-mgr";

	// locationrelation 对外提供查询货位和商品关系地址
	public static final String LOCATIONRELATIONCOMPONTENNAME = "locationrelation-mgr";

	public static final String LOCATIONSADDRESS = "queryLocatonsGoodsRelation";

	// sheftsrelation 对外提供查询货位和商品关系地址
	public static final String SHEFTSRELATIONCOMPONTENNAME = "sheftsrelation-mgr";

	public static final String SHEFTSLOCATIONSADDRESS = "querysheftsGoodsRelation";

	// --预留组件

	public static final String RESERVEDCOMPONTENNAME = "stockreserved";

	public static final String QUERYRESERVEDSADDRESS = "getFirstBatch";

}
