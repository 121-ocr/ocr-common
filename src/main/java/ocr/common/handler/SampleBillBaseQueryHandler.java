package ocr.common.handler;

import io.vertx.core.http.HttpMethod;
import io.vertx.core.json.JsonObject;
import otocloud.common.ActionURI;
import otocloud.framework.app.function.ActionDescriptor;
import otocloud.framework.app.function.ActionHandlerImpl;
import otocloud.framework.app.function.AppActivityImpl;
import otocloud.framework.core.CommandMessage;
import otocloud.framework.core.HandlerDescriptor;

/**
 * 查询操作基类
 * 
 * @author wanghw
 *
 */
public class SampleBillBaseQueryHandler extends ActionHandlerImpl<JsonObject> {

	public SampleBillBaseQueryHandler(AppActivityImpl appActivity) {
		super(appActivity);
		// TODO Auto-generated constructor stub
	}

	/**
	 * 此action的入口地址
	 */
	@Override
	public String getEventAddress() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String getBizUnit(CommandMessage<JsonObject> msg){
		return null;
	}


	/**
	 * 处理器
	 */
	@Override
	public void handle(CommandMessage<JsonObject> msg) {
		
		//JsonObject session = msg.getSession();
		String bizUnit = getBizUnit(msg);

		JsonObject queryParams = msg.body().getJsonObject("content");
		//PagingOptions pagingObj = PagingOptions.buildPagingOptions(queryParams);
		JsonObject fields = queryParams.getJsonObject("fields");		
		JsonObject queryCond = queryParams.getJsonObject("query");
		JsonObject pagingInfo = queryParams.getJsonObject("paging");
		this.queryLatestFactDataList(bizUnit, appActivity.getBizObjectType(), getStatus(queryParams), fields, pagingInfo, queryCond, null, findRet -> {
			if (findRet.succeeded()) {
				msg.reply(findRet.result());
			} else {
				Throwable errThrowable = findRet.cause();
				String errMsgString = errThrowable.getMessage();
				appActivity.getLogger().error(errMsgString, errThrowable);
				msg.fail(100, errMsgString);
			}

		});
	}

	/**
	 * 要查询的单据状态
	 * 
	 * @return
	 */
	public String getStatus(JsonObject msgBody) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 此action的自描述元数据
	 */
	@Override
	public ActionDescriptor getActionDesc() {

		ActionDescriptor actionDescriptor = super.getActionDesc();
		HandlerDescriptor handlerDescriptor = actionDescriptor.getHandlerDescriptor();

		ActionURI uri = new ActionURI(getEventAddress(), HttpMethod.POST);
		handlerDescriptor.setRestApiURI(uri);

		return actionDescriptor;
	}

}
