package com.firstproj.resolver;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.xml.XMLSerializer;

import com.google.gson.Gson;

public class MappingXmlView extends MappingJacksonJsonView{
    public static final String DEFAULT_CONTENT_TYPE = "application/xml";

    @Override
    public String getContentType() {
        return DEFAULT_CONTENT_TYPE;
    }

    @Override
    public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        Gson gson = new Gson();
        String source = gson.toJson(model);
        
        XMLSerializer serializer = new XMLSerializer(); 
        JSON json = JSONSerializer.toJSON( source );
        serializer.setRootName("response");
        
        String objectRes = serializer.write( json );    
        response.getOutputStream().write( objectRes.getBytes() );
        response.setContentType(DEFAULT_CONTENT_TYPE);
    }
}
