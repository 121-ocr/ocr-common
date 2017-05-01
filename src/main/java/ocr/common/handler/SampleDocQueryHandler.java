package ocr.common.handler;

import io.vertx.core.http.HttpMethod;
import io.vertx.core.json.JsonObject;
import otocloud.common.ActionURI;
import otocloud.framework.app.common.PagingOptions;
import otocloud.framework.app.function.ActionDescriptor;
import otocloud.framework.app.function.ActionHandlerImpl;
import otocloud.framework.app.function.AppActivityImpl;
import otocloud.framework.core.CommandMessage;
import otocloud.framework.core.HandlerDescriptor;

/**
 * 简单档案查询基类
 * @author wanghw
 *
 */
public class SampleDocQueryHandler extends ActionHandlerImpl<JsonObject> {
	

	public SampleDocQueryHandler(AppActivityImpl appActivity) {
		super(appActivity);
	}

	@Override
	public String getEventAddress() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String getBizUnit(CommandMessage<JsonObject> msg){
		return null;
	}


    /**
     * 查询
     */
	@Override
	public void handle(CommandMessage<JsonObject> msg) {
		
		//JsonObject session = msg.getSession();
		String bizUnit = getBizUnit(msg);

		JsonObject queryParams = msg.body().getJsonObject("content");

	    PagingOptions pagingObj = PagingOptions.buildPagingOptions(queryParams);        
	    this.queryBizDataList(bizUnit, appActivity.getBizObjectType(), pagingObj, null, findRet -> {
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
