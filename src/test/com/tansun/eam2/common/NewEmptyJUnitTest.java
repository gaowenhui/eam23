/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.common;

import org.jdom.output.Format;
import java.io.IOException;
import org.jdom.output.XMLOutputter;
import org.jdom.Namespace;
import org.jdom.Element;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Baitin.Fong
 */
public class NewEmptyJUnitTest {

    public NewEmptyJUnitTest() {
    }

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    @Test
    public void hello() {
        Element head = new Element("header");
        head.addNamespaceDeclaration(Namespace.getNamespace("jic", "http://www.jic.cn/soa"));
        Element user = new Element("auth_user");
        user.addContent("authUser");
        Element password = new Element("auth_password");
        password.addContent("authPassword");
        Element sName = new Element("svc_name");
        sName.addContent("svcName");
        Element sOperation = new Element("svc_operation");
        sOperation.addContent("svcOperation");
        Element sVersion = new Element("svc_version");
        sVersion.addContent("svcVersion");
        Element sAppName = new Element("req_appName");
        sAppName.addContent("reqAppName");
        head.addContent(user);
        head.addContent(password);
        head.addContent(sName);
        head.addContent(sOperation);
        head.addContent(sVersion);
        head.addContent(sAppName);
        System.out.println(head);

        XMLOutputter xmlOut = new XMLOutputter(Format.getCompactFormat());
        try {
            xmlOut.output(head,System.out);
        } catch (IOException e) {
            e.printStackTrace();
        }

        assertNotNull(head);
    }

}