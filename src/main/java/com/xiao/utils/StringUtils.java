package com.xiao.utils;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.jdbc.core.JdbcTemplate;



public class StringUtils {
	private static SimpleDateFormat format_yyMMddHHmmssSSS = new SimpleDateFormat("yyMMddHHmmssSSS");
	private static SimpleDateFormat format_yyyyMMdd = new SimpleDateFormat("yyyyMMdd");
	private static SimpleDateFormat format_yyyyMMddHHmmss = new SimpleDateFormat("yyyyMMddHHmmss");
	/**
	 * 如果str为null，返回“”,否则返回str
	 * 
	 * @param str
	 * @return
	 */
	public static String isNull(String str) {
		if (str == null) {
			return "";
		}
		return str;
	}

	public static String isNull(Object o) {
		if (o == null) {
			return "";
		}
		String str="";
		if(o instanceof String){
			str=(String)o;
		}else{
			str=o.toString();
		}
		return str;
	}
	
	/**
	 * 检查email是否是邮箱格式，返回true表示是，反之为否
	 * 
	 * @param email
	 * @return
	 */
	public static boolean isEmail(String email) {
		email = isNull(email);
		Pattern regex = Pattern
				.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
		Matcher matcher = regex.matcher(email);
		boolean isMatched = matcher.matches();
		return isMatched;
	}
	/**
	 * 检验手机号码格式
	 * @param mobiles
	 * @return
	 */
	 public static boolean isMobile(String mobiles){     
        Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0-9])|())\\d{8}$");     
        Matcher m = p.matcher(mobiles);      
        return m.matches();     
    } 
	
	/**
	 * 检查身份证的格式，返回true表示是，反之为否
	 * 
	 * @param email
	 * @return
	 */
	public static boolean isCard(String cardId) {
		cardId = isNull(cardId);
		//身份证正则表达式(15位) 
		Pattern isIDCard1=Pattern.compile("^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$"); 
		//身份证正则表达式(18位) 
		Pattern isIDCard2=Pattern.compile("^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$"); 
		Matcher matcher1= isIDCard1.matcher(cardId);
		Matcher matcher2= isIDCard2.matcher(cardId);
		boolean isMatched = matcher1.matches()||matcher2.matches();
		return isMatched;
	}

	/**
	 * 判断字符串是否为整数
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isInteger(String str) {
		if (isEmpty(str)) {
			return false;
		}
		Pattern regex = Pattern.compile("\\d*");
		Matcher matcher = regex.matcher(str);
		boolean isMatched = matcher.matches();
		return isMatched;
	}

	/**
	 * 判断字符串是否为数字
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNumber(String str) {
		if (isEmpty(str)) {
			return false;
		}

		Pattern regex = Pattern.compile("\\d*(.\\d*)?");
		Matcher matcher = regex.matcher(str);
		boolean isMatched = matcher.matches();
		return isMatched;
	}

	/**
	 * 判断字符串是否为非负数字
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNoMinus(String str) {
		if (isEmpty(str)) {
			return false;
		}
		
		Pattern regex = Pattern.compile("([1-9]\\d*\\.?\\d*)|(0\\.\\d*[0-9])");
		Matcher matcher = regex.matcher(str);
		boolean isMatched = matcher.matches();
		return isMatched;
	}
	
	/**
	 * 判断字符串是否为空
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
		if (str == null || "".equals(str)) {
			return true;
		}
		return false;
	}

	/**
	 * 首字母大写
	 * 
	 * @param s
	 * @return
	 */
	public static String firstCharUpperCase(String s) {
		StringBuffer sb = new StringBuffer(s.substring(0, 1).toUpperCase());
		sb.append(s.substring(1, s.length()));
		return sb.toString();
	}
	
	public static String hideChar(String str,int len){
		if(str==null) return null;
		char[] chars=str.toCharArray();
		for(int i=1;i>chars.length-1;i++){
			if(i<len){
				chars[i]='*';
			}
		}
		str=new String(chars);
		return str;
	}
	
	public static String hideLastChar(String str,int len){
		if(str==null) return null;
		char[] chars=str.toCharArray();
		if(str.length()<=len){
			for(int i=0;i<chars.length;i++){
				chars[i]='*';
			}
		}else{
			for(int i=chars.length-1;i>chars.length-len-1;i--){
				chars[i]='*';
			}
		}
		str=new String(chars);
		return str;
	}
	
	/**
	 * 
	 * @return
	 */
	public static String format(String str,int len){
		if(str==null) return "-";
		if(str.length()<=len){
			int pushlen=len-str.length();
			StringBuffer sb=new StringBuffer();
			for(int i=0;i<pushlen;i++){
				sb.append("0");
			}
			sb.append(str);
			str=sb.toString();
		}else{
			String newStr=str.substring(0, len);
			str=newStr;
		}
		return str;
	}
	
	public static String contact(Object[] args){
		StringBuffer sb=new StringBuffer();
		for(int i=0;i<args.length;i++){
			sb.append(args[i]);
			if(i<args.length-1){
				sb.append(",");
			}
		}
		return sb.toString();
	}
	
	/**
	 * 是否包含在以“，”隔开字符串内
	 * @param s
	 * @param type
	 * @return
	 */
	public static boolean isInSplit(String s,String type){
		if(isNull(s).equals("")){
			return false;
		}
		List<String> list=Arrays.asList(s.split(","));
		if(list.contains(type)){
			return true;
		}
		return false;
	}
	
	public static boolean isBlank(String str){
		return StringUtils.isNull(str).trim().equals("");
	}
	
//	public static String generateTradeNO(long userid,String type){
//		String s;
//		s = type + userid + getFullTimeStr();
//		return s;
//	}
	
//	public static String generatePnrTradeNO(long userid,String type){
//		String s;
//		SimpleDateFormat format = new SimpleDateFormat("MMddHHmmss");
//		String str = format.format(Calendar.getInstance().getTime());
//		long r=NumberUtils.getRandom(4);
//		StringUtils.format(r+"", 4);
//		s = type + userid + str+StringUtils.format(r+"", 4);
//		return s;
//	}
//	
//	public static String getFullTimeStr(){
//		String s=DateUtils.dateStr3(Calendar.getInstance().getTime());
//		return s;
//	}

	public static String array2Str(Object[] arr){
		StringBuffer s=new StringBuffer();
		for(int i=0;i<arr.length;i++){
			s.append(arr[i]);
			if(i<arr.length-1){
				s.append(",");
			}
		}
		return s.toString();
	}
	
	public static String array2Str(int[] arr){
		StringBuffer s=new StringBuffer();
		for(int i=0;i<arr.length;i++){
			s.append(arr[i]);
			if(i<arr.length-1){
				s.append(",");
			}
		}
		return s.toString();
	}
	
    public static String gbk2Utf(String gbk) throws UnsupportedEncodingException {  
        char[] c = gbk.toCharArray();  
        byte[] fullByte = new byte[3*c.length];  
        for (int i=0; i<c.length; i++) {  
            String binary = Integer.toBinaryString(c[i]);  
            StringBuffer sb = new StringBuffer();  
            int len = 16 - binary.length();  
            //前面补零  
            for(int j=0; j<len; j++){  
                    sb.append("0");  
                }  
            sb.append(binary);  
            //增加位，达到到24位3个字节  
            sb.insert(0, "1110");  
                sb.insert(8, "10");  
                sb.insert(16, "10");  
                fullByte[i*3] = Integer.valueOf(sb.substring(0, 8), 2).byteValue();//二进制字符串创建整型  
                fullByte[i*3+1] = Integer.valueOf(sb.substring(8, 16), 2).byteValue();  
                fullByte[i*3+2] = Integer.valueOf(sb.substring(16, 24), 2).byteValue();  
        }  
        //模拟UTF-8编码的网站显示  
        return new String(fullByte,"UTF-8");
    }  
	
    public static String getGbk(String str) throws UnsupportedEncodingException{
    	return new String(str.getBytes("UTF-8"),"GB2312");
    }
    
    public static boolean isTenderPwd(String mobiles){     
        Pattern p = Pattern.compile("^(?![^a-zA-Z]+$)(?!\\D+$)[0-9a-zA-Z]{6,16}$");     
        Matcher m = p.matcher(mobiles);      
        return m.matches();     
    } 
    /**
	 * 将double舍位后转换成字符串返回
	 * @param value
	 * @param n
	 * @return
	 */
	public static String DoubleStrRound(double value,int n){		
		BigDecimal bd = new BigDecimal(value); 
		if(n>0)
			return  bd.setScale(n,BigDecimal.ROUND_HALF_UP).toString(); 
		else
			return bd.setScale(0,BigDecimal.ROUND_HALF_UP).toString(); 
	}
	
    /**
	 * 生成分润订单号
	 */
	public static synchronized String createOrderNo() {
		String orderNo = format_yyMMddHHmmssSSS.format(new Date());
		try {
			Thread.sleep(1);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return orderNo;
	}
	/**
	 * 生成合同编号JN+产品类型+日期+5位流水
	 */
//	public static synchronized String getHTNo(String type) {
//		String cpType = "99";
//		if("C".equals(type))cpType="01";
//		if("Z".equals(type))cpType="02";
//		if("F".equals(type))cpType="03";
//		String htNo =  "JN"+cpType+format_yyyyMMdd.format(new Date());
//		int no = getNo("HTBH_"+cpType,"合同编号["+cpType+"]");
//		htNo += ((100000+no)+"").substring(1);
//		return htNo;
//	}
	/**
	 * 生成合同唯一号（只取时间到秒的位置，后面需要自己加编号）
	 */
	public static synchronized String getHTWYH() {
		String orderNo = format_yyyyMMddHHmmss.format(new Date());
		Random random = new Random();
		for(int i = 0; i < 3; i++){
			orderNo = orderNo + random.nextInt(10);
		}
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return orderNo;
	}
	/**
	 * 生成合同文件名称
	 */
//	public static synchronized String getFTPFileName() {
//		String htNo =  "HTF"+format_yyyyMMddHHmmss.format(new Date());
//		int no = getNo("HT_NAME","合同文件名");
//		htNo += ((100000+no)+"").substring(1);
//		return htNo;
//	}
	/**
	 * 取序号
	 * @param code 序号编码
	 * @param name 序号名称
	 * @return
	 */
//	private static synchronized int getNo(String code,String name){
//		String date = format_yyyyMMdd.format(new Date());
//		List<Map<String,Object>> list = SpringInfo.getJDBC().queryForList("select code,name,value,date from dw_id_generator where code=?", code);
//		if(list==null||list.size()==0){
//			SpringInfo.getJDBC().execute("insert into dw_id_generator (code,name,value,date) values('"+code+"','"+name+"',1,'"+date+"')");
//			return 1;
//		}else{
//			if(!date.equals(list.get(0).get("date"))){
//				SpringInfo.getJDBC().execute("update dw_id_generator set value=1,date='"+date+"' where code='"+code+"'");
//				return 1;
//			}else{
//				SpringInfo.getJDBC().execute("update dw_id_generator set value=value+1 where code='"+code+"'");
//				return (Integer)list.get(0).get("value")+1;
//			}
//		}
//	}
	/**
	 * 将日期对象按传入的格式转换成字符串
	 * 
	 * @param date
	 *            日期对象
	 * @param format
	 *            格式
	 * @return 日期字符串
	 */
	public static String dateToStr(Date date, String format) {
		return new SimpleDateFormat(format).format(date);
	}

	/**
	 * 生成借款编号
	 * @param type 借款类型
	 * @return
	 */
//	public static synchronized String getLoanCode(String type) {
//		String cpType = "99";
//		if("CJ".equals(type))cpType="01";//车借通
//		if("FJ".equals(type))cpType="02";//房借通
//		if("DC".equals(type))cpType="03";//地产通
//		String htNo =  "JN"+cpType+format_yyyyMMdd.format(new Date());
//		int no = getNo("BW_CODE_"+cpType,"借款编号["+cpType+"]");
//		htNo += ((100000+no)+"").substring(1);
//		return htNo;
//	}
	/**
	 * 将字符串后面替换成指定字符
	 * @param str
	 * @return
	 */
	public static String stringReplice(String str,int n,char b){
		if(str==null)return "";
		if(n<=0)return str;
		if(n>=str.length())return str;
		if(str.length()<=n)return str;
		char[] chars=str.toCharArray();
		for(int i=n;i<chars.length;i++){
			chars[i]=b;
		}
		return new String(chars);
	}
	public static void main(String[] args) {
//		System.out.println(stringReplice("asdsd",2,'*'));
//		Date nowDate = new Date();
//		Date sendQueryDate = Utils.addDay(nowDate,0);
//		System.out.println(nowDate);
//		System.out.println(sendQueryDate);
		System.out.println(StringUtils.isMobile("13311016571"));
////		System.out.println(getHTWYH());
	//	System.out.println(StringUtils.stringReplaceSection("411081198806221278",6,14,'*'));
	}
	 /**
     * 将数据替换模板中的匹配内容（无屏蔽规则）
     * @param templateStr
     * @param paramsMap
     * @return
     */
    public static String replace(String templateStr,Map paramsMap) {
		Matcher m = Pattern.compile("[$]([^{]*?)[$]").matcher(templateStr);
		StringBuffer buf = new StringBuffer();
		while (m.find()) {
			try {
				String paramValue = paramsMap.get(m.group(1)) == null ? ""
						: paramsMap.get(m.group(1)).toString();
				m.appendReplacement(buf, paramValue);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		m.appendTail(buf);
		templateStr = buf.toString();

		return templateStr;
	}
    /**
	 * 将字符串中指定的一段字符串替换成指定字符
	 * @param str
	 * @return
	 */
	public static String stringReplaceSection(String str,int a,int b,char c){
		if(str==null)return "";
		if(a<=0)return str;
		if(a>=str.length())return str;
		if(str.length()<=a)return str;
		char[] chars=str.toCharArray();
		for(int i=a;i<b;i++){
			chars[i]=c;
		}
		return new String(chars);
	}
}
