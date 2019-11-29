<%@ page language="java" import="java.util.HashMap" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<String, String> datas1 = (Map<String, String>) request.getAttribute("datas1");
@SuppressWarnings("unchecked")
Map<String, String> datas2 = (Map<String, String>) request.getAttribute("datas2");
@SuppressWarnings("unchecked")
Map<String, String> datas3 = (Map<String, String>) request.getAttribute("datas3");
@SuppressWarnings("unchecked")
Map<String, String> datas4 = (Map<String, String>) request.getAttribute("datas4");
String[] meta = (String[]) request.getAttribute("meta");
boolean total = "1".equals(request.getParameter("total"));
Map<String, String[]> keys1 = new HashMap<String, String[]>();
keys1.put("back_log", new String[] { "堆栈缓存请求数量", "缓存由于TCP/IP请求信道阻塞等原因导致暂时停止响应的这段时间产生的新请求的句柄到堆栈的最大数量。" });
keys1.put("basedir", new String[] { "软件安装运行路径", "数据库安装运行的路径。" });
keys1.put("binlog_format", new String[] { "操作日志保存格式", "二进制日志保存的格式。" });
keys1.put("bulk_insert_buffer_size", new String[] { "批量插入缓存大小", "批量插入数据的缓存大小，可提高插入效率，默认为8M。" });
keys1.put("datadir", new String[] { "存储文件物理路径", "数据文件所在的路径。" });
keys1.put("general_log_file", new String[] { "日志文件物理路径", "日志模式开启后将保存数据库所有的操作记录。" });
keys1.put("innodb_additional_mem_pool_size", new String[] { "目录结构内存大小", "用于InnoDB引擎存储的数据目录信息和其它内部数据结构的内存大小，类似Oracle的library cache，可以超过此值。" });
keys1.put("innodb_buffer_pool_size", new String[] { "缓存占用内存大小", "InnoDB引擎比MyISAM对缓存更为敏感，MyISAM可在默认的key_buffer_size设置下运行流畅而InnoDB引擎却很慢，由于InnoDB引擎把数据和索引都缓存起来，因此在只需用InnoDB引擎时可设置为70-80%的可用内存。" });
keys1.put("innodb_data_file_path", new String[] { "数据空间文件路径", "数据表空间文件的路径标识。" });
keys1.put("innodb_file_per_table", new String[] { "独享数据空间设置", "默认关闭独享数据表空间。" });
keys1.put("innodb_lock_wait_timeout", new String[] { "死锁回滚等待时间", "InnoDB引擎内置的死锁检测机制能促使未完成的事务进行回滚，但当InnoDB引擎使用MyISAM引擎的lock tables或第三方事务引擎时InnoDB引擎无法识别死锁，为避免这种情况，此值设定数据库在允许其他事务修改那些最终受事务回滚的数据前可以等待的秒数。" });
keys1.put("innodb_thread_concurrency", new String[] { "引擎线程并发数量", "设为硬件服务器CPU的个数，建议采用默认的设置。" });
keys1.put("interactive_timeout", new String[] { "最大交互等待秒数", "关闭一个交互连接前需要等待的秒数。" });
keys1.put("join_buffer_size", new String[] { "表间关联缓存大小", "用于表之间关联的缓存大小，对于每个连接此值是独享的。" });
keys1.put("key_buffer_size", new String[] { "索引缓存占用大小", "是影响MyISAM引擎的性能最大的一个参数，增大此值可得到更好的索引处理性能，对于4GB内存可设置为256MB或384MB。" });
keys1.put("log_error", new String[] { "错误日志文件路径", "保存错误日志的文件的路径。" });
keys1.put("log_warnings", new String[] { "是否记录警告信息", "1为记录，默认为1。" });
keys1.put("long_query_time", new String[] { "慢查询花多长时间", "超过此值的查询为慢查询。" });
keys1.put("lower_case_file_system", new String[] { "是否对大小写敏感", "当前系统文件是否大小写敏感。" });
keys1.put("lower_case_table_names", new String[] { "是否对大小写敏感", "表名是否大小写敏感，取值为0时敏感、取值为1时把表名转为小写后执行。" });
keys1.put("max_allowed_packet", new String[] { "数据包最大字节数", "网络传输中一次传输消息数据的最大字节数，默认值为1MB，最大值为1GB，必须设置为1024的倍数。" });
keys1.put("max_connect_errors", new String[] { "主机中断次数限制", "允许的每个主机的请求异常中断的最大次数，当超过该次数时数据库将禁止该主机host连接，直到数据库重启或通过flush hosts来清空相关的主机信息。" });
keys1.put("max_connections", new String[] { "最大用户连接数量", "实际可连接数为max_connections+1个，但此值最大不能超过16384个，增大此值不会占用太多系统资源，占用系统资源（如cpu、内存）的多少主要取决于查询的密度、效率等，此值过小易造成too many connections错误。" });
keys1.put("max_heap_table_size", new String[] { "表堆栈缓存的大小", "默认为16MB。" });
keys1.put("myisam_max_sort_file_size", new String[] { "索引重建文件大小", "当MyISAM引擎重建索引(repair、alter table或load data infile)时临时文件所允许的最大字节数，若文件大小比此值更大，索引会通过键值缓冲创建从而导致更慢。" });
keys1.put("myisam_repair_threads", new String[] { "索引修复线程数量", "若一个表有多个索引，MyISAM引擎可使用多个线程并行去修复，尤其适用于多个CUP和高内存的情况。" });
keys1.put("myisam_sort_buffer_size", new String[] { "表变化时重排缓存", "MyISAM引擎表发生变化时重新排序所需的缓存大小。" });
keys1.put("open_files_limit", new String[] { "文件句柄数量限制", "用户能够打开的文件句柄的最大数量，此值依赖于软件运行所在的操作系统。" });
keys1.put("port", new String[] { "数据网络传输端口", "默认为3306。" });
keys1.put("query_cache_limit", new String[] { "单次查询缓存大小", "单个查询能够使用的缓存的大小，默认为1M，超过此值的查询将不缓存。" });
keys1.put("query_cache_min_res_unit", new String[] { "查询缓存最小单位", "缓存簇块最小的字节数，默认为4KB，设置较大对大数据查询有好处，但若查询都是小数据则就容易造成内存碎片与浪费。" });
keys1.put("query_cache_size", new String[] { "查询缓存占用大小", "一个查询执行后缓存该语句及结果，当执行同样的查询语句且数据没发生变化时则直接返回查询缓存中的数据，此时要求该语句涉及的表在这段时间内没有发生变化，若该表发生变更则要把缓存数据及相关的语句全部置为失效并等待写入更新，那么若缓存数据非常大、该表的查询结构多而复杂，会导致查询语句失效慢、一个更新或插入相应地也会慢，故插入或更新量比较大时此值不必分配过大，而在高并发、更新量大时建议禁用该功能。" });
keys1.put("query_cache_type", new String[] { "哪些语句可被缓存", "决定哪些查询语句可以被缓存。" });
keys1.put("query_cache_wlock_invalidate", new String[] { "写入缓存读取处理", "当对MyISAM引擎表写操作的同时且查询在缓存数据中进行时，是返回缓存数据还是等写操作完成后再读表获取结果。" });
keys1.put("read_buffer_size", new String[] { "顺序读取缓存大小", "若对表的顺序扫描非常频繁且认为频繁扫描进行得太慢，可通过增大此值以及内存缓冲大小来提高性能，对于每个连接此值是独享的。" });
keys1.put("read_rnd_buffer_size", new String[] { "随机读取缓存大小", "随机读（查询操作）的缓冲的大小，当按任意顺序（如按照排序顺序）读取行时，将分配一个随机读缓存区，进行排序查询时会先扫描一遍该缓冲以避免搜索磁盘，从而提高查询速度，若需要排序大量数据可增大此值。" });
keys1.put("server_id", new String[] { "数库服务唯一标识", "用于标识数据库数据插入操作的编号，标识主从同步时slave在master上的线程，主主同步避免数据不会陷入死循环。" });
keys1.put("slow_launch_time", new String[] { "超过几秒为慢查询", "设置超过多少秒为慢查询。" });
keys1.put("sort_buffer_size", new String[] { "排序缓存占用大小", "每个连接（会话）第一次需要使用时一次性分配的，此值并不是越大越好，由于是会话级的参数，过大的设置加上高并发可能会耗尽系统内存资源，当超过2KB时会使用mmap()而不是malloc()来进行内存分配，从而导致效率降低。" });
keys1.put("sql_mode", new String[] { "语法执行支持模式", "会话级别配置，5.0以上可支持模式：ANSI（宽松模式=对插入数据进行校验，若不符合定义类型或长度，对数据类型调整或截断处理并抛warning）、TRADITIONAL（事务模式=当插入数据时进行数据的严格校验，错误数据插入时抛error，同时会进行事务回滚）和STRICT_TRANS_TABLES（严格模式=进行数据的严格校验，错误数据不能插入，抛error错误），当此值中包涵no_engine_subtitution且在创建表时指定的engine项不被支持，则抛错。" });
keys1.put("table_open_cache", new String[] { "缓存打开表的数量", "缓存打开过表的最大数量。" });
keys1.put("thread_cache_size", new String[] { "线程缓存最大数量", "可以利用保存在缓存中线程的最大数量，当断开连接时若缓存中还有空间则客户端的线程将被放到缓存中，当线程再次被请求时将从缓存中读取，增大此值可以改善系统性能，设置规则为1GB内存8个、2GB内存16个、3GB内存32个、4GB或更大内存可配置更大。" });
keys1.put("thread_concurrency", new String[] { "线程并发最大数量", "设置正确与否对性能影响很大，在多CPU或多核的情况下错误地设置thread_concurrency，会导致不能充分利用多CPU或多核，建议设为CPU核数的2倍。" });
keys1.put("thread_stack", new String[] { "单个线程堆栈大小", "默认值可满足一般的操作，设置范围为128KB至4GB。" });
keys1.put("tmp_table_size", new String[] { "临时结果缓存大小", "默认为32MB，受限于max_heap_table_size，若一张临时表超过此值则将临时表写入磁盘。" });
keys1.put("version", new String[] { "数库安装版本信息", "数据库的版本号。" });
keys1.put("wait_timeout", new String[] { "连接最大等待时间", "关闭一个非交互的连接前要等待的秒数，若设置过小则很快关闭连接，若设置过大则易造成too many connections错误，使用show processlist可查看连接的线程的状态。" });
Map<String, String[]> keys2 = new HashMap<String, String[]>();
keys2.put("error_count", new String[] { "失败操作错误统计", "失败操作的错误的统计数。" });
Map<String, String[]> keys3 = new HashMap<String, String[]>();
keys3.put("aborted_clients", new String[] { "连接非正常关闭数", "由于客户没有正确关闭导致连接已死掉、已放弃的数量。" });
keys3.put("aborted_connects", new String[] { "请求失败连接次数", "尝试请求已失败的连接的次数。" });
keys3.put("com_select", new String[] { "执行查询成功次数", "服务器成功完成的查询请求的统计数。" });
keys3.put("connections", new String[] { "连接数据库的次数", "试图连接数据库的次数。" });
keys3.put("created_tmp_disk_tables", new String[] { "硬盘的临时表数量", "每次创建临时表，created_tmp_tables会增加，若同时在磁盘上创建，created_tmp_disk_tables也会增加。" });
keys3.put("created_tmp_files", new String[] { "创建的临时文件数", "数据库创建的临时文件数。" });
keys3.put("created_tmp_tables", new String[] { "创建的临时表数量", "每次创建临时表，此值会增加。" });
keys3.put("delayed_errors", new String[] { "延迟插入错误行数", "用延迟线程写时发生的某些错误（如由可能重复的主键）的行数。" });
keys3.put("delayed_insert_threads", new String[] { "延迟插入线程数量", "正在使用的延迟插入处理线程的数量。" });
keys3.put("delayed_writes", new String[] { "延时线程写的行数", "用延时线程写数据的行数。" });
keys3.put("flush_commands", new String[] { "执行刷新命令次数", "执行flush命令的次数。" });
keys3.put("handler_delete", new String[] { "删除表数据的次数", "请求从一张表中删除行的次数。" });
keys3.put("handler_read_first", new String[] { "读入表首行的次数", "Handler readfirst 请求读入表中第一行的次数。" });
keys3.put("handler_read_key", new String[] { "基于索引读的次数", "请求基于索引读行的次数。" });
keys3.put("handler_read_next", new String[] { "基于索引下读次数", "请求基于索引读下一行的次数。" });
keys3.put("handler_read_rnd", new String[] { "基于索引随读次数", "请求基于索引随机读取某行次数。" });
keys3.put("handler_read_rnd_next", new String[] { "读下一行的请求数", "在数据文件中读下一行的请求数，若你正进行大量的表扫描且该值较高，通常说明表索引不正确或查询没有利用到索引。" });
keys3.put("handler_update", new String[] { "更新表数据的次数", "请求更新表中某行的次数。" });
keys3.put("handler_write", new String[] { "插入表数据的次数", "请求向表中插入一行的次数。" });
keys3.put("key_blocks_not_flushed", new String[] { "索引更新未刷新数", "索引已更新但还没清空索引缓存的数量。" });
keys3.put("key_blocks_unused", new String[] { "未使用过的索引数", "未使用的索引缓存的簇数。" });
keys3.put("key_blocks_used", new String[] { "已使用过的索引数", "表示曾经用到的最大的簇数。" });
keys3.put("key_read_requests", new String[] { "请求读取索引次数", "当前索引被读取请求的次数。" });
keys3.put("key_reads", new String[] { "硬盘读取索引数量", "在内存中没有找到直接从硬盘读取索引的数量。" });
keys3.put("key_write_requests", new String[] { "请求写入索引次数", "请求将一个索引写入缓存的次数。" });
keys3.put("key_writes", new String[] { "硬盘写入索引次数", "将一个索引写入物理磁盘的次数。" });
keys3.put("max_used_connections", new String[] { "当前被使用连接数", "当前有多少个连接正在被使用。" });
keys3.put("not_flushed_delayed_rows", new String[] { "等待延迟写入行数", "在延迟插入线程中等待被写入的行的数量。" });
keys3.put("open_files", new String[] { "当前打开文件数量", "当前打开的文件的数量。" });
keys3.put("open_tables", new String[] { "当前打开表的数量", "当前打开的表的数量。" });
keys3.put("open_streams", new String[] { "当前打开流的数量", "当前打开流的数量，这些流主要用于记录日志。" });
keys3.put("opened_tables", new String[] { "打开过的表的数量", "表示曾打开过的表的数量，若opened_tables数量过大，说明table_open_cache的值可能太小。" });
keys3.put("qcache_free_blocks", new String[] { "相邻缓存区块个数", "缓存中相邻内存的区块的个数，数目大说明可能有碎片，执行flush query cache对缓存中的碎片进行整理。" });
keys3.put("qcache_free_memory", new String[] { "缓存中的空闲内存", "缓存中的空闲内存的大小。" });
keys3.put("qcache_hits", new String[] { "查询缓存命中数量", "每次查询缓存且命中时此值就会增大。" });
keys3.put("qcache_inserts", new String[] { "添加查询语句数量", "每次添加一个查询时就增大。" });
keys3.put("qcache_lowmem_prunes", new String[] { "缓存不足清理次数", "缓存出现内存不足以便为更多查询提供缓存空间时必须要进行清理的次数，此值最好长时间关注，若此值在不断增长则可能碎片非常严重或内存过少。" });
keys3.put("qcache_not_cached", new String[] { "不适合缓存的数量", "不适合进行缓存查询的语句的数量，通常为不是select或用了now()等函数的语句。" });
keys3.put("qcache_queries_in_cache", new String[] { "当前缓存的查询数", "当前缓存查询（和响应）的数量。" });
keys3.put("qcache_total_blocks", new String[] { "缓存中簇块的数量", "缓存中簇块的数量。" });
keys3.put("questions", new String[] { "请求执行查询数量", "请求服务器执行查询的数量。" });
keys3.put("slow_launch_threads", new String[] { "当前慢查询线程数", "当前运行的慢查询线程的个数。" });
keys3.put("slow_queries", new String[] { "当前慢查询语句数", "当前有多少个大于long_query_time的值的慢查询语句。" });
keys3.put("sort_merge_passes", new String[] { "分块排序次数统计", "首先会尝试在内存（内存大小由sort_buffer_size决定）中做排序，若不能把所有的记录都读到内存中时，数据库会把每次在内存中排序的结果存到临时文件中，等数据库找到所有记录后再把临时文件中的记录做再次排序，这次排序就会增加此值，实际上数据库会用另一个临时文件来保存再次排序的结果，使用临时文件排序速度可能会很慢，增加sort_buffer_size会减少sort_merge_passes和创建临时文件的次数，但盲目的增加sort_buffer_size并不一定能提高排序速度，另外增加read_rnd_buffer_size的值对排序也有一些的好处。" });
keys3.put("table_locks_immediate", new String[] { "立即释放锁的数量", "立即要释放的锁的数量。" });
keys3.put("table_locks_waited", new String[] { "需等待的加锁数量", "需要等待的加锁的数量。" });
keys3.put("threads_cached", new String[] { "缓存会话的线程数", "当前被缓存的会话线程的数量，若设置了thread_cache_size，当断开连接后将会话的线程缓存起来，前提是未达到缓存数的上限。" });
keys3.put("threads_connected", new String[] { "曾连接过的线程数", "曾被连接过的线程的数量。" });
keys3.put("threads_created", new String[] { "曾创建过的线程数", "曾创建过的线程的数量。" });
keys3.put("threads_running", new String[] { "正在运行的线程数", "当前正在并发运行的线程的数量。" });
keys3.put("uptime", new String[] { "数库已经运行秒数", "数据库已经运行了多少秒。" });
Map<String, String[]> keys4 = new HashMap<String, String[]>();
%>
<%!
public String row(int i, String key, String value, String[] keys) {
	if (value == null || value.equals("")) {
		value = "-";
	}
	StringBuffer res = new StringBuffer();
	res.append("<tr>");
	res.append("<td>" + i + "</td>");
	res.append("<td>" + key + "</td>");
	res.append("<td>" + value.substring(0, Math.min(20, value.length())) + "</td>");
	if (keys != null) {
		res.append("<td>" + keys[0] + "</td>");
		res.append("<td><textarea>" + keys[1] + "</textarea></td>");
	} else {
		res.append("<td>-</td>");
		res.append("<td>-</td>");
	}
	res.append("</tr>");
	return res.toString();
}
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, meta[1])%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
<style type="text/css">
.am-table-centered th{font-weight:normal;}
.am-table-centered td:last-child{width:45%;}
.am-table-centered td[colspan]{text-align:left;}
.am-table-centered td[colspan] b{font-weight:normal;color:#F00;}
.am-table-centered td[colspan] i{padding-left:10px;font-style:normal;color:#999;}
textarea{width:100%;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<div id="j_right">
		<%=crumb(request)%>
		<div class="am-g">
			<select data-am-selected="{btnStyle:'secondary',btnWidth:'20%',searchBox:1}" onchange="javascript:location.href='auto/driver/state.htm?id=<%=meta[0]%>&total='+this.value;">
				<option value="0">只显示解释了</option>
				<option value="1"<%=total ? " selected=\"selected\"" : ""%>>显示全部参数</option>
			</select>
			<select data-am-selected="{btnStyle:'secondary',btnWidth:'20%',searchBox:1}" onchange="quency(this)">
				<option value="-1">请选择刷新时间</option>
				<option value="6">每隔6秒刷新一次</option>
				<option value="60">每隔60秒刷新一次</option>
				<option value="3600">每隔1小时刷新一次</option>
				<option value="21600" selected="selected">每隔6小时刷新一次</option>
			</select>
			<select data-am-selected="{btnStyle:'secondary',btnWidth:'59.4%',searchBox:1}" id="formula" onchange="javascript:if(this.value!='-1'){state([this.value]);}">
				<option value="-1">请选择计算的公式</option>
				<option value="_hhljsyl=3:max_used_connections/1:max_connections*100%">会话连接使用率=<%=keys3.get("max_used_connections")[0]%>：max_used_connections ÷ <%=keys1.get("max_connections")[0]%>：max_connections × 100%</option>
				<option value="_wjjbdkl=3:open_files/1:open_files_limit*100%">文件句柄打开率=<%=keys3.get("open_files")[0]%>：open_files/<%=keys1.get("open_files_limit")[0]%>：open_files_limit × 100%</option>
				<option value="_ypjlsbl=3:created_tmp_disk_tables/3:created_tmp_tables*100%">硬盘建临时表率=<%=keys3.get("created_tmp_disk_tables")[0]%>：created_tmp_disk_tables ÷ <%=keys3.get("created_tmp_tables")[0]%>：created_tmp_tables × 100%</option>
				<option value="_bdkkzyl=3:open_tables/1:table_open_cache*100%">表打开块占用率=<%=keys3.get("open_tables")[0]%>：open_tables ÷ <%=keys1.get("table_open_cache")[0]%>：table_open_cache*100% × 100%</option>
				<option value="_bdkzsyl=3:open_tables/3:opened_tables*100%">表打开再使用率=<%=keys3.get("open_tables")[0]%>：open_tables ÷ <%=keys3.get("opened_tables")[0]%>：opened_tables × 100%</option>
				<option value="_cxhccpl=3:qcache_free_blocks/3:qcache_total_blocks*100%">查询缓存碎片率=<%=keys3.get("qcache_free_blocks")[0]%>：qcache_free_blocks ÷ <%=keys3.get("qcache_total_blocks")[0]%>：qcache_total_blocks × 100%</option>
				<option value="_cxhclyl=1-3:qcache_free_memory/1:query_cache_size*100%">查询缓存利用率=1–<%=keys3.get("qcache_free_memory")[0]%>：qcache_free_memory ÷ <%=keys1.get("query_cache_size")[0]%>：query_cache_size × 100%</option>
				<option value="_cxhcmzl=1-3:qcache_inserts/3:qcache_hits*100%">查询缓存命中率=1–<%=keys3.get("qcache_inserts")[0]%>：qcache_inserts ÷ <%=keys3.get("qcache_hits")[0]%>：qcache_hits</option>
				<option value="_bcgsmbl=3:handler_read_rnd_next/3:com_select">表成功扫描倍率=<%=keys3.get("handler_read_rnd_next")[0]%>：handler_read_rnd_next ÷ <%=keys3.get("com_select")[0]%>：com_select</option>
				<option value="_syyxsyl=3:key_blocks_used/(3:key_blocks_unused+3:key_blocks_used)*100%">索引有效使用率=<%=keys3.get("key_blocks_used")[0]%>：key_blocks_used ÷ (<%=keys3.get("key_blocks_unused")[0]%>：key_blocks_unused + <%=keys3.get("key_blocks_used")[0]%>：key_blocks_used) × 100%</option>
				<option value="_wmzsygl=3:key_reads/3:key_read_requests*100%">未命中索引概率=<%=keys3.get("key_reads")[0]%>：key_reads ÷ <%=keys3.get("key_read_requests")[0]%>：key_read_requests × 100%</option>
				<option value="_jsdjsbl=3:table_locks_immediate/3:table_locks_waited">解锁待加锁倍率=<%=keys3.get("table_locks_immediate")[0]%>：table_locks_immediate ÷ <%=keys3.get("table_locks_waited")[0]%>：table_locks_waited</option>
			</select>
		</div>
		<div class="am-g am-padding-top-xs">
			<table class="am-margin-bottom-0 am-table am-table-bordered am-table-radius am-table-striped am-table-hover am-table-centered am-table-compact">
				<tr><td colspan="5">数据库版本：<b style="padding-right:10px;"><%=meta[2]%></b>驱动版本号：<b><%=meta[3]%></b></td></tr>
				<tr><td colspan="5">会话连接使用率：<b id="_hhljsyl"></b><i></i><i>理想值约为85%。</i></td></tr>
				<tr><td colspan="5">文件句柄打开率：<b id="_wjjbdkl"></b><i></i><i>理想值不超过75%。</i></td></tr>
				<tr><td colspan="5">硬盘建临时表率：<b id="_ypjlsbl"></b><i></i><i>理想值不超过25%。</i></td></tr>
				<tr><td colspan="5">表打开块占用率：<b id="_bdkkzyl"></b><i></i><i>理想值为不大于95%。</i></td></tr>
				<tr><td colspan="5">表打开再使用率：<b id="_bdkzsyl"></b><i></i><i>理想值为不小于85%。</i></td></tr>
				<tr><td colspan="5">查询缓存碎片率：<b id="_cxhccpl"></b><i></i><i>若超过20%，可使用flush query cache清理缓存碎片。</i></td></tr>
				<tr><td colspan="5">查询缓存利用率：<b id="_cxhclyl"></b><i></i><i>若此值在25%以下则说明query_cache_size设过大，若此值在80%以上且qcache_lowmem_prunes&gt;50则说明query_cache_size有点小或碎片过太。</i></td></tr>
				<tr><td colspan="5">查询缓存命中率：<b id="_cxhcmzl"></b><i></i><i></i></td></tr>
				<tr><td colspan="5">表成功扫描倍率：<b id="_bcgsmbl"></b><i></i><i>若此值超过4000则说明进行了过多表扫描，很有可能索引没有建好，增加read_buffer_size值会有一些好处。</i></td></tr>
				<tr><td colspan="5">索引有效使用率：<b id="_syyxsyl"></b><i></i><i>理想值约为80%。</i></td></tr>
				<tr><td colspan="5">未命中索引概率：<b id="_wmzsygl"></b><i></i><i></i></td></tr>
				<tr><td colspan="5">解锁待加锁倍率：<b id="_jsdjsbl"></b><i></i><i>若此值大于5000，最好采用InnoDB引擎，因为InnoDB是行锁而MyISAM是表锁，对于高并发写入的系统InnoDB效果会好些。</i></td></tr>
				<tbody style="color:#0E90D2;">
					<tr><th colspan="5">全局变量</th></tr>
					<%
						if (datas1.size() > 0) {
							int i = 1;
							for (Map.Entry<String, String> data : datas1.entrySet()) {
								String key = data.getKey();
								String[] keys = keys1.get(key);
								if (total || keys != null) {
									if (keys != null) {
										keys1.remove(key);
									}
									out.print(this.row(i++, key, data.getValue(), keys));
								}
							}
							if (keys1.size() > 0) {
								out.print("<tr><td colspan=\"5\">无效解释：" + keys1.keySet().toString().replace("[", "").replace("]", "") + "</td></tr>");
							}
						}
					%>
				</tbody>
				<tbody style="color:#5EB95E;">
					<tr><th colspan="5">当前变量</th></tr>
					<%
						if (datas2.size() > 0) {
							int i = 1;
							for (Map.Entry<String, String> data : datas2.entrySet()) {
								String key = data.getKey();
								if (datas1.containsKey(key)) {
									continue;
								}
								String[] keys = keys2.get(key);
								if (total || keys != null) {
									if (keys != null) {
										keys2.remove(key);
									}
									out.print(this.row(i++, key, data.getValue(), keys));
								}
							}
							if (keys2.size() > 0) {
								out.print("<tr><td colspan=\"5\">无效解释：" + keys2.keySet().toString().replace("[", "").replace("]", "") + "</td></tr>");
							}
						}
					%>
				</tbody>
				<tbody style="color:#F37B1D;">
					<tr><th colspan="5">全局状态</th></tr>
					<%
						if (datas3.size() > 0) {
							int i = 1;
							for (Map.Entry<String, String> data : datas3.entrySet()) {
								String key = data.getKey();
								String[] keys = keys3.get(key);
								if (total || keys != null) {
									if (keys != null) {
										keys3.remove(key);
									}
									out.print(this.row(i++, key, data.getValue(), keys));
								}
							}
							if (keys3.size() > 0) {
								out.print("<tr><td colspan=\"5\">无效解释：" + keys3.keySet().toString().replace("[", "").replace("]", "") + "</td></tr>");
							}
						}
					%>
				</tbody>
				<tbody style="color:#3BB4F2;">
					<tr><th colspan="5">当前状态</th></tr>
					<%
						if (datas4.size() > 0){
							int i = 1;
							for (Map.Entry<String, String> data : datas4.entrySet()) {
								String key = data.getKey();
								if (datas3.containsKey(key)) {
									continue;
								}
								String[] keys = keys4.get(key);
								if (total || keys != null) {
									if (keys != null) {
										keys4.remove(key);
									}
									out.print(this.row(i++, key, data.getValue(), keys));
								}
							}
							if (keys4.size() > 0) {
								out.print("<tr><td colspan=\"5\">无效解释：" + keys4.keySet().toString().replace("[", "").replace("]", "") + "</td></tr>");
							}
						}
					%>
				</tbody>
			</table>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript">
var FORMULA=[];
var HELPER=null;
function state(params){
	$.ajax({
		type:"post",
		url:"${ROOT}auto/driver/state.htm",
		data:{id:<%=meta[0]%>,params:params},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			var data=res.data;
			for(var i=0;i<params.length;i++){
				var param=params[i];
				var index=param.indexOf("=");
				var id=param.substring(0,index);
				var rate=param.indexOf("*100%")!=-1;
				param=param.substring(index+1).replace("*100%","");
				$("#"+id).next("i").html("=&nbsp;&nbsp;"+param.replace(/1:/g,"").replace(/2:/g,"").replace(/3:/g,"").replace(/4:/g,""));
				for(var j=0;j<data.length;j++){
					param=param.replace(eval("/"+data[j][0]+"/g"),data[j][1]);
				}
				var count=eval("("+param+")")*(rate?100:1);
				$("#"+id).html(isNaN(count)?"-":count+(rate?"%":""));
			}
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function quency(o){
	if(HELPER!=null){
		window.clearInterval(HELPER);
	}
	var time=o?parseInt(o.value):21600;
	if(!time){
		return;
	}
	HELPER=window.setInterval(function(){
		state(FORMULA);
	},time*1000);
}
$(document).ready(function(){
	$.each($("#formula").find("option"),function(){
		var v=$(this).val();
		if(v!="-1"){
			FORMULA[FORMULA.length]=v;
		}
	});
	window.setTimeout(function(){
		state(FORMULA);
		quency();
	},1000);
	$.each($(".am-table textarea"),function(){
		$(this).attr({rows:1,readonly:"readonly",title:"双击打开或关闭文本框"}).dblclick(function(){
			var o=$(this);
			o.attr("rows",o.attr("rows")=="1"?"4":"1");
		});
	});
});
</script>
</body>
</html>