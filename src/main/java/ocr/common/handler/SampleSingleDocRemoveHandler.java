package ocr.common.handler;

import io.vertx.core.AsyncResult;
import io.vertx.core.Future;
import io.vertx.core.Handler;
import io.vertx.core.json.JsonObject;
import otocloud.framework.app.function.ActionHandlerImpl;
import otocloud.framework.app.function.AppActivityImpl;
import otocloud.framework.core.OtoCloudBusMessage;

/**
 * 档案操作基类（单个）
 * 
 * @author LCL
 *
 */
public class SampleSingleDocRemoveHandler extends ActionHandlerImpl<JsonObject> {

	public SampleSingleDocRemoveHandler(AppActivityImpl appActivity) {
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

	/**
	 * 保存
	 * 
	 * @param msg
	 * @param result
	 */
	private void proess(OtoCloudBusMessage<JsonObject> msg, JsonObject bo) {

		JsonObject query = msg.body().getJsonObject("content");

		appActivity.getAppDatasource().getMongoClient()
				.removeDocument(appActivity.getDBTableName(appActivity.getBizObjectType()), query, result -> {
					if (result.succeeded()) {
						// 后续处理
						afterProcess(bo, ret -> {
							if (ret.succeeded()) {
								msg.reply(ret.result()); // 返回
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
	}

	/**
	 * 单据保存后处理
	 * 
	 * @param bo
	 * @param retHandler
	 */
	private void afterProcess(JsonObject bos, Handler<AsyncResult<JsonObject>> retHandler) {
		Future<JsonObject> future = Future.future();
		future.setHandler(retHandler);
		afterProcess(bos, future);

	}

	/**
	 * 子类重写
	 * 
	 * @param bo
	 * @param future
	 */
	protected void afterProcess(JsonObject bos, Future<JsonObject> future) {
		future.complete(bos);
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
		future.complete(msg.body());
	}

	@Override
	public String getEventAddress() {
		// TODO Auto-generated method stub
		return null;
	}
}
