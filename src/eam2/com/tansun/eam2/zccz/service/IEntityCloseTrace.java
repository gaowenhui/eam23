/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.zccz.service;

import com.tansun.eam2.zccz.vo.EntityDisposeVO;

/**
 *
 * @author Baitin.Fong
 */
public interface IEntityCloseTrace {
    EntityDisposeVO queryTrace(String stid);
}
