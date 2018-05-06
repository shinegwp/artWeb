package com.art.util;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 濞ｆɑ绐愰崯鍡楃厔閼奉亜鐣炬稊澶婃惙鎼存梻绮ㄩ弸锟�
 */
public class TaotaoResult implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;




	// 鐎规矮绠焜ackson鐎电钖�
    private static final ObjectMapper MAPPER = new ObjectMapper();
   
  


	// 閸濆秴绨叉稉姘閻樿埖锟斤拷
    private Integer status;

    // 閸濆秴绨插☉鍫熶紖
    private String msg;

    // 閸濆秴绨叉稉顓犳畱閺佺増宓�
    private Object data;
    
 
   

	
    @Override
	public String toString() {
		return "TaotaoResult [status=" + status + ", msg=" + msg + ", data=" + data + "]";
	}

	public static TaotaoResult build(Integer status, String msg, Object data) {
        return new TaotaoResult(status, msg, data);
    }

    public static TaotaoResult ok(Object data) {
        return new TaotaoResult(data);
    }

    public static TaotaoResult ok() {
        return new TaotaoResult(null);
    }

    public TaotaoResult() {

    }

    public static TaotaoResult build(Integer status, String msg) {
        return new TaotaoResult(status, msg, null);
    }

    public TaotaoResult(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public TaotaoResult(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }

//    public Boolean isOK() {
//        return this.status == 200;
//    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    /**
     * 鐏忓攬son缂佹挻鐏夐梿鍡氭祮閸栨牔璐烼aotaoResult鐎电钖�
     * 
     * @param jsonData json閺佺増宓�
     * @param clazz TaotaoResult娑擃厾娈憃bject缁鐎�
     * @return
     */
    public static TaotaoResult formatToPojo(String jsonData, Class<?> clazz) {
        try {
            if (clazz == null) {
                return MAPPER.readValue(jsonData, TaotaoResult.class);
            }
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("data");
            Object obj = null;
            if (clazz != null) {
                if (data.isObject()) {
                    obj = MAPPER.readValue(data.traverse(), clazz);
                } else if (data.isTextual()) {
                    obj = MAPPER.readValue(data.asText(), clazz);
                }
            }
            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 濞屸剝婀乷bject鐎电钖勯惃鍕祮閸栵拷
     * 
     * @param json
     * @return
     */
    public static TaotaoResult format(String json) {
        try {
            return MAPPER.readValue(json, TaotaoResult.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Object閺勵垶娉﹂崥鍫ｆ祮閸栵拷
     * 
     * @param jsonData json閺佺増宓�
     * @param clazz 闂嗗棗鎮庢稉顓犳畱缁鐎�
     * @return
     */
    public static TaotaoResult formatToList(String jsonData, Class<?> clazz) {
        try {
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("data");
            Object obj = null;
            if (data.isArray() && data.size() > 0) {
                obj = MAPPER.readValue(data.traverse(),
                        MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
            }
            return build(jsonNode.get("status").intValue(), jsonNode.get("msg").asText(), obj);
        } catch (Exception e) {
            return null;
        }
    }

}
