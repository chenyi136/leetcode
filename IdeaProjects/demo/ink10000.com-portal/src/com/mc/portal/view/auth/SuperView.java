package com.mc.portal.view.auth;
import com.mc.core.entity.SuperEntity;
import com.mc.core.service.SuperService;
public abstract class SuperView<K, E extends SuperEntity> extends com.mc.portal.view.SuperView<K, E> {
	public SuperView(SuperService<K, E> service) {
		super(service);
	}
}