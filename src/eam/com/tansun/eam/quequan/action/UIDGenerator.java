package com.tansun.eam.quequan.action;

import java.io.Serializable;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import org.hibernate.HibernateException;
import org.hibernate.MappingException;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.id.AbstractUUIDGenerator;
import org.hibernate.id.Configurable;
import org.hibernate.type.Type;

public class UIDGenerator extends AbstractUUIDGenerator implements Configurable
{

    public UIDGenerator()
    {
    }

    private int nextInt(int iLower, int iUpper, long lSeed)
    {
        if(iUpper <= iLower)
        {
            return 0;
        } else
        {
            int iRandom = 0;
            Random random1 = new Random();
            random1.setSeed(lSeed);
            iRandom = iLower + random1.nextInt(iUpper);
            return iRandom;
        }
    }

    public String getSequence()
    {
        Date currentDateTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String strYMDHMSS = formatter.format(currentDateTime);
        SecureRandom seeder = new SecureRandom();
        String strValue = "";
        try
        {
            String strRandom = String.valueOf(nextInt(0x186a0, 0xdbb9f, seeder.nextInt(0x5f5e100)));
            strValue = strYMDHMSS + strRandom;
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return strValue;
    }

    public void configure(Type type, Properties properties, Dialect dialect)
        throws MappingException
    {
    }

    public Serializable generate(SessionImplementor arg0, Object arg1)
        throws HibernateException
    {
        return getSequence();
    }

}
