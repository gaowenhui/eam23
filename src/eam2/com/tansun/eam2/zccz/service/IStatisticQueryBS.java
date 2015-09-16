/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.zccz.service;

/**
 *
 * @author Baitin.Fong
 */
public interface IStatisticQueryBS {

    double selectEntityYjhsje(String stid);

    double selectEntityHkje(String stid);

    double statisticIncome(String xmid);

    double[] statisticCost(String xmid);
}
