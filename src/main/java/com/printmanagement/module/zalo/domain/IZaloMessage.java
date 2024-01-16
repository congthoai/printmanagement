package com.printmanagement.module.zalo.domain;

import java.util.function.Consumer;

public interface IZaloMessage {

	void sendDeliveryMessage(Consumer<ZaloDeliveryItem> data);
}
