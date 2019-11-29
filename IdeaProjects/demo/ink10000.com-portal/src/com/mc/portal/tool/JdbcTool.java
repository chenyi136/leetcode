package com.mc.portal.tool;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import com.mc.core.entity.auto.Bound;
import com.mc.core.entity.auto.Driver;
import com.mc.core.entity.auto.Field;
import com.mc.core.entity.auto.Inward;
import com.mc.core.entity.auto.Table;
import com.mc.core.template.TemplateConfig;
import com.mc.core.tool.JsonTool;
/**
 * 工具层-数库操作
 * @author 1138789752@qq.com
 * @version 2017-10-30 13:16:31
 * */
public final class JdbcTool {
	/**
	 * 主键约束
	 * */
	public static final String JDBC_PRIMARY_KEY = "PRIMARY KEY";
	/**
	 * 打开连接
	 * @param driver 驱动类名
	 * @param url 连接地址
	 * @param user 连接用户
	 * @param password 连接密码
	 * */
	public static Connection open(String driver, String url, String user, String password) throws Exception {
		if (driver == null || url == null || user == null || password == null) {
			throw new Exception("请求参数非法");
		}
		Class.forName(driver).newInstance();
		return DriverManager.getConnection(url, user, password);
	}
	/**
	 * 关闭连接
	 * @param conn 数据连接
	 * @param ps 执行对象
	 * @param sm 执行对象
	 * @param rs 数据游标
	 */
	public static void close(Connection conn, PreparedStatement ps, Statement sm, ResultSet rs) {
		try {
			if (rs != null && !rs.isClosed()) {
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (sm != null && !sm.isClosed()) {
				sm.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (ps != null && !ps.isClosed()) {
				ps.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 元数据集
	 * @param conn 数库连接
	 * */
	public static Map<String, Object> meta(Connection conn) {
		Map<String, Object> res = new LinkedHashMap<String, Object>();
		try {
			DatabaseMetaData meta = conn.getMetaData();
			res.put("Connection.TRANSACTION_NONE", Connection.TRANSACTION_NONE);
			res.put("Connection.TRANSACTION_READ_COMMITTED", Connection.TRANSACTION_READ_COMMITTED);
			res.put("Connection.TRANSACTION_READ_UNCOMMITTED", Connection.TRANSACTION_READ_UNCOMMITTED);
			res.put("Connection.TRANSACTION_REPEATABLE_READ", Connection.TRANSACTION_REPEATABLE_READ);
			res.put("Connection.TRANSACTION_SERIALIZABLE", Connection.TRANSACTION_SERIALIZABLE);
			res.put("Connection.getAutoCommit()", conn.getAutoCommit());
			res.put("Connection.getCatalog()", conn.getCatalog());
			res.put("Connection.getClientInfo()", conn.getClientInfo());
			res.put("Connection.getHoldability()", conn.getHoldability());
			res.put("Connection.getNetworkTimeout()", conn.getNetworkTimeout());
			res.put("Connection.getSchema()", conn.getSchema());
			res.put("Connection.getTransactionIsolation()", conn.getTransactionIsolation());
			res.put("Connection.getTypeMap()", conn.getTypeMap());
			res.put("Connection.getWarnings()", conn.getWarnings());
			res.put("Connection.isClosed()", conn.isClosed());
			res.put("Connection.isReadOnly()", conn.isReadOnly());
			res.put("DatabaseMetaData.allProceduresAreCallable()", meta.allProceduresAreCallable());
			res.put("DatabaseMetaData.allTablesAreSelectable()", meta.allTablesAreSelectable());
			res.put("DatabaseMetaData.autoCommitFailureClosesAllResultSets()", meta.autoCommitFailureClosesAllResultSets());
			res.put("DatabaseMetaData.dataDefinitionCausesTransactionCommit()", meta.dataDefinitionCausesTransactionCommit());
			res.put("DatabaseMetaData.dataDefinitionIgnoredInTransactions()", meta.dataDefinitionIgnoredInTransactions());
			res.put("DatabaseMetaData.doesMaxRowSizeIncludeBlobs()", meta.doesMaxRowSizeIncludeBlobs());
			res.put("DatabaseMetaData.generatedKeyAlwaysReturned()", meta.generatedKeyAlwaysReturned());
			res.put("DatabaseMetaData.getCatalogSeparator()", meta.getCatalogSeparator());
			res.put("DatabaseMetaData.getCatalogTerm()", meta.getCatalogTerm());
			res.put("DatabaseMetaData.getCatalogs()", meta.getCatalogs());
			res.put("DatabaseMetaData.getClientInfoProperties()", meta.getClientInfoProperties());
			res.put("DatabaseMetaData.getConnection()", meta.getConnection());
			res.put("DatabaseMetaData.getDatabaseMajorVersion()", meta.getDatabaseMajorVersion());
			res.put("DatabaseMetaData.getDatabaseMinorVersion()", meta.getDatabaseMinorVersion());
			res.put("DatabaseMetaData.getDatabaseProductName()", meta.getDatabaseProductName());
			res.put("DatabaseMetaData.getDatabaseProductVersion()", meta.getDatabaseProductVersion());
			res.put("DatabaseMetaData.getDefaultTransactionIsolation()", meta.getDefaultTransactionIsolation());
			res.put("DatabaseMetaData.getDriverMajorVersion()", meta.getDriverMajorVersion());
			res.put("DatabaseMetaData.getDriverMinorVersion()", meta.getDriverMinorVersion());
			res.put("DatabaseMetaData.getDriverName()", meta.getDriverName());
			res.put("DatabaseMetaData.getDriverVersion()", meta.getDriverVersion());
			res.put("DatabaseMetaData.getExtraNameCharacters()", meta.getExtraNameCharacters());
			res.put("DatabaseMetaData.getIdentifierQuoteString()", meta.getIdentifierQuoteString());
			res.put("DatabaseMetaData.getJDBCMajorVersion()", meta.getJDBCMajorVersion());
			res.put("DatabaseMetaData.getJDBCMinorVersion()", meta.getJDBCMinorVersion());
			res.put("DatabaseMetaData.getMaxBinaryLiteralLength()", meta.getMaxBinaryLiteralLength());
			res.put("DatabaseMetaData.getMaxCatalogNameLength()", meta.getMaxCatalogNameLength());
			res.put("DatabaseMetaData.getMaxCharLiteralLength()", meta.getMaxCharLiteralLength());
			res.put("DatabaseMetaData.getMaxColumnNameLength()", meta.getMaxColumnNameLength());
			res.put("DatabaseMetaData.getMaxColumnsInGroupBy()", meta.getMaxColumnsInGroupBy());
			res.put("DatabaseMetaData.getMaxColumnsInIndex()", meta.getMaxColumnsInIndex());
			res.put("DatabaseMetaData.getMaxColumnsInOrderBy()", meta.getMaxColumnsInOrderBy());
			res.put("DatabaseMetaData.getMaxColumnsInSelect()", meta.getMaxColumnsInSelect());
			res.put("DatabaseMetaData.getMaxColumnsInTable()", meta.getMaxColumnsInTable());
			res.put("DatabaseMetaData.getMaxConnections()", meta.getMaxConnections());
			res.put("DatabaseMetaData.getMaxCursorNameLength()", meta.getMaxCursorNameLength());
			res.put("DatabaseMetaData.getMaxIndexLength()", meta.getMaxIndexLength());
			res.put("DatabaseMetaData.getMaxLogicalLobSize()", meta.getMaxLogicalLobSize());
			res.put("DatabaseMetaData.getMaxProcedureNameLength()", meta.getMaxProcedureNameLength());
			res.put("DatabaseMetaData.getMaxRowSize()", meta.getMaxRowSize());
			res.put("DatabaseMetaData.getMaxSchemaNameLength()", meta.getMaxSchemaNameLength());
			res.put("DatabaseMetaData.getMaxStatementLength()", meta.getMaxStatementLength());
			res.put("DatabaseMetaData.getMaxStatements()", meta.getMaxStatements());
			res.put("DatabaseMetaData.getMaxTableNameLength()", meta.getMaxTableNameLength());
			res.put("DatabaseMetaData.getMaxTablesInSelect()", meta.getMaxTablesInSelect());
			res.put("DatabaseMetaData.getMaxUserNameLength()", meta.getMaxUserNameLength());
			res.put("DatabaseMetaData.getNumericFunctions()", meta.getNumericFunctions());
			res.put("DatabaseMetaData.getProcedureTerm()", meta.getProcedureTerm());
			res.put("DatabaseMetaData.getResultSetHoldability()", meta.getResultSetHoldability());
			res.put("DatabaseMetaData.getRowIdLifetime()", meta.getRowIdLifetime());
			res.put("DatabaseMetaData.getSchemas()", meta.getSchemas());
			res.put("DatabaseMetaData.getSchemaTerm()", meta.getSchemaTerm());
			res.put("DatabaseMetaData.getSearchStringEscape()", meta.getSearchStringEscape());
			res.put("DatabaseMetaData.getSQLKeywords()", meta.getSQLKeywords());
			res.put("DatabaseMetaData.getSQLStateType()", meta.getSQLStateType());
			res.put("DatabaseMetaData.getStringFunctions()", meta.getStringFunctions());
			res.put("DatabaseMetaData.getSystemFunctions()", meta.getSystemFunctions());
			res.put("DatabaseMetaData.getTableTypes()", meta.getTableTypes());
			res.put("DatabaseMetaData.getTimeDateFunctions()", meta.getTimeDateFunctions());
			res.put("DatabaseMetaData.getTypeInfo()", meta.getTypeInfo());
			res.put("DatabaseMetaData.getURL()", meta.getURL());
			res.put("DatabaseMetaData.getUserName()", meta.getUserName());
			res.put("DatabaseMetaData.isCatalogAtStart()", meta.isCatalogAtStart());
			res.put("DatabaseMetaData.isReadOnly()", meta.isReadOnly());
			res.put("DatabaseMetaData.locatorsUpdateCopy()", meta.locatorsUpdateCopy());
			res.put("DatabaseMetaData.nullPlusNonNullIsNull()", meta.nullPlusNonNullIsNull());
			res.put("DatabaseMetaData.nullsAreSortedAtEnd()", meta.nullsAreSortedAtEnd());
			res.put("DatabaseMetaData.nullsAreSortedAtStart()", meta.nullsAreSortedAtStart());
			res.put("DatabaseMetaData.nullsAreSortedHigh()", meta.nullsAreSortedHigh());
			res.put("DatabaseMetaData.nullsAreSortedLow()", meta.nullsAreSortedLow());
			res.put("DatabaseMetaData.storesLowerCaseIdentifiers()", meta.storesLowerCaseIdentifiers());
			res.put("DatabaseMetaData.storesLowerCaseQuotedIdentifiers()", meta.storesLowerCaseQuotedIdentifiers());
			res.put("DatabaseMetaData.storesMixedCaseIdentifiers()", meta.storesMixedCaseIdentifiers());
			res.put("DatabaseMetaData.storesMixedCaseQuotedIdentifiers()", meta.storesMixedCaseQuotedIdentifiers());
			res.put("DatabaseMetaData.storesUpperCaseIdentifiers()", meta.storesUpperCaseIdentifiers());
			res.put("DatabaseMetaData.storesUpperCaseQuotedIdentifiers()", meta.storesUpperCaseQuotedIdentifiers());
			res.put("DatabaseMetaData.supportsAlterTableWithAddColumn()", meta.supportsAlterTableWithAddColumn());
			res.put("DatabaseMetaData.supportsAlterTableWithDropColumn()", meta.supportsAlterTableWithDropColumn());
			res.put("DatabaseMetaData.supportsANSI92EntryLevelSQL()", meta.supportsANSI92EntryLevelSQL());
			res.put("DatabaseMetaData.supportsANSI92FullSQL()", meta.supportsANSI92FullSQL());
			res.put("DatabaseMetaData.supportsANSI92IntermediateSQL()", meta.supportsANSI92IntermediateSQL());
			res.put("DatabaseMetaData.supportsBatchUpdates()", meta.supportsBatchUpdates());
			res.put("DatabaseMetaData.supportsCatalogsInDataManipulation()", meta.supportsCatalogsInDataManipulation());
			res.put("DatabaseMetaData.supportsCatalogsInIndexDefinitions()", meta.supportsCatalogsInIndexDefinitions());
			res.put("DatabaseMetaData.supportsCatalogsInPrivilegeDefinitions()", meta.supportsCatalogsInPrivilegeDefinitions());
			res.put("DatabaseMetaData.supportsCatalogsInProcedureCalls()", meta.supportsCatalogsInProcedureCalls());
			res.put("DatabaseMetaData.supportsCatalogsInTableDefinitions()", meta.supportsCatalogsInTableDefinitions());
			res.put("DatabaseMetaData.supportsColumnAliasing()", meta.supportsColumnAliasing());
			res.put("DatabaseMetaData.supportsConvert()", meta.supportsConvert());
			res.put("DatabaseMetaData.supportsCoreSQLGrammar()", meta.supportsCoreSQLGrammar());
			res.put("DatabaseMetaData.supportsCorrelatedSubqueries()", meta.supportsCorrelatedSubqueries());
			res.put("DatabaseMetaData.supportsDataDefinitionAndDataManipulationTransactions()", meta.supportsDataDefinitionAndDataManipulationTransactions());
			res.put("DatabaseMetaData.supportsDataManipulationTransactionsOnly()", meta.supportsDataManipulationTransactionsOnly());
			res.put("DatabaseMetaData.supportsDifferentTableCorrelationNames()", meta.supportsDifferentTableCorrelationNames());
			res.put("DatabaseMetaData.supportsExpressionsInOrderBy()", meta.supportsExpressionsInOrderBy());
			res.put("DatabaseMetaData.supportsExtendedSQLGrammar()", meta.supportsExtendedSQLGrammar());
			res.put("DatabaseMetaData.supportsFullOuterJoins()", meta.supportsFullOuterJoins());
			res.put("DatabaseMetaData.supportsGetGeneratedKeys()", meta.supportsGetGeneratedKeys());
			res.put("DatabaseMetaData.supportsGroupBy()", meta.supportsGroupBy());
			res.put("DatabaseMetaData.supportsGroupByBeyondSelect()", meta.supportsGroupByBeyondSelect());
			res.put("DatabaseMetaData.supportsGroupByUnrelated()", meta.supportsGroupByUnrelated());
			res.put("DatabaseMetaData.supportsIntegrityEnhancementFacility()", meta.supportsIntegrityEnhancementFacility());
			res.put("DatabaseMetaData.supportsLikeEscapeClause()", meta.supportsLikeEscapeClause());
			res.put("DatabaseMetaData.supportsLimitedOuterJoins()", meta.supportsLimitedOuterJoins());
			res.put("DatabaseMetaData.supportsMinimumSQLGrammar()", meta.supportsMinimumSQLGrammar());
			res.put("DatabaseMetaData.supportsMixedCaseIdentifiers()", meta.supportsMixedCaseIdentifiers());
			res.put("DatabaseMetaData.supportsMixedCaseQuotedIdentifiers()", meta.supportsMixedCaseQuotedIdentifiers());
			res.put("DatabaseMetaData.supportsMultipleOpenResults()", meta.supportsMultipleOpenResults());
			res.put("DatabaseMetaData.supportsMultipleResultSets()", meta.supportsMultipleResultSets());
			res.put("DatabaseMetaData.supportsMultipleTransactions()", meta.supportsMultipleTransactions());
			res.put("DatabaseMetaData.supportsNamedParameters()", meta.supportsNamedParameters());
			res.put("DatabaseMetaData.supportsNonNullableColumns()", meta.supportsNonNullableColumns());
			res.put("DatabaseMetaData.supportsOpenCursorsAcrossCommit()", meta.supportsOpenCursorsAcrossCommit());
			res.put("DatabaseMetaData.supportsOpenCursorsAcrossRollback()", meta.supportsOpenCursorsAcrossRollback());
			res.put("DatabaseMetaData.supportsOpenStatementsAcrossCommit()", meta.supportsOpenStatementsAcrossCommit());
			res.put("DatabaseMetaData.supportsOpenStatementsAcrossRollback()", meta.supportsOpenStatementsAcrossRollback());
			res.put("DatabaseMetaData.supportsOrderByUnrelated()", meta.supportsOrderByUnrelated());
			res.put("DatabaseMetaData.supportsOuterJoins()", meta.supportsOuterJoins());
			res.put("DatabaseMetaData.supportsPositionedDelete()", meta.supportsPositionedDelete());
			res.put("DatabaseMetaData.supportsPositionedUpdate()", meta.supportsPositionedUpdate());
			res.put("DatabaseMetaData.supportsRefCursors()", meta.supportsRefCursors());
			res.put("DatabaseMetaData.supportsSavepoints()", meta.supportsSavepoints());
			res.put("DatabaseMetaData.supportsSchemasInDataManipulation()", meta.supportsSchemasInDataManipulation());
			res.put("DatabaseMetaData.supportsSchemasInIndexDefinitions()", meta.supportsSchemasInIndexDefinitions());
			res.put("DatabaseMetaData.supportsSchemasInPrivilegeDefinitions()", meta.supportsSchemasInPrivilegeDefinitions());
			res.put("DatabaseMetaData.supportsSchemasInProcedureCalls()", meta.supportsSchemasInProcedureCalls());
			res.put("DatabaseMetaData.supportsSchemasInTableDefinitions()", meta.supportsSchemasInTableDefinitions());
			res.put("DatabaseMetaData.supportsSelectForUpdate()", meta.supportsSelectForUpdate());
			res.put("DatabaseMetaData.supportsStatementPooling()", meta.supportsStatementPooling());
			res.put("DatabaseMetaData.supportsStoredFunctionsUsingCallSyntax()", meta.supportsStoredFunctionsUsingCallSyntax());
			res.put("DatabaseMetaData.supportsStoredProcedures()", meta.supportsStoredProcedures());
			res.put("DatabaseMetaData.supportsSubqueriesInComparisons()", meta.supportsSubqueriesInComparisons());
			res.put("DatabaseMetaData.supportsSubqueriesInExists()", meta.supportsSubqueriesInExists());
			res.put("DatabaseMetaData.supportsSubqueriesInIns()", meta.supportsSubqueriesInIns());
			res.put("DatabaseMetaData.supportsSubqueriesInQuantifieds()", meta.supportsSubqueriesInQuantifieds());
			res.put("DatabaseMetaData.supportsTableCorrelationNames()", meta.supportsTableCorrelationNames());
			res.put("DatabaseMetaData.supportsTransactions()", meta.supportsTransactions());
			res.put("DatabaseMetaData.supportsUnion()", meta.supportsUnion());
			res.put("DatabaseMetaData.supportsUnionAll()", meta.supportsUnionAll());
			res.put("DatabaseMetaData.usesLocalFilePerTable()", meta.usesLocalFilePerTable());
			res.put("DatabaseMetaData.usesLocalFiles()", meta.usesLocalFiles());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	/**
	 * 表头信息
	 * @param conn 数库连接
	 * */
	public static final List<Table> table (Connection conn) throws Exception {
		DatabaseMetaData meta = conn.getMetaData();
		ResultSet rs = meta.getTables(conn.getCatalog(), null, null, new String[] { "TABLE" });
		List<Table> res = new ArrayList<Table>();
		while (rs.next()) {
			Table data = new Table();
			data.setFrame(rs.getString("table_name"));
			res.add(data);
		}
		close(null, null, null, rs);
		if (res.size() > 0) {
			return res;
		}
		return null;
	}
	/**
	 * 数库产品
	 * @param conn 数库连接
	 * @param url 连接地址
	 * */
	public static DataBase product(Connection conn, String url) {
		if (url == null) {
			url = meta(conn).get("DatabaseMetaData.getDatabaseProductName()").toString();
		}
		url = url.toLowerCase();
		if (url.indexOf("mysql") != -1) {
			return new MySQL();
		}
		return null;
	}
	/**
	 * 解析字段
	 * @param datas 字段数组
	 * @param symbol 安全字符
	 * @param tacit 默认返值
	 * */
	public static String field(String value, String symbol, String tacit) throws Exception {
		List<Field> datas = JsonTool.list(value, Field.class);
		if (datas == null || datas.size() < 1) {
			return tacit;
		}
		StringBuffer res = new StringBuffer();
		for (Field data : datas) {
			res.append("," + symbol + data.getFrame() + symbol);
		}
		return res.substring(1);
	}
	/**
	 * 【MySQL】<br>
	 * 约束类型：主键约束、唯一约束、外键约束<br>
	 * 索引类型：主键索引、普通索引(文本索引)
	 * */
	public interface DataBase {
		/**
		 * 外键约束
		 * */
		public final String JDBC_FOREIGN_KEY = "FOREIGN KEY";
		/**
		 * 文本索引
		 * */
		public final String JDBC_FULL_TEXT_KEY = "FULL TEXT KEY";
		/**
		 * 普通索引
		 * */
		public final String JDBC_NORMAL_KEY = "NORMAL KEY";
		/**
		 * 唯一约束
		 * */
		public final String JDBC_UNIQUE_KEY = "UNIQUE KEY";
		/**
		 * 表存在吗
		 * @param conn 数据连接
		 * @param schema 表库名称
		 * @param table 表结构名
		 * */
		public boolean exist(Connection conn, String schema, String table) throws Exception;
		/**
		 * 表的状态
		 * @param conn 数据连接
		 * @param type 查询类型
		 * @param keys 主键集合
		 * */
		public Map<String, String> state(Connection conn, int type, List<String> keys) throws Exception;
		/**
		 * 对象头部
		 * @param driver 驱动信息
		 * @param table 对象信息
		 * */
		public String header(Driver driver, Table table);
		/**
		 * 表的字段
		 * @param conn 数据连接
		 * @param table 表结构名
		 * */
		public List<Field> column(Connection conn, String table) throws Exception;
		/**
		 * 表的字段
		 * @param conn 数据连接
		 * @param driver 驱动信息
		 * @param table 对象信息
		 * @param field 表的字段
		 * */
		public String column(Connection conn, Driver driver, Table table, Field field);
		/**
		 * 对象字段
		 * @param config 模板配置
		 * @param driver 驱动信息
		 * @param table 对象信息
		 * @param field 对象字段
		 * */
		public String column(TemplateConfig config, Driver driver, Table table, Field field, Inward inward);
		/**
		 * 表的主键
		 * @param conn 数据连接
		 * @param schema 表库名称
		 * @param table 表结构名
		 * */
		public List<Field> primary(Connection conn, String schema, String table) throws Exception;
		/**
		 * 对象主键
		 * @param driver 驱动信息
		 * @param fields 主键信息
		 * */
		public String primary(Driver driver, List<Field> fields);
		/**
		 * 表的尾部
		 * @param conn 数据连接
		 * @param schema 表库名称
		 * @param table 表结构名
		 * */
		public String footer(Connection conn, String schema, String table) throws Exception;
		/**
		 * 对象尾部
		 * @param driver 驱动信息
		 * @param table 对象信息
		 * */
		public String footer(Driver driver, Table table);
		/**
		 * 表的索引
		 * @param conn 数据连接
		 * @param driver 驱动信息
		 * @param table 表结构名
		 * @param res 返回集合
		 * */
		public Map<String, String> index(Connection conn, Driver driver, String table, Map<String, String> res) throws Exception;
		/**
		 * 表的约束
		 * @param conn 数据连接
		 * @param driver 驱动信息
		 * @param schema 表库名称
		 * @param table 表结构名
		 * @param tyeps 索引类型
		 * @param foreign 仅限外键
		 * @param res 返回集合
		 * */
		public void restrict(Connection conn, Driver driver, String schema, String table, Map<String, String> types, boolean foreign, Map<String, String> res) throws Exception;
		/**
		 * 对象索约
		 * @param driver 驱动信息
		 * @param tables 对象信息
		 * @param bound 索约信息
		 * @param trash 是否删除
		 * */
		public String limit(Driver driver, Map<Integer, String> tables, Bound bound, boolean trash) throws Exception;
	}
	private static abstract class DataBaseImpl implements DataBase {
		public String header(Driver driver, Table table) {
			return "CREATE TABLE " + driver.getSymbol() + table.getFrame() + driver.getSymbol() + " (";
		}
		public String column(TemplateConfig config, Driver driver, Table table, Field field, Inward inward) {
			String[] type = config.getTypeMap().get(field.getType());
			if (type == null) {
				return "   -- 无法处理的数据类型：" + field.getFrame() + "(" + field.getType() + ")";
			}
			type[2] = type[2].toUpperCase();
			TemplateConfig.Context context = config.getContext();
			StringBuffer res = new StringBuffer();
			res.append("   " + driver.getSymbol() + field.getFrame() + driver.getSymbol() + " " + type[2]);
			if (field.getLength() > 0) {
				if ("FLOAT".equals(type[2]) || "DOUBLE".equals(type[2])) {
					res.append(context.FloatDotLength > 0 && field.getLength() > context.FloatDotLength ? "(" + field.getLength() + "," + context.FloatDotLength + ")" : "(" + field.getLength() + ",0)");
				} else if ("DECIMAL".equals(type[2])) {
					res.append(context.DecimalDotLength > 0 && field.getLength() > context.DecimalDotLength ? "(" + field.getLength() + "," + context.DecimalDotLength + ")" : "(" + field.getLength() + ",0)");
				} else {
					res.append("(" + field.getLength() + ")");
				}
			}
			if (context.UnsignedNumberSupport && Arrays.asList("INT", "TINYINT", "BIGINT").contains(type[2])) {
				res.append(" UNSIGNED");
			}
			if (context.UnsignedFloatSupport && Arrays.asList("FLOAT", "DOUBLE", "DECIMAL").contains(type[2])) {
				res.append(" UNSIGNED");
			}
			if (!field.getEmpty()) {
				res.append(" NOT NULL");
			}
			if (!field.getMajor() && type[2].indexOf("BLOB") == -1) {
				if (field.getEmpty()) {
					res.append(" DEFAULT NULL");
				} else {
					if (context.TacitValueType && !field.doIsEmpty(field.getTacit())) {
						res.append(" DEFAULT " + field.getTacit());
					}
				}
			}
			if (field.getMajor() && table.getGrow()) {
				res.append(" AUTO_INCREMENT");
			}
			res.append(" COMMENT '");
			res.append(field.getName());
			if (field.getMajor() && table.getGrow()) {
				res.append(",自增长");
			}
			if (inward != null) {
				res.append(context.ItemValueType ? ",取值为[" + config.toString(inward) + "]" : ",取值约束");
			}
			if (!field.doIsEmpty(field.getNote())) {
				res.append("," + field.getNote());
			}
			res.append("',");
			return res.toString();
		}
		public String primary(Driver driver, List<Field> fields) {
			if (fields.size() < 1) {
				return "-- 数据库表缺少主键";
			}
			StringBuffer res = new StringBuffer();
			for (Field field : fields) {
				res.append(driver.getSymbol() + field.getFrame() + driver.getSymbol() + ",");
			}
			return "   PRIMARY KEY (" + res.deleteCharAt(res.length() - 1) + ")";
		}
		public String limit(Driver driver, Map<Integer, String> tables, Bound bound, boolean trash) throws Exception {
			String table = tables.get(bound.getFkTableHost());
			if (table == null) {
				return "-- 约束主表名称非法";
			}
			String symbol = driver.getSymbol();
			String name = symbol + bound.getName() + symbol;
			String tableHost = symbol + table + symbol;
			if (trash) {
				if (JDBC_PRIMARY_KEY.equals(bound.getType())) {
					return "ALTER TABLE " + tableHost + " DROP PRIMARY KEY;";
				} else if (JDBC_FOREIGN_KEY.equals(bound.getType())) {
					return "ALTER TABLE " + tableHost + " DROP FOREIGN KEY " + name + ";";
				} else if (JDBC_FULL_TEXT_KEY.equals(bound.getType()) || JDBC_NORMAL_KEY.equals(bound.getType()) || JDBC_UNIQUE_KEY.equals(bound.getType())) {
					return "DROP INDEX " + name + " ON " + tableHost + ";";
				}
			} else {
				String fieldHost = field(bound.getFieldHost(), symbol, null);
				if (fieldHost == null) {
					return "-- 约束主表字段非法";
				}
				if (JDBC_PRIMARY_KEY.equals(bound.getType())) {
					return "ALTER TABLE " + tableHost + " ADD PRIMARY KEY(" + fieldHost + ")";
				} else if (JDBC_FOREIGN_KEY.equals(bound.getType())) {
					String tableObey = tables.get(bound.getFkTableObey());
					if (tableObey == null) {
						return "-- 外键从表名称非法";
					}
					String fieldObey = field(bound.getFieldObey(), symbol, null);
					if (fieldObey == null) {
						return "-- 外键从表字段非法";
					}
					return "ALTER TABLE " + tableHost + " ADD CONSTRAINT " + name + " FOREIGN KEY(" + fieldHost + ") REFERENCES " + symbol + tableObey + symbol + "(" + fieldObey + ") ON DELETE " + bound.getTrash() + " ON UPDATE " + bound.getModify() + ";";
				} else if (JDBC_FULL_TEXT_KEY.equals(bound.getType())) {
					return "ALTER TABLE " + tableHost + " ADD FULLTEXT INDEX " + name + "(" + fieldHost + ");";
				} else if (JDBC_NORMAL_KEY.equals(bound.getType())) {
					return "ALTER TABLE " + tableHost + " ADD INDEX " + name + "(" + fieldHost + ") USING " + driver.getIndexes() + ";";
				} else if (JDBC_UNIQUE_KEY.equals(bound.getType())) {
					return "ALTER TABLE " + tableHost + " ADD CONSTRAINT " + name + " UNIQUE KEY(" + fieldHost + ") USING " + driver.getIndexes() + ";";
				}
			}
			return null;
		}
	}
	public static final class MySQL extends DataBaseImpl {
		private String INFORMATION_SCHEMA$KEY_COLUMN_USAGE = "information_schema.key_column_usage";
		private String INFORMATION_SCHEMA$REFERENTIAL_CONSTRAINTS = "information_schema.referential_constraints";
		private String INFORMATION_SCHEMA$TABLE_CONSTRAINTS = "information_schema.table_constraints";
		private String INFORMATION_SCHEMA$TABLES = "information_schema.tables";
		private String SHOW_FULL_FIELDS = "show full fields";
		private String SHOW_INDEX = "show index";
		private String SHOW_TABLE_STATUS = "show table status";
		private String[] SHOW_STATUS = new String[] { "show global status", "show status" };
		private String[] SHOW_VARIABLES = new String[] { "show global variables", "show variables" };
		public boolean exist(Connection conn, String schema, String table) throws Exception {
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery("select count(*) as total from " + INFORMATION_SCHEMA$TABLES + " where table_schema = '" + schema + "' and table_name = '" + table + "'");
			int res = 0;
			while (rs.next()) {
				res = rs.getInt("total");
				break;
			}
			close(null, null, sm, rs);
			return res > 0;
		}
		public Map<String, String> state(Connection conn, int type, List<String> keys) throws Exception {
			String param = keys != null ? " where variable_name in" + keys.toString().replace(", ","','").replace("[", "('").replace("]", "')") : "";
			Statement sm = conn.createStatement();
			ResultSet rs = null;
			switch (type) {
				case 1: rs = sm.executeQuery(SHOW_VARIABLES[0] + param); break;
				case 2: rs = sm.executeQuery(SHOW_VARIABLES[1] + param); break;
				case 3: rs = sm.executeQuery(SHOW_STATUS[0] + param); break;
				case 4: rs = sm.executeQuery(SHOW_STATUS[1] + param); break;
				default: return new LinkedHashMap<String, String>();
			}
			Map<String, String> res = new LinkedHashMap<String, String>();
			while (rs.next()) {
				res.put(rs.getString("variable_name").toLowerCase(), rs.getString("value"));
			}
			close(null, null, sm, rs);
			return res;
		}
		public List<Field> column(Connection conn, String table) throws Exception {
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(SHOW_FULL_FIELDS + " from " + table);
			List<Field> res = new ArrayList<Field>();
			while (rs.next()) {
				Field data = new Field();
				data.setFrame(rs.getString("field"));
				data.setType(rs.getString("type").toUpperCase());
				data.setEmpty(rs.getString("null").equalsIgnoreCase("yes"));
				data.setTacit(rs.getString("default"));
				data.setNote(rs.getString("comment"));
				data.setName(rs.getString("extra"));//额外信息
				data.setMajor("PRI".equals(rs.getString("key")));
				res.add(data);
			}
			close(null, null, sm, rs);
			return res;
		}
		public String column(Connection conn, Driver driver, Table table, Field field) {
			StringBuffer res = new StringBuffer();
			res.append("   " + driver.getSymbol() + field.getFrame() + driver.getSymbol());
			res.append(" " + field.getType());
			if (!field.getEmpty()) {
				res.append(" NOT NULL");
			}
			if (field.doIsEmpty(field.getTacit())) {
				if (field.getEmpty() && !field.getMajor() && field.getType().indexOf("BLOB") == -1) {
					res.append(" DEFAULT NULL");
				}
			} else {//额外信息
				res.append(field.getName() == null ? " DEFAULT '" + field.getTacit() + "'" : " DEFAULT " + field.getTacit());
			}
			if (field.getName() != null) {//额外信息
				res.append(" " + field.getName().toUpperCase());
			}
			res.append(" COMMENT '" + field.getNote() + "',");
			return res.toString();
		}
		public List<Field> primary(Connection conn, String schema, String table) throws Exception {
			try {
				StringBuffer sql = new StringBuffer("select");
				sql.append(" a.constraint_name as constraint_name,");
				sql.append(" a.table_name as table_name,");
				sql.append(" c.column_name as column_name,");
				sql.append(" c.ordinal_position as ordinal_position");
				sql.append(" from " + INFORMATION_SCHEMA$TABLE_CONSTRAINTS + " as a");
				sql.append(" left join " + INFORMATION_SCHEMA$KEY_COLUMN_USAGE + " as c on a.constraint_name = c.constraint_name");
				sql.append(" where");
				sql.append(" a.constraint_schema = '" + schema + "'");
				sql.append(" and c.constraint_schema = '" + schema + "'");
				sql.append(" and a.table_name = '" + table + "'");
				sql.append(" and c.table_name = '" + table + "'");
				sql.append(" and a.constraint_type = 'PRIMARY KEY'");
				Statement sm = conn.createStatement();
				ResultSet rs = sm.executeQuery(sql.toString());
				List<Field> res = new ArrayList<Field>();
				while (rs.next()) {
					Field data = new Field();
					data.setFrame(rs.getString("column_name"));
					res.add(data);
				}
				close(null, null, sm, rs);
				return res;
			} catch (Exception e) {
				Statement sm = conn.createStatement();
				ResultSet rs = sm.executeQuery(SHOW_INDEX + " from " + table + " where key_name = 'PRIMARY'");
				List<Field> res = new ArrayList<Field>();
				while (rs.next()) {
					Field data = new Field();
					data.setFrame(rs.getString("column_name"));
					res.add(data);
					break;
				}
				close(null, null, sm, rs);
				return res;
			}
		}
		public String footer(Connection conn, String schema, String table) throws Exception {
			try {
				StringBuffer sql = new StringBuffer("select engine,table_collation,table_comment");
				sql.append(" from " + INFORMATION_SCHEMA$TABLES);
				sql.append(" where");
				sql.append(" table_schema = '" + schema + "'");
				sql.append(" and table_name = '" + table + "'");
				Statement sm = conn.createStatement();
				ResultSet rs = sm.executeQuery(sql.toString());
				String res = null;
				while (rs.next()) {
					res = ") ENGINE=" + rs.getString("engine").toUpperCase() + " DEFAULT CHARSET=" + rs.getString("table_collation").split("_")[0].toUpperCase() + " COMMENT='" + rs.getString("table_comment") + "';";
					break;
				}
				close(null, null, sm, rs);
				return res;
			} catch (Exception e) {
				Statement sm = conn.createStatement();
				ResultSet rs = sm.executeQuery(SHOW_TABLE_STATUS + " where name = '" + table + "'");
				String res = null;
				while (rs.next()) {
					res = ") ENGINE=" + rs.getString("engine").toUpperCase() + " DEFAULT CHARSET=" + rs.getString("collation").split("_")[0].toUpperCase() + " COMMENT='" + rs.getString("comment") + "';";
					break;
				}
				close(null, null, sm, rs);
				return res;
			}
		}
		public String footer(Driver driver, Table table) {
			return ") ENGINE=" + driver.getEngine().toUpperCase() + " DEFAULT CHARSET=" + driver.getUnicode().toUpperCase() + " COMMENT='" + table.getName() + "';";
		}
		public Map<String, String> index(Connection conn, Driver driver, String table, Map<String, String> res) throws Exception {
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(SHOW_INDEX + " from " + table);
			Map<String, String> types = new HashMap<String, String>();
			Map<String, String> fields = new HashMap<String, String>();
			while (rs.next()) {
				String name = rs.getString("key_name");
				if (name.equals("PRIMARY")) {
					continue;
				}
				String field = rs.getString("column_name");
				String value = res.get(name);
				if (value == null) {
					String type = rs.getString("index_type").toUpperCase();
					res.put(name, type.equals("FULLTEXT") ? "ALTER TABLE " + driver.getSymbol() + table + driver.getSymbol() + " ADD " + type + " INDEX " + driver.getSymbol() + name + driver.getSymbol() + "(${field});" : "ALTER TABLE " + driver.getSymbol() + table + driver.getSymbol() + " ADD INDEX " + driver.getSymbol() + name + driver.getSymbol() + "(${field}) USING " + type + ";");
					types.put(name, type);
					fields.put(name, driver.getSymbol() + field + driver.getSymbol());
				} else {
					fields.put(name, fields.get(name) + "," + driver.getSymbol() + field + driver.getSymbol());
				}
			}
			close(null, null, sm, rs);
			for (Map.Entry<String, String> en : fields.entrySet()) {
				res.put(en.getKey(), res.get(en.getKey()).replace("${field}", en.getValue()));
			}
			return types;
		}
		public void restrict(Connection conn, Driver driver, String schema, String table, Map<String, String> types, boolean foreign, Map<String, String> res) throws Exception {
			StringBuffer sql = new StringBuffer("select");
			sql.append(" a.constraint_name as constraint_name,");
			sql.append(" a.constraint_type as constraint_type,");
			sql.append(" b.delete_rule as delete_rule,");
			sql.append(" b.update_rule as update_rule,");
			sql.append(" a.table_name as table_name,");
			sql.append(" c.column_name as column_name,");
			sql.append(" c.ordinal_position as ordinal_position,");
			sql.append(" c.referenced_table_name as referenced_table_name,");
			sql.append(" c.referenced_column_name as referenced_column_name");
			sql.append(" from " + INFORMATION_SCHEMA$TABLE_CONSTRAINTS + " as a");
			sql.append(" left join " + INFORMATION_SCHEMA$REFERENTIAL_CONSTRAINTS + " as b on a.constraint_name = b.constraint_name");
			sql.append(" left join " + INFORMATION_SCHEMA$KEY_COLUMN_USAGE + " as c on a.constraint_name = c.constraint_name");
			sql.append(" where");
			sql.append(" a.constraint_schema = '" + schema + "'");
			sql.append(" and c.constraint_schema = '" + schema + "'");
			sql.append(" and a.table_name = '" + table + "'");
			sql.append(" and c.table_name = '" + table + "'");
			if (foreign) {
				sql.append(" and b.table_name = '" + table + "'");
				sql.append(" and b.constraint_schema = '" + schema + "'");
				sql.append(" and a.constraint_type = 'FOREIGN KEY'");
			}
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql.toString());
			Map<String, String> temp = new HashMap<String, String>();
			Map<String, String> fields = new HashMap<String, String>();
			while (rs.next()) {
				String type = rs.getString("constraint_type");
				if (!type.equals("FOREIGN KEY") && !type.equals("UNIQUE")) {
					continue;
				}
				String name = rs.getString("constraint_name");
				String field = rs.getString("column_name");
				String value = temp.get(name);
				if (value == null) {
					if (type.equals("FOREIGN KEY")) {
						temp.put(name, "ALTER TABLE " + driver.getSymbol() + table + driver.getSymbol() + " ADD CONSTRAINT " + driver.getSymbol() + name + driver.getSymbol() + " FOREIGN KEY(${fieldHost}) REFERENCES " + driver.getSymbol() + rs.getString("referenced_table_name") + driver.getSymbol() + "(${fieldObey}) ON DELETE " + rs.getString("delete_rule") + " ON UPDATE " + rs.getString("update_rule") + ";");
						fields.put(name + "-host", driver.getSymbol() + field + driver.getSymbol());
						fields.put(name + "-obey", driver.getSymbol() + rs.getString("referenced_column_name") + driver.getSymbol());
					} else {
						temp.put(name, "ALTER TABLE " + driver.getSymbol() + table + driver.getSymbol() + " ADD CONSTRAINT " + driver.getSymbol() + name + driver.getSymbol() + " UNIQUE KEY(${field}) USING " + types.get(name) + ";");
						fields.put(name, driver.getSymbol() + field + driver.getSymbol());
					}
				} else {
					if (type.equals("FOREIGN KEY")) {
						fields.put(name + "-host", fields.get(name + "-host") + "," + driver.getSymbol() + field + driver.getSymbol());
						fields.put(name + "-obey", fields.get(name + "-obey") + "," + driver.getSymbol() + rs.getString("referenced_column_name") + driver.getSymbol());
					} else {
						fields.put(name, fields.get(name) + "," + driver.getSymbol() + field + driver.getSymbol());
					}
				}
			}
			for (Map.Entry<String, String> en : temp.entrySet()) {
				String name = en.getKey();
				String value = en.getValue();
				res.put(name, value.indexOf("FOREIGN KEY") != -1 ? value.replace("${fieldHost}", fields.get(name + "-host")).replace("${fieldObey}", fields.get(name + "-obey")) : value.replace("${field}", fields.get(name)));
			}
			close(null, null, sm, rs);
		}
	}
}