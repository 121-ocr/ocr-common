package ocr.common.handler;

import io.vertx.core.AsyncResult;
import io.vertx.core.Future;
import io.vertx.core.Handler;
import io.vertx.core.json.JsonArray;
import io.vertx.core.json.JsonObject;
import otocloud.framework.app.function.ActionHandlerImpl;
import otocloud.framework.app.function.AppActivityImpl;
import otocloud.framework.core.OtoCloudBusMessage;

/**
 * 档案操作基类（批量）
 * 
 * @author wanghw
 *
 */
public class SampleDocBaseHandler extends ActionHandlerImpl<JsonObject> {

	public SampleDocBaseHandler(AppActivityImpl appActivity) {
		super(appActivity);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void handle(OtoCloudBusMessage<JsonObject> msg) {
		//前处理
		beforeProess(msg, result -> {
			if (result.succeeded()) {
				//后续处理
				proess(msg,result.result());
			}else{
				Throwable errThrowable = result.cause();
				String errMsgString = errThrowable.getMessage();
				appActivity.getLogger().error(errMsgString, errThrowable);
				msg.fail(100, errMsgString);
			}
		});
	}
	/**
	 * 保存
	 * @param msg
	 * @param result
	 */
	private void proess(OtoCloudBusMessage<JsonObject> msg, JsonArray bo) {
		
/*		JsonObject session = msg.getSession();
		Long is_global_bu =  session.getLong(SessionSchema.IS_GLOBAL_BU, 1L);
		String bizUnit = null;
		if(is_global_bu == 0L){
			bizUnit = session.getString(SessionSchema.BIZ_UNIT_ID, null);
		}*/
		
		String acctId = this.appActivity.getAppInstContext().getAccount();
		//JsonArray settingInfos = msg.body()
		for (Object settingInfo : bo) {
			((JsonObject)settingInfo).put("account", acctId);
		}
		

		// 记录事实对象（业务数据），会根据ActionDescriptor定义的状态机自动进行状态变化，并发出状态变化业务事件
		// 自动查找数据源，自动进行分表处理
		appActivity.getAppDatasource().getMongoClient_oto().save(
				appActivity.getDBTableName(appActivity.getBizObjectType()), bo, result -> {
			if (result.succeeded()) {				
				JsonArray bos = result.result();
				//后续处理
				afterProcess(bos, ret -> {
					if (ret.succeeded()) {
						msg.reply(ret.result()); //返回
					}else{
						Throwable errThrowable = ret.cause();
						String errMsgString = errThrowable.getMessage();
						appActivity.getLogger().error(errMsgString, errThrowable);
						msg.fail(100, errMsgString);
					}
				});				
			} else {
				Throwable errThrowable = result.cause();
				String errMsgString = errThrowable.getMessage();
				appActivity.getLogger().error(errMsgString, errThrowable);
				msg.fail(100, errMsgString);
			}
		});		
	}

	/**
	 * 单据保存后处理
	 * @param bo
	 * @param retHandler
	 */
	private void afterProcess(JsonArray bos, Handler<AsyncResult<JsonArray>> retHandler) {
		Future<JsonArray> future = Future.future();
		future.setHandler(retHandler);
		afterProcess(bos,future);	
		
	}

	/**
	 * 子类重写
	 * @param bo
	 * @param future
	 */
	protected void afterProcess(JsonArray bos, Future<JsonArray> future) {
		future.complete(bos);		
	}

	/**
	 * 单据保存前处理
	 * @param msg
	 */

	private void beforeProess(OtoCloudBusMessage<JsonObject> msg, Handler<AsyncResult<JsonArray>> retHandler) {
		Future<JsonArray> future = Future.future();
		future.setHandler(retHandler);
		beforeProess(msg,future);		
	}

	/**
	 * 子类重写
	 * @param msg
	 * @param future
	 */
	protected void beforeProess(OtoCloudBusMessage<JsonObject> msg, Future<JsonArray> future) {
		future.complete(msg.body().getJsonArray("content"));		
	}

	@Override
	public String getEventAddress() {
		// TODO Auto-generated method stub
		return null;
	}

}
