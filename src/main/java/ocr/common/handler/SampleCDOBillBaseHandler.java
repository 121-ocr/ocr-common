package ocr.common.handler;

import io.vertx.core.AsyncResult;
import io.vertx.core.Future;
import io.vertx.core.Handler;
import io.vertx.core.MultiMap;
import io.vertx.core.json.JsonObject;
import otocloud.common.ActionContextTransfomer;
import otocloud.common.SessionSchema;
import otocloud.framework.app.common.BizRoleDirection;
import otocloud.framework.app.function.AppActivityImpl;
import otocloud.framework.app.function.CDOHandlerImpl;
import otocloud.framework.core.OtoCloudBusMessage;

/**
 * CDO操作基类
 * 
 * @author pcitc
 *
 */
public class SampleCDOBillBaseHandler extends CDOHandlerImpl<JsonObject> {

	public SampleCDOBillBaseHandler(AppActivityImpl appActivity) {
		super(appActivity);
	}

	@Override
	public void handle(OtoCloudBusMessage<JsonObject> msg) {
		// 前处理
		beforeProess(msg, result -> {
			if (result.succeeded()) {
				// 后续处理
				proess(msg, result.result());
			} else {
				Throwable errThrowable = result.cause();
				String errMsgString = errThrowable.getMessage();
				appActivity.getLogger().error(errMsgString, errThrowable);
				msg.fail(100, errMsgString);
			}
		});
	}

	public String getNewState() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getPreStatus() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean isContainsFactData() {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean needPublishEvent() {
		// TODO Auto-generated method stub
		return false;
	}

	/**
	 * 协作方的id必须放在bo里
	 * 
	 * @param msg
	 * @param result
	 */
	private void proess(OtoCloudBusMessage<JsonObject> msg, JsonObject bo) {

		MultiMap headerMap = msg.headers();
		
		JsonObject session = msg.getSession();
		boolean is_global_bu =  session.getBoolean(SessionSchema.IS_GLOBAL_BU, true);
		String bizUnit1 = null;
		if(!is_global_bu){
			bizUnit1 = session.getString(SessionSchema.BIZ_UNIT_ID, null);
		}	
		final String bizUnit = bizUnit1;

		String boId = bo.getString("bo_id");
		// 当前操作人信息
		JsonObject actor = ActionContextTransfomer.fromMessageHeaderToActor(headerMap);
		String partnerAcct = bo.getString("link_account");
		// 记录事实对象（业务数据），会根据ActionDescriptor定义的状态机自动进行状态变化，并发出状态变化业务事件
		// 自动查找数据源，自动进行分表处理

		this.recordCDO(null, BizRoleDirection.FROM, partnerAcct, null, this.appActivity.getBizObjectType(), bo, boId,
				getPreStatus(), getNewState(), false, false, actor, cdoRet -> {
					if (cdoRet.succeeded()) {
						JsonObject stubBo = this.buildStubForCDO(bo, boId, partnerAcct);
						this.recordFactData(bizUnit, appActivity.getBizObjectType(), stubBo, boId, getPreStatus(), getNewState(),
								needPublishEvent(), isContainsFactData(), actor, null, result -> {
									if (result.succeeded()) {
										// 后续处理
										afterProcess(bo, ret -> {
											if (ret.succeeded()) {
												msg.reply(ret.result()); // 返回BO
											} else {
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
					} else {
						Throwable errThrowable = cdoRet.cause();
						String errMsgString = errThrowable.getMessage();
						appActivity.getLogger().error(errMsgString, errThrowable);
						msg.fail(100, errMsgString);
					}
				});
	}

	/**
	 * 单据保存后处理
	 * 
	 * @param bo
	 * @param retHandler
	 */
	private void afterProcess(JsonObject bo, Handler<AsyncResult<JsonObject>> retHandler) {
		Future<JsonObject> future = Future.future();
		future.setHandler(retHandler);
		afterProcess(bo, future);

	}

	/**
	 * 子类重写
	 * 
	 * @param bo
	 * @param future
	 */
	protected void afterProcess(JsonObject bo, Future<JsonObject> future) {
		future.complete(bo);
	}

	/**
	 * 单据保存前处理
	 * 
	 * @param msg
	 */

	private void beforeProess(OtoCloudBusMessage<JsonObject> msg, Handler<AsyncResult<JsonObject>> retHandler) {
		Future<JsonObject> future = Future.future();
		future.setHandler(retHandler);
		beforeProess(msg, future);
	}

	/**
	 * 子类重写
	 * 
	 * @param msg
	 * @param future
	 */
	protected void beforeProess(OtoCloudBusMessage<JsonObject> msg, Future<JsonObject> future) {
		future.complete(msg.body().getJsonObject("content"));
	}

	@Override
	public String getEventAddress() {
		// TODO Auto-generated method stub
		return null;
	}


}
