package com.mc.portal.pojo;
import com.mc.core.template.TemplateConfig;
/**
 * 数据层-空间参数
 * @author 1138789752@qq.com
 * @version 2017-10-30 11:53:14
 * */
public class WorkParam extends TemplateConfig.Context {
	public void setMeshKeySupport(boolean meshKeySupport) {
		this.MeshKeySupport = meshKeySupport;
	}
	public void setHumpNamingSupport(boolean humpNamingSupport) {
		this.HumpNamingSupport = humpNamingSupport;
	}
	public void setTacitValueType(boolean tacitValueType) {
		this.TacitValueType = tacitValueType;
	}
	public void setItemValueType(boolean itemValueType) {
		this.ItemValueType = itemValueType;
	}
	public void setUnsignedNumberSupport(boolean unsignedNumberSupport) {
		this.UnsignedNumberSupport = unsignedNumberSupport;
	}
	public void setUnsignedFloatSupport(boolean unsignedFloatSupport) {
		this.UnsignedFloatSupport = unsignedFloatSupport;
	}
	public void setFloatDotLength(int floatDotLength) {
		this.FloatDotLength = floatDotLength;
	}
	public void setDecimalDotLength(int decimalDotLength) {
		this.DecimalDotLength = decimalDotLength;
	}
	public void setBasePackageName(String basePackageName) {
		this.BasePackageName = basePackageName;
	}
	public void setEntityClassPackageNameTemplate(String entityClassPackageNameTemplate) {
		this.EntityClassPackageNameTemplate = entityClassPackageNameTemplate;
	}
	public void setEntityClassSimpleNameTemplate(String entityClassSimpleNameTemplate) {
		this.EntityClassSimpleNameTemplate = entityClassSimpleNameTemplate;
	}
	public void setDaoClassPackageNameTemplate(String daoClassPackageNameTemplate) {
		this.DaoClassPackageNameTemplate = daoClassPackageNameTemplate;
	}
	public void setDaoClassSimpleNameTemplate(String daoClassSimpleNameTemplate) {
		this.DaoClassSimpleNameTemplate = daoClassSimpleNameTemplate;
	}
	public void setDaoImplClassPackageNameTemplate(String daoImplClassPackageNameTemplate) {
		this.DaoImplClassPackageNameTemplate = daoImplClassPackageNameTemplate;
	}
	public void setDaoImplClassSimpleNameTemplate(String daoImplClassSimpleNameTemplate) {
		this.DaoImplClassSimpleNameTemplate = daoImplClassSimpleNameTemplate;
	}
	public void setDaoMapperXMLPackageNameTemplate(String daoMapperXMLPackageNameTemplate) {
		this.DaoMapperXMLPackageNameTemplate = daoMapperXMLPackageNameTemplate;
	}
	public void setDaoMapperXMLSimpleNameTemplate(String daoMapperXMLSimpleNameTemplate) {
		this.DaoMapperXMLSimpleNameTemplate = daoMapperXMLSimpleNameTemplate;
	}
	public void setServiceClassPackageNameTemplate(String serviceClassPackageNameTemplate) {
		this.ServiceClassPackageNameTemplate = serviceClassPackageNameTemplate;
	}
	public void setServiceClassSimpleNameTemplate(String serviceClassSimpleNameTemplate) {
		this.ServiceClassSimpleNameTemplate = serviceClassSimpleNameTemplate;
	}
	public void setServiceImplClassPackageNameTemplate(String serviceImplClassPackageNameTemplate) {
		this.ServiceImplClassPackageNameTemplate = serviceImplClassPackageNameTemplate;
	}
	public void setServiceImplClassSimpleNameTemplate(String serviceImplClassSimpleNameTemplate) {
		this.ServiceImplClassSimpleNameTemplate = serviceImplClassSimpleNameTemplate;
	}
}