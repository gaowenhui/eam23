package com.tansun.eam2.common.workflow.trace;

import java.awt.Point;
import java.awt.Rectangle;;

/**
 * 
 * @author Baitin.Fong
 *
 */
public final class Intersection {
	private static void createLine(Point x1, Point x2, Line l){
		l.a = x1.y - x2.y;
		l.b = x2.x - x1.x;
		l.c = x2.y * x1.x - x1.y * x2.x;
	}
	
	private static Point getLineInter(Point p1, Point p2, Point p3, Point p4){
		int x, y;
		Line l1 = new Line();
		Line l2 = new Line();
		createLine(p1, p2, l1);
		createLine(p3, p4, l2);
		
		float seta = l1.b * l2.a - l2.b*l1.a ;
		if( seta == 0){//////平行
		   return null;
		}

//		float p = l2.c * l1.a - l1.c * l2.a;
//		float r = p/seta;
//		y = (int)r; ///////////
//
//		if(l1.a != 0){
//		   x = (int)(-(l1.b / l1.a) * y - l1.c / l1.a);
//		}else{
//		   x = (int)(-(l2.b / l2.a) * y - l2.c / l2.a);
//		}

		 x=(l2.c * l1.b - l1.c * l2.b)/(l1.a * l2.b - l2.a * l1.b);
		 y=(l2.a * l1.c - l1.a * l2.c)/(l1.a * l2.b - l2.a * l1.b);
		return new Point(x, y);
	}
	
	public static Point getRectInterPt(final Rectangle rect, final Point p1, final Point p2){
		if(!rect.contains(p1)){
			return p2;
		}
		if(rect.contains(p2)){
			return p2;
		}
		Rectangle temp = new Rectangle((int)(rect.getX() - 1), (int)(rect.getY() -1), (int)(rect.getWidth() + 2), (int)(rect.getHeight() + 2));
		Point ptRet = p2;
		if (p2.x > rect.x && p2.x < (rect.x + rect.width) && p2.y < rect.y){
			ptRet = getLineInter(new Point(rect.x, rect.y), new Point(
					(rect.x + rect.width), rect.y), p1, p2);
		}else if (p2.x > (rect.x + rect.width) && p2.y > rect.y
				&& p2.y < (rect.y + rect.height)){
			ptRet = getLineInter(new Point((rect.x + rect.width), rect.y),
					new Point((rect.x + rect.width), (rect.y + rect.height)),
					p1, p2);
		}else if (p2.x > rect.x && p2.x < (rect.x + rect.width)
				&& p2.y > (rect.y + rect.height)){
			ptRet = getLineInter(new Point(rect.x, (rect.y + rect.height)),
					new Point((rect.x + rect.width), (rect.y + rect.height)),
					p1, p2);
		}else if (p2.x < rect.x && p2.y > rect.y && p2.y < (rect.y + rect.height)){
			ptRet = getLineInter(new Point(rect.x, rect.y), new Point(rect.x,
					(rect.y + rect.height)), p1, p2);
		}else if (p2.x < rect.x && p2.y < rect.y) {
			ptRet = getLineInter(new Point(rect.x, rect.y), new Point(
					(rect.x + rect.width), rect.y), p1, p2);
			if (!temp.contains(ptRet)) {
				ptRet = getLineInter(new Point(rect.x, rect.y), new Point(
						rect.x, (rect.y + rect.height)), p1, p2);
			}
		}else if (p2.x > (rect.x + rect.width) && p2.y < rect.y) {
			ptRet = getLineInter(new Point(rect.x, rect.y), new Point(
					(rect.x + rect.width), rect.y), p1, p2);
			if (!temp.contains(ptRet)) {
				ptRet = getLineInter(
						new Point((rect.x + rect.width), rect.y),
						new Point((rect.x + rect.width), (rect.y + rect.height)),
						p1, p2);
			}
		}else if (p2.x > (rect.x + rect.width) && p2.y > (rect.y + rect.height)) {
			ptRet = getLineInter(new Point(rect.x, (rect.y + rect.height)),
					new Point((rect.x + rect.width), (rect.y + rect.height)),
					p1, p2);
			if (!temp.contains(ptRet)) {
				ptRet = getLineInter(
						new Point((rect.x + rect.width), rect.y),
						new Point((rect.x + rect.width), (rect.y + rect.height)),
						p1, p2);
			}
		}else if (p2.x < rect.x && p2.y > (rect.y + rect.height)) {
			ptRet = getLineInter(new Point(rect.x, (rect.y + rect.height)),
					new Point((rect.x + rect.width), (rect.y + rect.height)),
					p1, p2);
			if (!temp.contains(ptRet)) {
				ptRet = getLineInter(new Point(rect.x, rect.y), new Point(
						rect.x, (rect.y + rect.height)), p1, p2);
			}
		}
		return ptRet;
	}

	public static Point getCircleInter(Point p1, Point p2, int r){
		if(p1.equals(p2)){
			return p2;
		}
		Line l1 = new Line();
		createLine(p1, p2, l1);

		int tr = (int)Math.pow(l1.a ^ 2 + l1.b ^ 2, 1/2);
		if(tr < r){
			return p2;
		}
		Point p = new Point();
		/*
  		(1 + k^2)*x^2 - x*(2*cx -2*k*(b -cy) ) + cx*cx + ( b - cy)*(b - cy) - r*r = 0
  		*/
		if(p1.x == p2.x && p1.y < p2.y){
			p.x = p1.x;
			p.y = p2.y - r;
		}else if(p1.y == p2.y && p1.x < p2.x){
			p.x = p2.x + r;
			p.y = p2.y;
		}else if(p1.x == p2.x && p1.y > p2.y){
			p.x = p2.x;
			p.y = p2.y + r;
		}else if(p1.y == p2.y && p1.x > p2.x){
			p.x = p2.x - r;
			p.y = p2.y;
		}else{
			//(x - p2.x)^2 + (y - p2.y)^2 = r^2;
			//y=l1.a/l1.b * x + l1.c/l1.b;

		}
		return p;
	}
}
