package egovframework.com.utl.view;

import java.io.StringWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.springframework.web.servlet.view.AbstractView;
import org.w3c.dom.CDATASection;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.onestop.core.util.IUtility;

public class ResponseXmlView extends AbstractView{
	
		
	@Override
	protected void renderMergedOutputModel(Map map,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		StringBuffer xmlSb = new StringBuffer();
		String xmlHeader = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n";
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document document = builder.newDocument();
		
		Element eRoot = document.createElement("root");
		document.appendChild(eRoot);
		
		renderMap(document, eRoot, map);
		
		xmlSb.append(xmlHeader);
		xmlSb.append(getDomToString(document));
		
		response.setContentType("application/xml");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setContentLength(xmlSb.toString().getBytes("UTF-8").length);
		response.getWriter().print(xmlSb.toString());
	}
 
	public String getDomToString(Document doc) throws Exception{
		String xmlStr = "";
		
		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer transformer = factory.newTransformer();
		transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		
		StringWriter sw = new StringWriter();
		StreamResult result = new StreamResult(sw);
		DOMSource source = new DOMSource(doc);
		transformer.transform(source, result);
		
		xmlStr = sw.toString();
		
		return xmlStr;
	}
	
	public boolean renderMap(Document doc, Element element, Map paramMap){
		Iterator<String> iterator = paramMap.keySet().iterator();
		while(iterator.hasNext()){
			String key = iterator.next();
			Object obj = paramMap.get(key);
			
			Element keyEle = doc.createElement(key);
			
			if(obj == null){
				CDATASection cdataSection = doc.createCDATASection(IUtility.parseNull(obj));
				keyEle.appendChild(cdataSection);
				continue;
			}
			String clsName = obj.getClass().getName();
			if(clsName.indexOf("List") < 0 && clsName.indexOf("Map") < 0){
				CDATASection cdataSection = doc.createCDATASection(IUtility.parseNull(obj));
				keyEle.appendChild(cdataSection);
			}
			
			if(clsName.indexOf("Map") >= 0){
				renderMap(doc, keyEle, (Map)obj);
			}
			
			if(clsName.indexOf("List") >= 0){
				renderList(doc, keyEle, (List)obj);
			}
			
			element.appendChild(keyEle);
		}
		return true;
	}
	
	public boolean renderList(Document doc, Element element, List list){
		for(int i = 0; i < list.size(); i++){
			Object obj = list.get(i);
			
			Element keyEle = doc.createElement("row");
			
			if(obj == null){
				CDATASection cdataSection = doc.createCDATASection("");
				keyEle.appendChild(cdataSection);
				continue;
			}
			String clsName = obj.getClass().getName();

			if(clsName.indexOf("List") < 0 && clsName.indexOf("Map") < 0){
				CDATASection cdataSection = doc.createCDATASection(IUtility.parseNull(list.get(i)));
				keyEle.appendChild(cdataSection);
			}
			
			if(clsName.indexOf("Map") >= 0){
				renderMap(doc, keyEle, (Map)list.get(i));
			}
			
			if(clsName.indexOf("List") >= 0){
				renderList(doc, keyEle, (List)list.get(i));
			}
			
			element.appendChild(keyEle);
		}
		return true;
	}
}