package com.anyuan.oa.service;

import com.anyuan.oa.model.User;
import org.igniterealtime.restclient.RestApiClient;
import org.igniterealtime.restclient.entity.*;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * IM即时通讯用户操作接口
 */
@Component("openFireService")
public class OpenFireService {

    private static final String HOST = "http://101.37.171.186";

    private static final int PORT = 9090;

    private static final String TOKEN = "37704lBBUy127ALX";


    /**
     * 创建openfire通讯用户或修改用户信息
     *
     * @param user
     * @return
     */
    public static void createOrUpdateUser(User user) {
        AuthenticationToken authenticationToken = new AuthenticationToken(TOKEN);
        RestApiClient restApiClient = new RestApiClient(HOST, PORT, authenticationToken);
        UserEntities userEntities = restApiClient.getUsers();
        List<UserEntity> list = userEntities.getUsers();
        boolean isUserExist = false;
        UserEntity existUser = null;
        if (list != null && list.size() > 0) {
            for (UserEntity opUser : list) {
                if (opUser.getUsername().equals(user.getUserName())) {
                    //存在
                    existUser = opUser;
                    isUserExist = true;
                    break;
                }
            }
        }
        if (isUserExist) {
            //存在则修改
            existUser.setPassword(user.getwPassword());
            restApiClient.updateUser(existUser);
        } else {
            //无用户则新增
            UserEntity newUser = new UserEntity();
            newUser.setUsername(user.getUserName());
            newUser.setName(user.getUserName());
            newUser.setPassword(user.getwPassword());
            restApiClient.createUser(newUser);
        }
    }


    /**
     * 删除openfire通讯用户
     *
     * @param user
     * @return
     */
    public static void deleteUser(User user) {
        AuthenticationToken authenticationToken = new AuthenticationToken(TOKEN);
        RestApiClient restApiClient = new RestApiClient(HOST, PORT, authenticationToken);
        restApiClient.deleteUser(user.getUserName());
    }


    /**
     * 查询openfire群组
     *
     * @param groupName
     */
    public static boolean findGroup(String groupName) {
        AuthenticationToken authenticationToken = new AuthenticationToken(TOKEN);
        RestApiClient restApiClient = new RestApiClient(HOST, PORT, authenticationToken);
        GroupEntities ges = restApiClient.getGroups();
        List<GroupEntity> list = ges.getGroups();
        boolean isUserExist = false;
        if (list != null && list.size() > 0) {
            for (GroupEntity group : list) {
                if (group.getName().equals(groupName)) {
                    //存在
                    isUserExist = true;
                    break;
                }
            }
        }
        return isUserExist;
    }


    /**
     * 添加openfire添加群组
     *
     * @param groupName
     */
    public static void createGroup(String groupName) {
        AuthenticationToken authenticationToken = new AuthenticationToken(TOKEN);
        RestApiClient restApiClient = new RestApiClient(HOST, PORT, authenticationToken);
        GroupEntity groupEntity = new GroupEntity();
        if (StringUtils.isEmpty(groupName)) {
            groupEntity.setName("group");
        }
        restApiClient.createGroup(groupEntity);
    }


    /**
     * 删除openfire群组
     *
     * @param groupName
     */
    public static void deleteGroup(String groupName) {
        AuthenticationToken authenticationToken = new AuthenticationToken(TOKEN);
        RestApiClient restApiClient = new RestApiClient(HOST, PORT, authenticationToken);
        restApiClient.deleteGroup(groupName);
    }


    /**
     * 添加openfire用户到群组
     *
     * @param user
     * @param groupName
     */
    public static void addUserToGroup(User user, String groupName) {
        AuthenticationToken authenticationToken = new AuthenticationToken(TOKEN);
        RestApiClient restApiClient = new RestApiClient(HOST, PORT, authenticationToken);
        restApiClient.addUserToGroup(user.getUserName(), groupName);
    }


    /**
     * 将用户踢出群组
     *
     * @param user
     * @param groupName
     */
    public static void deleteUserFromGroup(User user, String groupName) {
        AuthenticationToken authenticationToken = new AuthenticationToken(TOKEN);
        RestApiClient restApiClient = new RestApiClient(HOST, PORT, authenticationToken);
        restApiClient.deleteUserFromGroup(user.getUserName(), groupName);
    }


    public static void main(String[] args) {
        findGroup("a");
    }
}
