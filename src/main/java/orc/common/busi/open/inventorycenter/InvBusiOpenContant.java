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

	public static final String AREACOMPONTENNAME = "invarea-mgr";
	
	public static final String SUPPLIERSCOMPONTENNAME = "suppliers-mgr";
	
	public static final String ALLOCATEORDERSCOMPONTENNAME = "allocateorders-mgr";
	
	public static final String INVENTORYCHECKCOMPONTENNAME = "inventorycheck-mgr";

	// unit-mgr 对外提供查询单位

	public static final String UNITCOMPONTENNAME = "invunit-mgr";

	// locationrelation 对外提供查询货位和商品关系地址
	public static final String LOCATIONRELATIONCOMPONTENNAME = "locationrelation-mgr";

	public static final String LOCATIONSADDRESS = "queryLocatonsGoodsRelation";

	// sheftsrelation 对外提供查询货位和商品关系地址
	public static final String SHEFTSRELATIONCOMPONTENNAME = "sheftsrelation-mgr";

	public static final String SHEFTSLOCATIONSADDRESS = "querysheftsGoodsRelation";

	// --预留组件

	public static final String RESERVEDCOMPONTENNAME = "stockreserved";

	public static final String QUERYRESERVEDSADDRESS = "getFirstBatch";
	
	// 保质期预警
	public static final String SHELFWARNINGCOMPONTENNAME = "shelfwarning";
	// 安全库存预警
	public static final String SAFESTOCKWARNINGCOMPONTENNAME = "safestockwarning";
	
	//安全库存
	public static final String SAFESTOCK = "safestock";

}
