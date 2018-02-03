package com.anyuan.oa.test;

import com.anyuan.oa.model.OldAccessToken;
import com.anyuan.oa.model.response.OldServiceResponse;
import com.anyuan.oa.service.OldOAService;
import com.anyuan.oa.model.response.HTTPResponse;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import java.io.IOException;

/**
 * Created by pengkan on 2018/2/1.
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class OldOAServiceTest {
    private static OldOAService oaService;
    private static OldAccessToken token;

    @BeforeClass
    public static void init(){
        oaService = new OldOAService();
    }

    @Test
    public void test1Login(){
        assert oaService!=null;
        try {
            OldServiceResponse<OldAccessToken> response = oaService.login("jinher", "666666");
            token = response.getData();
            System.out.println("Login: " + response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void test2GetToDoList() {
        assert oaService!=null;
        assert token!=null;
        try {
            HTTPResponse response = oaService.getToDoList(token);
            System.out.println("ToDoList: " + response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//    @Test
//    public void test3GetToDoDetail() {
//        assert oaService!=null;
//        assert token!=null;
//        try {
//            HTTPResponse response = oaService.getToDoDetail(token, "35017");
//            System.out.println("ToDoDetail: " + response);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//
//    @Test
//    public void test4GetToDoAttachment() {
//        assert oaService!=null;
//        assert token!=null;
//        try {
//            HTTPResponse response = oaService.getToDoAttachment(token, "XSH00000385", "xshtsqd_75ca1f11-0841-4abc-8000-a0b8e42a0b3d");
//            System.out.println("ToDoAttachment: " + response);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//
//    @Test
//    public void test5GetNextStep() {
//        assert oaService!=null;
//        assert token!=null;
//        try {
//            HTTPResponse response = oaService.getToDoNextStep(token, "35012", "cb332c5495c04d55a1db1dd1a517c916");
//            System.out.println("NextStep: " + response);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//
//    @Test
//    public void test6GetNextApprovers() {
//        assert oaService!=null;
//        assert token!=null;
//        try {
//            HTTPResponse response = oaService.getToDoNextStepApprovers(token, "35012", "cb332c5495c04d55a1db1dd1a517c916", "2028");
//            System.out.println("NextApprovers: " + response);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

    @AfterClass
    public static void destroy() {
        oaService = null;
    }

}
