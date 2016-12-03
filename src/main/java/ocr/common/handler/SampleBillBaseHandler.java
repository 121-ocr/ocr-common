package ocr.common.handler;

import io.vertx.core.AsyncResult;
import io.vertx.core.Future;
import io.vertx.core.Handler;
import io.vertx.core.MultiMap;
import io.vertx.core.json.JsonObject;
import otocloud.common.ActionContextTransfomer;
import otocloud.framework.app.function.ActionHandlerImpl;
import otocloud.framework.app.function.AppActivityImpl;
import otocloud.framework.core.OtoCloudBusMessage;

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
	private void proess(OtoCloudBusMessage<JsonObject> msg, JsonObject bo) {
		
		MultiMap headerMap = msg.headers();
		
		String boId = bo.getString("bo_id");
		//TODO 如果没有boid，则调用单据号生成规则生成一个单据号		
		//交易单据一般要记录协作方
    	String partnerAcct = getPartnerAcct(bo);
		// 当前操作人信息
		JsonObject actor = ActionContextTransfomer.fromMessageHeaderToActor(headerMap);

		// 记录事实对象（业务数据），会根据ActionDescriptor定义的状态机自动进行状态变化，并发出状态变化业务事件
		// 自动查找数据源，自动进行分表处理
		this.recordFactData(appActivity.getBizObjectType(), bo, boId, actor, partnerAcct, null, result -> {
			if (result.succeeded()) {				
				String bo_id = result.result();
				if(boId == null || boId.isEmpty()){
					bo.put("bo_id", bo_id);
				}
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
	private void afterProcess(JsonObject bo, Future<JsonObject> future) {
		future.complete(bo);		
	}

	/**
	 * 单据保存前处理
	 * @param msg
	 */

	private void beforeProess(OtoCloudBusMessage<JsonObject> msg, Handler<AsyncResult<JsonObject>> retHandler) {
		Future<JsonObject> future = Future.future();
		future.setHandler(retHandler);
		beforeProess(msg,future);		
	}

	/**
	 * 子类重写
	 * @param msg
	 * @param future
	 */
	protected void beforeProess(OtoCloudBusMessage<JsonObject> msg, Future<JsonObject> future) {
		future.complete(msg.body());		
	}

	/**
	 * 单据保存后处理
	 * @param bo
	 */
	protected void afterProcess(OtoCloudBusMessage<JsonObject> msg) {
		
	}

	public String getPartnerAcct(JsonObject bo) {
		return null;
	}	

	@Override
	public String getEventAddress() {
		// TODO Auto-generated method stub
		return null;
	}

}
