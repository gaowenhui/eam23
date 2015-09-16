package com.tansun.eam2.common.workflow.trace;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Point;
import java.awt.Rectangle;
import java.io.ByteArrayOutputStream;
import java.io.StringReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JLabel;

import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.batik.transcoder.image.PNGTranscoder;
import org.jbpm.api.model.Activity;
import org.jbpm.api.model.Transition;
import org.jbpm.pvm.internal.model.ActivityCoordinatesImpl;
import org.jbpm.pvm.internal.model.ProcessDefinitionImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.util.Base64;
import com.tansun.rdp4j.common.web.utils.ResponseUtil;
import com.tansun.rdp4j.workflow.common.model.PTAbandon;
import com.tansun.rdp4j.workflow.common.model.PTDid;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;

/**
 * 
 * @author Baitin.Fong
 *
 */
@Service
public class WorkflowSvg {
	
	@Autowired
	private WorkflowUtil workflowUtil;
	private String insid;
	private Color todoColor = Color.decode("0xe8da67");
	private Color unreadColor = Color.decode("0xd3d3d3");
	private Color meetingColor = Color.decode("0x0099FF");
	private Color meetingFinishColor = Color.decode("0x6666CC");
	private Color endColor = Color.decode("0x006600");
	private Color abandonColor = Color.decode("0xff0000");
	private Color didColor = Color.decode("0x66cc33");
	private String lineColor = "#0f85af";
	private Map<String, Color> statusColor = new HashMap<String, Color>();
    private Point imageSize = null;
	public void export(HttpServletRequest request, HttpServletResponse response){
		imageSize = new Point(800, 600);
		String pid = request.getParameter("instanceid");
        String pdk = request.getParameter("pdk");
        insid = pid;
        String img = request.getParameter("format");
        String xml = getProcessDefinitionByPDK(pdk);
        try {
            if("svg".equals(img)){
                response.setContentType("image/svg+xml");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(xml);
            }else{
                byte[] image = generateImage(xml);
                ResponseUtil.download(response, image, "svg.png", "image/png");
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
	}

    private byte[] generateImage(String image) throws Exception{
        PNGTranscoder transcoder =  new PNGTranscoder();
        TranscoderInput input = new TranscoderInput(new StringReader(image));
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        TranscoderOutput output = new TranscoderOutput(outputStream);
        transcoder.transcode(input, output);
        outputStream.flush();
        outputStream.close();
        return outputStream.toByteArray();
    }
	
	public WorkflowStates getWorkflowStates() {
		return (WorkflowStates)SpringContextHelper.getBean("workflowStates");
	}
	
	public String getProcessDefinitionByPDK(String pdk){
//		ProcessDefinitionImpl pdi = workflowUtil.getProcessDefinitionByPiId(pid);
        ProcessDefinitionImpl pdi =  workflowUtil.getProcessDefinitionByPDK(pdk);
		StringBuffer sb = new StringBuffer();
        StringBuffer result = new StringBuffer();
		renderLegend(sb);
		statusColor.clear();
		List<? extends Activity> activityList = pdi.getActivities();
		for (Activity iter : activityList) {
			ActivityCoordinatesImpl coord = pdi.findActivity(iter.getName()).getCoordinates();
            if((coord.getX() + coord.getWidth() + 20) > imageSize.x){
                imageSize.x = coord.getX() + coord.getWidth() + 20;
            }
            if((coord.getY() + coord.getHeight() + 20) > imageSize.y){
                imageSize.y = coord.getY() + coord.getHeight() + 20;
            }
			if("task".equals(iter.getType())){
				renderTask(sb, iter, coord);
			}else if("start".equals(iter.getType())){
				renderStart(sb, iter, coord);
			}else if("end".equals(iter.getType())){
				renderEnd(sb, iter, coord);
			}
			
			List<? extends Transition> tran = iter.getOutgoingTransitions();
			for(Transition t : tran){
				if(t.getName().startsWith("backto") || t.getName().equals("作废")){
					continue;
				}
				ActivityCoordinatesImpl target = pdi.findActivity(t.getDestination().getName()).getCoordinates();
				renderPath(sb, iter, coord, t, target);
			}
		}
		sb.append("</svg>").append("\n");
		initSvgInfo(result);
        result.append(sb);
        return result.toString();
	}

	private void renderLegend(StringBuffer sb) {
		Point rect = new Point();
		rect.x = 20;
		rect.y = 20;
		Point text = new Point();
		text.x = 45;
		text.y = 35;
		sb.append("       <rect").append("\n");
		sb.append("          style=\"fill:none;stroke:" + lineColor + ";stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          width=\"20\"").append("\n");
		sb.append("          height=\"20\"").append("\n");
		sb.append("          x=\"" + rect.x + "\"").append("\n");
		sb.append("          y=\"" + rect.y + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode("未参与") + "\"").append("/>\n");	
		sb.append("       <text").append("\n");
		sb.append("          x=\"" + text.x + "\"").append("\n");
		sb.append("          y=\"" + text.y + "\"").append("\n");
		sb.append("          xml:space=\"preserve\"").append("\n");
		sb.append("          style=\"font-size:16px;font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#00000;fill-opacity:1;stroke:none;font-family:YouYuan\"><tspan ").append("\n");
		sb.append("               x=\"" + text.x + "\"").append("\n");
		sb.append("               y=\"" + text.y + "\"").append("\n");
		sb.append("          	  id=\"" + Base64.encode("tspan1111未参与") + "\"").append(">");
		sb.append("未参与").append("</tspan></text>\n");
		rect.y += 30;
		text.y += 30;
		sb.append("       <rect").append("\n");
		sb.append("          style=\"fill:#" + (Integer.toHexString(unreadColor.getRGB()).toString()).substring(2)+ ";stroke:" + lineColor + ";stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          width=\"20\"").append("\n");
		sb.append("          height=\"20\"").append("\n");
		sb.append("          x=\"" + rect.x + "\"").append("\n");
		sb.append("          y=\"" + rect.y + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode("11111未阅待办") + "\"").append("/>\n");	
		sb.append("       <text").append("\n");
		sb.append("          x=\"" + text.x + "\"").append("\n");
		sb.append("          y=\"" + text.y + "\"").append("\n");
		sb.append("          xml:space=\"preserve\"").append("\n");
		sb.append("          style=\"font-size:16px;font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#00000;fill-opacity:1;stroke:none;font-family:YouYuan\"><tspan ").append("\n");
		sb.append("               x=\"" + text.x + "\"").append("\n");
		sb.append("               y=\"" + text.y + "\"").append("\n");
		sb.append("          	  id=\"" + Base64.encode("tspan1111未阅待办") + "\"").append(">");
		sb.append("未阅").append("</tspan></text>\n");
		rect.y += 30;
		text.y += 30;
		sb.append("       <rect").append("\n");
		sb.append("          style=\"fill:#" + ( Integer.toHexString(todoColor.getRGB()).toString()).substring(2) + ";stroke:" + lineColor + ";stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          width=\"20\"").append("\n");
		sb.append("          height=\"20\"").append("\n");
		sb.append("          x=\"" + rect.x + "\"").append("\n");
		sb.append("          y=\"" + rect.y + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode("11111待办") + "\"").append("/>\n");	
		sb.append("       <text").append("\n");
		sb.append("          x=\"" + text.x + "\"").append("\n");
		sb.append("          y=\"" + text.y + "\"").append("\n");
		sb.append("          xml:space=\"preserve\"").append("\n");
		sb.append("          style=\"font-size:16px;font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#00000;fill-opacity:1;stroke:none;font-family:YouYuan\"><tspan ").append("\n");
		sb.append("               x=\"" + text.x + "\"").append("\n");
		sb.append("               y=\"" + text.y + "\"").append("\n");
		sb.append("          	  id=\"" + Base64.encode("tspan1111待办") + "\"").append(">");
		sb.append("办理中").append("</tspan></text>\n");
		rect.y += 30;
		text.y += 30;
		sb.append("       <rect").append("\n");
		sb.append("          style=\"fill:#" + ( Integer.toHexString(didColor.getRGB()).toString()).substring(2) + ";stroke:" + lineColor + ";stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          width=\"20\"").append("\n");
		sb.append("          height=\"20\"").append("\n");
		sb.append("          x=\"" + rect.x + "\"").append("\n");
		sb.append("          y=\"" + rect.y + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode("已办") + "\"").append("/>\n");	
		sb.append("       <text").append("\n");
		sb.append("          x=\"" + text.x + "\"").append("\n");
		sb.append("          y=\"" + text.y + "\"").append("\n");
		sb.append("          xml:space=\"preserve\"").append("\n");
		sb.append("          style=\"font-size:16px;font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#00000;fill-opacity:1;stroke:none;font-family:YouYuan\"><tspan ").append("\n");
		sb.append("               x=\"" + text.x + "\"").append("\n");
		sb.append("               y=\"" + text.y + "\"").append("\n");
		sb.append("          	  id=\"" + Base64.encode("tspan1111已办") + "\"").append(">");
		sb.append("已办").append("</tspan></text>\n");
		rect.y += 30;
		text.y += 30;
		sb.append("       <rect").append("\n");
		sb.append("          style=\"fill:#" + ( Integer.toHexString(meetingColor.getRGB()).toString()).substring(2) + ";stroke:" + lineColor + ";stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          width=\"20\"").append("\n");
		sb.append("          height=\"20\"").append("\n");
		sb.append("          x=\"" + rect.x + "\"").append("\n");
		sb.append("          y=\"" + rect.y + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode("会签中") + "\"").append("/>\n");	
		sb.append("       <text").append("\n");
		sb.append("          x=\"" + text.x + "\"").append("\n");
		sb.append("          y=\"" + text.y + "\"").append("\n");
		sb.append("          xml:space=\"preserve\"").append("\n");
		sb.append("          style=\"font-size:16px;font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#00000;fill-opacity:1;stroke:none;font-family:YouYuan\"><tspan ").append("\n");
		sb.append("               x=\"" + text.x + "\"").append("\n");
		sb.append("               y=\"" + text.y + "\"").append("\n");
		sb.append("          	  id=\"" + Base64.encode("tspan1111会签中") + "\"").append(">");
		sb.append("会签中").append("</tspan></text>\n");
		rect.y += 30;
		text.y += 30;
		sb.append("       <rect").append("\n");
		sb.append("          style=\"fill:#" + ( Integer.toHexString(meetingFinishColor.getRGB()).toString()).substring(2) + ";stroke:" + lineColor + ";stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          width=\"20\"").append("\n");
		sb.append("          height=\"20\"").append("\n");
		sb.append("          x=\"" + rect.x + "\"").append("\n");
		sb.append("          y=\"" + rect.y + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode("会签结束") + "\"").append("/>\n");	
		sb.append("       <text").append("\n");
		sb.append("          x=\"" + text.x + "\"").append("\n");
		sb.append("          y=\"" + text.y + "\"").append("\n");
		sb.append("          xml:space=\"preserve\"").append("\n");
		sb.append("          style=\"font-size:16px;font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#00000;fill-opacity:1;stroke:none;font-family:YouYuan\"><tspan ").append("\n");
		sb.append("               x=\"" + text.x + "\"").append("\n");
		sb.append("               y=\"" + text.y + "\"").append("\n");
		sb.append("          	  id=\"" + Base64.encode("tspan1111会签结束") + "\"").append(">");
		sb.append("会签结束").append("</tspan></text>\n");
		rect.y += 30;
		text.y += 30;
		sb.append("       <rect").append("\n");
		sb.append("          style=\"fill:#" +  (Integer.toHexString(endColor.getRGB()).toString()).substring(2) + ";stroke:" + lineColor + ";stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          width=\"20\"").append("\n");
		sb.append("          height=\"20\"").append("\n");
		sb.append("          x=\"" + rect.x + "\"").append("\n");
		sb.append("          y=\"" + rect.y + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode("办结") + "\"").append("/>\n");	
		sb.append("       <text").append("\n");
		sb.append("          x=\"" + text.x + "\"").append("\n");
		sb.append("          y=\"" + text.y + "\"").append("\n");
		sb.append("          xml:space=\"preserve\"").append("\n");
		sb.append("          style=\"font-size:16px;font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#00000;fill-opacity:1;stroke:none;font-family:YouYuan\"><tspan ").append("\n");
		sb.append("               x=\"" + text.x + "\"").append("\n");
		sb.append("               y=\"" + text.y + "\"").append("\n");
		sb.append("          	  id=\"" + Base64.encode("tspan1111办结") + "\"").append(">");
		sb.append("办结").append("</tspan></text>\n");
		rect.y += 30;
		text.y += 30;
		sb.append("       <rect").append("\n");
		sb.append("          style=\"fill:#" + ( Integer.toHexString(abandonColor.getRGB()).toString()).substring(2)+ ";stroke:" + lineColor + ";stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          width=\"20\"").append("\n");
		sb.append("          height=\"20\"").append("\n");
		sb.append("          x=\"" + rect.x + "\"").append("\n");
		sb.append("          y=\"" + rect.y + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode("作废") + "\"").append("/>\n");	
		sb.append("       <text").append("\n");
		sb.append("          x=\"" + text.x + "\"").append("\n");
		sb.append("          y=\"" + text.y + "\"").append("\n");
		sb.append("          xml:space=\"preserve\"").append("\n");
		sb.append("          style=\"font-size:16px;font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#00000;fill-opacity:1;stroke:none;font-family:YouYuan\"><tspan ").append("\n");
		sb.append("               x=\"" + text.x + "\"").append("\n");
		sb.append("               y=\"" + text.y + "\"").append("\n");
		sb.append("          	  id=\"" + Base64.encode("tspan1111作废") + "\"").append(">");
		sb.append("作废").append("</tspan></text>\n");
		
	}

	private void renderTask(StringBuffer sb, Activity iter,
			ActivityCoordinatesImpl coord) {
		String[] rgb = getViewColor(iter);
		sb.append("       <rect").append("\n");
		sb.append("          style=\"fill:" + rgb[0] + ";stroke:" + rgb[1] + ";stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          width=\"" + coord.getWidth() + "\"").append("\n");
		sb.append("          height=\"" + coord.getHeight() + "\"").append("\n");
		sb.append("          x=\"" + coord.getX() + "\"").append("\n");
		sb.append("          y=\"" + coord.getY() + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode(iter.getName()) + "\"").append("/>\n");
		Point p = getFontCoordinate(coord, iter.getName());
		sb.append("       <text").append("\n");
		sb.append("          x=\"" + p.x + "\"").append("\n");
		sb.append("          y=\"" + p.y + "\"").append("\n");
		sb.append("          xml:space=\"preserve\"").append("\n");
		sb.append("          style=\"font-size:16px;font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#00000;fill-opacity:1;stroke:none;font-family:YouYuan\"><tspan ").append("\n");
		sb.append("               x=\"" + p.x + "\"").append("\n");
		sb.append("               y=\"" + p.y + "\"").append("\n");
		sb.append("          	  id=\"" + Base64.encode("tspan" + iter.getName()) + "\"").append(">");
		sb.append(iter.getName()).append("</tspan></text>\n");
	}

	private String[] getViewColor(Activity iter) {
		Color color = statusColor.get(iter.getName());
        if(color == null && this.insid != null){
            if(!getEnd() && !getAbandon()){
            	getTodo();
                getDid();
            }
            color = statusColor.get(iter.getName());
        }
		String[] val = new String[]{"none", lineColor};
		if(color != null){
			String co = Integer.toHexString(color.getRGB()).toString();
			val[0] = "#" + co.substring(2);
//			val[1] = "#" + co.substring(2);
		}
		return val;
	}

	private void renderEnd(StringBuffer sb, Activity iter,
			ActivityCoordinatesImpl coord) {
		sb.append("       <circle").append("\n");
		sb.append("          style=\"fill:none;stroke:#b91026;stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          cx=\"" + (coord.getX() + coord.getWidth()/2) + "\"").append("\n");
		sb.append("          cy=\"" + (coord.getY() + coord.getHeight()/2) + "\"").append("\n");
		sb.append("          r=\"" + (coord.getWidth()/2) + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode(iter.getName()) + "\"").append("/>\n");
		sb.append("       <circle").append("\n");
		sb.append("          style=\"fill:#b91026;stroke:#b91026;stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          cx=\"" + (coord.getX() + coord.getWidth()/2) + "\"").append("\n");
		sb.append("          cy=\"" + (coord.getY() + coord.getHeight()/2) + "\"").append("\n");
		sb.append("          r=\"" + (int)(0.3 * coord.getWidth()) + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode(iter.getName()) + "\"").append("/>\n");
		Point p = getFontCoordinate(coord, "结束");
		sb.append("       <text").append("\n");
		sb.append("          x=\"" + (p.x + coord.getWidth()) + "\"").append("\n");
		sb.append("          y=\"" + p.y + "\"").append("\n");
		sb.append("          xml:space=\"preserve\"").append("\n");
		sb.append("          style=\"font-size:16px;font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#00000;fill-opacity:1;stroke:none;font-family:YouYuan\"><tspan ").append("\n");
		sb.append("               x=\"" + (p.x + coord.getWidth()) + "\"").append("\n");
		sb.append("               y=\"" + p.y + "\"").append("\n");
		sb.append("          	  id=\"" + Base64.encode("tspan" + iter.getName()) + "\"").append(">");
		sb.append("结束").append("</tspan></text>\n");
	}

	private void renderStart(StringBuffer sb, Activity iter,
			ActivityCoordinatesImpl coord) {
		sb.append("       <circle").append("\n");
		sb.append("          style=\"fill:none;stroke:#007a26;stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          cx=\"" + (coord.getX() + coord.getWidth()/2) + "\"").append("\n");
		sb.append("          cy=\"" + (coord.getY() + coord.getHeight()/2) + "\"").append("\n");
		sb.append("          r=\"" + (coord.getWidth()/2) + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode(iter.getName()) + "\"").append("/>\n");
		sb.append("       <circle").append("\n");
		sb.append("          style=\"fill:#007a26;stroke:#007a26;stroke-width:3;stroke-opacity:1\"").append("\n");
		sb.append("          cx=\"" + (coord.getX() + coord.getWidth()/2) + "\"").append("\n");
		sb.append("          cy=\"" + (coord.getY() + coord.getHeight()/2) + "\"").append("\n");
		sb.append("          r=\"" + (int)(0.3 * coord.getWidth()) + "\"").append("\n");
		sb.append("          id=\"" + Base64.encode(iter.getName()) + "\"").append("/>\n");
		Point p = getFontCoordinate(coord, "开始");
		sb.append("       <text").append("\n");
		sb.append("          x=\"" + (p.x + coord.getWidth()) + "\"").append("\n");
		sb.append("          y=\"" + p.y + "\"").append("\n");
		sb.append("          xml:space=\"preserve\"").append("\n");
		sb.append("          style=\"font-size:16px;font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;text-align:start;line-height:125%;letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;text-anchor:start;fill:#00000;fill-opacity:1;stroke:none;font-family:YouYuan\"><tspan ").append("\n");
		sb.append("               x=\"" + (p.x + coord.getWidth()) + "\"").append("\n");
		sb.append("               y=\"" + p.y + "\"").append("\n");
		sb.append("          	  id=\"" + Base64.encode("tspan" + iter.getName()) + "\"").append(">");
		sb.append("开始").append("</tspan></text>\n");
	}

	private void renderPath(StringBuffer sb, Activity iter,
			ActivityCoordinatesImpl coord, Transition t,
			ActivityCoordinatesImpl target) {
		if(!iter.getName().equals(t.getDestination().getName())){
			Rectangle rect1 = new Rectangle(coord.getX(), coord.getY(), coord.getWidth(), coord.getHeight());
			Rectangle rect2 = new Rectangle(target.getX(), target.getY(), target.getWidth(), target.getHeight());
			
			Point p1 = Intersection.getRectInterPt(rect1, new Point(coord.getX() + coord.getWidth() / 2, coord.getY() + coord.getHeight() / 2), new Point(target.getX() + target.getWidth() / 2, target.getY() + target.getHeight() / 2));
			Point p2 = Intersection.getRectInterPt(rect2, new Point(target.getX() + target.getWidth() / 2, target.getY() + target.getHeight() / 2), new Point(coord.getX() + coord.getWidth() / 2, coord.getY() + coord.getHeight() / 2));
			sb.append("       <path").append("\n");
			sb.append("          style=\"fill:none;stroke:#0f85af;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow1Lend)\"").append("\n");
			sb.append("          d=\"");
				sb.append("M" + p1.x + "," + p1.y);
				sb.append(" L" + p2.x + "," + p2.y).append("\"\n");
			sb.append("          id=\"" + Base64.encode(iter.getName() + t.getName()) + "\"").append("/>\n");
			sb.append("          inkscape:connector-curvature=\"0\"").append("/>\n");
		}else{
			Point p1 = new Point();
			p1.x = coord.getX();
			p1.y = coord.getY() + coord.getHeight()/2;
			Point p2 = new Point();
			p2.x = coord.getX() + coord.getHeight() / 2;
			p2.y = coord.getY();
			sb.append("       <path").append("\n");
			sb.append("          style=\"fill:none;stroke:#0f85af;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;marker-end:url(#Arrow1Lend)\"").append("\n");
			sb.append("          d=\"");
			sb.append("M" + p1.x + "," + p1.y);
			sb.append(" A" + coord.getHeight() / 2 + "," + coord.getHeight() / 2 + " 0 1,1 " + p2.x + "," + p2.y).append("\"\n");
			sb.append("          id=\"" + Base64.encode(iter.getName() + t.getName()) + "\"").append("/>\n");
			sb.append("          inkscape:connector-curvature=\"0\"").append("/>\n");
			
		}
	}
	
	private void initSvgInfo(StringBuffer sb) {
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>").append("\n");
		sb.append("<svg").append("\n");
		sb.append("   xmlns:dc=\"http://purl.org/dc/elements/1.1/\"").append("\n");
		sb.append("   xmlns:cc=\"http://creativecommons.org/ns#\"").append("\n");
		sb.append("   xmlns:svg=\"http://www.w3.org/2000/svg\"").append("\n");
		sb.append("   xmlns=\"http://www.w3.org/2000/svg\"").append("\n");
		sb.append("   xmlns:sodipodi=\"http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd\"").append("\n");
		sb.append("   xmlns:inkscape=\"http://www.inkscape.org/namespaces/inkscape\"").append("\n");
		sb.append("   width=\"" + imageSize.x + "\"").append("\n");
		sb.append("   height=\"" + imageSize.y + "\"").append("\n");
		sb.append("   id=\"svg2\"").append("\n");
		sb.append("   version=\"1.1\"").append("\n");
		sb.append("   inkscape:version=\"0.48.0 r9654\">").append("\n");
		sb.append("  <defs").append("\n");
		sb.append("     id=\"defs4\">").append("\n");
		sb.append("    <marker").append("\n");
		sb.append("       inkscape:stockid=\"Arrow1Lend\"").append("\n");
		sb.append("       orient=\"auto\"").append("\n");
		sb.append("       refY=\"0\"").append("\n");
		sb.append("       refX=\"0\"").append("\n");
		sb.append("       id=\"Arrow1Lend\"").append("\n");
		sb.append("       style=\"overflow:visible\">").append("\n");
		sb.append("      <path").append("\n");
		sb.append("         id=\"path3810\"").append("\n");
		sb.append("         d=\"M 0,0 5,-5 -12.5,0 5,5 0,0 z\"").append("\n");
		sb.append("         style=\"fill-rule:evenodd;fill:#0f85af;stroke:#0f85af;stroke-width:1pt;marker-start:none\"").append("\n");
		sb.append("         transform=\"matrix(-0.8,0,0,-0.8,-10,0)\"").append("\n");
		sb.append("         inkscape:connector-curvature=\"0\" />").append("\n");
		sb.append("    </marker>").append("\n");
		sb.append("    <marker").append("\n");
		sb.append("       inkscape:stockid=\"Arrow1Lstart\"").append("\n");
		sb.append("       orient=\"auto\"").append("\n");
		sb.append("       refY=\"0\"").append("\n");
		sb.append("       refX=\"0\"").append("\n");
		sb.append("       id=\"Arrow1Lstart\"").append("\n");
		sb.append("       style=\"overflow:visible\">").append("\n");
		sb.append("      <path").append("\n");
		sb.append("         id=\"path3807\"").append("\n");
		sb.append("         d=\"M 0,0 5,-5 -12.5,0 5,5 0,0 z\"").append("\n");
		sb.append("         style=\"fill-rule:evenodd;fill:#0f85af;stroke:#0f85af;stroke-width:1pt;marker-start:none\"").append("\n");
		sb.append("         transform=\"matrix(0.8,0,0,0.8,10,0)\"").append("\n");
		sb.append("         inkscape:connector-curvature=\"0\" />").append("\n");
		sb.append("    </marker>").append("\n");
		sb.append("  </defs>").append("\n");
	}
	
	public WorkflowUtil getWorkflowUtil() {
		return workflowUtil;
	}

	public void setWorkflowUtil(WorkflowUtil workflowUtil) {
		this.workflowUtil = workflowUtil;
	}
	
	private Point getFontCoordinate(ActivityCoordinatesImpl p, String content){
		FontMetrics f = getFontMetrics();
		int w = f.stringWidth(content);
		int h = f.getHeight();
		int x, y;
		x = p.getX() + (p.getWidth() - w) / 2;
		y = (int)(p.getY() + (p.getHeight() - h) / 2 + 0.8 * h);
		return new Point(x, y);
	}
	
	private FontMetrics getFontMetrics(){
		Font stringFont = new Font("YouYuan",Font.BOLD, 16); 
		FontMetrics fontMetrics = new JLabel().getFontMetrics(stringFont); 
		return fontMetrics;
	}
	
	private boolean getTodo() {
		boolean isTodo = true;
		List<PTTodo> todos = getWorkflowStates().getTodo(insid);
		int unFin = getWorkflowStates().getUnfinishCounterSign(insid);
		int fin = getWorkflowStates().getfinishedCounterSign(insid);
		int  isCounterSign = 0;
		if(fin > 0 || unFin > 0){
			isCounterSign = 1;
			if(unFin == 0){
				isCounterSign = 2;
			}
		}
		for (PTTodo todo : todos) {
			if(todo.getIsRead() == null || todo.getIsRead().equals("0")){
				statusColor.put(todo.getTaskName(), unreadColor);
			}else{
				if(isCounterSign > 0){
					if(isCounterSign == 2){
						statusColor.put(todo.getTaskName(), meetingFinishColor);
					}else{
						statusColor.put(todo.getTaskName(), meetingColor);
					}
				}else{
					statusColor.put(todo.getTaskName(), todoColor);
				}
			}
		}
		return isTodo;
	}

	private boolean getDid(){
		boolean isDid = true;
		List<PTDid> dids = getWorkflowStates().getDid(insid);
		for (PTDid did : dids){
			statusColor.put(did.getTaskName(), didColor);
		}
		return isDid;
	}
	
	private void getDidHistory(boolean isEnd){
		List<PTDid> dids = getWorkflowStates().getDidHistory(insid);
		for (PTDid did : dids) {
			if(isEnd){
				statusColor.put(did.getTaskName(), endColor);
			}else{
				statusColor.put(did.getTaskName(), abandonColor);
			}
		}
	}
	
	private boolean getAbandon(){
		PTAbandon ab = getWorkflowStates().getAbandon(insid);
		boolean isAbandon = false;
		if(ab != null){
			isAbandon = true;
			getDidHistory(false);
		}
		return isAbandon;
	}

	private boolean getEnd() {
		PTEnd en = getWorkflowStates().getEnd(insid);
		boolean isEnd = false;
		if(en != null){
			isEnd = true;
			getDidHistory(true);
		}
		return isEnd;
	}
}
