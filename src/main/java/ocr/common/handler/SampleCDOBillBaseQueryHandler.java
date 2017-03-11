package ocr.common.handler;

import java.util.ArrayList;
import java.util.List;

import io.vertx.core.CompositeFuture;
import io.vertx.core.Future;
import io.vertx.core.http.HttpMethod;
import io.vertx.core.impl.CompositeFutureImpl;
import io.vertx.core.json.JsonObject;
import otocloud.common.ActionURI;
import otocloud.framework.app.common.BizRoleDirection;
import otocloud.framework.app.function.ActionDescriptor;
import otocloud.framework.app.function.AppActivityImpl;
import otocloud.framework.app.function.CDOHandlerImpl;
import otocloud.framework.core.HandlerDescriptor;
import otocloud.framework.core.OtoCloudBusMessage;

/**
 * CDO操作基类
 * 
 * @author pcitc
 *
 */
public class SampleCDOBillBaseQueryHandler extends CDOHandlerImpl<JsonObject> {

	public SampleCDOBillBaseQueryHandler(AppActivityImpl appActivity) {
		super(appActivity);
	}

	// 此action的入口地址
	@Override
	public String getEventAddress() {
		return null;
	}

	/**
	 * 要查询的单据状态
	 * 
	 * @return
	 */
	public String getStatus() {
		return null;
	}	
	
	/**
	 * 根据bo_id查询单据
	 */
	@Override
	public void handle(OtoCloudBusMessage<JsonObject> msg) {

		JsonObject queryParams = msg.body();
		this.queryLatestFactDataList(appActivity.getBizObjectType(), getStatus(), 
				null, queryParams, null, findRet -> {
			if (findRet.succeeded()) {
				List<JsonObject> stubBoList = findRet.result();
				if(stubBoList != null && stubBoList.size() > 0){
					List<Future> futures = new ArrayList<Future>();
					for(JsonObject stubBo : stubBoList){
						
						Future<JsonObject> cdoFuture = Future.future();
						futures.add(cdoFuture);						

						JsonObject bo = stubBo.getJsonObject("bo");
						String partner = bo.getString("partner");
						String boId = bo.getString("bo_id");
						
						this.queryLatestCDO(BizRoleDirection.FROM, partner, appActivity.getBizObjectType(), 
								boId, null, cdoRet->{
									if (findRet.succeeded()) {
										cdoFuture.complete(cdoRet.result());
									}else{
										cdoFuture.fail(cdoRet.cause());
									}									
									
								});						
					}					
					CompositeFuture.join(futures).setHandler(ar -> {
						List<JsonObject> retList = new ArrayList<>();
						CompositeFutureImpl comFutures = (CompositeFutureImpl)ar;
						if(comFutures.size() > 0){										
							for(int i=0;i<comFutures.size();i++){
								if(comFutures.succeeded(i)){
									JsonObject cdo = comFutures.result(i);
									retList.add(cdo);
								}
							}
						}
						
						msg.reply(retList);
					});
					
				}else{
					msg.reply(findRet.result());
				}
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
