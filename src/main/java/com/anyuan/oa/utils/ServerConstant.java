package com.anyuan.oa.utils;

import org.springframework.core.io.support.PropertiesLoaderUtils;

import java.io.IOException;
import java.util.Properties;

public class ServerConstant {

    public static String OLD_AY_HOST = null;
    public static String OPEN_FIRE_HOST = null;
    public static String OPEN_FIRE_HOST_PORT = null;
    public static String AYXZ_HOST = null;

    static {
        try {
            Properties properties = PropertiesLoaderUtils.loadAllProperties("server.properties");
            OLD_AY_HOST = properties.getProperty("OLD_AY_HOST");
            OPEN_FIRE_HOST = properties.getProperty("OPEN_FIRE_HOST");
            OPEN_FIRE_HOST_PORT = properties.getProperty("OPEN_FIRE_HOST_PORT");
            AYXZ_HOST = properties.getProperty("AYXZ_HOST");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
