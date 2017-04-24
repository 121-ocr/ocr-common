package ocr.common.handler;

import io.vertx.core.AsyncResult;
import io.vertx.core.Future;
import io.vertx.core.Handler;
import io.vertx.core.MultiMap;
import io.vertx.core.json.JsonObject;
import otocloud.common.ActionContextTransfomer;
import otocloud.common.SessionSchema;
import otocloud.framework.app.function.ActionHandlerImpl;
import otocloud.framework.app.function.AppActivityImpl;
import otocloud.framework.core.CommandMessage;

/**
 * 单据操作基类
 * 
 * @author wanghw
 *
 */
public class SampleBillBaseHandler extends ActionHandlerImpl<JsonObject> {

	public SampleBillBaseHandler(AppActivityImpl appActivity) {
		super(appActivity);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void handle(CommandMessage<JsonObject> msg) {
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
	private void proess(CommandMessage<JsonObject> msg, JsonObject bo) {
		
		MultiMap headerMap = msg.headers();
		
		JsonObject session = msg.getSession();
		boolean is_global_bu =  session.getBoolean(SessionSchema.IS_GLOBAL_BU, true);
		String bizUnit = null;
		if(!is_global_bu){
			bizUnit = session.getString(SessionSchema.BIZ_UNIT_ID, null);
		}
		
		String boId = bo.getString("bo_id");
		//TODO 如果没有boid，则调用单据号生成规则生成一个单据号		

		// 当前操作人信息
		JsonObject actor = ActionContextTransfomer.fromMessageHeaderToActor(headerMap);
		
//		if(bo.containsKey("current_state") && bo.containsKey("bo")){
		if(bo.containsKey("current_state")){
			String currentState = bo.getString("current_state");			
//			this.updateFactData(appActivity.getBizObjectType(), bo.getJsonObject("bo"), boId, currentState, actor, null, result -> {
			this.updateFactData(appActivity.getBizObjectType(), bo, boId, currentState, actor, null, result -> {
				if (result.succeeded()) {				
					//后续处理
					afterProcess(bo, ret -> {
						if (ret.succeeded()) {
							msg.reply(ret.result()); //返回BO
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
		}else{
	
			// 记录事实对象（业务数据），会根据ActionDescriptor定义的状态机自动进行状态变化，并发出状态变化业务事件
			// 自动查找数据源，自动进行分表处理
			this.recordFactData(bizUnit, appActivity.getBizObjectType(), bo, boId, actor, null, result -> {
				if (result.succeeded()) {				
					//后续处理
					afterProcess(bo, ret -> {
						if (ret.succeeded()) {
							msg.reply(ret.result()); //返回BO
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
	}

	/**
	 * 单据保存后处理
	 * @param bo
	 * @param retHandler
	 */
	private void afterProcess(JsonObject bo, Handler<AsyncResult<JsonObject>> retHandler) {
		Future<JsonObject> future = Future.future();
		future.setHandler(retHandler);
		afterProcess(bo,future);	
		
	}

	/**
	 * 子类重写
	 * @param bo
	 * @param future
	 */
	protected void afterProcess(JsonObject bo, Future<JsonObject> future) {
		future.complete(bo);		
	}

	/**
	 * 单据保存前处理
	 * @param msg
	 */

	private void beforeProess(CommandMessage<JsonObject> msg, Handler<AsyncResult<JsonObject>> retHandler) {
		Future<JsonObject> future = Future.future();
		future.setHandler(retHandler);
		beforeProess(msg,future);		
	}

	/**
	 * 子类重写
	 * @param msg
	 * @param future
	 */
	protected void beforeProess(CommandMessage<JsonObject> msg, Future<JsonObject> future) {
		future.complete(msg.getContent());		
	}


	@Override
	public String getEventAddress() {
		// TODO Auto-generated method stub
		return null;
	}

}
