package com.art.util;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


public class ArtResult implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;




	//
    private static final ObjectMapper MAPPER = new ObjectMapper();
   
  


	
    private Integer status;

    
    private String msg;

    
    private Object data;
    
 
   

	
    @Override
	public String toString() {
		return "TaotaoResult [status=" + status + ", msg=" + msg + ", data=" + data + "]";
	}

	public static ArtResult build(Integer status, String msg, Object data) {
        return new ArtResult(status, msg, data);
    }

    public static ArtResult ok(Object data) {
        return new ArtResult(data);
    }

    public static ArtResult ok() {
        return new ArtResult(null);
    }

    public ArtResult() {

    }

    public static ArtResult build(Integer status, String msg) {
        return new ArtResult(status, msg, null);
    }

    public ArtResult(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public ArtResult(Object data) {
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

    
    public static ArtResult formatToPojo(String jsonData, Class<?> clazz) {
        try {
            if (clazz == null) {
                return MAPPER.readValue(jsonData, ArtResult.class);
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

   
    public static ArtResult format(String json) {
        try {
            return MAPPER.readValue(json, ArtResult.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    
    public static ArtResult formatToList(String jsonData, Class<?> clazz) {
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
