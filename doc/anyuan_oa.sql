/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : anyuan_oa

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-02-01 13:53:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bdf2_company
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_company`;
CREATE TABLE `bdf2_company` (
  `ID_` varchar(60) NOT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_company
-- ----------------------------
INSERT INTO `bdf2_company` VALUES ('00', '湖北安源安全环保科技有限公司', '湖北安源安全环保科技有限公司');
INSERT INTO `bdf2_company` VALUES ('AY', '安源环保有限公司', '安源');

-- ----------------------------
-- Table structure for bdf2_component
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_component`;
CREATE TABLE `bdf2_component` (
  `ID_` varchar(60) NOT NULL,
  `COMPONENT_ID_` varchar(60) NOT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_component
-- ----------------------------
INSERT INTO `bdf2_component` VALUES ('424b2be8-5123-4722-8eff-925792e76fd0', 'delete', null);
INSERT INTO `bdf2_component` VALUES ('492a2fa3-dc15-48c0-a00c-b152e0ae3f9b', 'delete07', null);
INSERT INTO `bdf2_component` VALUES ('6e6994ec-b950-42da-9490-da9e1fe83951', 'flush', null);
INSERT INTO `bdf2_component` VALUES ('77e694de-1bd2-4587-abbd-f624ca63c6c1', 'confirm', null);
INSERT INTO `bdf2_component` VALUES ('840e2a03-1216-47a2-b31e-11da37b286f1', 'save', null);
INSERT INTO `bdf2_component` VALUES ('8584ff95-80f9-47d2-9ac4-791f25d21e51', 'queryAY', null);
INSERT INTO `bdf2_component` VALUES ('cffb7e8f-ef44-451a-a60a-2ec64c4db0e8', 'save07', null);
INSERT INTO `bdf2_component` VALUES ('d34cdb4b-e378-426f-92ac-f2cc905ddfab', 'add', null);
INSERT INTO `bdf2_component` VALUES ('e73420dc-baa7-427d-82cb-e39c5601aafb', 'save07', null);

-- ----------------------------
-- Table structure for bdf2_dept
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_dept`;
CREATE TABLE `bdf2_dept` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  `PARENT_ID_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_dept
-- ----------------------------
INSERT INTO `bdf2_dept` VALUES ('00', 'AY', null, null, '领导层', null);
INSERT INTO `bdf2_dept` VALUES ('01', 'AY', null, null, '安全事业部', null);
INSERT INTO `bdf2_dept` VALUES ('011', 'AY', null, null, '检测中心', '01');
INSERT INTO `bdf2_dept` VALUES ('012', 'AY', null, null, '安全评价技术中心', '01');
INSERT INTO `bdf2_dept` VALUES ('013', 'AY', null, null, '安全技术咨询中心', '01');
INSERT INTO `bdf2_dept` VALUES ('02', 'AY', null, null, '环境事业部', null);
INSERT INTO `bdf2_dept` VALUES ('021', 'AY', null, null, '环境保护技术中心', '02');
INSERT INTO `bdf2_dept` VALUES ('022', 'AY', null, null, '生态保护技术中心', '02');
INSERT INTO `bdf2_dept` VALUES ('023', 'AY', null, null, '能效评估技术中心', '02');
INSERT INTO `bdf2_dept` VALUES ('03', 'AY', null, null, '综合管理部', null);
INSERT INTO `bdf2_dept` VALUES ('04', 'AY', null, null, '市场部', null);
INSERT INTO `bdf2_dept` VALUES ('041', 'AY', null, null, '驻外人员', '04');
INSERT INTO `bdf2_dept` VALUES ('05', 'AY', null, null, '质量管理部', null);
INSERT INTO `bdf2_dept` VALUES ('06', 'AY', null, null, '财务部', null);
INSERT INTO `bdf2_dept` VALUES ('07', 'AY', null, null, '外聘专家', null);

-- ----------------------------
-- Table structure for bdf2_group
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_group`;
CREATE TABLE `bdf2_group` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  `PARENT_ID_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_group
-- ----------------------------
INSERT INTO `bdf2_group` VALUES ('966ad4bd-3bb4-4b0e-a5d6-ecfc3390f22e', 'AY', '2017-12-26 09:54:52', null, '部门计划填报', null);

-- ----------------------------
-- Table structure for bdf2_group_member
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_group_member`;
CREATE TABLE `bdf2_group_member` (
  `ID_` varchar(60) NOT NULL,
  `DEPT_ID_` varchar(60) DEFAULT NULL,
  `GROUP_ID_` varchar(60) DEFAULT NULL,
  `POSITION_ID_` varchar(60) DEFAULT NULL,
  `USERNAME_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_group_member
-- ----------------------------
INSERT INTO `bdf2_group_member` VALUES ('31a0ef19-009c-4375-8fac-54062be98e78', null, '966ad4bd-3bb4-4b0e-a5d6-ecfc3390f22e', null, 'xuxh1');
INSERT INTO `bdf2_group_member` VALUES ('3503c1be-65b3-4dff-83b9-78d618c11c42', null, '966ad4bd-3bb4-4b0e-a5d6-ecfc3390f22e', null, 'Xuhj');
INSERT INTO `bdf2_group_member` VALUES ('51267596-d792-465e-9bbd-aef25956b97c', null, '966ad4bd-3bb4-4b0e-a5d6-ecfc3390f22e', null, 'Zhangl');
INSERT INTO `bdf2_group_member` VALUES ('652a2729-ad31-4c32-bfd8-394c64250095', null, '966ad4bd-3bb4-4b0e-a5d6-ecfc3390f22e', null, 'Yuany');
INSERT INTO `bdf2_group_member` VALUES ('683542ac-65ef-4bfd-8abc-0b5e98ddb8b9', null, '966ad4bd-3bb4-4b0e-a5d6-ecfc3390f22e', null, 'yangying');
INSERT INTO `bdf2_group_member` VALUES ('68982968-b08d-4e72-b6e1-3aa3a1e81f55', null, '966ad4bd-3bb4-4b0e-a5d6-ecfc3390f22e', null, 'Yim');
INSERT INTO `bdf2_group_member` VALUES ('6cefa5d3-4664-401f-99c3-42842c975335', null, '966ad4bd-3bb4-4b0e-a5d6-ecfc3390f22e', null, 'Jizb');
INSERT INTO `bdf2_group_member` VALUES ('7375556e-7a7f-477a-b1e5-f551b49c8b57', null, '966ad4bd-3bb4-4b0e-a5d6-ecfc3390f22e', null, 'Pijh');
INSERT INTO `bdf2_group_member` VALUES ('89b1e833-0400-4d7d-8857-8268883f7ce9', null, '966ad4bd-3bb4-4b0e-a5d6-ecfc3390f22e', null, 'Gaocr');
INSERT INTO `bdf2_group_member` VALUES ('d33fb2da-c77e-4a9f-a69e-cca94ebc40ce', null, '966ad4bd-3bb4-4b0e-a5d6-ecfc3390f22e', null, 'yujj');

-- ----------------------------
-- Table structure for bdf2_message
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_message`;
CREATE TABLE `bdf2_message` (
  `ID_` varchar(60) NOT NULL,
  `CONTENT_` varchar(1000) NOT NULL,
  `READ_` bit(1) NOT NULL,
  `RECEIVER_` varchar(60) NOT NULL,
  `REPLY_` bit(1) DEFAULT NULL,
  `SEND_DATE_` datetime DEFAULT NULL,
  `SENDER_` varchar(60) NOT NULL,
  `TAGS_` varchar(100) DEFAULT NULL,
  `TITLE_` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_message
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_message_template
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_message_template`;
CREATE TABLE `bdf2_message_template` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) DEFAULT NULL,
  `CONTENT_` varchar(1000) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  `TYPE_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_message_template
-- ----------------------------

-- ----------------------------
-- Table structure for bdf2_position
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_position`;
CREATE TABLE `bdf2_position` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_position
-- ----------------------------
INSERT INTO `bdf2_position` VALUES ('GW0001', 'AY', '2017-11-24 12:27:30', '部门填报人员', '部门填报');
INSERT INTO `bdf2_position` VALUES ('GW0002', 'AY', null, '部门负责人', '部门负责人');
INSERT INTO `bdf2_position` VALUES ('GW0003', 'AY', null, '高管审核人', '高管审核人');
INSERT INTO `bdf2_position` VALUES ('GW0004', 'AY', '2017-12-11 16:47:17', '行政专员', '行政专员');
INSERT INTO `bdf2_position` VALUES ('GW0005', 'AY', '2017-12-18 18:37:04', '周任务填报', '周任务填报');

-- ----------------------------
-- Table structure for bdf2_role
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_role`;
CREATE TABLE `bdf2_role` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `CREATE_USER_` varchar(60) DEFAULT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `ENABLED_` bit(1) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  `PARENT_ID_` varchar(60) DEFAULT NULL,
  `TYPE_` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_role
-- ----------------------------
INSERT INTO `bdf2_role` VALUES ('5d0e5efd-ee2f-4d97-acef-47b8705eec93', 'AY', '2017-12-13 15:13:56', null, '系统管理员', '', '系统管理员', null, 'normal');
INSERT INTO `bdf2_role` VALUES ('6342c2ef-4db5-4c50-8c32-ef28a37dbf95', 'AY', '2017-12-13 14:47:50', null, '任务发起人', '', '行政专员', null, 'normal');
INSERT INTO `bdf2_role` VALUES ('7525d14b-d301-4e29-aedc-efbf1b3edc43', 'AY', null, null, '任务填报员工', '', '部门任务填报员', null, 'normal');
INSERT INTO `bdf2_role` VALUES ('ccf2ff05-69a9-4280-8600-30349aa6f970', 'AY', '2017-12-13 14:49:37', null, '高管审批', '', '高管', null, 'normal');
INSERT INTO `bdf2_role` VALUES ('d697f9d6-fb00-40ed-9385-ff398e9e351b', 'AY', '2018-01-16 12:02:37', null, '财务专员-金和数据维护', '', '财务专员', null, 'normal');
INSERT INTO `bdf2_role` VALUES ('da3e2a62-865f-4903-8919-82a6970d36e3', 'AY', null, null, '管理员', '', '超级管理员', null, 'normal');
INSERT INTO `bdf2_role` VALUES ('de300049-5537-42b9-9dad-98cc6ccb3370', 'AY', '2017-12-13 14:48:23', null, '部门审核', '', '部门审核领导', null, 'normal');
INSERT INTO `bdf2_role` VALUES ('eb7254ae-ac73-44d0-9ed9-5e03aa992e21', 'AY', '2018-01-16 12:03:04', null, '市场专员-获取金和数据', '', '市场专员', null, 'normal');

-- ----------------------------
-- Table structure for bdf2_role_member
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_role_member`;
CREATE TABLE `bdf2_role_member` (
  `ID_` varchar(60) NOT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `DEPT_ID_` varchar(60) DEFAULT NULL,
  `GRANTED_` bit(1) DEFAULT NULL,
  `POSITION_ID_` varchar(60) DEFAULT NULL,
  `ROLE_ID_` varchar(60) DEFAULT NULL,
  `USERNAME_` varchar(60) DEFAULT NULL,
  `GROUP_ID_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK79BEE4326C254D1D` (`GROUP_ID_`) USING BTREE,
  CONSTRAINT `bdf2_role_member_ibfk_1` FOREIGN KEY (`GROUP_ID_`) REFERENCES `bdf2_group` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_role_member
-- ----------------------------
INSERT INTO `bdf2_role_member` VALUES ('057ba56d-e594-4492-b6bf-d04ba41a2ec9', '2017-12-13 14:52:49', null, '', 'GW0001', '7525d14b-d301-4e29-aedc-efbf1b3edc43', null, null);
INSERT INTO `bdf2_role_member` VALUES ('1b2a1801-0b41-42e5-aad0-de93b9f77698', '2017-12-14 14:14:18', null, '', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', 'Qinxc', null);
INSERT INTO `bdf2_role_member` VALUES ('4a7d0471-2faa-4161-bbaa-7be5f8a821d1', '2017-12-13 15:24:18', null, '', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', 'liuwl', null);
INSERT INTO `bdf2_role_member` VALUES ('5a02ab90-d522-47d0-97a6-2cf6942ef0a1', '2018-01-16 12:05:23', null, '', null, 'd697f9d6-fb00-40ed-9385-ff398e9e351b', 'yujj', null);
INSERT INTO `bdf2_role_member` VALUES ('65524426-d3be-4f8d-8df4-df45043fa8ef', '2017-12-13 14:53:32', null, '', 'GW0002', 'de300049-5537-42b9-9dad-98cc6ccb3370', null, null);
INSERT INTO `bdf2_role_member` VALUES ('7ebf8d8e-4328-4f7c-a2fc-fb068068e0fb', '2017-12-13 14:53:43', null, '', 'GW0003', 'ccf2ff05-69a9-4280-8600-30349aa6f970', null, null);
INSERT INTO `bdf2_role_member` VALUES ('82a06b3c-08f8-43a2-b1c9-b0059cdbfb58', '2017-11-28 11:34:23', null, '', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', 'admin', null);
INSERT INTO `bdf2_role_member` VALUES ('875b0566-3ffb-4024-bbe4-e3a0110f75df', '2018-01-16 12:05:03', null, '', null, 'eb7254ae-ac73-44d0-9ed9-5e03aa992e21', 'LuW', null);
INSERT INTO `bdf2_role_member` VALUES ('908cc002-caa0-41c2-8292-aff8c9c787f6', '2018-01-16 12:05:03', null, '', null, 'eb7254ae-ac73-44d0-9ed9-5e03aa992e21', 'Yuany', null);
INSERT INTO `bdf2_role_member` VALUES ('d566af54-27fb-4568-bdfc-6a242f3c5fb3', '2018-01-16 12:05:03', null, '', null, 'eb7254ae-ac73-44d0-9ed9-5e03aa992e21', 'Chengs', null);
INSERT INTO `bdf2_role_member` VALUES ('e37166dc-a82c-45cd-882a-e61df9b15bd2', '2017-12-13 14:52:08', null, '', 'GW0004', '6342c2ef-4db5-4c50-8c32-ef28a37dbf95', null, null);
INSERT INTO `bdf2_role_member` VALUES ('e6db2d95-2898-437e-a19e-daa8117a9f39', '2018-01-16 12:05:03', null, '', null, 'eb7254ae-ac73-44d0-9ed9-5e03aa992e21', 'zhengwj', null);
INSERT INTO `bdf2_role_member` VALUES ('f1abfcb7-5741-4237-b3ca-489d1638d304', '2018-01-16 12:05:03', null, '', null, 'eb7254ae-ac73-44d0-9ed9-5e03aa992e21', 'Zhouwy', null);

-- ----------------------------
-- Table structure for bdf2_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_role_resource`;
CREATE TABLE `bdf2_role_resource` (
  `ID_` varchar(60) NOT NULL,
  `PACKAGE_ID_` varchar(60) DEFAULT NULL,
  `ROLE_ID_` varchar(60) DEFAULT NULL,
  `URL_ID_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_role_resource
-- ----------------------------
INSERT INTO `bdf2_role_resource` VALUES ('03b56200-1770-4461-9d96-2c8e58eb376b', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', 'e5af06f5-cf16-4c26-92db-44003ed95716');
INSERT INTO `bdf2_role_resource` VALUES ('077c835c-4368-470f-a6c4-eac72d203c41', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', '5097321c-0efe-4acf-a75c-07f2a69f4283');
INSERT INTO `bdf2_role_resource` VALUES ('15f436e2-a8ae-43be-99b7-a6ce1d1bc9cf', null, 'd697f9d6-fb00-40ed-9385-ff398e9e351b', '32e27af9-d1cc-4cac-93f9-d8fb8b52d756');
INSERT INTO `bdf2_role_resource` VALUES ('1728a74a-cee3-4ec2-8fd5-324709f9dfc1', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', 'ac3fbdc8-10e6-485a-9d56-1bd659eedcf8');
INSERT INTO `bdf2_role_resource` VALUES ('1bdde9c8-3df8-4911-9413-d3c41e84eaba', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '7af1cd77-cae3-4a74-8c42-34f4913e0d64');
INSERT INTO `bdf2_role_resource` VALUES ('223534a3-7872-47fe-912f-fc326e795556', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', '01c62036-8f81-4436-8431-eecd3b190580');
INSERT INTO `bdf2_role_resource` VALUES ('247d7b80-b575-408f-a531-1c0332a83723', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '7a4973c2-1a22-449b-aa7b-fa4753684171');
INSERT INTO `bdf2_role_resource` VALUES ('2a8c8749-8d9f-4ec4-84eb-3ebdc183c676', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '09009f8d-eec9-4e8c-b27f-3b444855ab42');
INSERT INTO `bdf2_role_resource` VALUES ('2bc304cf-4ce3-41ff-822f-be8cb77ea83b', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', '8b35ddf4-4ce0-4bb7-9a9c-95e08ac7e63d');
INSERT INTO `bdf2_role_resource` VALUES ('2cdac2b7-dc6d-4806-ba5f-66dbd440ca54', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '13c8807b-5fa6-4288-a23e-e8b39f9e96ef');
INSERT INTO `bdf2_role_resource` VALUES ('301297b6-fbac-44c6-aabe-90d067a6b51b', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', 'root-AY');
INSERT INTO `bdf2_role_resource` VALUES ('309f0c72-bef1-422e-bf39-1dfb207339d6', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '72fe65e6-0e11-410e-8df0-33268f71d09d');
INSERT INTO `bdf2_role_resource` VALUES ('36248628-72d2-44c1-a8b5-90526d34f692', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', '159c6509-e043-4b4e-b9c7-140019d93fe0');
INSERT INTO `bdf2_role_resource` VALUES ('412375f8-5128-4a44-9555-151048abf9d1', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', '32e27af9-d1cc-4cac-93f9-d8fb8b52d756');
INSERT INTO `bdf2_role_resource` VALUES ('57be3868-2d0d-44d3-84d5-017d1a17bc46', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '17c4606a-e58d-4c2f-8eee-e0933d97c5a1');
INSERT INTO `bdf2_role_resource` VALUES ('5868ab57-274b-49ec-9e43-f344437927a4', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '77b63464-9c20-47e4-998b-e782ac5f2cfc');
INSERT INTO `bdf2_role_resource` VALUES ('5950e36c-c1ef-43e7-8c1f-4894659c2172', null, 'eb7254ae-ac73-44d0-9ed9-5e03aa992e21', 'c1cec8e6-8222-4f09-ba79-e862c693fa05');
INSERT INTO `bdf2_role_resource` VALUES ('5ae58a3e-34d9-43a8-ace7-b2afb088ded3', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '32e27af9-d1cc-4cac-93f9-d8fb8b52d756');
INSERT INTO `bdf2_role_resource` VALUES ('5c6a20f1-30a8-4ce6-842a-d231d673f2be', null, '6342c2ef-4db5-4c50-8c32-ef28a37dbf95', 'c1cec8e6-8222-4f09-ba79-e862c693fa05');
INSERT INTO `bdf2_role_resource` VALUES ('5c838cf9-6ad6-4f0e-b4b1-d91eee6bf4d8', null, 'eb7254ae-ac73-44d0-9ed9-5e03aa992e21', '32e27af9-d1cc-4cac-93f9-d8fb8b52d756');
INSERT INTO `bdf2_role_resource` VALUES ('62ae5ec2-25c0-427c-8b98-8caf57b95a87', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', '72fe65e6-0e11-410e-8df0-33268f71d09d');
INSERT INTO `bdf2_role_resource` VALUES ('653fb618-87c7-4ad3-971a-d674bb37de33', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', '6e3856a2-2149-4373-8955-21d12f3a05c8');
INSERT INTO `bdf2_role_resource` VALUES ('679ab37f-39f8-4836-bdbf-313416fd84a1', null, '6342c2ef-4db5-4c50-8c32-ef28a37dbf95', '6e3856a2-2149-4373-8955-21d12f3a05c8');
INSERT INTO `bdf2_role_resource` VALUES ('681c39fe-8da8-4b9f-b98c-a2eed34a2e06', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '5097321c-0efe-4acf-a75c-07f2a69f4283');
INSERT INTO `bdf2_role_resource` VALUES ('6ca2bc08-87b7-4eab-9b79-f563971c2db7', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', 'e3a2ea09-5c41-48a3-9e4c-d0db5a063fcd');
INSERT INTO `bdf2_role_resource` VALUES ('7604363c-5c78-44b4-92a8-83c95d449a57', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', '09009f8d-eec9-4e8c-b27f-3b444855ab42');
INSERT INTO `bdf2_role_resource` VALUES ('8143d648-38f5-44af-a023-d57c38bfecad', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', 'ac3fbdc8-10e6-485a-9d56-1bd659eedcf8');
INSERT INTO `bdf2_role_resource` VALUES ('8680cfb6-4e1e-4ea8-ace9-2ca3c1df871a', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', 'root-AY');
INSERT INTO `bdf2_role_resource` VALUES ('8858bd17-048e-4fcd-b5b0-ff62f6b383ef', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '01c62036-8f81-4436-8431-eecd3b190580');
INSERT INTO `bdf2_role_resource` VALUES ('8a6f7614-7652-417c-8369-da617a48dbb5', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', '14a75472-f204-470b-ba31-b397b282437f');
INSERT INTO `bdf2_role_resource` VALUES ('a8bc805f-4754-4684-8921-d76c4b1785c8', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', 'c1cec8e6-8222-4f09-ba79-e862c693fa05');
INSERT INTO `bdf2_role_resource` VALUES ('ac03380c-8542-4f3e-89a2-2ad7955659b0', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', 'b574dfd4-71e0-41fc-9479-8d50186592a0');
INSERT INTO `bdf2_role_resource` VALUES ('b1963bab-8c14-4326-814d-c8e76661d3a5', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '159c6509-e043-4b4e-b9c7-140019d93fe0');
INSERT INTO `bdf2_role_resource` VALUES ('cde5c2a9-7f36-4d30-894a-259b48a129b9', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '932f3713-c121-4889-a51f-81914dd02d01');
INSERT INTO `bdf2_role_resource` VALUES ('ce95301f-68fd-4737-908b-d75b56a79528', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '2e2182ce-a82e-436e-9287-1ef1a6a2aebd');
INSERT INTO `bdf2_role_resource` VALUES ('d1d9d3f0-89fb-4d51-aff4-af23e4815fd8', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', 'bbd2cb1a-8a55-4171-8425-aabefc94cd85');
INSERT INTO `bdf2_role_resource` VALUES ('d4650641-df51-4e2a-870f-5495ab7c78f3', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', 'c1cec8e6-8222-4f09-ba79-e862c693fa05');
INSERT INTO `bdf2_role_resource` VALUES ('d493e0be-6fc7-4124-abaa-de8138c331c8', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '6e3856a2-2149-4373-8955-21d12f3a05c8');
INSERT INTO `bdf2_role_resource` VALUES ('d5b39700-7964-47ac-82bb-d01a0b0b4934', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', 'e5af06f5-cf16-4c26-92db-44003ed95716');
INSERT INTO `bdf2_role_resource` VALUES ('d5d597de-c4e7-479e-bb6c-78706d12e364', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '8b35ddf4-4ce0-4bb7-9a9c-95e08ac7e63d');
INSERT INTO `bdf2_role_resource` VALUES ('d9b9cdc3-e104-45a5-af25-0253f877f591', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', 'c47cfc7d-16c2-4016-99ec-3d771a6971f9');
INSERT INTO `bdf2_role_resource` VALUES ('db67754c-6864-4360-ace5-5baa6c304b34', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', 'e6b17800-b67f-4e07-a0ff-c20a4344ebbb');
INSERT INTO `bdf2_role_resource` VALUES ('ddbb1245-c6bf-4b75-89d8-3f094fc351c1', null, 'd697f9d6-fb00-40ed-9385-ff398e9e351b', 'c1cec8e6-8222-4f09-ba79-e862c693fa05');
INSERT INTO `bdf2_role_resource` VALUES ('e4104699-1c98-43cc-9ced-6143d0f077f2', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', 'b574dfd4-71e0-41fc-9479-8d50186592a0');
INSERT INTO `bdf2_role_resource` VALUES ('e9b5f295-bf18-4a4e-b13d-6a322edc0293', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', '14a75472-f204-470b-ba31-b397b282437f');
INSERT INTO `bdf2_role_resource` VALUES ('ea0e9477-255b-4c77-903b-5c08b3d8a0c0', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', 'bbd2cb1a-8a55-4171-8425-aabefc94cd85');
INSERT INTO `bdf2_role_resource` VALUES ('ee0effab-fe8f-4e3d-ab9f-0fbfda303463', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', 'ee242fd6-399a-47ac-a535-67a4cc9fbf8b');
INSERT INTO `bdf2_role_resource` VALUES ('fb12d48f-a101-4349-ba31-f01aef35b272', null, 'da3e2a62-865f-4903-8919-82a6970d36e3', 'e3a2ea09-5c41-48a3-9e4c-d0db5a063fcd');
INSERT INTO `bdf2_role_resource` VALUES ('ffe71e13-b4ff-4f06-a730-ceb918dab3dd', null, '5d0e5efd-ee2f-4d97-acef-47b8705eec93', 'c47cfc7d-16c2-4016-99ec-3d771a6971f9');

-- ----------------------------
-- Table structure for bdf2_url
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_url`;
CREATE TABLE `bdf2_url` (
  `ID_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) NOT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `FOR_NAVIGATION_` bit(1) NOT NULL,
  `ICON_` varchar(120) DEFAULT NULL,
  `NAME_` varchar(60) NOT NULL,
  `ORDER_` int(11) DEFAULT NULL,
  `PARENT_ID_` varchar(60) DEFAULT NULL,
  `SYSTEM_ID_` varchar(60) DEFAULT NULL,
  `URL_` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_url
-- ----------------------------
INSERT INTO `bdf2_url` VALUES ('01c62036-8f81-4436-8431-eecd3b190580', 'AY', null, '', 'url(skin>common/icons.gif) -302px -61px', '消息模版维护', '5', '8b35ddf4-4ce0-4bb7-9a9c-95e08ac7e63d', null, 'bdf2.core.view.messagetemplate.MessageTemplateMaintain.d');
INSERT INTO `bdf2_url` VALUES ('09009f8d-eec9-4e8c-b27f-3b444855ab42', 'AY', null, '', 'url(skin>common/icons.gif) -42px -41px', '权限管理', '2', 'root-AY', null, null);
INSERT INTO `bdf2_url` VALUES ('0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', 'AY', null, '', 'url(>skin>common/icons.gif) -220px -140px', '查询', '5', '60a18667-a3da-4465-a993-efb95c76d94c', null, null);
INSERT INTO `bdf2_url` VALUES ('13c8807b-5fa6-4288-a23e-e8b39f9e96ef', 'AY', null, '', 'url(>skin>common/icons.gif) -280px -40px', '报表', '1', 'e6b17800-b67f-4e07-a0ff-c20a4344ebbb', null, null);
INSERT INTO `bdf2_url` VALUES ('14a75472-f204-470b-ba31-b397b282437f', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '公用代码档', '1', 'c1cec8e6-8222-4f09-ba79-e862c693fa05', null, 'com.jghz.dc.view.dcjva1.d');
INSERT INTO `bdf2_url` VALUES ('159c6509-e043-4b4e-b9c7-140019d93fe0', 'AY', null, '', 'url(skin>common/icons.gif) -142px -101px', '用户维护', '2', '8b35ddf4-4ce0-4bb7-9a9c-95e08ac7e63d', null, 'bdf2.core.view.user.UserMaintain.d');
INSERT INTO `bdf2_url` VALUES ('17c4606a-e58d-4c2f-8eee-e0933d97c5a1', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '任务汇总', '6', '932f3713-c121-4889-a51f-81914dd02d01', null, 'com.jghz.op.view.opjv02x.d');
INSERT INTO `bdf2_url` VALUES ('2483a3cc-3dd3-4e20-b4d7-70a5a3b064fc', 'AY', null, '', 'url(>skin>common/icons.gif) -0px -120px', '周工作资料', '4', '60a18667-a3da-4465-a993-efb95c76d94c', null, null);
INSERT INTO `bdf2_url` VALUES ('2e1898ba-baf9-4d13-8d9d-6a870e0eb70b', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '周工作', '8', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.report.opjv08report.d');
INSERT INTO `bdf2_url` VALUES ('2e2182ce-a82e-436e-9287-1ef1a6a2aebd', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '产值', '2', '932f3713-c121-4889-a51f-81914dd02d01', null, 'com.jghz.op.view.opjv021.d');
INSERT INTO `bdf2_url` VALUES ('32e27af9-d1cc-4cac-93f9-d8fb8b52d756', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '获取合同项目数据', '5', 'c1cec8e6-8222-4f09-ba79-e862c693fa05', null, 'com.jghz.op.view.opjv07.d');
INSERT INTO `bdf2_url` VALUES ('32e5a27e-d03c-49bd-a92b-0a664de8e9c2', 'AY', null, '', 'url(>skin>common/icons.gif) -260px -100px', '任务管理', '3', null, null, null);
INSERT INTO `bdf2_url` VALUES ('3a50a217-5cd9-4952-a197-65b018a0ab21', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -60px', '月度办公会资料', '2', '60a18667-a3da-4465-a993-efb95c76d94c', null, null);
INSERT INTO `bdf2_url` VALUES ('3e567e29-a90d-4cf8-80b9-3ffa519d6115', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '收费', '1', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.report.opjv04report.d');
INSERT INTO `bdf2_url` VALUES ('47437cf2-b0e0-4c10-b76f-1c0de99a3663', 'AY', null, '', 'url(>skin>common/icons.gif) -280px -60px', '年度工作计划编制', '1', '60a18667-a3da-4465-a993-efb95c76d94c', null, null);
INSERT INTO `bdf2_url` VALUES ('49e97d4b-f05a-4591-8538-5f0d8f238462', 'AY', null, '\0', 'url(>skin>common/icons.gif) -300px -260px', '周工作计划查询', '12', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.view.opjv063.d');
INSERT INTO `bdf2_url` VALUES ('5097321c-0efe-4acf-a75c-07f2a69f4283', 'AY', null, '', 'url(skin>common/icons.gif) -240px -80px', '角色维护', '1', '09009f8d-eec9-4e8c-b27f-3b444855ab42', null, 'bdf2.core.view.role.RoleMaintain.d');
INSERT INTO `bdf2_url` VALUES ('55df67a0-958c-4ee6-935c-a51196edef5e', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '科研', '7', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.report.opjv07report.d');
INSERT INTO `bdf2_url` VALUES ('5940818f-bc1f-4d95-b7f6-083de8ef3cd2', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '周工作任务发布', '1', '2483a3cc-3dd3-4e20-b4d7-70a5a3b064fc', null, 'com.jghz.op.view.opjv06.d');
INSERT INTO `bdf2_url` VALUES ('5a5497d1-4611-403c-a43a-810448a23208', 'AY', null, '\0', 'url(>skin>common/icons.gif) -260px -100px', '专题资料', '4', '60a18667-a3da-4465-a993-efb95c76d94c', null, null);
INSERT INTO `bdf2_url` VALUES ('60a18667-a3da-4465-a993-efb95c76d94c', 'AY', null, '', 'url(>skin>common/icons.gif) -260px -140px', '计划管理', '4', null, null, null);
INSERT INTO `bdf2_url` VALUES ('68cb1f2b-85bb-4f25-8618-93d6f3e73544', 'AY', null, '\0', 'url(>skin>common/icons.gif) -300px -260px', '周工作任务填报', '3', '2483a3cc-3dd3-4e20-b4d7-70a5a3b064fc', null, 'com.jghz.op.view.opjv061.d');
INSERT INTO `bdf2_url` VALUES ('6e3856a2-2149-4373-8955-21d12f3a05c8', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '业务分类', '4', 'c1cec8e6-8222-4f09-ba79-e862c693fa05', null, 'com.jghz.op.view.opjv01.d');
INSERT INTO `bdf2_url` VALUES ('72fe65e6-0e11-410e-8df0-33268f71d09d', 'AY', null, '', 'url(skin>common/icons.gif) -42px -41px', '部门维护', '3', '8b35ddf4-4ce0-4bb7-9a9c-95e08ac7e63d', null, 'bdf2.core.view.dept.DeptMaintain.d');
INSERT INTO `bdf2_url` VALUES ('77b63464-9c20-47e4-998b-e782ac5f2cfc', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '资质', '4', '932f3713-c121-4889-a51f-81914dd02d01', null, 'com.jghz.op.view.opjv023.d');
INSERT INTO `bdf2_url` VALUES ('7a4973c2-1a22-449b-aa7b-fa4753684171', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '收费', '3', '932f3713-c121-4889-a51f-81914dd02d01', null, 'com.jghz.op.view.opjv022.d');
INSERT INTO `bdf2_url` VALUES ('7af1cd77-cae3-4a74-8c42-34f4913e0d64', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '月度完成', '5', '932f3713-c121-4889-a51f-81914dd02d01', null, 'com.jghz.op.view.opjv02a.d');
INSERT INTO `bdf2_url` VALUES ('860ffa24-5abc-4b53-a161-dbab60e1b705', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '合同', '3', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.report.opjv01report.d');
INSERT INTO `bdf2_url` VALUES ('8b35ddf4-4ce0-4bb7-9a9c-95e08ac7e63d', 'AY', null, '', 'url(skin>common/icons.gif) -100px -20px', '系统默认基本信息维护', '1', 'root-AY', null, null);
INSERT INTO `bdf2_url` VALUES ('932f3713-c121-4889-a51f-81914dd02d01', 'AY', null, '', 'url(>skin>common/icons.gif) -40px -60px', '查询页面模板', '2', 'e6b17800-b67f-4e07-a0ff-c20a4344ebbb', null, null);
INSERT INTO `bdf2_url` VALUES ('948555c4-5a5c-4e97-a221-29e66e876cff', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '月度计划任务汇总', '4', '3a50a217-5cd9-4952-a197-65b018a0ab21', null, 'com.jghz.op.view.opjv053.d');
INSERT INTO `bdf2_url` VALUES ('9e2148a1-fda2-4fa8-b5df-025814509a2a', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '产值', '2', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.report.opjv02report.d');
INSERT INTO `bdf2_url` VALUES ('9fb20aba-5cb1-4735-ba5c-8b691dc71c89', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '周工作汇总', '4', '2483a3cc-3dd3-4e20-b4d7-70a5a3b064fc', null, 'com.jghz.op.view.opjv063.d');
INSERT INTO `bdf2_url` VALUES ('aa728188-d789-46d6-9c91-fe35b5af2dac', 'AY', null, '', 'url(>skin>common/icons.gif) -240px -40px', '重要经济指标', '9', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.view.opjvbb01.d');
INSERT INTO `bdf2_url` VALUES ('ac3fbdc8-10e6-485a-9d56-1bd659eedcf8', 'AY', null, '', 'url(skin>common/icons.gif) -102px -21px', '角色成员维护', '4', '09009f8d-eec9-4e8c-b27f-3b444855ab42', null, 'bdf2.core.view.role.member.RoleMemberMaintain.d');
INSERT INTO `bdf2_url` VALUES ('b1e8edba-1fbc-48f5-a17f-7c919d9f7e07', 'AY', null, '\0', 'url(>skin>common/icons.gif) -300px -260px', '专题任务发起', '1', '5a5497d1-4611-403c-a43a-810448a23208', null, 'com.jghz.op.view.opjv04.d');
INSERT INTO `bdf2_url` VALUES ('b574dfd4-71e0-41fc-9479-8d50186592a0', 'AY', null, '', 'url(skin>common/icons.gif) -262px -41px', '岗位维护', '4', '8b35ddf4-4ce0-4bb7-9a9c-95e08ac7e63d', null, 'bdf2.core.view.position.PositionMaintain.d');
INSERT INTO `bdf2_url` VALUES ('b59526e4-706a-42ed-a088-cc530477a9bd', 'AY', null, '', null, '新菜单', '6', null, null, null);
INSERT INTO `bdf2_url` VALUES ('b66a956f-4617-424e-8e32-c1545d935801', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '专项工作', '4', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.report.opjv05report.d');
INSERT INTO `bdf2_url` VALUES ('ba767a2d-8720-4a1b-8dbb-4923c720c099', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '月度计划任务发布', '1', '3a50a217-5cd9-4952-a197-65b018a0ab21', null, 'com.jghz.op.view.opjv05.d');
INSERT INTO `bdf2_url` VALUES ('bbd2cb1a-8a55-4171-8425-aabefc94cd85', 'AY', null, '', 'url(skin>common/icons.gif) -262px -100px', 'URL权限维护', '2', '09009f8d-eec9-4e8c-b27f-3b444855ab42', null, 'bdf2.core.view.role.url.RoleUrlMaintain.d');
INSERT INTO `bdf2_url` VALUES ('c1cec8e6-8222-4f09-ba79-e862c693fa05', 'AY', null, '', 'url(>skin>common/icons.gif) -100px -20px', '基础数据维护', '2', null, null, '');
INSERT INTO `bdf2_url` VALUES ('c256e259-c96c-4473-8c64-c7ec520ebddd', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '年度计划任务汇总', '5', '47437cf2-b0e0-4c10-b76f-1c0de99a3663', null, 'com.jghz.op.view.opjv043.d');
INSERT INTO `bdf2_url` VALUES ('c47cfc7d-16c2-4016-99ec-3d771a6971f9', 'AY', null, '', 'url(skin>common/icons.gif) -62px -141px', '菜单维护', '1', '8b35ddf4-4ce0-4bb7-9a9c-95e08ac7e63d', null, 'bdf2.core.view.url.UrlMaintain.d');
INSERT INTO `bdf2_url` VALUES ('c7b92df0-d688-4d53-8a1a-f55405776b57', 'AY', null, '\0', 'url(>skin>common/icons.gif) -300px -260px', '专题任务审核', '3', '5a5497d1-4611-403c-a43a-810448a23208', null, 'com.jghz.op.view.opjv04.d');
INSERT INTO `bdf2_url` VALUES ('cc66e67d-d939-4cc6-bc2a-0853f52f0762', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '年度计划任务发布', '2', '47437cf2-b0e0-4c10-b76f-1c0de99a3663', null, 'com.jghz.op.view.opjv04.d');
INSERT INTO `bdf2_url` VALUES ('d3bbfcb7-a6eb-4c02-acd8-f7dbc3167fe9', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -60px', '我的任务', '1', '32e5a27e-d03c-49bd-a92b-0a664de8e9c2', null, 'uflo/todo');
INSERT INTO `bdf2_url` VALUES ('d56090ac-3fb8-47b9-a13f-a317e3341f2d', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '资产采购', '6', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.report.opjv06report.d');
INSERT INTO `bdf2_url` VALUES ('e0503b76-0715-484b-b472-691cee1af7f5', 'AY', null, '', null, '控制中心', '6', '8b35ddf4-4ce0-4bb7-9a9c-95e08ac7e63d', null, 'uflo/central');
INSERT INTO `bdf2_url` VALUES ('e3a2ea09-5c41-48a3-9e4c-d0db5a063fcd', 'AY', null, '', 'url(skin>common/icons.gif) -101px -121px', '群组维护', '5', '09009f8d-eec9-4e8c-b27f-3b444855ab42', null, 'bdf2.core.view.group.GroupMaintain.d');
INSERT INTO `bdf2_url` VALUES ('e5af06f5-cf16-4c26-92db-44003ed95716', 'AY', null, '', 'url(skin>common/icons.gif) -181px -41px', '组件权限维护', '3', '09009f8d-eec9-4e8c-b27f-3b444855ab42', null, 'bdf2.core.view.role.component.RoleComponentMaintain.d');
INSERT INTO `bdf2_url` VALUES ('e6b17800-b67f-4e07-a0ff-c20a4344ebbb', 'AY', null, '', null, '其它', '5', null, null, null);
INSERT INTO `bdf2_url` VALUES ('eda572a9-f951-4376-bda4-9797483578f6', 'AY', null, '\0', 'url(>skin>common/icons.gif) -300px -40px', '合同', '13', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.view.opjvbb02.d');
INSERT INTO `bdf2_url` VALUES ('ee242fd6-399a-47ac-a535-67a4cc9fbf8b', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '合同', '1', '932f3713-c121-4889-a51f-81914dd02d01', null, 'com.jghz.op.view.opjv02.d');
INSERT INTO `bdf2_url` VALUES ('f2ddbf31-66a8-4061-80bd-05baa5860177', 'AY', null, '', 'url(>skin>common/icons.gif) -300px -260px', '经济指标', '5', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.report.opjv03report.d');
INSERT INTO `bdf2_url` VALUES ('f3c121d6-4921-4f05-a440-032af2bac3e9', 'AY', null, '\0', 'url(>skin>common/icons.gif) -300px -260px', '年度计划查询', '10', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.view.opjv043.d');
INSERT INTO `bdf2_url` VALUES ('fbce0f1f-b492-41fd-8779-7c84347b79e5', 'AY', null, '\0', 'url(>skin>common/icons.gif) -300px -260px', '月度计划与完成情况查询', '11', '0dbbb451-c1ce-4dad-91ce-e186af0bbc4c', null, 'com.jghz.op.view.opjv053.d');
INSERT INTO `bdf2_url` VALUES ('root-AY', 'AY', null, '', 'url(skin>common/icons.gif) -102px -101px', '系统管理', '1', null, null, null);

-- ----------------------------
-- Table structure for bdf2_url_component
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_url_component`;
CREATE TABLE `bdf2_url_component` (
  `ID_` varchar(60) NOT NULL,
  `AUTHORITY_TYPE_` varchar(10) NOT NULL,
  `ROLE_ID_` varchar(60) DEFAULT NULL,
  `URL_ID_` varchar(60) DEFAULT NULL,
  `COMPONENT_ID_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FKFCFBDBDCD4C56CC` (`COMPONENT_ID_`) USING BTREE,
  CONSTRAINT `bdf2_url_component_ibfk_1` FOREIGN KEY (`COMPONENT_ID_`) REFERENCES `bdf2_component` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_url_component
-- ----------------------------
INSERT INTO `bdf2_url_component` VALUES ('1c68e4f2-0b55-4463-b87c-0c00c75219a8', 'read', 'eb7254ae-ac73-44d0-9ed9-5e03aa992e21', '32e27af9-d1cc-4cac-93f9-d8fb8b52d756', '8584ff95-80f9-47d2-9ac4-791f25d21e51');
INSERT INTO `bdf2_url_component` VALUES ('4561f76c-d3c8-4aaa-8603-2553f9318778', 'read', 'da3e2a62-865f-4903-8919-82a6970d36e3', '254008b9-c7a4-4779-ab47-ca0e3d3a2917', '77e694de-1bd2-4587-abbd-f624ca63c6c1');
INSERT INTO `bdf2_url_component` VALUES ('722de050-f5d2-4e1a-aabb-56351cec519f', 'read', 'da3e2a62-865f-4903-8919-82a6970d36e3', '254008b9-c7a4-4779-ab47-ca0e3d3a2917', 'd34cdb4b-e378-426f-92ac-f2cc905ddfab');
INSERT INTO `bdf2_url_component` VALUES ('7388be83-199b-4003-9031-4e161d4f59ac', 'read', 'da3e2a62-865f-4903-8919-82a6970d36e3', '254008b9-c7a4-4779-ab47-ca0e3d3a2917', '840e2a03-1216-47a2-b31e-11da37b286f1');
INSERT INTO `bdf2_url_component` VALUES ('85bbe570-020e-400c-9822-442cb05a33ff', 'read', 'd697f9d6-fb00-40ed-9385-ff398e9e351b', '32e27af9-d1cc-4cac-93f9-d8fb8b52d756', 'e73420dc-baa7-427d-82cb-e39c5601aafb');
INSERT INTO `bdf2_url_component` VALUES ('8b5af995-8086-4804-88a2-80ad181f0cf8', 'read', 'eb7254ae-ac73-44d0-9ed9-5e03aa992e21', '32e27af9-d1cc-4cac-93f9-d8fb8b52d756', 'cffb7e8f-ef44-451a-a60a-2ec64c4db0e8');
INSERT INTO `bdf2_url_component` VALUES ('a2550af0-f03b-4896-88de-a7a8e1936f72', 'read', 'da3e2a62-865f-4903-8919-82a6970d36e3', '254008b9-c7a4-4779-ab47-ca0e3d3a2917', '424b2be8-5123-4722-8eff-925792e76fd0');
INSERT INTO `bdf2_url_component` VALUES ('ae35d9c5-7969-43c0-beca-4f17663c30c2', 'read', 'da3e2a62-865f-4903-8919-82a6970d36e3', '254008b9-c7a4-4779-ab47-ca0e3d3a2917', '6e6994ec-b950-42da-9490-da9e1fe83951');
INSERT INTO `bdf2_url_component` VALUES ('e8ceea60-7889-4b05-a898-ffd2a1056b17', 'read', 'eb7254ae-ac73-44d0-9ed9-5e03aa992e21', '32e27af9-d1cc-4cac-93f9-d8fb8b52d756', '492a2fa3-dc15-48c0-a00c-b152e0ae3f9b');

-- ----------------------------
-- Table structure for bdf2_user
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_user`;
CREATE TABLE `bdf2_user` (
  `USERNAME_` varchar(60) NOT NULL,
  `ADDRESS_` varchar(120) DEFAULT NULL,
  `ADMINISTRATOR_` bit(1) NOT NULL,
  `BIRTHDAY_` datetime DEFAULT NULL,
  `CNAME_` varchar(60) NOT NULL,
  `COMPANY_ID_` varchar(60) NOT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `EMAIL_` varchar(60) DEFAULT NULL,
  `ENABLED_` bit(1) NOT NULL,
  `ENAME_` varchar(60) DEFAULT NULL,
  `MALE_` bit(1) NOT NULL,
  `MOBILE_` varchar(20) DEFAULT NULL,
  `PASSWORD_` varchar(70) NOT NULL,
  `SALT_` varchar(10) NOT NULL,
  PRIMARY KEY (`USERNAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_user
-- ----------------------------
INSERT INTO `bdf2_user` VALUES ('admin', '2', '', null, '系统管理员', 'AY', null, 'xxxx@xxxx.com', '', 'administrator', '', '18917888888', 'fef5e264e8a7099c2dae843c9525db8db32bd358', '850');
INSERT INTO `bdf2_user` VALUES ('Caiz', null, '\0', null, '蔡振', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Chengs', null, '\0', null, '程胜', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Chengy', null, '\0', null, '程迎', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Chengyh', null, '\0', null, '程艳辉', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Chenj', null, '\0', null, '陈江', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Cuihh', null, '\0', null, '崔海华', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('dengl', null, '\0', null, '邓丽', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Duanhl', null, '\0', null, '段慧琳', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Duanjh', null, '\0', null, '段金虎', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Duanwb', null, '\0', null, '段伟博', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Fangsl', null, '\0', null, '方少林', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('fengj', null, '\0', null, '冯静', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Gaocr', null, '\0', null, '高长仁', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Gaof', null, '\0', null, '高飞', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', 'b79b915481155eb70317fa5d640c87e9574b14f5', '967');
INSERT INTO `bdf2_user` VALUES ('Gex', null, '\0', null, '葛璇', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Guangwx', null, '\0', null, '光文祥', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Guohy', null, '\0', null, '郭红雨', 'AY', '2018-01-19 09:11:36', '123@123.com', '', 'guohongyu', '', '12312312312', '848a05c042fa596701b13969d05f89d9bb6abaa0', '5');
INSERT INTO `bdf2_user` VALUES ('hewq', null, '\0', null, '何文钦', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Huangsx', null, '\0', null, '黄仕鑫', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('huangy', null, '\0', null, '黄莹', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Huoj', null, '\0', null, '霍俊', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('huyang8', null, '\0', null, '胡洋', 'AY', '2018-01-26 14:41:49', '1212@qq.com', '', 'gf', '', '18607169044', '21232F297A57A5A743894A0E4A801FC3', '79');
INSERT INTO `bdf2_user` VALUES ('Jiam', null, '\0', null, '贾梦', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Jinw', null, '\0', null, '金伟', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', 'eddd16dd520d2b0e38e739b2be1ee0f3d9b78ecd', '126');
INSERT INTO `bdf2_user` VALUES ('Jizb', null, '\0', null, '吉增宝', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Kongwq', null, '\0', null, '孔维强', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('lexh', null, '\0', null, '乐雪焕', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Lih', null, '\0', null, '李辉', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Lijc', null, '\0', null, '李进成', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Liq', null, '\0', null, '李庆', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('liqw', null, '\0', null, '李倩炜', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Liuw', null, '\0', null, '刘炜', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '92c1024ebf1f1694e3d09d662d2ae07735800275', '759');
INSERT INTO `bdf2_user` VALUES ('liuweilong', null, '', null, '系统管理员', '00', null, 'xxxx@xxxx.com', '', 'administrator', '', '18917888888', '35fc20b1749a2688c79f6978cf3e193fb1b566b5', '258');
INSERT INTO `bdf2_user` VALUES ('liuwl', null, '\0', null, '刘伟龙', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('liuyg', null, '\0', null, '刘艳改', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('liyg', null, '\0', null, '李永桂', 'AY', null, '1212@qq.com', '\0', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Luj', null, '\0', null, '陆军', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Luox', null, '\0', null, '罗鑫', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('LuW', null, '\0', null, '卢玮', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('luzh', null, '\0', null, '卢洲', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Meip', null, '\0', null, '梅鹏', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Mengly', null, '\0', null, '孟路园', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('pengkan_123', null, '\0', null, '彭侃', 'AY', '2018-02-01 13:52:01', '1212@qq.com', '', 'gf', '', '18607169044', '21232F297A57A5A743894A0E4A801FC3', '79');
INSERT INTO `bdf2_user` VALUES ('Pijh', null, '\0', null, '皮江红', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Qinl', null, '\0', null, '秦亮', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Qinxc', null, '\0', null, '秦向春', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Qiy', null, '\0', null, '祁源', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Shanxj', null, '\0', null, '单新健', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('songwg', null, '\0', null, '宋伟刚', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Songxy', null, '\0', null, '宋晓彦', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Suhw', null, '\0', null, '苏宏伟', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Taoxf', null, '\0', null, '陶小飞', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('taozy', null, '\0', null, '陶子夜', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Tongt', null, '\0', null, '童涛', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Wangh', null, '\0', null, '王晖', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Wanghb', null, '\0', null, '王浩宾', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Wangr', null, '\0', null, '汪锐', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Wangrx', null, '\0', null, '王瑞霞', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Weihj', null, '\0', null, '魏华杰', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('weij', null, '\0', null, '魏健', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('weij90', null, '\0', null, '卫杰', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Wux', null, '\0', null, '吴茜', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Xiangtf', null, '\0', null, '向腾飞', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Xianyuxb', null, '\0', null, '鲜于晓波', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Xiars', null, '\0', null, '夏任司', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Xinw', null, '\0', null, '辛巍', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Xiongmy', null, '\0', null, '熊梦吟', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Xiongw', null, '\0', null, '熊伟', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Xuhj', null, '\0', null, '徐宏杰', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('xuxh1', null, '\0', null, '许晓卉', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('yangpy', null, '\0', null, '杨佩莹', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Yangyi', null, '\0', null, '杨懿', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('yangying', null, '\0', null, '杨迎', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Yanmz', null, '\0', null, '闫美珍', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Yaon', null, '\0', null, '姚娜', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Yim', null, '\0', null, '易明', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Yuany', null, '\0', null, '袁殷', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('yujj', null, '\0', null, '于晶锦', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Yulr', null, '\0', null, '余良睿', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Yupy', null, '\0', null, '喻培元', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Zenglq', null, '\0', null, '曾利琴', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('zengs1', null, '\0', null, '曾闪', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Zengzm', null, '\0', null, '曾早明', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Zhangf', null, '\0', null, '张帆', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Zhangl', null, '\0', null, '张磊', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Zhangzh', null, '\0', null, '张振辉', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Zhaom', null, '\0', null, '赵明', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('zhengwj', null, '\0', null, '郑文君', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('zhoud', null, '\0', null, '周栋', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '4395cb3fd153e06c5e289dfc27239500df8e8183', '448');
INSERT INTO `bdf2_user` VALUES ('Zhouwy', null, '\0', null, '周文莹', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');
INSERT INTO `bdf2_user` VALUES ('Zhuhw', null, '\0', null, '朱红卫', 'AY', '2017-11-17 10:58:44', '1212@qq.com', '', 'gf', '', '13456789012', '9014223aedd8986c02986cdefef5389cc472f3ce', '79');

-- ----------------------------
-- Table structure for bdf2_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_user_dept`;
CREATE TABLE `bdf2_user_dept` (
  `ID_` varchar(60) NOT NULL,
  `DEPT_ID_` varchar(60) NOT NULL,
  `USERNAME_` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_user_dept
-- ----------------------------
INSERT INTO `bdf2_user_dept` VALUES ('15f76425-62bc-45be-a0e8-05ea1f7f8dea', '02', 'Yaon');
INSERT INTO `bdf2_user_dept` VALUES ('1c0aa095-3c27-4882-b969-7578e41d31f8', '012', 'Xiongw');
INSERT INTO `bdf2_user_dept` VALUES ('1c89839f-0a53-4fc0-add3-3e44b44ee504', '05', 'Zengzm');
INSERT INTO `bdf2_user_dept` VALUES ('26b79b98-cd41-4e72-8be1-027854576dbd', '013', 'lexh');
INSERT INTO `bdf2_user_dept` VALUES ('5233dcd5-68dd-4df4-ba71-218ff94a8772', '012', 'Xinw');
INSERT INTO `bdf2_user_dept` VALUES ('953f68bd-5684-4919-adfc-9ea0f603976b', '041', 'luzh');
INSERT INTO `bdf2_user_dept` VALUES ('b8209f29-2915-4d97-9900-d144c467ac11', '023', 'Guohy');
INSERT INTO `bdf2_user_dept` VALUES ('d4c6ff06-9f8c-42a2-ba34-df6c99c3529e', '03', 'Gaof');
INSERT INTO `bdf2_user_dept` VALUES ('fdb8a274-76a9-4085-a640-2575e174897d', '01', 'Cuihh');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0002', '03', '00002');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0003', '03', 'liuwl');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0004', '03', 'Liuw');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0005', '03', 'Luj');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0006', '03', 'Qinl');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0007', '03', 'Qinxc');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0008', '03', 'songwg');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0009', '03', 'Wangrx');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0010', '03', 'Xianyuxb');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0011', '03', 'xuxh1');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0012', '03', '00012');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0013', '03', 'zengs1');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0014', '03', 'Zhangzh');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0015', '041', 'Shanxj');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0016', '041', 'Songxy');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0017', '041', 'Xiangtf');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0018', '041', 'Yangyi');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0019', '05', 'Duanhl');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0020', '05', 'Xiongmy');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0021', '05', 'Xuhj');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0022', '05', 'Yanmz');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0023', '05', '00023');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0024', '04', 'Chengs');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0025', '04', 'Huoj');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0026', '04', 'Jiam');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0027', '04', 'LuW');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0028', '04', '00028');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0029', '04', 'Yuany');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0030', '04', 'Zhangf');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0031', '04', 'zhengwj');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0032', '04', 'Zhouwy');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0033', '022', 'Chengyh');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0034', '022', 'Lijc');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0035', '022', 'liuyg');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0036', '022', 'Qiy');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0037', '022', 'weij90');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0038', '022', 'Wux');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0039', '022', 'Yulr');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0040', '022', 'Zhangl');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0041', '023', 'hewq');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0043', '023', 'Suhw');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0044', '023', 'weij');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0045', '023', 'Yupy');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0046', '023', 'Zhuhw');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0047', '00', 'Chenj');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0048', '00', '00048');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0049', '00', 'Wangh');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0050', '011', 'Chengy');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0051', '011', 'Gex');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0052', '011', 'Luox');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0053', '011', 'yangying');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0054', '011', 'Zenglq');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0055', '011', 'Zhaom');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0056', '02', 'Duanjh');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0057', '02', 'Jizb');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0058', '02', 'Lih');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0060', '021', 'dengl');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0061', '021', 'Kongwq');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0062', '021', '00062');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0063', '021', 'liqw');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0064', '021', 'Liq');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0065', '021', 'liyg');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0066', '021', 'Meip');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0067', '021', 'Pijh');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0068', '021', 'taozy');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0069', '021', 'Weihj');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0070', '06', 'fengj');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0071', '06', 'huangy');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0072', '06', '00072');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0073', '06', 'yangpy');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0074', '06', 'yujj');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0075', '01', 'Caiz');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0077', '01', 'Mengly');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0079', '012', 'Fangsl');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0080', '012', 'Jinw');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0082', '012', '00082');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0083', '012', 'Wanghb');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0084', '012', 'Xiars');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0085', '012', 'Yim');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0087', '013', 'Duanwb');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0088', '013', 'Gaocr');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0089', '013', 'Guangwx');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0090', '013', 'Huangsx');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0091', '013', 'Taoxf');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0092', '013', 'Tongt');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0093', '013', 'Wangr');
INSERT INTO `bdf2_user_dept` VALUES ('XXX0095', '013', 'zhoud');

-- ----------------------------
-- Table structure for bdf2_user_position
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_user_position`;
CREATE TABLE `bdf2_user_position` (
  `ID_` varchar(60) NOT NULL,
  `POSITION_ID_` varchar(60) NOT NULL,
  `USERNAME_` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdf2_user_position
-- ----------------------------
INSERT INTO `bdf2_user_position` VALUES ('02bca7c2-8597-41e8-a006-7959f7ad3800', 'GW0002', 'Xuhj');
INSERT INTO `bdf2_user_position` VALUES ('07cd32d8-34bf-454d-bd61-0fe82700f565', 'GW0005', 'Cuihh');
INSERT INTO `bdf2_user_position` VALUES ('07f987dd-3dca-48f9-9dae-095d4083d46e', 'GW0005', 'liuwl');
INSERT INTO `bdf2_user_position` VALUES ('08b4bf18-b2e5-45ea-abf2-650feace2b0d', 'GW0005', 'Zhangl');
INSERT INTO `bdf2_user_position` VALUES ('0daf5a6c-e28c-4366-9804-1b3f8e5cf897', 'GW0005', 'Liuw');
INSERT INTO `bdf2_user_position` VALUES ('11', 'GW0005', 'Duanwb');
INSERT INTO `bdf2_user_position` VALUES ('12', 'GW0005', 'Fangsl');
INSERT INTO `bdf2_user_position` VALUES ('13e77d45-7d4e-4658-a43d-04bfc8b32849', 'GW0005', 'Duanjh');
INSERT INTO `bdf2_user_position` VALUES ('16', 'GW0005', 'Gex');
INSERT INTO `bdf2_user_position` VALUES ('17', 'GW0005', 'Guangwx');
INSERT INTO `bdf2_user_position` VALUES ('18', 'GW0005', 'hewq');
INSERT INTO `bdf2_user_position` VALUES ('18d932d8-0a0e-49d1-b87a-6d076ec82bd1', 'GW0001', 'Cuihh');
INSERT INTO `bdf2_user_position` VALUES ('19', 'GW0005', 'Huangsx');
INSERT INTO `bdf2_user_position` VALUES ('1b6ecb03-36b3-4393-9d42-6a4e4a1709f0', 'GW0005', 'Zhangzh');
INSERT INTO `bdf2_user_position` VALUES ('2', 'GW0005', 'Caiz');
INSERT INTO `bdf2_user_position` VALUES ('20', 'GW0005', 'huangy');
INSERT INTO `bdf2_user_position` VALUES ('21', 'GW0005', 'Huoj');
INSERT INTO `bdf2_user_position` VALUES ('22', 'GW0005', 'Jiam');
INSERT INTO `bdf2_user_position` VALUES ('23', 'GW0005', 'Jinw');
INSERT INTO `bdf2_user_position` VALUES ('25', 'GW0005', 'Kongwq');
INSERT INTO `bdf2_user_position` VALUES ('25a86d28-c9a0-4233-a655-ba3ae20c59c6', 'GW0002', 'Yuany');
INSERT INTO `bdf2_user_position` VALUES ('26', 'GW0005', 'lexh');
INSERT INTO `bdf2_user_position` VALUES ('27', 'GW0005', 'Lih');
INSERT INTO `bdf2_user_position` VALUES ('27eff9a4-2bcf-432d-aea0-2f77140ccb98', 'GW0002', 'yangying');
INSERT INTO `bdf2_user_position` VALUES ('28', 'GW0005', 'Lijc');
INSERT INTO `bdf2_user_position` VALUES ('281f235f-dc84-4fa7-859a-db952c9c16cb', 'GW0001', 'Zhangl');
INSERT INTO `bdf2_user_position` VALUES ('29', 'GW0005', 'Liq');
INSERT INTO `bdf2_user_position` VALUES ('2979c4e9-373a-485e-8495-82dae194671c', 'GW0001', 'Yaon');
INSERT INTO `bdf2_user_position` VALUES ('30', 'GW0005', 'liqw');
INSERT INTO `bdf2_user_position` VALUES ('32', 'GW0005', 'liuweilong');
INSERT INTO `bdf2_user_position` VALUES ('34', 'GW0005', 'liuyg');
INSERT INTO `bdf2_user_position` VALUES ('35', 'GW0005', 'liyg');
INSERT INTO `bdf2_user_position` VALUES ('3512d250-aa04-4c9b-ad95-8068c596507f', 'GW0005', 'fengj');
INSERT INTO `bdf2_user_position` VALUES ('36', 'GW0005', 'Luj');
INSERT INTO `bdf2_user_position` VALUES ('37', 'GW0005', 'Luox');
INSERT INTO `bdf2_user_position` VALUES ('3781a5ac-3ebb-4944-b644-d53d0fb96161', 'GW0005', 'yangying');
INSERT INTO `bdf2_user_position` VALUES ('37d5889d-9472-4a14-9ee8-40607c57c0df', 'GW0004', 'liuwl');
INSERT INTO `bdf2_user_position` VALUES ('39', 'GW0005', 'luzh');
INSERT INTO `bdf2_user_position` VALUES ('3b2b13c3-967f-4c95-89af-94915e5ee9cf', 'GW0001', 'zengs1');
INSERT INTO `bdf2_user_position` VALUES ('3be035d0-9fa0-4992-b9c0-b22ab8e729a5', 'GW0005', 'Gaocr');
INSERT INTO `bdf2_user_position` VALUES ('3d12134a-a47f-4420-a9b3-b311f884efbb', 'GW0001', 'yujj');
INSERT INTO `bdf2_user_position` VALUES ('3db9edc1-3058-4fb6-a97e-24436fb327bd', 'GW0003', 'Wangh');
INSERT INTO `bdf2_user_position` VALUES ('4', 'GW0005', 'Chengy');
INSERT INTO `bdf2_user_position` VALUES ('40', 'GW0005', 'Meip');
INSERT INTO `bdf2_user_position` VALUES ('403aeb1e-409f-42d9-abfd-5fbfa1329748', 'GW0001', 'Zhangzh');
INSERT INTO `bdf2_user_position` VALUES ('41', 'GW0005', 'Mengly');
INSERT INTO `bdf2_user_position` VALUES ('43', 'GW0005', 'Qinl');
INSERT INTO `bdf2_user_position` VALUES ('44', 'GW0005', 'Qinxc');
INSERT INTO `bdf2_user_position` VALUES ('4411ffb3-b7da-4a49-aa1d-0824454cca94', 'GW0001', 'liuwl');
INSERT INTO `bdf2_user_position` VALUES ('45', 'GW0005', 'Qiy');
INSERT INTO `bdf2_user_position` VALUES ('46', 'GW0005', 'Shanxj');
INSERT INTO `bdf2_user_position` VALUES ('47', 'GW0005', 'songwg');
INSERT INTO `bdf2_user_position` VALUES ('48', 'GW0005', 'Songxy');
INSERT INTO `bdf2_user_position` VALUES ('49', 'GW0005', 'Suhw');
INSERT INTO `bdf2_user_position` VALUES ('4e2eb501-1dc9-4319-92c8-5217f3e00cb0', 'GW0005', 'Yaon');
INSERT INTO `bdf2_user_position` VALUES ('50', 'GW0005', 'Taoxf');
INSERT INTO `bdf2_user_position` VALUES ('51', 'GW0005', 'taozy');
INSERT INTO `bdf2_user_position` VALUES ('52', 'GW0005', 'Tongt');
INSERT INTO `bdf2_user_position` VALUES ('54', 'GW0005', 'Wanghb');
INSERT INTO `bdf2_user_position` VALUES ('55', 'GW0005', 'Wangr');
INSERT INTO `bdf2_user_position` VALUES ('57', 'GW0005', 'Weihj');
INSERT INTO `bdf2_user_position` VALUES ('58', 'GW0005', 'weij');
INSERT INTO `bdf2_user_position` VALUES ('59', 'GW0005', 'weij90');
INSERT INTO `bdf2_user_position` VALUES ('5b0b136d-9d35-4d9d-bcfb-1e0b5dadc10b', 'GW0005', 'zengs1');
INSERT INTO `bdf2_user_position` VALUES ('5bf5fbb7-5dcd-45dd-b23f-a41c3c9fc23b', 'GW0001', 'Gaocr');
INSERT INTO `bdf2_user_position` VALUES ('5caee931-43fc-4c67-9afd-ff227c3dcb4f', 'GW0005', 'Yim');
INSERT INTO `bdf2_user_position` VALUES ('60', 'GW0005', 'Wux');
INSERT INTO `bdf2_user_position` VALUES ('61', 'GW0005', 'Xiangtf');
INSERT INTO `bdf2_user_position` VALUES ('62', 'GW0005', 'Xianyuxb');
INSERT INTO `bdf2_user_position` VALUES ('62762c93-e480-47f9-a9f3-040618f3e358', 'GW0002', 'Gaocr');
INSERT INTO `bdf2_user_position` VALUES ('63', 'GW0005', 'Xiars');
INSERT INTO `bdf2_user_position` VALUES ('64', 'GW0005', 'Xinw');
INSERT INTO `bdf2_user_position` VALUES ('65', 'GW0005', 'Xiongmy');
INSERT INTO `bdf2_user_position` VALUES ('66', 'GW0005', 'Xiongw');
INSERT INTO `bdf2_user_position` VALUES ('69', 'GW0005', 'yangpy');
INSERT INTO `bdf2_user_position` VALUES ('6b1cd4a2-062f-4248-b7f7-169a54b4282a', 'GW0001', 'Wangrx');
INSERT INTO `bdf2_user_position` VALUES ('70', 'GW0005', 'Yangyi');
INSERT INTO `bdf2_user_position` VALUES ('72', 'GW0005', 'Yanmz');
INSERT INTO `bdf2_user_position` VALUES ('75', 'GW0005', 'Yuany');
INSERT INTO `bdf2_user_position` VALUES ('76', 'GW0005', 'yujj');
INSERT INTO `bdf2_user_position` VALUES ('77', 'GW0005', 'Yulr');
INSERT INTO `bdf2_user_position` VALUES ('78', 'GW0005', 'Yupy');
INSERT INTO `bdf2_user_position` VALUES ('79', 'GW0005', 'Zenglq');
INSERT INTO `bdf2_user_position` VALUES ('794fa91a-6595-4370-acee-1f14c6ef8d34', 'GW0004', 'xuxh1');
INSERT INTO `bdf2_user_position` VALUES ('8', 'GW0005', 'dengl');
INSERT INTO `bdf2_user_position` VALUES ('81', 'GW0005', 'Zengzm');
INSERT INTO `bdf2_user_position` VALUES ('81d271f5-2ed6-4f41-8b02-388ca53678a9', 'GW0005', 'Chengs');
INSERT INTO `bdf2_user_position` VALUES ('82', 'GW0005', 'Zhangf');
INSERT INTO `bdf2_user_position` VALUES ('8234dec3-605f-418f-8a87-e09a1ccbacdb', 'GW0001', 'Pijh');
INSERT INTO `bdf2_user_position` VALUES ('8381ec3f-6f09-4207-9a7b-0ca02d36ed39', 'GW0001', '00002');
INSERT INTO `bdf2_user_position` VALUES ('85', 'GW0005', 'Zhaom');
INSERT INTO `bdf2_user_position` VALUES ('86', 'GW0005', 'zhengwj');
INSERT INTO `bdf2_user_position` VALUES ('87', 'GW0005', 'zhoud');
INSERT INTO `bdf2_user_position` VALUES ('88', 'GW0005', 'Zhouwy');
INSERT INTO `bdf2_user_position` VALUES ('88e9f763-803d-4be4-ba21-b9642f4033d3', 'GW0001', 'Yim');
INSERT INTO `bdf2_user_position` VALUES ('89', 'GW0005', 'Zhuhw');
INSERT INTO `bdf2_user_position` VALUES ('8defe420-8d7e-4e58-8111-bf888640dd72', 'GW0005', 'Chengyh');
INSERT INTO `bdf2_user_position` VALUES ('9a64f08b-988c-434b-8ffc-96c88b1877cb', 'GW0001', 'Jizb');
INSERT INTO `bdf2_user_position` VALUES ('9e8d2c4e-42be-49ef-82fa-dd5d104c2ef4', 'GW0001', 'xuxh1');
INSERT INTO `bdf2_user_position` VALUES ('a12c42d2-2fea-4144-ac99-c2a3a4c6193b', 'GW0001', 'LuW');
INSERT INTO `bdf2_user_position` VALUES ('a3928b18-4ffd-4389-8534-c8a2b0f5e8a6', 'GW0005', 'Jizb');
INSERT INTO `bdf2_user_position` VALUES ('a511cfb1-2ea9-41b4-9d5a-91f8b5a7ab1a', 'GW0005', 'Xuhj');
INSERT INTO `bdf2_user_position` VALUES ('ae8b57db-749b-4006-be68-943b88713bf5', 'GW0002', 'yujj');
INSERT INTO `bdf2_user_position` VALUES ('b3cb7572-793e-47fa-a3cd-104a6d11d103', 'GW0005', 'xuxh1');
INSERT INTO `bdf2_user_position` VALUES ('bae55755-5d00-48bd-ba4c-643a3a679120', 'GW0005', 'Guohy');
INSERT INTO `bdf2_user_position` VALUES ('cd4b2d9e-becf-4b60-b447-ef38286fa461', 'GW0002', 'Cuihh');
INSERT INTO `bdf2_user_position` VALUES ('d597f0af-1bbf-4d3d-a68e-722ecca9c21d', 'GW0005', 'Duanhl');
INSERT INTO `bdf2_user_position` VALUES ('d7324c4b-5522-4cef-95e9-882abed95a7d', 'GW0005', 'Gaof');
INSERT INTO `bdf2_user_position` VALUES ('dce9ef22-2fc8-4354-8062-92447aa3c2a6', 'GW0005', 'Wangrx');
INSERT INTO `bdf2_user_position` VALUES ('e1e22930-aceb-4ee9-9735-44d1ac199a73', 'GW0002', 'Yaon');
INSERT INTO `bdf2_user_position` VALUES ('eb675ba0-875d-4f3c-bf94-441f4b92d744', 'GW0002', 'Qinxc');
INSERT INTO `bdf2_user_position` VALUES ('ec374bab-abbc-4b98-928c-aecb8f71e8d3', 'GW0003', 'Chenj');
INSERT INTO `bdf2_user_position` VALUES ('f075d59e-4e5e-4c06-ab58-a274b13f286c', 'GW0001', 'yangying');
INSERT INTO `bdf2_user_position` VALUES ('f136270c-fb93-417e-853c-04cc7dc9d660', 'GW0005', 'Pijh');
INSERT INTO `bdf2_user_position` VALUES ('f53fb583-16e1-4c84-ac2a-3e38de42ab5c', 'GW0001', 'Duanhl');
INSERT INTO `bdf2_user_position` VALUES ('fca04024-bd82-4943-9a9a-dca2b69ae662', 'GW0005', 'LuW');
INSERT INTO `bdf2_user_position` VALUES ('fea6407f-af3c-4511-bc91-6fcdb946e68e', 'GW0002', 'Yim');

-- ----------------------------
-- Table structure for bdf2_user_wechat
-- ----------------------------
DROP TABLE IF EXISTS `bdf2_user_wechat`;
CREATE TABLE `bdf2_user_wechat` (
  `ID_` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ACCOUNT_` varchar(20) DEFAULT NULL COMMENT 'OA账号',
  `OPEN_ID_` varchar(100) DEFAULT NULL COMMENT '微信openid',
  `CHATNICK_` varchar(250) DEFAULT NULL COMMENT '微信昵称',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户微信绑定表';

-- ----------------------------
-- Records of bdf2_user_wechat
-- ----------------------------
INSERT INTO `bdf2_user_wechat` VALUES ('17', 'huyang8', 'oMjQV0arWpr43Xq_jzWxFN_s2cEQ', '芥末不是末');

-- ----------------------------
-- Table structure for tbdca1
-- ----------------------------
DROP TABLE IF EXISTS `tbdca1`;
CREATE TABLE `tbdca1` (
  `DCA1_ID_` varchar(50) NOT NULL,
  `AUTHORI_` varchar(20) DEFAULT NULL,
  `COMP_ID_` varchar(10) DEFAULT NULL,
  `COMP_TAB_CODE_` varchar(20) DEFAULT NULL,
  `COMP_TAB_EXPLN_` varchar(60) DEFAULT NULL,
  `CREATE_EMP_` varchar(20) DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `FUNC_POWER_` varchar(10) DEFAULT NULL,
  `OWNER_` varchar(10) DEFAULT NULL,
  `SYS_TYPE_` varchar(10) DEFAULT NULL,
  `UPDATE_EMP_` varchar(20) DEFAULT NULL,
  `UPDATE_TIME_` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`DCA1_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbdca1
-- ----------------------------
INSERT INTO `tbdca1` VALUES ('176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, 'AY', 'OP_NO_', '作业类型', 'admin', '2017-11-12 10:54:59', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1` VALUES ('42c081a2-fcf7-4ea1-a13f-a692a3e724ad', null, 'AY', 'OP_LEVEL_', '级别', null, '2017-11-10 17:14:18', null, null, 'OP', 'admin', '2017-11-26 18:15:19', '3');
INSERT INTO `tbdca1` VALUES ('443e9c41-cf8b-4b70-8957-85707e2431f1', null, 'AY', 'OP_TYPE_', '类型对照表', '00001', '2017-12-03 18:13:13', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1` VALUES ('4f00788b-8448-4b35-a9fa-a550dba5165d', null, 'AY', 'OP04_STATUS_', '任务状态', '00001', '2017-11-24 10:56:44', null, null, 'OP', '00001', '2017-12-06 15:08:43', '1');
INSERT INTO `tbdca1` VALUES ('854ec791-bece-4fa8-bbdb-4fc528442d51', null, 'AY', 'TYPE_', '状态', null, '2017-12-03 20:12:19', null, null, 'OP', null, '2017-12-03 20:13:01', '1');
INSERT INTO `tbdca1` VALUES ('bbcef483-ba1e-4643-84b5-35b21d1d3dbc', null, 'AY', 'OP04_TYPE_', '类别对照', '00001', '2017-11-28 16:12:00', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1` VALUES ('e2f6080b-681c-46d4-9282-a76cbbf8e54c', null, 'AY', 'OP02_STATUS_', '状态', '00001', '2017-12-03 19:42:01', null, null, 'OP', null, null, '0');

-- ----------------------------
-- Table structure for tbdca1a
-- ----------------------------
DROP TABLE IF EXISTS `tbdca1a`;
CREATE TABLE `tbdca1a` (
  `DCA1A_ID_` varchar(50) NOT NULL,
  `COMP_ID_` varchar(10) DEFAULT NULL,
  `COMP_TAB_CODE_` varchar(20) DEFAULT NULL,
  `CREATE_EMP_` varchar(20) DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `DCA1_ID_` varchar(50) DEFAULT NULL,
  `DELETE_FLAG_` varchar(10) DEFAULT NULL,
  `DESP_FIVE_` varchar(40) DEFAULT NULL,
  `DESP_FOUR_` varchar(40) DEFAULT NULL,
  `DESP_ONE_` varchar(40) DEFAULT NULL,
  `DESP_SIX_` varchar(40) DEFAULT NULL,
  `DESP_THREE_` varchar(40) DEFAULT NULL,
  `DESP_TWO_` varchar(40) DEFAULT NULL,
  `ITEM_NO_` varchar(40) DEFAULT NULL,
  `MEMO_` varchar(200) DEFAULT NULL,
  `SEQ_NO_` varchar(5) DEFAULT NULL,
  `SYS_TYPE_` varchar(10) DEFAULT NULL,
  `UPDATE_EMP_` varchar(20) DEFAULT NULL,
  `UPDATE_TIME_` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`DCA1A_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbdca1a
-- ----------------------------
INSERT INTO `tbdca1a` VALUES ('081b93db-0e9d-4162-ac94-cbcaacca0276', 'AY', 'OP04_STATUS_', '00001', '2017-11-24 10:58:29', '4f00788b-8448-4b35-a9fa-a550dba5165d', null, null, null, '部门审核中', null, null, null, '02', null, null, 'OP', '00001', '2017-12-06 15:12:40', '2');
INSERT INTO `tbdca1a` VALUES ('111', 'AY', 'OP_LEVEL_', 'admin', '2017-11-12 10:55:26', '42c081a2-fcf7-4ea1-a13f-a692a3e724ad', null, null, null, '一级', null, null, null, '1', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1112', 'AY', 'OP_LEVEL_', 'admin', '2017-11-12 10:55:26', '42c081a2-fcf7-4ea1-a13f-a692a3e724ad', null, null, null, '二级', null, null, null, '2', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1113', 'AY', 'OP_LEVEL_', 'admin', '2017-11-12 10:55:26', '42c081a2-fcf7-4ea1-a13f-a692a3e724ad', null, null, null, '三级', null, null, null, '3', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1114', 'AY', 'OP_LEVEL_', 'admin', '2017-11-12 10:55:26', '42c081a2-fcf7-4ea1-a13f-a692a3e724ad', null, null, null, '四级', null, null, null, '4', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1a21bb1c-a580-4c2c-aa98-16935d50c889', 'AY', 'OP04_STATUS_', '00001', '2017-11-24 10:57:02', '4f00788b-8448-4b35-a9fa-a550dba5165d', null, null, null, '新增', null, null, null, '00', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c611', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '信息化', null, null, null, 'OP12', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c612', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '风控与监察', null, null, null, 'OP13', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c613', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '年度关键任务', null, null, null, 'OP14', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c614', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '党工团工', null, null, null, 'OP15', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c615', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '创新', null, null, null, 'OP16', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c6e', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '合同', null, null, null, 'OP01', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c6e0', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '宣传', null, null, null, 'OP11', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c6e1', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '产值', null, null, null, 'OP02', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c6e2', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '收费', null, null, null, 'OP03', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c6e3', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '资质', null, null, null, 'OP04', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c6e4', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '质量管理', null, null, null, 'OP05', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c6e5', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '科研', null, null, null, 'OP06', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c6e6', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '人资', null, null, null, 'OP07', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c6e7', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '安全', null, null, null, 'OP08', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c6e8', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '资产采购', null, null, null, 'OP09', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('1eb45fb4-6ced-406d-ace0-1c1e37941c6e9', 'AY', 'OP_NO_', 'admin', '2017-11-12 10:55:26', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '行政', null, null, null, 'OP10', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('20dc1248-72fe-406b-ac62-bb29f539c640', 'AY', 'OP_NO_', 'admin', '2018-01-15 11:51:50', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '营业收入', null, null, null, 'OP17', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('28d020e8-171c-46f9-8e7e-deed94262239', 'AY', 'OP02_STATUS_', '00001', '2017-12-03 19:44:06', 'e2f6080b-681c-46d4-9282-a76cbbf8e54c', null, null, null, '审批结束', null, null, null, '99', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('3151a330-9062-4216-8a23-f275d7cd9ead', 'AY', 'OP_TYPE_', '00001', '2017-12-03 18:14:50', '443e9c41-cf8b-4b70-8957-85707e2431f1', null, null, null, '周计划', null, null, null, 'ZWC', null, null, 'OP', '00001', '2017-12-04 12:51:34', '1');
INSERT INTO `tbdca1a` VALUES ('4127a477-f5c0-4f44-93df-d068927d352b', 'AY', 'OP04_STATUS_', '00001', '2017-11-30 11:54:15', '4f00788b-8448-4b35-a9fa-a550dba5165d', null, null, null, '汇总新增', null, null, null, '05', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('44d66cec-9a63-46e3-bb15-8045143a97d3', 'AY', 'OP02_STATUS_', '00001', '2017-12-04 23:21:55', 'e2f6080b-681c-46d4-9282-a76cbbf8e54c', null, null, null, '审核中', null, null, null, '03', null, null, 'OP', '00004', '2017-12-13 11:37:53', '1');
INSERT INTO `tbdca1a` VALUES ('490dbf78-8111-4db2-96fe-be12ecfc7a32', 'AY', 'TYPE_', null, '2017-12-03 20:12:36', '854ec791-bece-4fa8-bbdb-4fc528442d51', null, null, null, '汇总', null, null, null, 'HZ', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('4abc2471-3250-43a5-b1cf-a925167d1f3c', 'AY', 'OP_TYPE_', '00001', '2017-12-03 18:13:30', '443e9c41-cf8b-4b70-8957-85707e2431f1', null, null, null, '年计划', null, null, null, 'NJH', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('4bb19999-bfd7-474c-ab3e-c821b142942e', 'AY', 'TYPE_', null, '2017-12-03 20:12:45', '854ec791-bece-4fa8-bbdb-4fc528442d51', null, null, null, '填报', null, null, null, 'TB', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('539159b7-adf4-486b-a66a-1becc96733e3', 'AY', 'OP04_STATUS_', '00001', '2017-11-24 10:59:20', '4f00788b-8448-4b35-a9fa-a550dba5165d', null, null, null, '审核通过', null, null, null, '04', null, null, 'OP', '00001', '2017-12-06 15:13:53', '2');
INSERT INTO `tbdca1a` VALUES ('540f49e1-80a1-4d16-af46-dfc166751d1b', 'AY', 'OP02_STATUS_', '00001', '2017-12-08 14:10:03', 'e2f6080b-681c-46d4-9282-a76cbbf8e54c', null, null, null, '汇总审核中', null, null, null, '20', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('5738bbae-dec0-46ee-83fa-f3761fc8af2e', 'AY', 'OP04_TYPE_', '00001', '2017-11-28 16:12:38', 'bbcef483-ba1e-4643-84b5-35b21d1d3dbc', null, null, null, '汇总', null, null, null, 'HZ', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('caa354c0-b23f-454b-9f52-ce48520ce341', 'AY', 'OP_TYPE_', '00001', '2017-12-03 18:14:38', '443e9c41-cf8b-4b70-8957-85707e2431f1', null, null, null, '月完成', null, null, null, 'YWC', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('cc724bb2-385e-4efb-baea-615f3dc94327', 'AY', 'OP_NO_', 'admin', '2018-01-15 11:52:13', '176b219d5244d32d:1f2e22cb:15fae0af848:-7ffe', null, null, null, '利润', null, null, null, 'OP18', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('cdc7f074-4ace-4012-b33e-24416ad314b4', 'AY', 'OP04_STATUS_', '00001', '2017-12-03 22:55:06', '4f00788b-8448-4b35-a9fa-a550dba5165d', null, null, null, '确认', null, null, null, '99', null, null, 'OP', '00001', '2017-12-06 15:14:25', '2');
INSERT INTO `tbdca1a` VALUES ('d1e31386-aebd-4ef1-9586-0bda46a9edae', 'AY', 'OP04_TYPE_', '00001', '2017-11-28 16:12:27', 'bbcef483-ba1e-4643-84b5-35b21d1d3dbc', null, null, null, '填报', null, null, null, 'TB', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('d9db0367-5ced-4d90-912c-a71028a72dc4', 'AY', 'OP_TYPE_', '00001', '2017-12-03 18:14:25', '443e9c41-cf8b-4b70-8957-85707e2431f1', null, null, null, '月计划', null, null, null, 'YJH', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('e0a4d3b9-c774-4b28-9bfe-651f08f04412', 'AY', 'OP02_STATUS_', '00001', '2017-12-03 19:42:30', 'e2f6080b-681c-46d4-9282-a76cbbf8e54c', null, null, null, '新增', null, null, null, '01', null, null, 'OP', '00001', '2017-12-03 19:47:07', '2');
INSERT INTO `tbdca1a` VALUES ('e77800b6-016e-4d3a-9562-fb1925d8518c', 'AY', 'OP02_STATUS_', '00001', '2017-12-03 19:50:41', 'e2f6080b-681c-46d4-9282-a76cbbf8e54c', null, null, null, '部门已审核', null, null, null, '10', null, null, 'OP', null, null, '0');
INSERT INTO `tbdca1a` VALUES ('ed0b43ef-9a96-4f2d-94a1-17b8a2a447b8', 'AY', 'OP04_STATUS_', '00001', '2017-11-24 10:57:38', '4f00788b-8448-4b35-a9fa-a550dba5165d', null, null, null, '部门填报中', null, null, null, '01', null, null, 'OP', '00001', '2017-12-06 15:12:26', '1');
INSERT INTO `tbdca1a` VALUES ('ed554ae9-8222-4089-823c-23f3aadf3588', 'AY', 'OP04_STATUS_', '00001', '2017-11-24 10:58:42', '4f00788b-8448-4b35-a9fa-a550dba5165d', null, null, null, '行政审核中', null, null, null, '03', null, null, 'OP', '00001', '2017-12-06 15:12:55', '1');

-- ----------------------------
-- Table structure for tbdrdc
-- ----------------------------
DROP TABLE IF EXISTS `tbdrdc`;
CREATE TABLE `tbdrdc` (
  `DRDCID` varchar(45) NOT NULL,
  `COMPID` varchar(10) DEFAULT NULL,
  `FILEHANDLE` varchar(100) DEFAULT NULL,
  `FILEDESCRIPTION` varchar(300) DEFAULT NULL,
  `INFOID` varchar(50) DEFAULT NULL,
  `FILENAME` varchar(200) DEFAULT NULL,
  `CREATEEMP` varchar(100) DEFAULT NULL,
  `CREATETIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MAINDOCID` varchar(45) DEFAULT NULL,
  `SYSID` varchar(10) DEFAULT NULL,
  `APPID` varchar(20) DEFAULT NULL,
  `MAINDOCNAME` varchar(1000) DEFAULT NULL,
  `DEST_DIR_` varchar(30) DEFAULT NULL,
  `META1_` varchar(50) DEFAULT NULL,
  `META2_` varchar(50) DEFAULT NULL,
  `META3_` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DRDCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbdrdc
-- ----------------------------
INSERT INTO `tbdrdc` VALUES ('3d531c12-32bd-4228-9039-499ef19eafd7', 'AY', '3d531c12-32bd-4228-9039-499ef19eafd7', null, null, '1_副本.jpg', 'LuW', '2018-01-16 09:30:12', 'b6822913-3ee5-4943-be66-d4ec7934073a', 'OP02', 'OPJV051', null, 'C:\\saveDir', null, null, null);

-- ----------------------------
-- Table structure for tbdscf
-- ----------------------------
DROP TABLE IF EXISTS `tbdscf`;
CREATE TABLE `tbdscf` (
  `DSCF_ID_` varchar(45) NOT NULL,
  `KEY_` varchar(500) DEFAULT NULL,
  `VALUE_` varchar(2000) DEFAULT NULL,
  `DESC_` varchar(2000) DEFAULT NULL,
  `CREATE_EMP_` varchar(45) DEFAULT NULL,
  `CREATE_DATE_` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATE_EMP_` varchar(45) DEFAULT NULL,
  `UPDATE_DATE_` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `CMNT1_` varchar(2000) DEFAULT NULL,
  `CMNT2_` varchar(2000) DEFAULT NULL,
  `CMNT3_` varchar(2000) DEFAULT NULL,
  `CMNT4_` varchar(2000) DEFAULT NULL,
  `CATEGORY_` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`DSCF_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbdscf
-- ----------------------------

-- ----------------------------
-- Table structure for tbop01
-- ----------------------------
DROP TABLE IF EXISTS `tbop01`;
CREATE TABLE `tbop01` (
  `OP01_ID_` varchar(50) NOT NULL COMMENT '系统ID',
  `COMP_ID_` varchar(10) DEFAULT NULL COMMENT '公司别',
  `OP_NO_` varchar(5) DEFAULT NULL COMMENT '业务类别',
  `YEAR_` varchar(4) DEFAULT NULL COMMENT '年份',
  `TYPE_NO_` varchar(10) DEFAULT NULL COMMENT '工作类别代码',
  `TYPE_NAME_` varchar(50) DEFAULT NULL COMMENT '工作类别',
  `FATHER_ID_` varchar(50) DEFAULT NULL COMMENT '父节点ID',
  `ROOT_` varchar(2) DEFAULT NULL COMMENT '是否根节点',
  `INDEX_` int(11) DEFAULT NULL COMMENT '排序',
  `MEMO_` varchar(100) DEFAULT NULL COMMENT '说明',
  `CREATE_EMP_` varchar(20) DEFAULT NULL COMMENT '新增人',
  `CREATE_TIME_` datetime DEFAULT NULL COMMENT '新增时间',
  `UPDATE_EMP_` varchar(20) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME_` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(11) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`OP01_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作类别表';

-- ----------------------------
-- Records of tbop01
-- ----------------------------
INSERT INTO `tbop01` VALUES ('0055dc05-ba61-4b07-8ee0-f60a3ffd5341', 'AY', 'OP03', '2018', 'A', '安全业务', '16ff36aa-116a-485d-a277-f70cf14edfab', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('008945ca-bc16-4b0a-b53c-1a4079884ae8', 'AY', 'OP03', '2018', 'A04', '应急产业', '0055dc05-ba61-4b07-8ee0-f60a3ffd5341', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:01', '2');
INSERT INTO `tbop01` VALUES ('00bd42d7-d717-4333-8468-266e40c46044', 'AY', 'OP02', '2018', 'B0602', '电网发展诊断', 'febf7314-29e0-4a8e-a8be-b2470169f3b1', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('026f9536-3e31-4847-9c90-fd547de9d62d', 'AY', 'OP01', '2018', 'A0107', '安全篇章设计（湖北院）', 'f6c1888c-97f2-44ec-b7dd-112e720f63e8', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('03203529-01a6-4f8a-98c5-dadb7b19bcf3', 'AY', 'OP03', '2018', 'B0103', '新能源环评（省外主体及线路）', 'ddde887b-7dd8-4b94-b933-b2b79cfd1881', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('03f20821-89de-4758-8340-8c03390979ff', 'AY', 'OP02', '2018', 'B03', '风险稳定评价', 'c60e11f6-ac78-43b5-b54b-4d06f2d8a5bd', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('04142471-1138-4ed8-a5f2-c020340fbdea', 'AY', 'OP04', '2017', 'OP04', '资质', null, 'Y', '0', null, '00001', '2017-12-12 12:03:14', null, null, '0');
INSERT INTO `tbop01` VALUES ('056f80bf-f110-4131-b237-a1683da67c5f', 'AY', 'OP03', '2018', 'B0702', '生态修复（水保专项设计等）', '141b9534-bcf8-46d4-ac96-f9c52e1bd0eb', 'N', '1', null, 'admin', '2018-01-15 12:32:39', null, null, '1');
INSERT INTO `tbop01` VALUES ('06100198-b94a-4bbf-83ae-ab2cf7ce02db', 'AY', 'OP02', '2018', 'B0207', '用户水保验收（含新能源）', '08d2648b-76d7-4e11-a151-0df11ca29e9d', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('06468d3d-4665-42d8-a911-b56ca85f8bf8', 'AY', 'OP08', '2017', '02', '制度建设', null, 'N', '0', null, 'admin', '2017-12-19 09:24:00', 'admin', '2017-12-19 09:30:33', '3');
INSERT INTO `tbop01` VALUES ('06ce080a-535b-4230-bad0-e544eaa205cd', 'AY', 'OP01', '2018', 'B06', '土地复垦、发展诊断', 'd1b14211-684f-45d4-9e66-69de7ec50871', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('08aef0b6-ee3d-473b-ac62-439a5b43fe4b', 'AY', 'OP02', '2018', 'A0107', '安全篇章设计（湖北院）', '13ebf78c-8f80-48da-935b-15a40f2436b4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('08ce812d-1e91-4399-b730-8e1b24a0fabd', 'AY', 'OP03', '2018', 'B0704', '环保科研课题', '141b9534-bcf8-46d4-ac96-f9c52e1bd0eb', 'N', '1', null, 'admin', '2018-01-15 12:32:39', null, null, '1');
INSERT INTO `tbop01` VALUES ('08d2648b-76d7-4e11-a151-0df11ca29e9d', 'AY', 'OP02', '2018', 'B02', '水保业务', 'c60e11f6-ac78-43b5-b54b-4d06f2d8a5bd', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('097a92f6-5cdf-46e5-8579-73f75a825bf3', 'AY', 'OP03', '2018', 'A0104', '安全验收、现状评价（湖北、重庆发电）', '3726482e-3207-4c5f-9fcc-c009a5a8b9ac', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('0b85962d-ac74-4788-a382-1906661e3feb', 'AY', 'OP03', '2018', 'B0108', '生态专题', 'ddde887b-7dd8-4b94-b933-b2b79cfd1881', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('0b90f456-65a9-4cfa-ab25-4a52ec51cd2a', 'AY', 'OP01', '2018', 'B0109', '院环保篇章设计', 'a7fd5e28-d1d2-4ba6-ab58-644ad3fa6198', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('0c3a847d-937d-465e-b995-51a744a0b54b', 'AY', 'OP08', '2018', '11', '安全预算', '7b6ce647-7592-4480-a93b-bed330805715', 'N', '0', null, 'xuxh1', '2018-01-15 19:37:38', null, null, '0');
INSERT INTO `tbop01` VALUES ('0c79ab68-d271-4ea8-8588-0d2849e19074', 'AY', 'OP03', '2018', 'B0106', '用户环评', 'ddde887b-7dd8-4b94-b933-b2b79cfd1881', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('0cd5b45c-b9b1-4818-a0dd-f7b3d1082e4b', 'AY', 'OP03', '2018', 'A0206', '环境年度监测', '16d8ed51-a498-459d-9b73-0d4a6451fdc0', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('0f0dfdda-1c16-49fe-97d6-958a7a87bfb0', 'AY', 'OP03', '2018', 'B0104', '电网环保业务（省外）', 'ddde887b-7dd8-4b94-b933-b2b79cfd1881', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('0f170711-3173-45cf-9c3c-15041a41e8e3', 'AY', 'OP01', '2018', 'B0703', '政府咨询采购', 'e614a911-cfc0-4fa0-a52b-733a2e9d5e67', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('10bbc530-d61e-41a7-9475-0dff9fd92a37', 'AY', 'OP01', '2018', 'A0202', '职评（省内非能源）', 'e7633d97-f760-4c40-92d5-e935b72d6ec6', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('11b92982-b78f-4394-baa3-93fcba0f477a', 'AY', 'OP03', '2018', 'B0202', '新能源水保方案（省内主体及线路）', 'f8cad5ed-b1d5-46c1-8952-e463cee36289', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('1224b47c-089e-4cbd-bfa8-5e50ca14f108', 'AY', 'OP02', '2018', 'A0402', '电建集团', 'ee572593-0437-4144-a534-c6c92e542968', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('12fb8280-5975-4fc8-b19c-a2c4ea4c9509', 'AY', 'OP01', '2018', 'A0404', '省外（含发电、电网）应急产业', '44782c65-f7e2-4096-8b85-4a72516f44b8', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('13425758-5231-4508-8c3a-3f2e033271ed', 'AY', 'OP07', '2018', '04', '招聘与人资规划', '943b7315-8d46-4ab5-8f12-d9f3ae37d03c', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:16', null, null, '0');
INSERT INTO `tbop01` VALUES ('13e3566e-d547-404a-956a-7cf33fc59df1', 'AY', 'OP02', '2018', 'A0104', '安全验收、现状评价（湖北、重庆发电）', '13ebf78c-8f80-48da-935b-15a40f2436b4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('13ebf78c-8f80-48da-935b-15a40f2436b4', 'AY', 'OP02', '2018', 'A01', '安全评价', 'd282ffb0-ec55-4623-a588-67adffa34ef1', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('141b9534-bcf8-46d4-ac96-f9c52e1bd0eb', 'AY', 'OP03', '2018', 'B07', '环保管家', 'b76dd1b7-9d04-46c8-a18c-bd42757682f9', 'N', '1', null, 'admin', '2018-01-15 12:32:39', null, null, '1');
INSERT INTO `tbop01` VALUES ('14d06555-96db-4b42-a84a-608e067b11bb', 'AY', 'OP03', '2018', 'B0203', '电网水保业务（省外）', 'f8cad5ed-b1d5-46c1-8952-e463cee36289', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('151a7ae8-5833-4741-846f-3497abc17336', 'AY', 'OP01', '2018', 'A0503', '安全工程', '21c1bd7d-33f1-41b1-b7db-46c62118d2e2', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('1535e608-a8ee-455d-a578-fcccef04f9e4', 'AY', 'OP02', '2018', 'A0302', '标准化评审、自查、回头看（集团公司）', '4bc6725d-eb41-4787-aacc-9d244201b26f', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('15f8b259-1f6c-4317-8bbd-e4d152e72826', 'AY', 'OP11', '2018', '01', '宣传管理', 'eef0c017-134e-4625-9304-066ede74c4b0', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:34', 'admin', '2017-12-19 09:36:46', '1');
INSERT INTO `tbop01` VALUES ('1686c083-6569-496d-be27-506f4eac53d5', 'AY', 'OP01', '2018', 'B0704', '环保科研课题', 'e614a911-cfc0-4fa0-a52b-733a2e9d5e67', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('16d8ed51-a498-459d-9b73-0d4a6451fdc0', 'AY', 'OP03', '2018', 'A02', '职评实验室', '0055dc05-ba61-4b07-8ee0-f60a3ffd5341', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:01', '2');
INSERT INTO `tbop01` VALUES ('16ff36aa-116a-485d-a277-f70cf14edfab', 'AY', 'OP03', '2018', '', '收费', '', 'Y', '0', null, 'admin', '2018-01-15 12:32:39', 'admin', '2017-12-08 23:41:13', '3');
INSERT INTO `tbop01` VALUES ('1742b400-e215-4c63-b1b1-d03b2287ece2', 'AY', 'OP13', '2017', '01', '制度修编', '3b7835f1-a2f4-4b7d-aae6-ab214aa64c60', 'N', '0', null, 'admin', '2017-12-19 09:43:57', null, null, '0');
INSERT INTO `tbop01` VALUES ('17a718fe-21a9-4a04-a93f-9bafd69d12c4', 'AY', 'OP08', '2017', '04', '应急管理', null, 'N', '0', null, 'admin', '2017-12-19 09:26:18', 'admin', '2017-12-19 09:30:33', '6');
INSERT INTO `tbop01` VALUES ('17ef306f-f5c5-4318-87d9-63f7570d471c', 'AY', 'OP02', '2018', 'B0401', '电网项目后评价（湖北）', '5f7cb6fc-d45d-46a1-adce-194219e763bb', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('18a89e1f-ed60-459b-9368-27f333204fea', 'AY', 'OP07', '2017', '06', '制度与执行', '66d9f9f7-c549-4208-8c52-7f946eefb53b', 'N', '0', null, '00004', '2017-12-13 12:15:09', null, null, '0');
INSERT INTO `tbop01` VALUES ('18e48628-ef5f-4be7-bc35-34cf6bf5397f', 'AY', 'OP07', '2018', '05', '资格与职称', '943b7315-8d46-4ab5-8f12-d9f3ae37d03c', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:16', null, null, '0');
INSERT INTO `tbop01` VALUES ('18f766d1-430f-4ff9-8383-3fbd6cd9fde2', 'AY', 'OP01', '2018', 'B0705', '其它新型环保业务', 'e614a911-cfc0-4fa0-a52b-733a2e9d5e67', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('1a86b84f-1bd4-4c64-846a-79203e1d3c75', 'AY', 'OP01', '2018', 'B0209', '水资源论证', '55a620cd-6e5e-4a1b-a786-e7afd8428941', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('1be5fd4d-6db2-4e09-844f-ee16391fcd94', 'AY', 'OP01', '2018', 'B0105', '电网环保验收（湖北）', 'a7fd5e28-d1d2-4ba6-ab58-644ad3fa6198', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('1d44c3aa-37bb-4a46-ab86-6887e57edfc2', 'AY', 'OP03', '2018', 'B0101', '电网环评（湖北）', 'ddde887b-7dd8-4b94-b933-b2b79cfd1881', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('1da5310d-eb8c-44d9-96f8-158e53f961eb', 'AY', 'OP01', '2018', 'A0502', '省外安全管家业务', '21c1bd7d-33f1-41b1-b7db-46c62118d2e2', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('1e596900-ff86-4d73-a490-3373daebbf11', 'AY', 'OP12', '2018', '06', '信息化管理', 'e7df0948-c654-4393-8a03-bb1e11f5fd9f', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:47', null, null, '0');
INSERT INTO `tbop01` VALUES ('20250c52-ba7b-4df0-b1f6-705b672eb5ee', 'AY', 'OP02', '2018', 'A0201', '职评（省内能源）', 'c021a3c7-7aab-4842-b676-c4c5dbfc1eb4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('20c0148a-33c8-477d-b096-24b9b00f18b6', 'AY', 'OP03', '2018', 'B0402', '新能源后评价', 'be9879cf-6ae4-4add-b9c0-814b1e7a3486', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('2121c4b0-96f9-4cb1-b6aa-4c734e9bd5df', 'AY', 'OP03', '2018', 'A0403', '发电企业（湖北、重庆）', '008945ca-bc16-4b0a-b53c-1a4079884ae8', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('21786d0e-1395-45d3-85bb-e8a8a46c404c', 'AY', 'OP12', '2017', '06', '信息化管理', '7f7f28dd-e8f1-4573-b002-677250d4fef1', 'N', '0', null, 'admin', '2017-12-19 09:41:57', null, null, '0');
INSERT INTO `tbop01` VALUES ('21c1bd7d-33f1-41b1-b7db-46c62118d2e2', 'AY', 'OP01', '2018', 'A05', '安全管家', '21cc2498-22b5-4ba5-8a53-0bdc02a89040', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('21cc2498-22b5-4ba5-8a53-0bdc02a89040', 'AY', 'OP01', '2018', 'A', '安全业务', '7d3f3085-720c-45a1-8c74-62d4c7148593', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('2408e953-00da-443d-84de-4d5a379efec3', 'AY', 'OP03', '2018', 'A0404', '省外（含发电、电网）应急产业', '008945ca-bc16-4b0a-b53c-1a4079884ae8', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('242fce38-0cb1-42ef-a863-342ddab241b4', 'AY', 'OP02', '2018', 'B0101', '电网环评（湖北）', 'bfb0db13-0430-4e39-922e-08754df16b7b', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('26df77c0-d8f1-4851-98ed-2bcb724047dc', 'AY', 'OP10', '2017', 'OP10', '行政', null, 'Y', '0', null, 'admin', '2017-12-19 09:32:47', null, null, '0');
INSERT INTO `tbop01` VALUES ('27286920-73d6-4cbc-bf00-0c3059dc7e7d', 'AY', 'OP02', '2018', 'B0203', '电网水保业务（省外）', '08d2648b-76d7-4e11-a151-0df11ca29e9d', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('273d80bc-d1f1-42e5-b2ee-7bc911ba751b', 'AY', 'OP03', '2018', 'B0102', '新能源环评（省内主体及线路）', 'ddde887b-7dd8-4b94-b933-b2b79cfd1881', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('28da4923-df55-4ae7-a644-044731a3a7b3', 'AY', 'OP03', '2018', 'B0208', '水保监测(含电网项目)', 'f8cad5ed-b1d5-46c1-8952-e463cee36289', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('2bb42bb7-d3d9-44e3-91d0-3bd8be5ba931', 'AY', 'OP01', '2018', 'A0102', '安全预评价（湖北新能源、分布式）', 'f6c1888c-97f2-44ec-b7dd-112e720f63e8', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('2cc2bc18-c244-4ea4-a870-9d827a428f65', 'AY', 'OP07', '2018', '07', '其他', '943b7315-8d46-4ab5-8f12-d9f3ae37d03c', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:16', null, null, '0');
INSERT INTO `tbop01` VALUES ('2e0a9af2-0a10-42a5-a42b-f263bfb0b389', 'AY', 'OP12', '2017', '02', '内部建设', '7f7f28dd-e8f1-4573-b002-677250d4fef1', 'N', '0', null, 'admin', '2017-12-19 09:40:53', null, null, '0');
INSERT INTO `tbop01` VALUES ('2ffa1f53-a5f6-4a94-a6b5-660c859f910f', 'AY', 'OP02', '2018', 'B0202', '新能源水保方案（省内主体及线路）', '08d2648b-76d7-4e11-a151-0df11ca29e9d', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('30c7ef5c-0a92-47be-abd4-c451d3d25f85', 'AY', 'OP03', '2018', 'B0109', '院环保篇章设计', 'ddde887b-7dd8-4b94-b933-b2b79cfd1881', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('3168da88-ca01-4b45-8a2b-b104b04dc14f', 'AY', 'OP08', '2017', '11', '安全预算', '9492f2bb-ae18-4641-b3b7-cafa0ad2be66', 'N', '0', null, 'admin', '2017-12-19 09:32:15', null, null, '0');
INSERT INTO `tbop01` VALUES ('31fdc107-edcd-4f24-9b50-e494a8323610', 'AY', 'OP01', '2018', 'B0203', '电网水保业务（省外）', '55a620cd-6e5e-4a1b-a786-e7afd8428941', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('32df4c56-1183-4876-bfec-37b6039a250c', 'AY', 'OP02', '2018', 'B0209', '水资源论证', '08d2648b-76d7-4e11-a151-0df11ca29e9d', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('33408f9c-5d9a-4250-898e-1bfb0660df15', 'AY', 'OP02', '2018', 'B0302', '风险稳定评估（非电网项目）', '03f20821-89de-4758-8340-8c03390979ff', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('3459da03-2529-47ca-b173-8eaad084ac5d', 'AY', 'OP02', '2018', 'B0701', '电网环保治理工程', '9dd8649d-eb0f-424a-bb46-45ebf6935572', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('36ae641c-69ef-458a-9845-b77e711a65ff', 'AY', 'OP08', '2017', '07', '安全总结', null, 'N', '0', null, 'admin', '2017-12-19 09:25:55', 'admin', '2017-12-19 09:30:33', '4');
INSERT INTO `tbop01` VALUES ('3726482e-3207-4c5f-9fcc-c009a5a8b9ac', 'AY', 'OP03', '2018', 'A01', '安全评价', '0055dc05-ba61-4b07-8ee0-f60a3ffd5341', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:01', '2');
INSERT INTO `tbop01` VALUES ('388261d9-4647-4ceb-8ed4-851461889880', 'AY', 'OP02', '2018', 'B0601', '电网土地复垦', 'febf7314-29e0-4a8e-a8be-b2470169f3b1', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('3991fe0b-7037-4b8c-8963-8d0db749f8d0', 'AY', 'OP08', '2018', '09', '安全投入', '7b6ce647-7592-4480-a93b-bed330805715', 'N', '0', null, 'xuxh1', '2018-01-15 19:37:38', null, null, '0');
INSERT INTO `tbop01` VALUES ('3ab11f1e-5b46-4f4f-a328-c36f36b67d45', 'AY', 'OP12', '2018', '01', '新建模块与功能', 'e7df0948-c654-4393-8a03-bb1e11f5fd9f', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:47', null, null, '0');
INSERT INTO `tbop01` VALUES ('3b7835f1-a2f4-4b7d-aae6-ab214aa64c60', 'AY', 'OP13', '2017', 'OP13', '风控与监察', null, 'Y', '0', null, 'admin', '2017-12-19 09:43:50', null, null, '0');
INSERT INTO `tbop01` VALUES ('3c6ede55-d0b8-4e54-94da-2cd4021f684a', 'AY', 'OP01', '2018', 'A0302', '标准化评审、自查、回头看（集团公司）', 'fd5aa888-bd3a-4454-8767-97761d5d5d0b', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('3e969b0f-11e8-408b-b575-362624a81938', 'AY', 'OP02', '2018', 'A0204', '检测（省内非能源、省外非集团项目）', 'c021a3c7-7aab-4842-b676-c4c5dbfc1eb4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('3eb636b5-446b-4aa0-9d23-0edf9dd6300e', 'AY', 'OP08', '2018', '10', '安全考核', '7b6ce647-7592-4480-a93b-bed330805715', 'N', '0', null, 'xuxh1', '2018-01-15 19:37:38', null, null, '0');
INSERT INTO `tbop01` VALUES ('3f8f6338-a986-4194-82b0-89414eddf8a7', 'AY', 'OP03', '2018', 'B0207', '用户水保验收（含新能源）', 'f8cad5ed-b1d5-46c1-8952-e463cee36289', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('406df469-c2d6-455e-84ac-a3e4986de04f', 'AY', 'OP12', '2017', '03', '平台维护与管理', '7f7f28dd-e8f1-4573-b002-677250d4fef1', 'N', '0', null, 'admin', '2017-12-19 09:41:06', null, null, '0');
INSERT INTO `tbop01` VALUES ('40e4cb38-3cce-4374-9b52-55c972e4e86d', 'AY', 'OP07', '2017', '04', '招聘与人资规划', '66d9f9f7-c549-4208-8c52-7f946eefb53b', 'N', '0', null, '00004', '2017-12-13 12:14:36', null, null, '0');
INSERT INTO `tbop01` VALUES ('40f603f8-5d75-4c3a-a4dc-e57338c0be91', 'AY', 'OP07', '2018', '06', '总结与检查', '943b7315-8d46-4ab5-8f12-d9f3ae37d03c', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:16', null, null, '0');
INSERT INTO `tbop01` VALUES ('41693928-b8ca-43cb-ae8a-4ca6fea2e441', 'AY', 'OP02', '2018', 'A0505', '安全科研', 'b442d999-92e7-4129-9fb0-8b6fc6c79ff3', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('41c5261b-1b24-428d-ad8f-b5ed16005c6b', 'AY', 'OP03', '2018', 'B0403', '电网后评价（省外）', 'be9879cf-6ae4-4add-b9c0-814b1e7a3486', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('4262216b-67d0-4f4d-801b-e6bf3d192d0a', 'AY', 'OP13', '2018', '01', '制度修编', 'f97f7d20-1578-4084-8d03-7cbf6fe0531e', 'N', '0', null, 'xuxh1', '2018-01-15 19:39:02', null, null, '0');
INSERT INTO `tbop01` VALUES ('44782c65-f7e2-4096-8b85-4a72516f44b8', 'AY', 'OP01', '2018', 'A04', '应急产业', '21cc2498-22b5-4ba5-8a53-0bdc02a89040', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('4700176c-542a-40b7-96ef-09283adb950d', 'AY', 'OP02', '2018', 'B0108', '生态专题', 'bfb0db13-0430-4e39-922e-08754df16b7b', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('4814eba4-21a3-4fe0-b7d5-eee9760cb142', 'AY', 'OP01', '2018', 'A0205', '电网职评', 'e7633d97-f760-4c40-92d5-e935b72d6ec6', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('49329986-a155-4a5e-af5a-ffcb2471c3c0', 'AY', 'OP12', '2017', '04', '内部建设', '7f7f28dd-e8f1-4573-b002-677250d4fef1', 'N', '0', null, 'admin', '2017-12-19 09:41:25', null, null, '0');
INSERT INTO `tbop01` VALUES ('4b667194-d7fc-409c-9a1f-19a0d23fef2c', 'AY', 'OP03', '2018', 'A0302', '标准化评审、自查、回头看（集团公司）', 'eff6c135-fd0f-4a58-898f-d23d132b6a45', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('4bc6725d-eb41-4787-aacc-9d244201b26f', 'AY', 'OP02', '2018', 'A03', '安全咨询', 'd282ffb0-ec55-4623-a588-67adffa34ef1', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('4c827da3-90d0-4baa-a438-0f85d07fbb7f', 'AY', 'OP03', '2018', 'B0601', '电网土地复垦', '58645030-6a92-4f5a-b57a-bd98eb4daa16', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('52b02210-a501-4c0e-bdae-ec69030f8f30', 'AY', 'OP03', '2018', 'A0102', '安全预评价（湖北新能源、分布式）', '3726482e-3207-4c5f-9fcc-c009a5a8b9ac', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('532aa8a9-4d2e-4dd5-a7a9-a6a0128ebf2b', 'AY', 'OP03', '2018', 'B0301', '风险稳定评估（湖北电网）', 'e1ee8306-4385-49f2-8be7-ec2c8b777b2b', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('533c18d4-9d1b-49da-919f-8d13e80b7a48', 'AY', 'OP03', '2018', 'B0401', '电网项目后评价（湖北）', 'be9879cf-6ae4-4add-b9c0-814b1e7a3486', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('5352c64f-f6fe-4a30-b24c-b18a27641185', 'AY', 'OP01', '2018', 'B04', '后评价', 'd1b14211-684f-45d4-9e66-69de7ec50871', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('55a620cd-6e5e-4a1b-a786-e7afd8428941', 'AY', 'OP01', '2018', 'B02', '水保业务', 'd1b14211-684f-45d4-9e66-69de7ec50871', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('55a62822-7c48-44e2-bf86-9bd325b67b23', 'AY', 'OP03', '2018', 'B0205', '用户水保方案(黄石、随州、宜昌）', 'f8cad5ed-b1d5-46c1-8952-e463cee36289', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('5605edcc-7093-44b8-92fc-b76211a29690', 'AY', 'OP02', '2018', 'B0403', '电网后评价（省外）', '5f7cb6fc-d45d-46a1-adce-194219e763bb', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('57de736a-e964-4e19-b10a-ac1c8bc1875f', 'AY', 'OP03', '2018', 'A0203', '检测（省内能源类、电建集团）', '16d8ed51-a498-459d-9b73-0d4a6451fdc0', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('5802e608-7175-427e-9e90-f05225b9d519', 'AY', 'OP03', '2018', 'A0505', '安全科研', 'dc8a6723-740f-4d94-bc3e-6c08e101abfd', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('58645030-6a92-4f5a-b57a-bd98eb4daa16', 'AY', 'OP03', '2018', 'B06', '土地复垦、发展诊断', 'b76dd1b7-9d04-46c8-a18c-bd42757682f9', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('58ea7937-d771-4392-aa8d-5f51d5672c01', 'AY', 'OP03', '2018', 'A0301', '安全培训', 'eff6c135-fd0f-4a58-898f-d23d132b6a45', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('5a939577-6261-4488-a793-edb9602ad806', 'AY', 'OP02', '2018', 'B0206', '用户水保方案（省内其它区域）', '08d2648b-76d7-4e11-a151-0df11ca29e9d', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('5a9a7ddf-01e8-47c7-81b6-45868443e0f4', 'AY', 'OP02', '2018', 'B0204', '新能源水保（省外主体及线路）', '08d2648b-76d7-4e11-a151-0df11ca29e9d', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('5e5356fe-e084-4deb-96e4-a72d1948e61e', 'AY', 'OP01', '2018', 'B0104', '电网环保业务（省外）', 'a7fd5e28-d1d2-4ba6-ab58-644ad3fa6198', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('5ea29630-6130-4724-a53c-22e052983efd', 'AY', 'OP01', '2018', 'B0204', '新能源水保（省外主体及线路）', '55a620cd-6e5e-4a1b-a786-e7afd8428941', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('5eabac6c-847f-4d20-aa45-08213e687826', 'AY', 'OP01', '2018', 'B0302', '风险稳定评估（非电网项目）', 'b1fcb0f0-34a6-4447-9575-5a473787f209', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('5f469fad-9976-44c4-b67d-23077f9279b0', 'AY', 'OP03', '2018', 'A0503', '安全工程', 'dc8a6723-740f-4d94-bc3e-6c08e101abfd', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('5f5c1cf6-cb3e-4035-bfe5-f6057f6885ec', 'AY', 'OP03', '2018', 'A0501', '湖北、重庆发电企业安全管家业务', 'dc8a6723-740f-4d94-bc3e-6c08e101abfd', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('5f7cb6fc-d45d-46a1-adce-194219e763bb', 'AY', 'OP02', '2018', 'B04', '后评价', 'c60e11f6-ac78-43b5-b54b-4d06f2d8a5bd', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('5fe41c09-54e9-4670-ba86-d25a33817d6a', 'AY', 'OP07', '2018', '01', '绩效考核', '943b7315-8d46-4ab5-8f12-d9f3ae37d03c', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:16', null, null, '0');
INSERT INTO `tbop01` VALUES ('608db519-cff1-40fe-8796-72d1aa13468b', 'AY', 'OP08', '2017', '10', '安全考核', '9492f2bb-ae18-4641-b3b7-cafa0ad2be66', 'N', '0', null, 'admin', '2017-12-19 09:31:59', null, null, '0');
INSERT INTO `tbop01` VALUES ('60f743ba-2340-4485-937b-99f32954ed58', 'AY', 'OP02', '2018', 'B0503', '电网节能评估（省外）', '7fc3e1d7-ff11-46c1-a724-38a502821d5e', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('61329e74-f885-49cb-a109-9b7a6e74c70e', 'AY', 'OP02', '2018', 'A0202', '职评（省内非能源）', 'c021a3c7-7aab-4842-b676-c4c5dbfc1eb4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('6137d109-aa64-455b-b847-bc78eddce6a0', 'AY', 'OP02', '2018', 'A0501', '湖北、重庆发电企业安全管家业务', 'b442d999-92e7-4129-9fb0-8b6fc6c79ff3', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('62776e86-d766-4e4a-ad91-5a009571a56a', 'AY', 'OP03', '2018', 'B0107', '环保验收、监理', 'ddde887b-7dd8-4b94-b933-b2b79cfd1881', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('62ca08d8-8a8d-4fb1-99e4-56a1a5ed0e74', 'AY', 'OP02', '2018', 'A0503', '安全工程', 'b442d999-92e7-4129-9fb0-8b6fc6c79ff3', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('63a1b8c1-4e41-49fd-a183-427a897717f0', 'AY', 'OP03', '2018', 'B0703', '政府咨询采购', '141b9534-bcf8-46d4-ac96-f9c52e1bd0eb', 'N', '1', null, 'admin', '2018-01-15 12:32:39', null, null, '1');
INSERT INTO `tbop01` VALUES ('652dd658-6d6b-4cee-b4c7-dfcff956b809', 'AY', 'OP07', '2017', '01', '绩效考核', '66d9f9f7-c549-4208-8c52-7f946eefb53b', 'N', '0', null, '00004', '2017-12-13 12:13:50', null, null, '0');
INSERT INTO `tbop01` VALUES ('65ad512a-c4e2-439f-8c46-7e3861bdf437', 'AY', 'OP01', '2018', 'B0207', '用户水保验收（含新能源）', '55a620cd-6e5e-4a1b-a786-e7afd8428941', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('6677a4b4-0787-46f3-8c34-2a9f0a99f192', 'AY', 'OP01', '2018', 'A0201', '职评（省内能源）', 'e7633d97-f760-4c40-92d5-e935b72d6ec6', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('66d9f9f7-c549-4208-8c52-7f946eefb53b', 'AY', 'OP07', '2017', 'OP07', '人资', null, 'Y', '0', null, '00004', '2017-12-13 12:13:26', null, null, '0');
INSERT INTO `tbop01` VALUES ('690fdacd-8625-4c9f-b7b4-f682f5db251c', 'AY', 'OP01', '2018', 'B0108', '生态专题', 'a7fd5e28-d1d2-4ba6-ab58-644ad3fa6198', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('699f5312-47f9-4cc8-8814-6166d4028248', 'AY', 'OP01', '2018', 'A0301', '安全培训', 'fd5aa888-bd3a-4454-8767-97761d5d5d0b', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('69b0a252-82c1-49de-8c59-3725d5c7b6ca', 'AY', 'OP04', '2017', '01', '资质延续', '04142471-1138-4ed8-a5f2-c020340fbdea', 'N', '0', null, '00004', '2017-12-13 10:51:16', 'admin', '2017-12-19 09:20:10', '1');
INSERT INTO `tbop01` VALUES ('6b241123-e066-4aeb-81a6-e62d6c2791c7', 'AY', 'OP01', '2018', 'B0402', '新能源后评价', '5352c64f-f6fe-4a30-b24c-b18a27641185', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('6c098c0a-180a-4e24-a099-50c2ddbece72', 'AY', 'OP08', '2017', '12', '安全培训', '9492f2bb-ae18-4641-b3b7-cafa0ad2be66', 'N', '0', null, 'liuwl', '2017-12-20 11:51:15', null, null, '0');
INSERT INTO `tbop01` VALUES ('6c765fa6-00e8-4c75-9ab8-a7f0ce0eaeee', 'AY', 'OP02', '2018', 'B0104', '电网环保业务（省外）', 'bfb0db13-0430-4e39-922e-08754df16b7b', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('6d464d9b-3dc0-43f3-a090-a0d6c0c7afa4', 'AY', 'OP04', '2017', '02', '专项申报', '04142471-1138-4ed8-a5f2-c020340fbdea', 'N', '0', null, 'admin', '2017-12-19 09:20:24', null, null, '0');
INSERT INTO `tbop01` VALUES ('6e1e9265-dbda-4155-888e-81e3bfac28cf', 'AY', 'OP02', '2018', 'A0404', '省外（含发电、电网）应急产业', 'ee572593-0437-4144-a534-c6c92e542968', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('6ef5dcf8-e7c4-46d8-b2f5-dbe8ea3ffe58', 'AY', 'OP02', '2018', '', '产值', '', 'Y', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('6f50e8eb-1b74-4dba-b6ef-2bd30cc26279', 'AY', 'OP10', '2017', '01', '内部会议', '26df77c0-d8f1-4851-98ed-2bcb724047dc', 'N', '0', null, 'admin', '2017-12-19 09:34:07', null, null, '0');
INSERT INTO `tbop01` VALUES ('6fa6513f-c01a-4877-bd98-ca41444788bc', 'AY', 'OP01', '2018', 'A0204', '检测（省内非能源、省外非集团项目）', 'e7633d97-f760-4c40-92d5-e935b72d6ec6', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('7064ecfd-42b9-40e9-ab72-6db2539109c0', 'AY', 'OP02', '2018', 'B0105', '电网环保验收（湖北）', 'bfb0db13-0430-4e39-922e-08754df16b7b', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('7160ca18-9b06-4710-80a8-ba78e0b49c85', 'AY', 'OP02', '2018', 'B0301', '风险稳定评估（湖北电网）', '03f20821-89de-4758-8340-8c03390979ff', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('72f06f5c-f5af-4803-8251-7b2415a25a87', 'AY', 'OP02', '2018', 'A0106', '承分包商安全评估（湖北电网）', '13ebf78c-8f80-48da-935b-15a40f2436b4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('73c18fed-f320-4148-8fe9-68c65a09a7e3', 'AY', 'OP01', '2018', 'B0205', '用户水保方案(黄石、随州、宜昌）', '55a620cd-6e5e-4a1b-a786-e7afd8428941', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('73ec37fc-7c0f-41f5-b83b-c03e60e15d96', 'AY', 'OP02', '2018', 'A0403', '发电企业（湖北、重庆）', 'ee572593-0437-4144-a534-c6c92e542968', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('762b974c-f385-453a-aff5-dc7885692b1b', 'AY', 'OP02', '2018', 'A0401', '湖北电网', 'ee572593-0437-4144-a534-c6c92e542968', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('780a2c1b-8a4f-4273-8297-2d0325b67cca', 'AY', 'OP12', '2018', '02', '内部建设', 'e7df0948-c654-4393-8a03-bb1e11f5fd9f', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:47', null, null, '0');
INSERT INTO `tbop01` VALUES ('78abc6f1-48f7-43f8-8246-9874e49f93cf', 'AY', 'OP01', '2018', 'A0105', '本质安全评价（湖北电网）', 'f6c1888c-97f2-44ec-b7dd-112e720f63e8', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('79af6095-2dd9-405f-96b6-612622600f50', 'AY', 'OP01', '2018', 'B0202', '新能源水保方案（省内主体及线路）', '55a620cd-6e5e-4a1b-a786-e7afd8428941', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('79fd4aff-bf9e-4a81-9fff-3b4e06c2467a', 'AY', 'OP01', '2018', 'A0106', '承分包商安全评估（湖北电网）', 'f6c1888c-97f2-44ec-b7dd-112e720f63e8', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('7a9feb40-16b1-4b09-a7da-3cb273eee6bd', 'AY', 'OP03', '2018', 'B0705', '其它新型环保业务', '141b9534-bcf8-46d4-ac96-f9c52e1bd0eb', 'N', '1', null, 'admin', '2018-01-15 12:32:39', null, null, '1');
INSERT INTO `tbop01` VALUES ('7aa89dc6-27f1-41b0-b8b3-631325e00418', 'AY', 'OP02', '2018', 'A0105', '本质安全评价（湖北电网）', '13ebf78c-8f80-48da-935b-15a40f2436b4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('7add272a-82cd-473b-b47d-e8167dfe64a4', 'AY', 'OP07', '2017', '05', '资格与职称', '66d9f9f7-c549-4208-8c52-7f946eefb53b', 'N', '0', null, '00004', '2017-12-13 12:14:51', null, null, '0');
INSERT INTO `tbop01` VALUES ('7b6ce647-7592-4480-a93b-bed330805715', 'AY', 'OP08', '2018', 'OP08', '安全', null, 'Y', '0', null, 'xuxh1', '2018-01-15 19:37:38', null, null, '0');
INSERT INTO `tbop01` VALUES ('7b940b7e-cf9c-4587-923c-d09d9b20557f', 'AY', 'OP01', '2018', 'B0601', '电网土地复垦', '06ce080a-535b-4230-bad0-e544eaa205cd', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('7d3f3085-720c-45a1-8c74-62d4c7148593', 'AY', 'OP01', '2018', '', '合同', '', 'Y', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('7e461407-9d32-4bd8-8ffb-34a69d4196bc', 'AY', 'OP07', '2017', '02', '培训与培养', '66d9f9f7-c549-4208-8c52-7f946eefb53b', 'N', '0', null, '00004', '2017-12-13 12:14:03', null, null, '0');
INSERT INTO `tbop01` VALUES ('7f08e4f4-5340-4348-b99b-e5f560e90e27', 'AY', 'OP02', '2018', 'B0704', '环保科研课题', '9dd8649d-eb0f-424a-bb46-45ebf6935572', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('7f7f28dd-e8f1-4573-b002-677250d4fef1', 'AY', 'OP12', '2017', 'OP12', '信息化', null, 'Y', '0', null, 'admin', '2017-12-19 09:40:22', null, null, '0');
INSERT INTO `tbop01` VALUES ('7fc3e1d7-ff11-46c1-a724-38a502821d5e', 'AY', 'OP02', '2018', 'B05', '节能评估', 'c60e11f6-ac78-43b5-b54b-4d06f2d8a5bd', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('81e90093-f33e-46b8-a3c5-42c9c558ef93', 'AY', 'OP03', '2018', 'B0204', '新能源水保（省外主体及线路）', 'f8cad5ed-b1d5-46c1-8952-e463cee36289', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('85554523-c0e1-48ef-a43a-7838f5a0f0a2', 'AY', 'OP01', '2018', 'A0501', '湖北、重庆发电企业安全管家业务', '21c1bd7d-33f1-41b1-b7db-46c62118d2e2', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('859cc47b-ccda-4fb3-891a-4a675ec87f46', 'AY', 'OP02', '2018', 'B0107', '环保验收、监理', 'bfb0db13-0430-4e39-922e-08754df16b7b', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('86b5065b-d27d-4a65-a248-96118d154828', 'AY', 'OP03', '2018', 'B0302', '风险稳定评估（非电网项目）', 'e1ee8306-4385-49f2-8be7-ec2c8b777b2b', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('86e6afc7-5ec9-4cc5-a7e8-2e7277610ebf', 'AY', 'OP01', '2018', 'B0602', '电网发展诊断', '06ce080a-535b-4230-bad0-e544eaa205cd', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('86e852e9-d33b-41a2-a98b-dd2fb5ce3dfe', 'AY', 'OP03', '2018', 'A0101', '安全预评价（湖北电网）', '3726482e-3207-4c5f-9fcc-c009a5a8b9ac', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('871cee51-c3e1-41df-aacf-fd0c97fcb104', 'AY', 'OP01', '2018', 'A0506', '其他新业务（安全信息化等）', '21c1bd7d-33f1-41b1-b7db-46c62118d2e2', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('87b62497-717f-45bc-a6ea-5abe55818e7b', 'AY', 'OP10', '2018', '01', '内部会议', 'b715b54f-8792-4bd1-a234-c04611d84632', 'N', '0', null, 'xuxh1', '2018-01-15 19:37:27', null, null, '0');
INSERT INTO `tbop01` VALUES ('89dfac61-fa49-4ced-855a-a22d9dca7356', 'AY', 'OP10', '2018', '02', '内部管理', 'b715b54f-8792-4bd1-a234-c04611d84632', 'N', '0', null, 'xuxh1', '2018-01-15 19:37:27', null, null, '0');
INSERT INTO `tbop01` VALUES ('89f4e40a-ba94-406e-ba85-938717d3ef67', 'AY', 'OP03', '2018', 'A0402', '电建集团', '008945ca-bc16-4b0a-b53c-1a4079884ae8', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('8bac0d44-46e9-4118-a693-860b69ec4cc3', 'AY', 'OP03', '2018', 'B0206', '用户水保方案（省内其它区域）', 'f8cad5ed-b1d5-46c1-8952-e463cee36289', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('8bd92915-445a-402b-b6c4-1a6739631c63', 'AY', 'OP03', '2018', 'B0201', '电网水保方案（湖北）', 'f8cad5ed-b1d5-46c1-8952-e463cee36289', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('8e4c90b2-e287-473e-9807-5dd8bb0e0645', 'AY', 'OP02', '2018', 'B0208', '水保监测(含电网项目)', '08d2648b-76d7-4e11-a151-0df11ca29e9d', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('8f44fdec-b266-4965-85d6-e3df8c89f999', 'AY', 'OP03', '2018', 'A0201', '职评（省内能源）', '16d8ed51-a498-459d-9b73-0d4a6451fdc0', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('908ba9e2-3453-445a-bd7f-48fbb9fd174d', 'AY', 'OP08', '2017', '06', '安全会议', null, 'N', '0', null, 'admin', '2017-12-19 09:24:12', 'admin', '2017-12-19 09:30:33', '6');
INSERT INTO `tbop01` VALUES ('917aa84f-c5a5-4f96-b330-e291e160c757', 'AY', 'OP02', '2018', 'B0502', '发电节能评估（含新能源）', '7fc3e1d7-ff11-46c1-a724-38a502821d5e', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('9312221c-fcb9-4dee-8fdb-160c42f42e88', 'AY', 'OP01', '2018', 'B0502', '发电节能评估（含新能源）', 'ab6457cf-45c7-42a6-8d59-d87dd221bec5', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('943b7315-8d46-4ab5-8f12-d9f3ae37d03c', 'AY', 'OP07', '2018', 'OP07', '人资', null, 'Y', '0', null, 'xuxh1', '2018-01-15 19:38:16', null, null, '0');
INSERT INTO `tbop01` VALUES ('9492f2bb-ae18-4641-b3b7-cafa0ad2be66', 'AY', 'OP08', '2017', 'OP08', '安全', null, 'Y', '0', null, 'admin', '2017-12-19 09:22:41', null, null, '0');
INSERT INTO `tbop01` VALUES ('959d54bf-e085-4b7a-968c-742867a4cc6b', 'AY', 'OP01', '2018', 'A0206', '环境年度监测', 'e7633d97-f760-4c40-92d5-e935b72d6ec6', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('963024c1-7d7f-47ea-b278-25e2157b1470', 'AY', 'OP04', '2018', '03', '日常管理', 'd570bb2c-2b47-4d66-9e06-2396894016d2', 'N', '0', null, 'xuxh1', '2018-01-15 19:37:57', null, null, '0');
INSERT INTO `tbop01` VALUES ('96679030-ee46-42ae-b838-9137c24e1478', 'AY', 'OP01', '2018', 'A0505', '安全科研', '21c1bd7d-33f1-41b1-b7db-46c62118d2e2', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('97e379dc-893d-4262-89c1-a5a5c4724d13', 'AY', 'OP01', '2018', 'B0403', '电网后评价（省外）', '5352c64f-f6fe-4a30-b24c-b18a27641185', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('982e0112-44ae-474a-81ff-2e0d6dd08952', 'AY', 'OP11', '2017', '02', '宣传目标', 'c5e1722b-b6d9-40f0-8b91-f50ee16d4199', 'N', '0', null, 'admin', '2017-12-19 09:37:01', null, null, '0');
INSERT INTO `tbop01` VALUES ('9914a70a-eecc-49dc-95ba-1aec4b3b5fa7', 'AY', 'OP01', '2018', 'B0107', '环保验收、监理', 'a7fd5e28-d1d2-4ba6-ab58-644ad3fa6198', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('9967df54-957f-427d-b2c0-394c411fad25', 'AY', 'OP02', '2018', 'B0109', '院环保篇章设计', 'bfb0db13-0430-4e39-922e-08754df16b7b', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('9be37ef5-ef7b-4aa4-b4c4-d9dbd9feac6c', 'AY', 'OP02', '2018', 'B0402', '新能源后评价', '5f7cb6fc-d45d-46a1-adce-194219e763bb', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('9dd8649d-eb0f-424a-bb46-45ebf6935572', 'AY', 'OP02', '2018', 'B07', '环保管家', 'c60e11f6-ac78-43b5-b54b-4d06f2d8a5bd', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('9f4b8ae9-1edb-4799-b06b-8341a8b60b5a', 'AY', 'OP11', '2017', '01', '宣传管理', 'c5e1722b-b6d9-40f0-8b91-f50ee16d4199', 'N', '0', null, 'admin', '2017-12-19 09:36:31', 'admin', '2017-12-19 09:36:46', '1');
INSERT INTO `tbop01` VALUES ('a007b99d-f42f-42f5-b13a-a236da0fee60', 'AY', 'OP03', '2018', 'B0105', '电网环保验收（湖北）', 'ddde887b-7dd8-4b94-b933-b2b79cfd1881', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('a0a97f48-6bab-4d59-ab99-f22d7f316721', 'AY', 'OP02', '2018', 'A0506', '其他新业务（安全信息化等）', 'b442d999-92e7-4129-9fb0-8b6fc6c79ff3', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('a605aa09-15f3-4a25-a61c-a36cd4b4648a', 'AY', 'OP11', '2017', '03', '宣传积分', 'c5e1722b-b6d9-40f0-8b91-f50ee16d4199', 'N', '0', null, 'admin', '2017-12-19 09:39:44', null, null, '0');
INSERT INTO `tbop01` VALUES ('a6776286-590e-4271-9344-a061b01dabc6', 'AY', 'OP03', '2018', 'A0401', '湖北电网', '008945ca-bc16-4b0a-b53c-1a4079884ae8', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('a6a2fe13-1286-4f70-82db-e940630fe5f1', 'AY', 'OP02', '2018', 'B0106', '用户环评', 'bfb0db13-0430-4e39-922e-08754df16b7b', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('a7842919-543d-4af3-93b2-8baa62843f10', 'AY', 'OP07', '2017', '06', '总结与检查', '66d9f9f7-c549-4208-8c52-7f946eefb53b', 'N', '0', null, '00004', '2017-12-13 12:15:26', null, null, '0');
INSERT INTO `tbop01` VALUES ('a7f045b5-1340-42fd-9126-2fef08401344', 'AY', 'OP01', '2018', 'B0401', '电网项目后评价（湖北）', '5352c64f-f6fe-4a30-b24c-b18a27641185', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('a7fd5e28-d1d2-4ba6-ab58-644ad3fa6198', 'AY', 'OP01', '2018', 'B01', '环评业务', 'd1b14211-684f-45d4-9e66-69de7ec50871', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('aa9ad36c-0437-4d46-9275-c728539792a9', 'AY', 'OP07', '2018', '02', '培训与培养', '943b7315-8d46-4ab5-8f12-d9f3ae37d03c', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:16', null, null, '0');
INSERT INTO `tbop01` VALUES ('aafa613f-bf1a-4ca3-847b-a0e5b42c8c48', 'AY', 'OP01', '2018', 'B0206', '用户水保方案（省内其它区域）', '55a620cd-6e5e-4a1b-a786-e7afd8428941', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('ab6457cf-45c7-42a6-8d59-d87dd221bec5', 'AY', 'OP01', '2018', 'B05', '节能评估', 'd1b14211-684f-45d4-9e66-69de7ec50871', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('aba668a2-c6b2-4eb2-b7c5-b5fd34fa7726', 'AY', 'OP01', '2018', 'B0201', '电网水保方案（湖北）', '55a620cd-6e5e-4a1b-a786-e7afd8428941', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('acc27625-dd61-4c56-96bf-c937e23d4cf3', 'AY', 'OP04', '2017', '04', '日常维护', '04142471-1138-4ed8-a5f2-c020340fbdea', 'N', '0', null, 'admin', '2017-12-19 09:20:58', null, null, '0');
INSERT INTO `tbop01` VALUES ('acde4904-ce85-4218-a64c-751782927445', 'AY', 'OP01', '2018', 'A0504', '政府采购安全咨询', '21c1bd7d-33f1-41b1-b7db-46c62118d2e2', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('ad112198-65dd-4003-a400-daefce52a9fb', 'AY', 'OP03', '2018', 'A0202', '职评（省内非能源）', '16d8ed51-a498-459d-9b73-0d4a6451fdc0', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('ad6317f0-89e8-4167-b1d8-3336b2f3712f', 'AY', 'OP07', '2018', '03', '薪酬福利', '943b7315-8d46-4ab5-8f12-d9f3ae37d03c', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:16', null, null, '0');
INSERT INTO `tbop01` VALUES ('aec55233-0b7c-406f-a154-ab3fb03a3876', 'AY', 'OP08', '2017', '03', '职业健康', null, 'N', '0', null, 'admin', '2017-12-19 09:24:34', 'admin', '2017-12-19 09:30:33', '5');
INSERT INTO `tbop01` VALUES ('b041aab9-efa2-4298-827b-dd727901201c', 'AY', 'OP01', '2018', 'B0301', '风险稳定评估（湖北电网）', 'b1fcb0f0-34a6-4447-9575-5a473787f209', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('b1fcb0f0-34a6-4447-9575-5a473787f209', 'AY', 'OP01', '2018', 'B03', '风险稳定评价', 'd1b14211-684f-45d4-9e66-69de7ec50871', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('b291b675-310f-4a9e-b6ae-146cda1a983f', 'AY', 'OP12', '2017', '05', '制度与执行', '7f7f28dd-e8f1-4573-b002-677250d4fef1', 'N', '0', null, 'admin', '2017-12-19 09:41:43', null, null, '0');
INSERT INTO `tbop01` VALUES ('b442d999-92e7-4129-9fb0-8b6fc6c79ff3', 'AY', 'OP02', '2018', 'A05', '安全管家', 'd282ffb0-ec55-4623-a588-67adffa34ef1', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('b4641180-d4e2-431e-ae82-f132313b73f3', 'AY', 'OP03', '2018', 'A0502', '省外安全管家业务', 'dc8a6723-740f-4d94-bc3e-6c08e101abfd', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('b623c5aa-8d22-4b72-a4b9-8e9bd0ccdd2d', 'AY', 'OP10', '2017', '02', '内部管理', '26df77c0-d8f1-4851-98ed-2bcb724047dc', 'N', '0', null, 'admin', '2017-12-19 09:34:24', null, null, '0');
INSERT INTO `tbop01` VALUES ('b6c1c96c-9231-4891-96cb-e4480b8829a6', 'AY', 'OP01', '2018', 'A0401', '湖北电网', '44782c65-f7e2-4096-8b85-4a72516f44b8', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('b715b54f-8792-4bd1-a234-c04611d84632', 'AY', 'OP10', '2018', 'OP10', '行政', null, 'Y', '0', null, 'xuxh1', '2018-01-15 19:37:27', null, null, '0');
INSERT INTO `tbop01` VALUES ('b76dd1b7-9d04-46c8-a18c-bd42757682f9', 'AY', 'OP03', '2018', 'B', '环保业务', '16ff36aa-116a-485d-a277-f70cf14edfab', 'N', '1', null, 'admin', '2018-01-15 12:32:39', null, null, '1');
INSERT INTO `tbop01` VALUES ('b7c948cd-2ec4-413c-bd4d-75284d2b3dc8', 'AY', 'OP12', '2018', '04', '内部建设', 'e7df0948-c654-4393-8a03-bb1e11f5fd9f', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:47', null, null, '0');
INSERT INTO `tbop01` VALUES ('b8f6d66d-3318-46e3-8455-d2ffe6259850', 'AY', 'OP03', '2018', 'A0107', '安全篇章设计（湖北院）', '3726482e-3207-4c5f-9fcc-c009a5a8b9ac', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('b9ee0900-20a9-49da-b530-c5d8a22f4d91', 'AY', 'OP08', '2017', '09', '安全投入', '9492f2bb-ae18-4641-b3b7-cafa0ad2be66', 'N', '0', null, 'admin', '2017-12-19 09:31:38', null, null, '0');
INSERT INTO `tbop01` VALUES ('baa7a83f-8b01-40d0-bf20-fa7baffd720b', 'AY', 'OP03', '2018', 'B0501', '电网节能评估（湖北）', 'f6436964-b684-4161-a321-6686f932e0cc', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('bc2932e6-0b24-4b4f-8dc9-7567da0af31e', 'AY', 'OP08', '2017', '01', '制定安全管理目标和工作计划', null, 'N', '0', null, 'admin', '2017-12-19 09:23:47', 'admin', '2017-12-19 09:30:33', '3');
INSERT INTO `tbop01` VALUES ('be55a1c0-2749-42e2-b3e1-4eae2278d056', 'AY', 'OP03', '2018', 'A0504', '政府采购安全咨询', 'dc8a6723-740f-4d94-bc3e-6c08e101abfd', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('be9879cf-6ae4-4add-b9c0-814b1e7a3486', 'AY', 'OP03', '2018', 'B04', '后评价', 'b76dd1b7-9d04-46c8-a18c-bd42757682f9', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('bea6346a-f1ae-4b6e-84a3-5f2e13204787', 'AY', 'OP02', '2018', 'A0203', '检测（省内能源类、电建集团）', 'c021a3c7-7aab-4842-b676-c4c5dbfc1eb4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('bf4ce7ca-4ea0-4f36-87bb-3ed99e8294c5', 'AY', 'OP04', '2018', '04', '日常维护', 'd570bb2c-2b47-4d66-9e06-2396894016d2', 'N', '0', null, 'xuxh1', '2018-01-15 19:37:57', null, null, '0');
INSERT INTO `tbop01` VALUES ('bfb0db13-0430-4e39-922e-08754df16b7b', 'AY', 'OP02', '2018', 'B01', '环评业务', 'c60e11f6-ac78-43b5-b54b-4d06f2d8a5bd', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('c021a3c7-7aab-4842-b676-c4c5dbfc1eb4', 'AY', 'OP02', '2018', 'A02', '职评实验室', 'd282ffb0-ec55-4623-a588-67adffa34ef1', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('c068e936-7f00-49ae-a8e4-b22c863fa86c', 'AY', 'OP01', '2018', 'B0501', '电网节能评估（湖北）', 'ab6457cf-45c7-42a6-8d59-d87dd221bec5', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('c1398ccf-8d8d-47c4-9523-ad9c4d492fdf', 'AY', 'OP12', '2017', '01', '新建模块与功能', '7f7f28dd-e8f1-4573-b002-677250d4fef1', 'N', '0', null, 'admin', '2017-12-19 09:40:40', null, null, '0');
INSERT INTO `tbop01` VALUES ('c49942a5-5d56-4e5f-919d-59f93b656a7d', 'AY', 'OP02', '2018', 'A0301', '安全培训', '4bc6725d-eb41-4787-aacc-9d244201b26f', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('c4d51f04-a64a-48ac-9e1e-3e19d9be1b31', 'AY', 'OP03', '2018', 'A0205', '电网职评', '16d8ed51-a498-459d-9b73-0d4a6451fdc0', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('c5738a26-185f-4f9f-8d4e-7e50df0976b9', 'AY', 'OP08', '2017', '05', '安全培训', null, 'N', '0', null, 'admin', '2017-12-19 09:24:50', 'admin', '2017-12-19 09:30:33', '3');
INSERT INTO `tbop01` VALUES ('c5e1722b-b6d9-40f0-8b91-f50ee16d4199', 'AY', 'OP11', '2017', 'OP11', '宣传', null, 'Y', '0', null, 'admin', '2017-12-19 09:36:20', null, null, '0');
INSERT INTO `tbop01` VALUES ('c60e11f6-ac78-43b5-b54b-4d06f2d8a5bd', 'AY', 'OP02', '2018', 'B', '环保业务', '6ef5dcf8-e7c4-46d8-b2f5-dbe8ea3ffe58', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('c67da2ed-7cad-4959-b7bf-589ccdbf8892', 'AY', 'OP11', '2018', '02', '宣传目标', 'eef0c017-134e-4625-9304-066ede74c4b0', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:34', null, null, '0');
INSERT INTO `tbop01` VALUES ('c806313f-b8a5-459e-ade2-de3f0d363ac5', 'AY', 'OP02', '2018', 'A0502', '省外安全管家业务', 'b442d999-92e7-4129-9fb0-8b6fc6c79ff3', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('c80ab925-ffcb-44bd-9a62-9775b3aef621', 'AY', 'OP02', '2018', 'B0703', '政府咨询采购', '9dd8649d-eb0f-424a-bb46-45ebf6935572', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('c8bc7050-d7dc-4b6d-97b7-812daf7cd26d', 'AY', 'OP01', '2018', 'A0203', '检测（省内能源类、电建集团）', 'e7633d97-f760-4c40-92d5-e935b72d6ec6', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('c8cd5a99-a3fd-4ba9-b6c3-521a27a4f86f', 'AY', 'OP02', '2018', 'A0504', '政府采购安全咨询', 'b442d999-92e7-4129-9fb0-8b6fc6c79ff3', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('c98db5f3-0b7f-4178-a132-eb7ef3ae7ccf', 'AY', 'OP01', '2018', 'B0702', '生态修复（水保专项设计等）', 'e614a911-cfc0-4fa0-a52b-733a2e9d5e67', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('cc75fd7e-d3a1-4876-b9ea-845fc9bedff1', 'AY', 'OP01', '2018', 'A0104', '安全验收、现状评价（湖北、重庆发电）', 'f6c1888c-97f2-44ec-b7dd-112e720f63e8', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('cff56dbe-17cf-400a-83dd-d7ec7c0ad39a', 'AY', 'OP01', '2018', 'B0503', '电网节能评估（省外）', 'ab6457cf-45c7-42a6-8d59-d87dd221bec5', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('d0083d17-6dac-4df5-bcab-3506f4092b7b', 'AY', 'OP12', '2018', '05', '制度与执行', 'e7df0948-c654-4393-8a03-bb1e11f5fd9f', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:47', null, null, '0');
INSERT INTO `tbop01` VALUES ('d0ad092c-1e41-4a0e-8796-024217568e8c', 'AY', 'OP02', '2018', 'B0501', '电网节能评估（湖北）', '7fc3e1d7-ff11-46c1-a724-38a502821d5e', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('d12d316f-239c-49ea-a324-30de8389f7f1', 'AY', 'OP03', '2018', 'A0106', '承分包商安全评估（湖北电网）', '3726482e-3207-4c5f-9fcc-c009a5a8b9ac', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('d1b14211-684f-45d4-9e66-69de7ec50871', 'AY', 'OP01', '2018', 'B', '环保业务', '7d3f3085-720c-45a1-8c74-62d4c7148593', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('d22e9739-f328-452a-9903-de8d02010893', 'AY', 'OP03', '2018', 'B0503', '电网节能评估（省外）', 'f6436964-b684-4161-a321-6686f932e0cc', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('d282ffb0-ec55-4623-a588-67adffa34ef1', 'AY', 'OP02', '2018', 'A', '安全业务', '6ef5dcf8-e7c4-46d8-b2f5-dbe8ea3ffe58', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('d4de37cd-749d-4c64-a5b1-db4bec278c47', 'AY', 'OP03', '2018', 'B0602', '电网发展诊断', '58645030-6a92-4f5a-b57a-bd98eb4daa16', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('d570bb2c-2b47-4d66-9e06-2396894016d2', 'AY', 'OP04', '2018', 'OP04', '资质', null, 'Y', '0', null, 'xuxh1', '2018-01-15 19:37:57', null, null, '0');
INSERT INTO `tbop01` VALUES ('d5845d06-d1ec-4b15-9526-76ecc9bbc45d', 'AY', 'OP02', '2018', 'A0101', '安全预评价（湖北电网）', '13ebf78c-8f80-48da-935b-15a40f2436b4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('d91db15e-79f1-47c9-9fb6-14edadf88064', 'AY', 'OP02', '2018', 'B0102', '新能源环评（省内主体及线路）', 'bfb0db13-0430-4e39-922e-08754df16b7b', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('da8904aa-8f5a-46e1-8948-bf139af9552a', 'AY', 'OP07', '2017', '03', '薪酬福利', '66d9f9f7-c549-4208-8c52-7f946eefb53b', 'N', '0', null, '00004', '2017-12-13 12:14:22', null, null, '0');
INSERT INTO `tbop01` VALUES ('dacf4d45-7a54-4754-a731-63ca2979458f', 'AY', 'OP01', '2018', 'B0701', '电网环保治理工程', 'e614a911-cfc0-4fa0-a52b-733a2e9d5e67', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('dbb4697f-2705-42ec-a0d4-8d6e6b56a8dd', 'AY', 'OP02', '2018', 'B0201', '电网水保方案（湖北）', '08d2648b-76d7-4e11-a151-0df11ca29e9d', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('dc8a6723-740f-4d94-bc3e-6c08e101abfd', 'AY', 'OP03', '2018', 'A05', '安全管家', '0055dc05-ba61-4b07-8ee0-f60a3ffd5341', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:01', '2');
INSERT INTO `tbop01` VALUES ('dcd0a531-b11b-474b-a4cb-2da059762442', 'AY', 'OP01', '2018', 'B0106', '用户环评', 'a7fd5e28-d1d2-4ba6-ab58-644ad3fa6198', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('dce703ed-4af7-4e6e-8fcb-a1db5f129d33', 'AY', 'OP02', '2018', 'A0206', '环境年度监测', 'c021a3c7-7aab-4842-b676-c4c5dbfc1eb4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('ddcc0f38-e8a3-4a76-8f9a-0ec3ecc85559', 'AY', 'OP01', '2018', 'A0103', '安全预评价（省外，非电，海上风电）', 'f6c1888c-97f2-44ec-b7dd-112e720f63e8', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('ddde887b-7dd8-4b94-b933-b2b79cfd1881', 'AY', 'OP03', '2018', 'B01', '环评业务', 'b76dd1b7-9d04-46c8-a18c-bd42757682f9', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('dff087a4-cc93-429e-b522-74ed2b3e0970', 'AY', 'OP01', '2018', 'B0103', '新能源环评（省外主体及线路）', 'a7fd5e28-d1d2-4ba6-ab58-644ad3fa6198', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('e1c740c2-bdb7-4780-a310-10c55a9127ec', 'AY', 'OP07', '2017', '07', '其他', '66d9f9f7-c549-4208-8c52-7f946eefb53b', 'N', '0', null, '00004', '2017-12-13 12:15:34', null, null, '0');
INSERT INTO `tbop01` VALUES ('e1ee8306-4385-49f2-8be7-ec2c8b777b2b', 'AY', 'OP03', '2018', 'B03', '风险稳定评价', 'b76dd1b7-9d04-46c8-a18c-bd42757682f9', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('e32cd7be-c58e-40df-92c3-8266659e0546', 'AY', 'OP03', '2018', 'B0502', '发电节能评估（含新能源）', 'f6436964-b684-4161-a321-6686f932e0cc', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('e34edadf-b063-4ec8-bcad-ccb148ad5787', 'AY', 'OP03', '2018', 'A0105', '本质安全评价（湖北电网）', '3726482e-3207-4c5f-9fcc-c009a5a8b9ac', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('e37e4bfb-cc93-4bbc-aeb1-cf4dafdbb7dd', 'AY', 'OP03', '2018', 'A0103', '安全预评价（省外，非电，海上风电）', '3726482e-3207-4c5f-9fcc-c009a5a8b9ac', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('e4f259c5-51b9-4af9-9dff-27d38ed7e721', 'AY', 'OP08', '2018', '12', '安全培训', '7b6ce647-7592-4480-a93b-bed330805715', 'N', '0', null, 'xuxh1', '2018-01-15 19:37:38', null, null, '0');
INSERT INTO `tbop01` VALUES ('e56cad46-ab42-4d3b-92fe-67148098aa8c', 'AY', 'OP04', '2017', '03', '日常管理', '04142471-1138-4ed8-a5f2-c020340fbdea', 'N', '0', null, 'admin', '2017-12-19 09:20:42', null, null, '0');
INSERT INTO `tbop01` VALUES ('e5df7928-5c45-4d00-8da5-bce27f888642', 'AY', 'OP04', '2018', '01', '资质延续', 'd570bb2c-2b47-4d66-9e06-2396894016d2', 'N', '0', null, 'xuxh1', '2018-01-15 19:37:57', 'admin', '2017-12-19 09:20:10', '1');
INSERT INTO `tbop01` VALUES ('e614a911-cfc0-4fa0-a52b-733a2e9d5e67', 'AY', 'OP01', '2018', 'B07', '环保管家', 'd1b14211-684f-45d4-9e66-69de7ec50871', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('e74b7b92-5532-47cf-b211-476fcb00e3fd', 'AY', 'OP04', '2018', '02', '专项申报', 'd570bb2c-2b47-4d66-9e06-2396894016d2', 'N', '0', null, 'xuxh1', '2018-01-15 19:37:57', null, null, '0');
INSERT INTO `tbop01` VALUES ('e7633d97-f760-4c40-92d5-e935b72d6ec6', 'AY', 'OP01', '2018', 'A02', '职评实验室', '21cc2498-22b5-4ba5-8a53-0bdc02a89040', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('e7a07ffa-5482-4a06-8fac-c64b14662800', 'AY', 'OP02', '2018', 'A0205', '电网职评', 'c021a3c7-7aab-4842-b676-c4c5dbfc1eb4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('e7de09ba-8717-4660-b6ea-1bc168bb1d3a', 'AY', 'OP01', '2018', 'A0402', '电建集团', '44782c65-f7e2-4096-8b85-4a72516f44b8', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('e7df0948-c654-4393-8a03-bb1e11f5fd9f', 'AY', 'OP12', '2018', 'OP12', '信息化', null, 'Y', '0', null, 'xuxh1', '2018-01-15 19:38:47', null, null, '0');
INSERT INTO `tbop01` VALUES ('e88942b1-1a6d-4b08-9240-dfc19ad0aae9', 'AY', 'OP03', '2018', 'B0209', '水资源论证', 'f8cad5ed-b1d5-46c1-8952-e463cee36289', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('e9ff8a88-9e0e-4b33-8ebf-0cff318e0674', 'AY', 'OP01', '2018', 'B0208', '水保监测(含电网项目)', '55a620cd-6e5e-4a1b-a786-e7afd8428941', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('ec5dca6d-4187-4dc8-9e65-0b239e05f89a', 'AY', 'OP03', '2018', 'B0701', '电网环保治理工程', '141b9534-bcf8-46d4-ac96-f9c52e1bd0eb', 'N', '1', null, 'admin', '2018-01-15 12:32:39', null, null, '1');
INSERT INTO `tbop01` VALUES ('ee572593-0437-4144-a534-c6c92e542968', 'AY', 'OP02', '2018', 'A04', '应急产业', 'd282ffb0-ec55-4623-a588-67adffa34ef1', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('eef0c017-134e-4625-9304-066ede74c4b0', 'AY', 'OP11', '2018', 'OP11', '宣传', null, 'Y', '0', null, 'xuxh1', '2018-01-15 19:38:34', null, null, '0');
INSERT INTO `tbop01` VALUES ('eff43a1b-79f1-4d06-8c4c-eb82e5a801e5', 'AY', 'OP08', '2017', '06', '安全检查', null, 'N', '0', null, 'admin', '2017-12-19 09:25:02', 'admin', '2017-12-19 09:30:33', '3');
INSERT INTO `tbop01` VALUES ('eff6c135-fd0f-4a58-898f-d23d132b6a45', 'AY', 'OP03', '2018', 'A03', '安全咨询', '0055dc05-ba61-4b07-8ee0-f60a3ffd5341', 'N', '1', null, 'admin', '2018-01-15 12:32:38', 'admin', '2017-12-08 23:41:01', '2');
INSERT INTO `tbop01` VALUES ('f0495a54-f0fb-4785-9749-df19c23a2b55', 'AY', 'OP01', '2018', 'A0403', '发电企业（湖北、重庆）', '44782c65-f7e2-4096-8b85-4a72516f44b8', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('f43c3c88-ab9f-45aa-9942-86ddbae4dbe2', 'AY', 'OP02', '2018', 'B0103', '新能源环评（省外主体及线路）', 'bfb0db13-0430-4e39-922e-08754df16b7b', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('f4bc55b5-7e98-4769-824f-6b503336cdfc', 'AY', 'OP07', '2018', '06', '制度与执行', '943b7315-8d46-4ab5-8f12-d9f3ae37d03c', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:16', null, null, '0');
INSERT INTO `tbop01` VALUES ('f6436964-b684-4161-a321-6686f932e0cc', 'AY', 'OP03', '2018', 'B05', '节能评估', 'b76dd1b7-9d04-46c8-a18c-bd42757682f9', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('f6737fb9-090f-491b-ae61-c2ed4891f40d', 'AY', 'OP02', '2018', 'B0705', '其它新型环保业务', '9dd8649d-eb0f-424a-bb46-45ebf6935572', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('f68d042d-5450-466c-b268-7061698b6f19', 'AY', 'OP01', '2018', 'B0101', '电网环评（湖北）', 'a7fd5e28-d1d2-4ba6-ab58-644ad3fa6198', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('f6c1888c-97f2-44ec-b7dd-112e720f63e8', 'AY', 'OP01', '2018', 'A01', '安全评价', '21cc2498-22b5-4ba5-8a53-0bdc02a89040', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('f7c861e0-45a5-4d9f-be84-df0bc59b3b65', 'AY', 'OP02', '2018', 'B0205', '用户水保方案(黄石、随州、宜昌）', '08d2648b-76d7-4e11-a151-0df11ca29e9d', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('f7ce1887-62bf-4a6b-aa7a-f126d91436c0', 'AY', 'OP12', '2018', '03', '平台维护与管理', 'e7df0948-c654-4393-8a03-bb1e11f5fd9f', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:47', null, null, '0');
INSERT INTO `tbop01` VALUES ('f8cad5ed-b1d5-46c1-8952-e463cee36289', 'AY', 'OP03', '2018', 'B02', '水保业务', 'b76dd1b7-9d04-46c8-a18c-bd42757682f9', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('f97f7d20-1578-4084-8d03-7cbf6fe0531e', 'AY', 'OP13', '2018', 'OP13', '风控与监察', null, 'Y', '0', null, 'xuxh1', '2018-01-15 19:39:02', null, null, '0');
INSERT INTO `tbop01` VALUES ('f9fc1ae6-6838-4551-ba67-1a2ea00a414d', 'AY', 'OP02', '2018', 'A0102', '安全预评价（湖北新能源、分布式）', '13ebf78c-8f80-48da-935b-15a40f2436b4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('fced8d47-310e-4446-94b5-3787581fa81a', 'AY', 'OP01', '2018', 'A0101', '安全预评价（湖北电网）', 'f6c1888c-97f2-44ec-b7dd-112e720f63e8', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('fcf7ece1-c0a1-4098-a9ab-1fc7eeb6c367', 'AY', 'OP11', '2018', '03', '宣传积分', 'eef0c017-134e-4625-9304-066ede74c4b0', 'N', '0', null, 'xuxh1', '2018-01-15 19:38:34', null, null, '0');
INSERT INTO `tbop01` VALUES ('fd055566-0022-4d5c-a85c-ac6b3d45dbb8', 'AY', 'OP03', '2018', 'A0506', '其他新业务（安全信息化等）', 'dc8a6723-740f-4d94-bc3e-6c08e101abfd', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('fd5aa888-bd3a-4454-8767-97761d5d5d0b', 'AY', 'OP01', '2018', 'A03', '安全咨询', '21cc2498-22b5-4ba5-8a53-0bdc02a89040', 'N', '1', null, 'admin', '2018-01-15 11:49:11', null, null, '1');
INSERT INTO `tbop01` VALUES ('fd5ab837-48a6-4141-950f-4685c492e52b', 'AY', 'OP03', '2018', 'A0204', '检测（省内非能源、省外非集团项目）', '16d8ed51-a498-459d-9b73-0d4a6451fdc0', 'N', '1', null, 'admin', '2018-01-15 12:32:38', null, null, '1');
INSERT INTO `tbop01` VALUES ('fe2776e8-da6a-43e6-8093-740cf540d261', 'AY', 'OP01', '2018', 'B0102', '新能源环评（省内主体及线路）', 'a7fd5e28-d1d2-4ba6-ab58-644ad3fa6198', 'N', '1', null, 'admin', '2018-01-15 11:49:12', null, null, '1');
INSERT INTO `tbop01` VALUES ('febf7314-29e0-4a8e-a8be-b2470169f3b1', 'AY', 'OP02', '2018', 'B06', '土地复垦、发展诊断', 'c60e11f6-ac78-43b5-b54b-4d06f2d8a5bd', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('ff31e7ff-7389-45ee-ba3b-1dc694830fb8', 'AY', 'OP02', '2018', 'B0702', '生态修复（水保专项设计等）', '9dd8649d-eb0f-424a-bb46-45ebf6935572', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('ff42698a-ff95-4686-8d16-ee8c7753737d', 'AY', 'OP02', '2018', 'A0103', '安全预评价（省外，非电，海上风电）', '13ebf78c-8f80-48da-935b-15a40f2436b4', 'N', '1', null, 'liuwl', '2018-01-09 14:04:50', null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A', 'AY', 'OP01', '2017', 'A', '安全业务', 'root17OP01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A01', 'AY', 'OP01', '2017', 'A01', '安全评价', 'OP01A', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0101', 'AY', 'OP01', '2017', 'A0101', '安全预评价（湖北电网）', 'OP01A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0102', 'AY', 'OP01', '2017', 'A0102', '安全预评价（湖北新能源、分布式）', 'OP01A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0103', 'AY', 'OP01', '2017', 'A0103', '安全预评价（省外，非电，海上风电）', 'OP01A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0104', 'AY', 'OP01', '2017', 'A0104', '安全验收、现状评价（湖北、重庆发电）', 'OP01A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0105', 'AY', 'OP01', '2017', 'A0105', '本质安全评价（湖北电网）', 'OP01A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0106', 'AY', 'OP01', '2017', 'A0106', '承分包商安全评估（湖北电网）', 'OP01A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0107', 'AY', 'OP01', '2017', 'A0107', '安全篇章设计（湖北院）', 'OP01A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A02', 'AY', 'OP01', '2017', 'A02', '职评实验室', 'OP01A', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0201', 'AY', 'OP01', '2017', 'A0201', '职评（省内能源）', 'OP01A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0202', 'AY', 'OP01', '2017', 'A0202', '职评（省内非能源）', 'OP01A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0203', 'AY', 'OP01', '2017', 'A0203', '检测（省内能源类、电建集团）', 'OP01A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0204', 'AY', 'OP01', '2017', 'A0204', '检测（省内非能源、省外非集团项目）', 'OP01A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0205', 'AY', 'OP01', '2017', 'A0205', '电网职评', 'OP01A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0206', 'AY', 'OP01', '2017', 'A0206', '环境年度监测', 'OP01A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A03', 'AY', 'OP01', '2017', 'A03', '安全咨询', 'OP01A', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0301', 'AY', 'OP01', '2017', 'A0301', '安全培训', 'OP01A03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0302', 'AY', 'OP01', '2017', 'A0302', '标准化评审、自查、回头看（集团公司）', 'OP01A03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A04', 'AY', 'OP01', '2017', 'A04', '应急产业', 'OP01A', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0401', 'AY', 'OP01', '2017', 'A0401', '湖北电网', 'OP01A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0402', 'AY', 'OP01', '2017', 'A0402', '电建集团', 'OP01A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0403', 'AY', 'OP01', '2017', 'A0403', '发电企业（湖北、重庆）', 'OP01A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0404', 'AY', 'OP01', '2017', 'A0404', '省外（含发电、电网）应急产业', 'OP01A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A05', 'AY', 'OP01', '2017', 'A05', '安全管家', 'OP01A', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0501', 'AY', 'OP01', '2017', 'A0501', '湖北、重庆发电企业安全管家业务', 'OP01A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0502', 'AY', 'OP01', '2017', 'A0502', '省外安全管家业务', 'OP01A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0503', 'AY', 'OP01', '2017', 'A0503', '安全工程', 'OP01A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0504', 'AY', 'OP01', '2017', 'A0504', '政府采购安全咨询', 'OP01A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0505', 'AY', 'OP01', '2017', 'A0505', '安全科研', 'OP01A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01A0506', 'AY', 'OP01', '2017', 'A0506', '其他新业务（安全信息化等）', 'OP01A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B', 'AY', 'OP01', '2017', 'B', '环保业务', 'root17OP01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B01', 'AY', 'OP01', '2017', 'B01', '环评业务', 'OP01B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0101', 'AY', 'OP01', '2017', 'B0101', '电网环评（湖北）', 'OP01B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0102', 'AY', 'OP01', '2017', 'B0102', '新能源环评（省内主体及线路）', 'OP01B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0103', 'AY', 'OP01', '2017', 'B0103', '新能源环评（省外主体及线路）', 'OP01B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0104', 'AY', 'OP01', '2017', 'B0104', '电网环保业务（省外）', 'OP01B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0105', 'AY', 'OP01', '2017', 'B0105', '电网环保验收（湖北）', 'OP01B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0106', 'AY', 'OP01', '2017', 'B0106', '用户环评', 'OP01B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0107', 'AY', 'OP01', '2017', 'B0107', '环保验收、监理', 'OP01B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0108', 'AY', 'OP01', '2017', 'B0108', '生态专题', 'OP01B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0109', 'AY', 'OP01', '2017', 'B0109', '院环保篇章设计', 'OP01B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B02', 'AY', 'OP01', '2017', 'B02', '水保业务', 'OP01B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0201', 'AY', 'OP01', '2017', 'B0201', '电网水保方案（湖北）', 'OP01B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0202', 'AY', 'OP01', '2017', 'B0202', '新能源水保方案（省内主体及线路）', 'OP01B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0203', 'AY', 'OP01', '2017', 'B0203', '电网水保业务（省外）', 'OP01B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0204', 'AY', 'OP01', '2017', 'B0204', '新能源水保（省外主体及线路）', 'OP01B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0205', 'AY', 'OP01', '2017', 'B0205', '用户水保方案(黄石、随州、宜昌）', 'OP01B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0206', 'AY', 'OP01', '2017', 'B0206', '用户水保方案（省内其它区域）', 'OP01B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0207', 'AY', 'OP01', '2017', 'B0207', '用户水保验收（含新能源）', 'OP01B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0208', 'AY', 'OP01', '2017', 'B0208', '水保监测(含电网项目)', 'OP01B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0209', 'AY', 'OP01', '2017', 'B0209', '水资源论证', 'OP01B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B03', 'AY', 'OP01', '2017', 'B03', '风险稳定评价', 'OP01B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0301', 'AY', 'OP01', '2017', 'B0301', '风险稳定评估（湖北电网）', 'OP01B03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0302', 'AY', 'OP01', '2017', 'B0302', '风险稳定评估（非电网项目）', 'OP01B03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B04', 'AY', 'OP01', '2017', 'B04', '后评价', 'OP01B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0401', 'AY', 'OP01', '2017', 'B0401', '电网项目后评价（湖北）', 'OP01B04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0402', 'AY', 'OP01', '2017', 'B0402', '新能源后评价', 'OP01B04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0403', 'AY', 'OP01', '2017', 'B0403', '电网后评价（省外）', 'OP01B04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B05', 'AY', 'OP01', '2017', 'B05', '节能评估', 'OP01B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0501', 'AY', 'OP01', '2017', 'B0501', '电网节能评估（湖北）', 'OP01B05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0502', 'AY', 'OP01', '2017', 'B0502', '发电节能评估（含新能源）', 'OP01B05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0503', 'AY', 'OP01', '2017', 'B0503', '电网节能评估（省外）', 'OP01B05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B06', 'AY', 'OP01', '2017', 'B06', '土地复垦、发展诊断', 'OP01B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0601', 'AY', 'OP01', '2017', 'B0601', '电网土地复垦', 'OP01B06', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0602', 'AY', 'OP01', '2017', 'B0602', '电网发展诊断', 'OP01B06', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B07', 'AY', 'OP01', '2017', 'B07', '环保管家', 'OP01B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0701', 'AY', 'OP01', '2017', 'B0701', '电网环保治理工程', 'OP01B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0702', 'AY', 'OP01', '2017', 'B0702', '生态修复（水保专项设计等）', 'OP01B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0703', 'AY', 'OP01', '2017', 'B0703', '政府咨询采购', 'OP01B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0704', 'AY', 'OP01', '2017', 'B0704', '环保科研课题', 'OP01B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP01B0705', 'AY', 'OP01', '2017', 'B0705', '其它新型环保业务', 'OP01B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A', 'AY', 'OP02', '2017', 'A', '安全业务', 'root17OP02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A01', 'AY', 'OP02', '2017', 'A01', '安全评价', 'OP02A', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0101', 'AY', 'OP02', '2017', 'A0101', '安全预评价（湖北电网）', 'OP02A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0102', 'AY', 'OP02', '2017', 'A0102', '安全预评价（湖北新能源、分布式）', 'OP02A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0103', 'AY', 'OP02', '2017', 'A0103', '安全预评价（省外，非电，海上风电）', 'OP02A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0104', 'AY', 'OP02', '2017', 'A0104', '安全验收、现状评价（湖北、重庆发电）', 'OP02A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0105', 'AY', 'OP02', '2017', 'A0105', '本质安全评价（湖北电网）', 'OP02A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0106', 'AY', 'OP02', '2017', 'A0106', '承分包商安全评估（湖北电网）', 'OP02A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0107', 'AY', 'OP02', '2017', 'A0107', '安全篇章设计（湖北院）', 'OP02A01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A02', 'AY', 'OP02', '2017', 'A02', '职评实验室', 'OP02A', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0201', 'AY', 'OP02', '2017', 'A0201', '职评（省内能源）', 'OP02A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0202', 'AY', 'OP02', '2017', 'A0202', '职评（省内非能源）', 'OP02A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0203', 'AY', 'OP02', '2017', 'A0203', '检测（省内能源类、电建集团）', 'OP02A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0204', 'AY', 'OP02', '2017', 'A0204', '检测（省内非能源、省外非集团项目）', 'OP02A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0205', 'AY', 'OP02', '2017', 'A0205', '电网职评', 'OP02A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0206', 'AY', 'OP02', '2017', 'A0206', '环境年度监测', 'OP02A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A03', 'AY', 'OP02', '2017', 'A03', '安全咨询', 'OP02A', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0301', 'AY', 'OP02', '2017', 'A0301', '安全培训', 'OP02A03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0302', 'AY', 'OP02', '2017', 'A0302', '标准化评审、自查、回头看（集团公司）', 'OP02A03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A04', 'AY', 'OP02', '2017', 'A04', '应急产业', 'OP02A', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0401', 'AY', 'OP02', '2017', 'A0401', '湖北电网', 'OP02A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0402', 'AY', 'OP02', '2017', 'A0402', '电建集团', 'OP02A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0403', 'AY', 'OP02', '2017', 'A0403', '发电企业（湖北、重庆）', 'OP02A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0404', 'AY', 'OP02', '2017', 'A0404', '省外（含发电、电网）应急产业', 'OP02A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A05', 'AY', 'OP02', '2017', 'A05', '安全管家', 'OP02A', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0501', 'AY', 'OP02', '2017', 'A0501', '湖北、重庆发电企业安全管家业务', 'OP02A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0502', 'AY', 'OP02', '2017', 'A0502', '省外安全管家业务', 'OP02A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0503', 'AY', 'OP02', '2017', 'A0503', '安全工程', 'OP02A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0504', 'AY', 'OP02', '2017', 'A0504', '政府采购安全咨询', 'OP02A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0505', 'AY', 'OP02', '2017', 'A0505', '安全科研', 'OP02A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02A0506', 'AY', 'OP02', '2017', 'A0506', '其他新业务（安全信息化等）', 'OP02A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B', 'AY', 'OP02', '2017', 'B', '环保业务', 'root17OP02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B01', 'AY', 'OP02', '2017', 'B01', '环评业务', 'OP02B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0101', 'AY', 'OP02', '2017', 'B0101', '电网环评（湖北）', 'OP02B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0102', 'AY', 'OP02', '2017', 'B0102', '新能源环评（省内主体及线路）', 'OP02B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0103', 'AY', 'OP02', '2017', 'B0103', '新能源环评（省外主体及线路）', 'OP02B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0104', 'AY', 'OP02', '2017', 'B0104', '电网环保业务（省外）', 'OP02B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0105', 'AY', 'OP02', '2017', 'B0105', '电网环保验收（湖北）', 'OP02B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0106', 'AY', 'OP02', '2017', 'B0106', '用户环评', 'OP02B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0107', 'AY', 'OP02', '2017', 'B0107', '环保验收、监理', 'OP02B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0108', 'AY', 'OP02', '2017', 'B0108', '生态专题', 'OP02B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0109', 'AY', 'OP02', '2017', 'B0109', '院环保篇章设计', 'OP02B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B02', 'AY', 'OP02', '2017', 'B02', '水保业务', 'OP02B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0201', 'AY', 'OP02', '2017', 'B0201', '电网水保方案（湖北）', 'OP02B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0202', 'AY', 'OP02', '2017', 'B0202', '新能源水保方案（省内主体及线路）', 'OP02B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0203', 'AY', 'OP02', '2017', 'B0203', '电网水保业务（省外）', 'OP02B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0204', 'AY', 'OP02', '2017', 'B0204', '新能源水保（省外主体及线路）', 'OP02B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0205', 'AY', 'OP02', '2017', 'B0205', '用户水保方案(黄石、随州、宜昌）', 'OP02B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0206', 'AY', 'OP02', '2017', 'B0206', '用户水保方案（省内其它区域）', 'OP02B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0207', 'AY', 'OP02', '2017', 'B0207', '用户水保验收（含新能源）', 'OP02B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0208', 'AY', 'OP02', '2017', 'B0208', '水保监测(含电网项目)', 'OP02B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0209', 'AY', 'OP02', '2017', 'B0209', '水资源论证', 'OP02B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B03', 'AY', 'OP02', '2017', 'B03', '风险稳定评价', 'OP02B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0301', 'AY', 'OP02', '2017', 'B0301', '风险稳定评估（湖北电网）', 'OP02B03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0302', 'AY', 'OP02', '2017', 'B0302', '风险稳定评估（非电网项目）', 'OP02B03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B04', 'AY', 'OP02', '2017', 'B04', '后评价', 'OP02B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0401', 'AY', 'OP02', '2017', 'B0401', '电网项目后评价（湖北）', 'OP02B04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0402', 'AY', 'OP02', '2017', 'B0402', '新能源后评价', 'OP02B04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0403', 'AY', 'OP02', '2017', 'B0403', '电网后评价（省外）', 'OP02B04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B05', 'AY', 'OP02', '2017', 'B05', '节能评估', 'OP02B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0501', 'AY', 'OP02', '2017', 'B0501', '电网节能评估（湖北）', 'OP02B05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0502', 'AY', 'OP02', '2017', 'B0502', '发电节能评估（含新能源）', 'OP02B05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0503', 'AY', 'OP02', '2017', 'B0503', '电网节能评估（省外）', 'OP02B05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B06', 'AY', 'OP02', '2017', 'B06', '土地复垦、发展诊断', 'OP02B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0601', 'AY', 'OP02', '2017', 'B0601', '电网土地复垦', 'OP02B06', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0602', 'AY', 'OP02', '2017', 'B0602', '电网发展诊断', 'OP02B06', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B07', 'AY', 'OP02', '2017', 'B07', '环保管家', 'OP02B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0701', 'AY', 'OP02', '2017', 'B0701', '电网环保治理工程', 'OP02B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0702', 'AY', 'OP02', '2017', 'B0702', '生态修复（水保专项设计等）', 'OP02B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0703', 'AY', 'OP02', '2017', 'B0703', '政府咨询采购', 'OP02B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0704', 'AY', 'OP02', '2017', 'B0704', '环保科研课题', 'OP02B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP02B0705', 'AY', 'OP02', '2017', 'B0705', '其它新型环保业务', 'OP02B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A', 'AY', 'OP03', '2017', 'A', '安全业务', 'root17OP03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A01', 'AY', 'OP03', '2017', 'A01', '安全评价', 'OP03A', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:01', '2');
INSERT INTO `tbop01` VALUES ('OP03A0101', 'AY', 'OP03', '2017', 'A0101', '安全预评价（湖北电网）', 'OP03A01', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('OP03A0102', 'AY', 'OP03', '2017', 'A0102', '安全预评价（湖北新能源、分布式）', 'OP03A01', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('OP03A0103', 'AY', 'OP03', '2017', 'A0103', '安全预评价（省外，非电，海上风电）', 'OP03A01', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('OP03A0104', 'AY', 'OP03', '2017', 'A0104', '安全验收、现状评价（湖北、重庆发电）', 'OP03A01', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('OP03A0105', 'AY', 'OP03', '2017', 'A0105', '本质安全评价（湖北电网）', 'OP03A01', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('OP03A0106', 'AY', 'OP03', '2017', 'A0106', '承分包商安全评估（湖北电网）', 'OP03A01', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('OP03A0107', 'AY', 'OP03', '2017', 'A0107', '安全篇章设计（湖北院）', 'OP03A01', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:13', '10');
INSERT INTO `tbop01` VALUES ('OP03A02', 'AY', 'OP03', '2017', 'A02', '职评实验室', 'OP03A', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:01', '2');
INSERT INTO `tbop01` VALUES ('OP03A0201', 'AY', 'OP03', '2017', 'A0201', '职评（省内能源）', 'OP03A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0202', 'AY', 'OP03', '2017', 'A0202', '职评（省内非能源）', 'OP03A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0203', 'AY', 'OP03', '2017', 'A0203', '检测（省内能源类、电建集团）', 'OP03A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0204', 'AY', 'OP03', '2017', 'A0204', '检测（省内非能源、省外非集团项目）', 'OP03A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0205', 'AY', 'OP03', '2017', 'A0205', '电网职评', 'OP03A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0206', 'AY', 'OP03', '2017', 'A0206', '环境年度监测', 'OP03A02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A03', 'AY', 'OP03', '2017', 'A03', '安全咨询', 'OP03A', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:01', '2');
INSERT INTO `tbop01` VALUES ('OP03A0301', 'AY', 'OP03', '2017', 'A0301', '安全培训', 'OP03A03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0302', 'AY', 'OP03', '2017', 'A0302', '标准化评审、自查、回头看（集团公司）', 'OP03A03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A04', 'AY', 'OP03', '2017', 'A04', '应急产业', 'OP03A', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:01', '2');
INSERT INTO `tbop01` VALUES ('OP03A0401', 'AY', 'OP03', '2017', 'A0401', '湖北电网', 'OP03A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0402', 'AY', 'OP03', '2017', 'A0402', '电建集团', 'OP03A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0403', 'AY', 'OP03', '2017', 'A0403', '发电企业（湖北、重庆）', 'OP03A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0404', 'AY', 'OP03', '2017', 'A0404', '省外（含发电、电网）应急产业', 'OP03A04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A05', 'AY', 'OP03', '2017', 'A05', '安全管家', 'OP03A', 'N', '1', null, null, null, 'admin', '2017-12-08 23:41:01', '2');
INSERT INTO `tbop01` VALUES ('OP03A0501', 'AY', 'OP03', '2017', 'A0501', '湖北、重庆发电企业安全管家业务', 'OP03A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0502', 'AY', 'OP03', '2017', 'A0502', '省外安全管家业务', 'OP03A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0503', 'AY', 'OP03', '2017', 'A0503', '安全工程', 'OP03A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0504', 'AY', 'OP03', '2017', 'A0504', '政府采购安全咨询', 'OP03A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0505', 'AY', 'OP03', '2017', 'A0505', '安全科研', 'OP03A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03A0506', 'AY', 'OP03', '2017', 'A0506', '其他新业务（安全信息化等）', 'OP03A05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B', 'AY', 'OP03', '2017', 'B', '环保业务', 'root17OP03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B01', 'AY', 'OP03', '2017', 'B01', '环评业务', 'OP03B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0101', 'AY', 'OP03', '2017', 'B0101', '电网环评（湖北）', 'OP03B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0102', 'AY', 'OP03', '2017', 'B0102', '新能源环评（省内主体及线路）', 'OP03B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0103', 'AY', 'OP03', '2017', 'B0103', '新能源环评（省外主体及线路）', 'OP03B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0104', 'AY', 'OP03', '2017', 'B0104', '电网环保业务（省外）', 'OP03B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0105', 'AY', 'OP03', '2017', 'B0105', '电网环保验收（湖北）', 'OP03B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0106', 'AY', 'OP03', '2017', 'B0106', '用户环评', 'OP03B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0107', 'AY', 'OP03', '2017', 'B0107', '环保验收、监理', 'OP03B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0108', 'AY', 'OP03', '2017', 'B0108', '生态专题', 'OP03B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0109', 'AY', 'OP03', '2017', 'B0109', '院环保篇章设计', 'OP03B01', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B02', 'AY', 'OP03', '2017', 'B02', '水保业务', 'OP03B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0201', 'AY', 'OP03', '2017', 'B0201', '电网水保方案（湖北）', 'OP03B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0202', 'AY', 'OP03', '2017', 'B0202', '新能源水保方案（省内主体及线路）', 'OP03B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0203', 'AY', 'OP03', '2017', 'B0203', '电网水保业务（省外）', 'OP03B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0204', 'AY', 'OP03', '2017', 'B0204', '新能源水保（省外主体及线路）', 'OP03B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0205', 'AY', 'OP03', '2017', 'B0205', '用户水保方案(黄石、随州、宜昌）', 'OP03B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0206', 'AY', 'OP03', '2017', 'B0206', '用户水保方案（省内其它区域）', 'OP03B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0207', 'AY', 'OP03', '2017', 'B0207', '用户水保验收（含新能源）', 'OP03B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0208', 'AY', 'OP03', '2017', 'B0208', '水保监测(含电网项目)', 'OP03B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0209', 'AY', 'OP03', '2017', 'B0209', '水资源论证', 'OP03B02', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B03', 'AY', 'OP03', '2017', 'B03', '风险稳定评价', 'OP03B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0301', 'AY', 'OP03', '2017', 'B0301', '风险稳定评估（湖北电网）', 'OP03B03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0302', 'AY', 'OP03', '2017', 'B0302', '风险稳定评估（非电网项目）', 'OP03B03', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B04', 'AY', 'OP03', '2017', 'B04', '后评价', 'OP03B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0401', 'AY', 'OP03', '2017', 'B0401', '电网项目后评价（湖北）', 'OP03B04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0402', 'AY', 'OP03', '2017', 'B0402', '新能源后评价', 'OP03B04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0403', 'AY', 'OP03', '2017', 'B0403', '电网后评价（省外）', 'OP03B04', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B05', 'AY', 'OP03', '2017', 'B05', '节能评估', 'OP03B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0501', 'AY', 'OP03', '2017', 'B0501', '电网节能评估（湖北）', 'OP03B05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0502', 'AY', 'OP03', '2017', 'B0502', '发电节能评估（含新能源）', 'OP03B05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0503', 'AY', 'OP03', '2017', 'B0503', '电网节能评估（省外）', 'OP03B05', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B06', 'AY', 'OP03', '2017', 'B06', '土地复垦、发展诊断', 'OP03B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0601', 'AY', 'OP03', '2017', 'B0601', '电网土地复垦', 'OP03B06', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0602', 'AY', 'OP03', '2017', 'B0602', '电网发展诊断', 'OP03B06', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B07', 'AY', 'OP03', '2017', 'B07', '环保管家', 'OP03B', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0701', 'AY', 'OP03', '2017', 'B0701', '电网环保治理工程', 'OP03B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0702', 'AY', 'OP03', '2017', 'B0702', '生态修复（水保专项设计等）', 'OP03B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0703', 'AY', 'OP03', '2017', 'B0703', '政府咨询采购', 'OP03B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0704', 'AY', 'OP03', '2017', 'B0704', '环保科研课题', 'OP03B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('OP03B0705', 'AY', 'OP03', '2017', 'B0705', '其它新型环保业务', 'OP03B07', 'N', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('root17OP01', 'AY', 'OP01', '2017', '', '合同', '', 'Y', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('root17OP02', 'AY', 'OP02', '2017', '', '产值', '', 'Y', '1', null, null, null, null, null, '1');
INSERT INTO `tbop01` VALUES ('root17OP03', 'AY', 'OP03', '2017', '', '收费', '', 'Y', '0', null, 'admin', '2017-12-08 23:13:10', 'admin', '2017-12-08 23:41:13', '3');

-- ----------------------------
-- Table structure for tbop02
-- ----------------------------
DROP TABLE IF EXISTS `tbop02`;
CREATE TABLE `tbop02` (
  `OP02_ID_` varchar(50) NOT NULL COMMENT '系统ID',
  `COMP_ID_` varchar(10) DEFAULT NULL COMMENT '公司别',
  `OP_NO_` varchar(5) DEFAULT NULL COMMENT '类别',
  `OP_TYPE_` varchar(5) DEFAULT NULL COMMENT '作业类型',
  `LEVEL_` varchar(20) DEFAULT NULL COMMENT '重要级别',
  `YEAR_` varchar(4) DEFAULT NULL COMMENT '年份',
  `MONTH_` varchar(2) DEFAULT NULL COMMENT '月份',
  `WEEK_` varchar(2) DEFAULT NULL COMMENT '周',
  `TYPE_NO_` varchar(5) DEFAULT NULL COMMENT '工作类别代码',
  `TYPE_NAME_` varchar(20) DEFAULT NULL COMMENT '工作类别',
  `CONTENT_` varchar(200) DEFAULT NULL COMMENT '工作内容',
  `TYPE_NO_1` varchar(5) DEFAULT NULL COMMENT '工作类别代码1',
  `TYPE_NAME_1` varchar(20) DEFAULT NULL COMMENT '一级分类',
  `TYPE_NO_2` varchar(5) DEFAULT NULL COMMENT '工作类别代码2',
  `TYPE_NAME_2` varchar(20) DEFAULT NULL COMMENT '二级分类',
  `TYPE_NO_3` varchar(5) DEFAULT NULL COMMENT '工作类别代码3',
  `TYPE_NAME_3` varchar(20) DEFAULT NULL COMMENT '三级分类',
  `TYPE_NO_4` varchar(5) DEFAULT NULL COMMENT '工作类别代码4',
  `TYPE_NAME_4` varchar(20) DEFAULT NULL COMMENT '四级分类',
  `HT_NO_` varchar(200) DEFAULT NULL COMMENT '安源编号合同',
  `XM_NO_` varchar(200) DEFAULT NULL COMMENT '安源编号项目',
  `AA_NO_` varchar(200) DEFAULT NULL COMMENT '安源编号财务',
  `CONTENT_TEMP_` varchar(200) DEFAULT NULL COMMENT '工作内容备用',
  `CONTENT_TEMP_2` varchar(200) DEFAULT NULL COMMENT '工作内容备用2',
  `CONTENT_TEMP_3` varchar(200) DEFAULT NULL COMMENT '工作内容备用3',
  `URL_` varchar(500) DEFAULT NULL COMMENT '附件',
  `AMT_` decimal(18,5) DEFAULT NULL COMMENT '计划总金额',
  `AMT_1` decimal(18,5) DEFAULT NULL COMMENT '金额1',
  `AMT_2` decimal(18,5) DEFAULT NULL COMMENT '金额2',
  `AMT_3` decimal(18,5) DEFAULT NULL COMMENT '金额3',
  `AMT_4` decimal(18,5) DEFAULT NULL COMMENT '金额4',
  `AMT_WW_` decimal(18,5) DEFAULT NULL COMMENT '计划外委金额',
  `AMT_TOTAL_` decimal(18,5) DEFAULT NULL COMMENT '完成总金额',
  `AMT_WW_TOTAL_` decimal(18,5) DEFAULT NULL COMMENT '完成外委金额',
  `RATE_` decimal(18,5) DEFAULT NULL COMMENT '累计比例',
  `TYPE_WW_` varchar(20) DEFAULT NULL COMMENT '外委类型',
  `DATE_START_` varchar(50) DEFAULT NULL COMMENT '计划启动时间',
  `DATE_END_` varchar(50) DEFAULT NULL COMMENT '计划完成时间',
  `DATE_FINISH_` varchar(50) DEFAULT NULL COMMENT '实际完成时间',
  `DATE_1` varchar(50) DEFAULT NULL COMMENT '时间1',
  `DATE_2` varchar(50) DEFAULT NULL COMMENT '时间2',
  `DATE_3` varchar(50) DEFAULT NULL COMMENT '时间3',
  `STATUS_` varchar(2) DEFAULT NULL COMMENT '状态',
  `STATUS_AUDIT_` varchar(20) DEFAULT NULL COMMENT '审核状态',
  `DEPT_NO_ZR_` varchar(100) DEFAULT NULL COMMENT '责任部门',
  `DEPT_NAME_ZR_` varchar(500) DEFAULT NULL COMMENT '责任部门名称',
  `EMP_NO_ZR_` varchar(100) DEFAULT NULL COMMENT '责任人',
  `EMP_NAME_ZR_` varchar(500) DEFAULT NULL COMMENT '责任人名称',
  `EMP_NO_XG_` varchar(500) DEFAULT NULL COMMENT '经办人ID',
  `EMP_NAME_XG` varchar(500) DEFAULT NULL COMMENT '经办人',
  `DEPT_NO_XG_` varchar(100) DEFAULT NULL COMMENT '承办部门ID',
  `DEPT_NAME_XG_` varchar(100) DEFAULT NULL COMMENT '承办部门',
  `EMP_NO_XG_2` varchar(500) DEFAULT NULL COMMENT '经办人ID2',
  `EMP_NAME_XG2` varchar(500) DEFAULT NULL COMMENT '经办人2',
  `DEPT_NO_XG_2` varchar(100) DEFAULT NULL COMMENT '承办部门ID2',
  `DEPT_NAME_XG_2` varchar(100) DEFAULT NULL COMMENT '承办部门2',
  `MEMO_` varchar(200) DEFAULT NULL COMMENT '备注',
  `CREATE_EMP_` varchar(20) DEFAULT NULL COMMENT '新增人',
  `CREATE_TIME_` datetime DEFAULT NULL COMMENT '新增时间',
  `UPDATE_EMP_` varchar(20) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME_` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`OP02_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='年/月计划与完成表';

-- ----------------------------
-- Records of tbop02
-- ----------------------------
INSERT INTO `tbop02` VALUES ('0349e63f-0de5-4f08-8f9f-9d88e2c728aa', 'AY', 'OP01', 'YWC', '1', '2018', '1', null, null, null, '恩施鹤峰220kV输变电工程水土保持方案报告书', 'B', '环保业务', 'B06', '土地复垦、发展诊断', 'B0601', '电网土地复垦', '', '', 'XSH00000421', null, null, '国网湖北省电力公司恩施供电公司', null, null, null, '16.50000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-09', '20', null, '02', '环境事业部', 'Yulr', '余良睿', 'LuW', '卢玮', '04', '市场部', '', '', '', '', null, 'LuW', '2018-01-15 23:39:54', 'xuxh1', '2018-01-16 11:56:42', '0');
INSERT INTO `tbop02` VALUES ('108bcb88-3355-4421-84fe-e6fbdc98d15b', 'AY', 'OP01', 'YJH', '1', '2018', '2', null, null, null, '孝感大悟墨关风电场220kV送出工程水土保持方案报告书', 'A', '安全业务', 'A05', '安全管家', 'A0503', '安全工程', '', '', 'XSH00000424', null, null, '中广核湖北大悟风力发电有限公司', null, null, null, '6.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-12', '20', null, '02', '环境事业部', 'Huoj', '霍俊', 'LuW', '卢玮', '04', '市场部', '', '', '', '', null, 'LuW', '2018-01-16 00:06:21', 'xuxh1', '2018-01-16 11:56:42', '0');
INSERT INTO `tbop02` VALUES ('21d46292-c551-4edb-9ea5-14e6895972ed', 'AY', 'OP01', 'NJH', '1', '2018', null, null, null, null, null, 'A', '安全业务', 'A05', '安全管家', 'A0503', '安全工程', null, null, null, null, null, null, null, null, null, '220.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '99', null, '04', '市场部', 'LuW', '卢玮', 'LuW', '卢玮', '04', '市场部', null, null, null, null, null, 'LuW', '2018-01-16 09:11:49', 'xuxh1', '2018-01-16 09:19:08', '0');
INSERT INTO `tbop02` VALUES ('23f002d6-5bbc-4421-b4ce-5436fd29ce70', 'AY', 'OP01', 'NJH', '1', '2018', null, null, null, null, null, 'B', '环保业务', 'B06', '土地复垦、发展诊断', 'B0601', '电网土地复垦', null, null, null, null, null, null, null, null, null, '120.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '99', null, '04', '市场部', 'LuW', '卢玮', 'LuW', '卢玮', '04', '市场部', null, null, null, null, null, 'LuW', '2018-01-15 21:34:09', 'xuxh1', '2018-01-15 22:36:35', '0');
INSERT INTO `tbop02` VALUES ('6579e71a-36c2-4699-a2f6-fa1ca5b28809', 'AY', 'OP01', 'NJH', '1', '2018', null, null, null, null, null, 'B', '环保业务', 'B06', '土地复垦、发展诊断', 'B0601', '电网土地复垦', null, null, null, null, null, null, null, null, null, '155.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '99', null, '04', '市场部', 'LuW', '卢玮', 'LuW', '卢玮', '04', '市场部', null, null, null, null, null, 'LuW', '2018-01-16 09:11:49', 'Qinxc', '2018-01-16 09:19:55', '0');
INSERT INTO `tbop02` VALUES ('6bcd687d-2e93-4bfc-b2a7-e47dddd22ce7', 'AY', 'OP02', 'YWC', '1', '2018', '1', null, null, null, '国电汉川发电有限公司应急能力评估', 'A', '安全业务', 'A04', '应急产业', 'A0403', '发电企业（湖北、重庆）', null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '03', null, '013', '安全技术咨询中心', 'Guangwx', '光文祥', 'Guangwx', '光文祥', '013', '安全技术咨询中心', null, null, null, null, '28.9万', 'Guangwx', '2018-01-24 14:41:19', null, null, '0');
INSERT INTO `tbop02` VALUES ('8dd1624f-855a-4f96-b039-64d268a9e3ee', 'AY', 'OP01', 'YWC', '1', '2018', '1', null, null, null, '湖北省电力装备有限公司2017年度安全生产标准化“回头看”专项检查', 'B', '环保业务', 'B06', '土地复垦、发展诊断', 'B0601', '电网土地复垦', '', '', 'XSH00000423', null, null, '湖北省电力装备有限公司', null, null, null, '2.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-09', '20', null, '01', '安全事业部', 'Duanwb', '段伟博', 'LuW', '卢玮', '04', '市场部', '', '', '', '', null, 'LuW', '2018-01-15 23:39:54', 'xuxh1', '2018-01-16 11:56:42', '0');
INSERT INTO `tbop02` VALUES ('9315ecaa-39f9-4dd2-a992-a36776de09a2', 'AY', 'OP01', 'YJH', '1', '2018', '2', null, null, null, '核动力运行研究所长城科技园区服务中心综合楼建设项目职业卫生“三同时”', 'B', '环保业务', 'B06', '土地复垦、发展诊断', 'B0601', '电网土地复垦', '', '', 'XSH00000425', null, null, '核动力运行研究所', null, null, null, '9.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-15', '20', null, '01', '安全事业部', 'Zhangf', '张帆', 'LuW', '卢玮', '04', '市场部', '', '', '', '', null, 'LuW', '2018-01-16 00:06:21', 'xuxh1', '2018-01-16 11:56:42', '0');
INSERT INTO `tbop02` VALUES ('a0e7a5d1-e583-456d-b6db-6bd01fc9367c', 'AY', 'OP01', 'NJH', '1', '2018', null, null, null, null, null, 'A', '安全业务', 'A05', '安全管家', 'A0503', '安全工程', null, null, null, null, null, null, null, null, null, '150.00000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '99', null, '04', '市场部', 'LuW', '卢玮', 'LuW', '卢玮', '04', '市场部', null, null, null, null, null, 'LuW', '2018-01-15 21:34:09', 'xuxh1', '2018-01-15 22:36:35', '0');
INSERT INTO `tbop02` VALUES ('acb44d24-7bb8-476d-a89f-1a2d5e72de40', 'AY', 'OP01', 'YJH', '1', '2018', '2', null, null, null, '孝感大悟墨关风电场220kV送出工程水土保持方案报告书', 'A', '安全业务', 'A05', '安全管家', 'A0503', '安全工程', '', '', 'XSH00000424', null, null, '中广核湖北大悟风力发电有限公司', null, null, null, '6.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-12', '03', null, '02', '环境事业部', 'Huoj', '霍俊', 'LuW', '卢玮', '04', '市场部', '', '', '', '', null, 'LuW', '2018-01-16 09:30:38', 'liuwl', '2018-01-15 23:33:08', '0');
INSERT INTO `tbop02` VALUES ('b6822913-3ee5-4943-be66-d4ec7934073a', 'AY', 'OP01', 'YWC', '1', '2018', '1', null, null, null, '湖北省电力装备有限公司2017年度安全生产标准化“回头看”专项检查', 'B', '环保业务', 'B06', '土地复垦、发展诊断', 'B0601', '电网土地复垦', '', '', 'XSH00000423', null, null, '湖北省电力装备有限公司', null, null, '3d531c12-32bd-4228-9039-499ef19eafd7', '2.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-09', '03', null, '01', '安全事业部', 'Duanwb', '段伟博', 'LuW', '卢玮', '04', '市场部', '', '', '', '', null, 'LuW', '2018-01-16 09:29:16', 'LuW', '2018-01-16 09:30:12', '0');
INSERT INTO `tbop02` VALUES ('dcbdd8a2-cc84-4e84-9277-681b8f86f4ef', 'AY', 'OP01', 'YJH', '1', '2018', '2', null, null, null, '核动力运行研究所长城科技园区服务中心综合楼建设项目职业卫生“三同时”', 'B', '环保业务', 'B06', '土地复垦、发展诊断', 'B0601', '电网土地复垦', '', '', 'XSH00000425', null, null, '核动力运行研究所', null, null, null, '9.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-15', '03', null, '01', '安全事业部', 'Zhangf', '张帆', 'LuW', '卢玮', '04', '市场部', '', '', '', '', null, 'LuW', '2018-01-16 09:30:38', 'liuwl', '2018-01-15 23:33:08', '0');
INSERT INTO `tbop02` VALUES ('de132a4e-deb2-4520-926d-e039611c2a1c', 'AY', 'OP01', 'YWC', '1', '2018', '1', null, null, null, '核动力运行研究所长城科技园区服务中心综合楼建设项目职业卫生“三同时”', 'B', '环保业务', 'B06', '土地复垦、发展诊断', 'B0601', '电网土地复垦', '', '', 'XSH00000425', null, null, '核动力运行研究所', null, null, null, '9.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-15', '03', null, '01', '安全事业部', 'Zhangf', '张帆', 'LuW', '卢玮', '04', '市场部', '', '', '', '', null, 'LuW', '2018-01-16 09:29:16', 'liuwl', '2018-01-15 23:33:08', '0');
INSERT INTO `tbop02` VALUES ('ef12cea0-9f6b-4102-882f-64aaf4cb0f71', 'AY', 'OP01', 'YWC', '1', '2018', '1', null, null, null, '江西省电力设备总厂2017年度安全生产标准化“回头看”专项检查', 'A', '安全业务', 'A05', '安全管家', 'A0503', '安全工程', '', '', 'XSH00000422', null, null, '江西省电力设备总厂', null, null, null, '2.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-1-9', '20', null, '01', '安全事业部', 'Zhangf', '张帆', 'LuW', '卢玮', '04', '市场部', '', '', '', '', null, 'LuW', '2018-01-15 23:39:54', 'xuxh1', '2018-01-16 11:56:42', '0');

-- ----------------------------
-- Table structure for tbop03
-- ----------------------------
DROP TABLE IF EXISTS `tbop03`;
CREATE TABLE `tbop03` (
  `OP03_ID_` varchar(50) NOT NULL COMMENT '系统ID',
  `OP02_ID_` varchar(50) NOT NULL COMMENT '主表ID',
  `COMP_ID_` varchar(10) DEFAULT NULL COMMENT '公司别',
  `OP_NO_` varchar(5) DEFAULT NULL COMMENT '业务类别',
  `YEAR_` varchar(4) DEFAULT NULL COMMENT '年份',
  `MONTH_` varchar(2) DEFAULT NULL COMMENT '月份',
  `WEEK_` varchar(2) DEFAULT NULL COMMENT '周',
  `CONTENT_` varchar(1000) DEFAULT NULL COMMENT '工作内容',
  `CONTENT_TEMP_` varchar(1000) DEFAULT NULL COMMENT '工作内容备用',
  `DATE_FINISH_` varchar(8) DEFAULT NULL COMMENT '实际完成时间',
  `DEPT_NO_ZR_` varchar(100) DEFAULT NULL COMMENT '责任部门',
  `DEPT_NAME_ZR_` varchar(500) DEFAULT NULL COMMENT '责任部门名称',
  `EMP_NO_ZR_` varchar(100) DEFAULT NULL COMMENT '责任人',
  `EMP_NAME_ZR_` varchar(500) DEFAULT NULL COMMENT '责任人名称',
  `MEMO_` varchar(200) DEFAULT NULL COMMENT '备注',
  `STATUS_` varchar(2) DEFAULT NULL COMMENT '状态',
  `CREATE_EMP_` varchar(20) DEFAULT NULL COMMENT '新增人',
  `CREATE_TIME_` datetime DEFAULT NULL COMMENT '新增时间',
  `UPDATE_EMP_` varchar(20) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME_` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`OP03_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='周任务完成表';

-- ----------------------------
-- Records of tbop03
-- ----------------------------
INSERT INTO `tbop03` VALUES ('045021c9-cf13-4937-ba08-56079d1b50b9', '045021c9-cf13-4937-ba08-56079d1b50b9', 'AY', 'ZJH', '2018', '2', '1', '联系部分集团成员企业，了解应急能力建设需求', null, null, null, null, null, null, null, '99', 'zhoud', '2018-01-18 08:54:24', 'zhoud', '2018-01-18 08:55:16', '0');
INSERT INTO `tbop03` VALUES ('070a9876-f740-4dc0-a488-2820de153452', '070a9876-f740-4dc0-a488-2820de153452', 'AY', 'ZJH', '2018', '1', '1', '实验室质量体系修编', null, null, null, null, null, null, null, '99', 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop03` VALUES ('0761164c-0a0a-4160-b802-0db36860221c', '0761164c-0a0a-4160-b802-0db36860221c', 'AY', 'ZJH', '2018', '1', '1', '江陵电厂控评现场调查', null, null, null, null, null, null, null, '99', 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop03` VALUES ('0a5aef66-2d7e-4119-bb35-aa1d40f71d30', '0a5aef66-2d7e-4119-bb35-aa1d40f71d30', 'AY', 'ZJH', '2018', '2', '1', '鄂州电厂三期扩建工程专项检查', null, null, null, null, null, null, null, '99', 'Guangwx', '2018-01-18 16:55:42', null, null, '0');
INSERT INTO `tbop03` VALUES ('0f6d4548-5e1f-4762-9d0e-77034dcd4eaf', '0f6d4548-5e1f-4762-9d0e-77034dcd4eaf', 'AY', 'ZJH', '2018', '1', '4', '1、保康龙坪风电场报告评审会；\n2、孝感承（分）包商现场评估前期准备', null, null, null, null, null, null, null, '01', 'Wanghb', '2018-01-19 15:35:19', null, null, '0');
INSERT INTO `tbop03` VALUES ('13b2fcf4-1f7d-4f0f-b0a2-7822472bb7a9', '13b2fcf4-1f7d-4f0f-b0a2-7822472bb7a9', 'AY', 'ZWC', '2018', '1', '4', null, '国电长源荆州热电有限公司应急预案编制完成', null, null, null, null, null, null, '99', 'Guangwx', '2018-01-18 16:55:52', 'Guangwx', '2018-01-18 16:58:21', '0');
INSERT INTO `tbop03` VALUES ('1f6e77df-fb9f-4c86-a2c4-b193545a0ea5', '1f6e77df-fb9f-4c86-a2c4-b193545a0ea5', 'AY', 'ZJH', '2018', '2', '1', '上海院应急预案修编现场指导', null, null, null, null, null, null, null, '99', 'zhoud', '2018-01-18 08:51:42', null, null, '0');
INSERT INTO `tbop03` VALUES ('2d84b6de-f2ca-4fdf-99b4-aa099a0ff5aa', '2d84b6de-f2ca-4fdf-99b4-aa099a0ff5aa', 'AY', 'ZJH', '2018', '1', '4', '完成国内电厂信息化调研', null, null, null, null, null, null, null, '01', 'lexh', '2018-01-19 12:44:37', null, null, '0');
INSERT INTO `tbop03` VALUES ('354faaae-791c-4aef-b4eb-d6123ef2fe40', '354faaae-791c-4aef-b4eb-d6123ef2fe40', 'AY', 'ZJH', '2018', '2', '1', '检测检验机构管理体系修编继续进行', null, null, null, null, null, null, null, '99', 'Chengy', '2018-01-17 10:30:03', null, null, '0');
INSERT INTO `tbop03` VALUES ('37337e77-027e-4fbe-95a1-dfec11511e50', '37337e77-027e-4fbe-95a1-dfec11511e50', 'AY', 'ZJH', '2018', '2', '1', '梳理发电企业市场信息', null, null, null, null, null, null, null, '99', 'Guangwx', '2018-01-18 16:55:42', null, null, '0');
INSERT INTO `tbop03` VALUES ('3dcb4e6c-123d-47a4-bd8e-ba95c3c0f074', '3dcb4e6c-123d-47a4-bd8e-ba95c3c0f074', 'AY', 'ZJH', '2018', '1', '4', '梳理发电企业市场信息', null, null, null, null, null, null, null, '01', 'Tongt', '2018-01-19 15:41:33', null, null, '0');
INSERT INTO `tbop03` VALUES ('3ed23241-1802-4a18-bb02-c59f59e750c2', '3ed23241-1802-4a18-bb02-c59f59e750c2', 'AY', 'ZJH', '2018', '2', '1', '湖北院应急预案修改', null, null, null, null, null, null, null, '01', 'Wangr', '2018-01-19 15:11:18', null, null, '0');
INSERT INTO `tbop03` VALUES ('3fdbef32-9c39-41fe-a015-97f10439beb3', '3fdbef32-9c39-41fe-a015-97f10439beb3', 'AY', 'ZWC', '2018', '1', '4', null, '完成', null, null, null, null, null, null, '99', 'Zhaom', '2018-01-17 09:46:38', null, null, '0');
INSERT INTO `tbop03` VALUES ('66661710-11ca-47c7-b15e-005c3ab49d26', '66661710-11ca-47c7-b15e-005c3ab49d26', 'AY', 'ZJH', '2018', '2', '1', '吉林院、昆明院应急能力评估合同沟通，拟定', null, null, null, null, null, null, null, '99', 'Duanwb', '2018-01-18 09:13:47', null, null, '0');
INSERT INTO `tbop03` VALUES ('66665592-0189-44bc-b02b-0d0b91ba1d18', '66665592-0189-44bc-b02b-0d0b91ba1d18', 'AY', 'ZJH', '2018', '1', '1', '核动力三同时项目前期沟通', null, null, null, null, null, null, null, '99', 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop03` VALUES ('68523a3e-e57f-4117-928f-6a49499c4e61', '68523a3e-e57f-4117-928f-6a49499c4e61', 'AY', 'ZJH', '2018', '1', '4', '湖北竹溪丰溪丰溪风电场工程安全预评价报告评审会', null, null, null, null, null, null, null, '01', 'Jinw', '2018-01-19 15:26:13', null, null, '0');
INSERT INTO `tbop03` VALUES ('69e2e9b8-9e09-439f-92d7-c4ca2aae69cd', '69e2e9b8-9e09-439f-92d7-c4ca2aae69cd', 'AY', 'ZWC', '2018', '1', '4', null, '管理体系修编中，完成6个程序问价、19个作业指导书及80份表格的修编。', null, null, null, null, null, null, '99', 'Chengy', '2018-01-17 09:49:44', 'Chengy', '2018-01-17 10:25:48', '0');
INSERT INTO `tbop03` VALUES ('6ec003e1-1a4f-47de-8aa6-91faa84ac390', '6ec003e1-1a4f-47de-8aa6-91faa84ac390', 'AY', 'ZWC', '2018', '1', '1', null, '测试', null, null, null, null, null, null, '01', 'xuxh1', '2018-01-16 00:44:52', null, null, '0');
INSERT INTO `tbop03` VALUES ('75b3cf49-1ae8-4340-8d8e-126ac2c858c5', '75b3cf49-1ae8-4340-8d8e-126ac2c858c5', 'AY', 'ZJH', '2018', '2', '1', '江陵电厂现场调查', null, null, null, null, null, null, null, '99', 'Zhaom', '2018-01-17 09:47:26', null, null, '0');
INSERT INTO `tbop03` VALUES ('78278804-da29-410f-a34e-0ccfbd3818d8', '78278804-da29-410f-a34e-0ccfbd3818d8', 'AY', 'ZJH', '2018', '1', '3', '汇总', null, null, null, null, null, null, null, '99', 'Qinxc', '2018-01-16 00:46:53', null, null, '0');
INSERT INTO `tbop03` VALUES ('8307e6d0-d254-493a-becb-9863abb82805', '8307e6d0-d254-493a-becb-9863abb82805', 'AY', 'ZJH', '2018', '2', '1', '国电青山热电有限公司应急预案修编', null, null, null, null, null, null, null, '99', 'zhoud', '2018-01-18 08:51:42', null, null, '0');
INSERT INTO `tbop03` VALUES ('8fbfee55-48fc-4d90-b7c2-511d63c83ecb', '8fbfee55-48fc-4d90-b7c2-511d63c83ecb', 'AY', 'ZWC', '2018', '1', '3', null, '123234', null, null, null, null, null, null, '01', 'xuxh1', '2018-01-16 08:57:43', null, null, '0');
INSERT INTO `tbop03` VALUES ('903de194-e97e-4102-8506-57a7df7f0e0d', '903de194-e97e-4102-8506-57a7df7f0e0d', 'AY', 'ZJH', '2018', '2', '1', '荣成纸业设计专篇编制', null, null, null, null, null, null, null, '99', 'Zhaom', '2018-01-17 09:47:26', null, null, '0');
INSERT INTO `tbop03` VALUES ('90818806-5bca-4b5f-b0b7-6b37550c2a9f', '90818806-5bca-4b5f-b0b7-6b37550c2a9f', 'AY', 'ZJH', '2018', '2', '1', '华中区域发电企业2018年安全咨询业务清单梳理', null, null, null, null, null, null, null, '99', 'Tongt', '2018-01-17 17:43:32', null, null, '0');
INSERT INTO `tbop03` VALUES ('92d55ed4-90da-4b00-a549-642fa8bf2f7f', '92d55ed4-90da-4b00-a549-642fa8bf2f7f', 'AY', 'ZWC', '2018', '1', '4', null, '未完成', null, null, null, null, null, null, '99', 'Zhaom', '2018-01-17 09:46:38', null, null, '0');
INSERT INTO `tbop03` VALUES ('93e7a139-1a21-41a4-80cf-c5aa96f49797', '93e7a139-1a21-41a4-80cf-c5aa96f49797', 'AY', 'ZJH', '2018', '1', '1', '省公司及黄石公司职业卫生汇报材料编写', null, null, null, null, null, null, null, '99', 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop03` VALUES ('97dc8e44-6b0a-4c16-98a4-a89bf4d80a3e', '97dc8e44-6b0a-4c16-98a4-a89bf4d80a3e', 'AY', 'ZJH', '2018', '1', '2', '其他工作', null, null, null, null, null, null, null, '01', 'xuxh1', '2018-01-16 00:38:29', null, null, '0');
INSERT INTO `tbop03` VALUES ('9c2dcccf-9631-4fa8-98b5-b7ef9c831051', '9c2dcccf-9631-4fa8-98b5-b7ef9c831051', 'AY', 'ZJH', '2018', '2', '1', '跟踪襄阳恩菲公司报价反馈情况', null, null, null, null, null, null, null, '99', 'Tongt', '2018-01-17 17:43:32', null, null, '0');
INSERT INTO `tbop03` VALUES ('a6f39f53-cddf-49cf-9981-91de2f6b4f64', 'a6f39f53-cddf-49cf-9981-91de2f6b4f64', 'AY', 'ZWC', '2018', '1', '4', null, '完成武汉市第十六届《职业病防治法》宣传周活动策划方案初稿', null, null, null, null, null, null, '99', 'Chengy', '2018-01-17 10:29:43', null, null, '0');
INSERT INTO `tbop03` VALUES ('a95e60fc-2cd5-4ad5-8fcf-ffbc5ea057e8', 'a95e60fc-2cd5-4ad5-8fcf-ffbc5ea057e8', 'AY', 'ZJH', '2018', '1', '1', '武汉市典型用人单位职业卫生执法检查手册初稿编制（持续开展）\n', null, null, null, null, null, null, null, '99', 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop03` VALUES ('aa7e44bd-edf3-4c0f-b0a6-a052f5a0bc8a', 'aa7e44bd-edf3-4c0f-b0a6-a052f5a0bc8a', 'AY', 'ZJH', '2018', '1', '4', '水电六局、水电十二局、水电基础局应急能力评估合同相关事宜沟通', null, null, null, null, null, null, null, '01', 'lexh', '2018-01-19 12:44:27', null, null, '0');
INSERT INTO `tbop03` VALUES ('b988ab64-10f6-4b6f-b14c-9768aa02bc08', 'b988ab64-10f6-4b6f-b14c-9768aa02bc08', 'AY', 'ZJH', '2018', '1', '1', '省安监局职业卫生技术服务机构网上公示情况核查', null, null, null, null, null, null, null, '01', 'yangying', '2018-01-18 16:54:58', null, null, '0');
INSERT INTO `tbop03` VALUES ('be0b095e-f08d-4738-8adb-ec9a64b61073', 'be0b095e-f08d-4738-8adb-ec9a64b61073', 'AY', 'ZWC', '2018', '1', '3', null, '123123', null, null, null, null, null, null, '01', 'xuxh1', '2018-01-16 08:57:43', null, null, '0');
INSERT INTO `tbop03` VALUES ('c25a64a3-5333-4a0e-a31b-6df32b6fc0fd', 'c25a64a3-5333-4a0e-a31b-6df32b6fc0fd', 'AY', 'ZJH', '2018', '2', '1', '武昌燃机电厂标准化、应急能力评估、职业健康现状评价信息跟踪', null, null, null, null, null, null, null, '01', 'Wangr', '2018-01-19 15:11:18', null, null, '0');
INSERT INTO `tbop03` VALUES ('c478240e-5572-41e3-bf87-44b41428277a', 'c478240e-5572-41e3-bf87-44b41428277a', 'AY', 'ZJH', '2018', '1', '4', 'qweqwe', null, null, null, null, null, null, null, '01', 'xuxh1', '2018-01-16 08:57:50', null, null, '0');
INSERT INTO `tbop03` VALUES ('c8ec9533-5730-46ba-bd9e-a0e8de162c56', 'c8ec9533-5730-46ba-bd9e-a0e8de162c56', 'AY', 'ZJH', '2018', '1', '4', '股份公司2018年度应急能力评估企业市场计划分解、组织跟踪相关企业市场信息', null, null, null, null, null, null, null, '01', 'Gaocr', '2018-01-22 11:08:38', null, null, '0');
INSERT INTO `tbop03` VALUES ('ccf61899-ead0-477f-affb-429f6dffdf88', 'ccf61899-ead0-477f-affb-429f6dffdf88', 'AY', 'ZWC', '2018', '1', '2', null, '新增任务', null, null, null, null, null, null, '99', 'Qinxc', '2018-01-16 00:46:33', null, null, '0');
INSERT INTO `tbop03` VALUES ('ced3b8a4-5f22-4e47-8437-96300f9e0d65', 'ced3b8a4-5f22-4e47-8437-96300f9e0d65', 'AY', 'ZJH', '2018', '1', '3', '系统试运行', null, null, null, null, null, null, null, '99', 'Qinxc', '2018-01-16 00:46:53', null, null, '0');
INSERT INTO `tbop03` VALUES ('cedc6b8f-a6d7-4dec-ac68-22c493ea5797', 'cedc6b8f-a6d7-4dec-ac68-22c493ea5797', 'AY', 'ZJH', '2018', '2', '1', '集团成员企业2018年标准化自评工作方案思考', null, null, null, null, null, null, null, '99', 'Duanwb', '2018-01-18 09:13:47', null, null, '0');
INSERT INTO `tbop03` VALUES ('d97c595e-3130-454f-a959-4fac480a710f', 'd97c595e-3130-454f-a959-4fac480a710f', 'AY', 'ZJH', '2018', '1', '4', '公司2017年度年会   专家现场查评要求整理', null, null, null, null, null, null, null, '01', 'Gaocr', '2018-01-22 11:08:38', null, null, '0');
INSERT INTO `tbop03` VALUES ('da2946e3-5c8c-458f-9b47-de41cc1f7c7d', 'da2946e3-5c8c-458f-9b47-de41cc1f7c7d', 'AY', 'ZJH', '2018', '2', '1', '青海院应急能力建设咨询及评估合同跟进', null, null, null, null, null, null, null, '99', 'zhoud', '2018-01-18 08:51:42', null, null, '0');
INSERT INTO `tbop03` VALUES ('daea6366-283f-4447-a678-d4143711e20d', 'daea6366-283f-4447-a678-d4143711e20d', 'AY', 'ZJH', '2018', '1', '4', '与软件公司沟通应急查评工具开发需求', null, null, null, null, null, null, null, '01', 'lexh', '2018-01-19 12:44:46', null, null, '0');
INSERT INTO `tbop03` VALUES ('ded0846c-953f-4f5a-94c7-ead8bc7e8e50', 'ded0846c-953f-4f5a-94c7-ead8bc7e8e50', 'AY', 'ZJH', '2018', '1', '1', '评价报告审核', null, null, null, null, null, null, null, '01', 'yangying', '2018-01-18 16:55:37', null, null, '0');
INSERT INTO `tbop03` VALUES ('ef53d052-80e7-4bce-8020-57e8551397e9', 'ef53d052-80e7-4bce-8020-57e8551397e9', 'AY', 'ZJH', '2018', '2', '1', '开展股份公司成员企业2018年应急能力评估工作计划开展企业沟通', null, null, null, null, null, null, null, '99', 'Gaocr', '2018-01-17 10:17:46', null, null, '0');
INSERT INTO `tbop03` VALUES ('f3a5da06-65fd-4cdb-acbd-e65d9b3b031b', 'f3a5da06-65fd-4cdb-acbd-e65d9b3b031b', 'AY', 'ZJH', '2018', '1', '1', '东湖燃机、创意天地协助业主现场整改', null, null, null, null, null, null, null, '99', 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop03` VALUES ('f9e14a83-4ef2-4a91-8e1a-2f9c8b5913e6', 'f9e14a83-4ef2-4a91-8e1a-2f9c8b5913e6', 'AY', 'ZJH', '2018', '1', '1', '国电广水吉阳山风电场职业病危害预评价招标跟踪', null, null, null, null, null, null, null, '99', 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop03` VALUES ('fcb7aa1f-7101-46cb-8310-fc4a15037734', 'fcb7aa1f-7101-46cb-8310-fc4a15037734', 'AY', 'ZJH', '2018', '1', '2', '系统试运行', null, null, null, null, null, null, null, '01', 'xuxh1', '2018-01-16 00:38:18', null, null, '0');

-- ----------------------------
-- Table structure for tbop04
-- ----------------------------
DROP TABLE IF EXISTS `tbop04`;
CREATE TABLE `tbop04` (
  `OP04_ID_` varchar(50) NOT NULL COMMENT '系统ID',
  `COMP_ID_` varchar(10) DEFAULT NULL COMMENT '公司别',
  `OP_NO_` varchar(50) DEFAULT NULL COMMENT '业务类别',
  `YEAR_` varchar(8) DEFAULT NULL COMMENT '年份',
  `MONTH_` varchar(2) DEFAULT NULL COMMENT '月份',
  `WEEK_` varchar(2) DEFAULT NULL COMMENT '周',
  `OP_TYPE_` varchar(50) DEFAULT NULL COMMENT '业务类型',
  `TITLE_` varchar(500) DEFAULT NULL COMMENT '标题',
  `CONTENT_` varchar(500) DEFAULT NULL COMMENT '内容',
  `URL_` varchar(500) DEFAULT NULL COMMENT '附件',
  `EMP_NO_` varchar(500) DEFAULT NULL COMMENT '责任人ID',
  `EMP_NAME_` varchar(500) DEFAULT NULL COMMENT '责任人',
  `DEPT_NO_` varchar(500) DEFAULT NULL COMMENT '责任部门ID',
  `DEPT_NAME_` varchar(500) DEFAULT NULL COMMENT '责任部门',
  `END_DATE_` varchar(10) DEFAULT NULL COMMENT '填报结束时间',
  `START_DATE_` varchar(10) DEFAULT NULL COMMENT '发布任务时间',
  `TYPE_` varchar(10) DEFAULT NULL COMMENT '类别',
  `STATUS_` varchar(10) DEFAULT NULL COMMENT '状态',
  `MODEL_ID_` varchar(50) DEFAULT NULL COMMENT '流程模板ID',
  `EXAMPLE_` varchar(50) DEFAULT NULL COMMENT '流程实例',
  `CREATE_EMP_` varchar(20) DEFAULT NULL COMMENT '新增人',
  `CREATE_TIME_` datetime DEFAULT NULL COMMENT '新增时间',
  `UPDATE_EMP_` varchar(20) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME_` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`OP04_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务主表';

-- ----------------------------
-- Records of tbop04
-- ----------------------------
INSERT INTO `tbop04` VALUES ('0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, '2018', '1', '2', 'ZWC', '周任务测试2', '周任务测试2', null, null, null, '03', '综合管理部', null, null, 'TB', '01', null, null, 'xuxh1', '2018-01-16 00:37:44', 'Qinxc', '2018-01-16 08:53:20', '0');
INSERT INTO `tbop04` VALUES ('03399ef7-c58b-4988-b3c9-1573d250d6b7', 'AY', 'OP02', '2018', null, null, 'NJH', '产值测试', null, null, 'Duanwb', '段伟博', '013', '安全技术咨询中心', '20180119', '20180116', 'TB', '01', null, null, 'Yuany', '2018-01-16 09:40:32', 'Yuany', '2018-01-16 09:40:39', '0');
INSERT INTO `tbop04` VALUES ('0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, '2018', '1', '1', 'ZWC', '周任务发布测试', '周任务发布测试', null, null, null, '03', '综合管理部', null, null, 'TB', '02', null, null, 'xuxh1', '2018-01-16 00:34:10', 'Qinxc', '2018-01-16 00:45:18', '0');
INSERT INTO `tbop04` VALUES ('1e58edc3-43ae-4031-b390-f6cc4874b0d1', 'AY', 'OP01', '2018', '1', null, 'YJH', '2018年1月合同月计划任务发布测试1', '2018年1月合同月计划任务发布测试1', null, 'LuW', '卢玮', '04', '市场部', '20180118', '20180111', 'TB', '04', null, null, 'xuxh1', '2018-01-16 00:05:52', 'xuxh1', '2018-01-16 00:05:56', '0');
INSERT INTO `tbop04` VALUES ('3c00302b-c828-4143-b798-28fa4086f1de', 'AY', 'OP01', '2018', null, null, 'NJH', '2018年度合同工作计划编制填报任务', '2018年度合同工作计划编制填报任务，注意事项。。。', null, 'LuW', '卢玮', '04', '市场部', '20180118', '20180111', 'TB', '04', null, null, 'xuxh1', '2018-01-15 21:31:31', 'xuxh1', '2018-01-15 21:31:38', '0');
INSERT INTO `tbop04` VALUES ('5238031b-879b-4852-8e47-75e4c85c3277', 'AY', null, '2018', '1', '4', 'ZWC', '检测中心（实验室）第四周工作计划', '1.鄂州电厂三期工程职业病危害控制效果评价投标\n2.武汉市典型用人单位职业卫生工作检查手册编制\n3.检测检验机构管理体系修编', null, null, null, '011', '检测中心', null, null, 'TB', '02', null, null, 'yangying', '2018-01-17 09:19:07', 'Cuihh', '2018-01-18 17:17:04', '0');
INSERT INTO `tbop04` VALUES ('5b63b722-c820-471e-b8f9-91f7f73dc43f', 'AY', null, '2018', '1', '3', 'ZWC', '鄂州电厂三期扩建工程职业病危害控制效果评价项目报价书制作', '购买鄂州电厂三期扩建工程职业病危害控制效果评价项目谈判文件，制作鄂州电厂三期扩建工程职业病危害控制效果评价项目报价书。', null, null, null, '011', '检测中心', null, null, 'TB', '00', null, null, 'Luox', '2018-01-17 10:25:51', null, null, '0');
INSERT INTO `tbop04` VALUES ('698e302e-02da-4931-acd8-4809e4693d1f', 'AY', 'OP01', '2018', null, null, 'NJH', '2018合同年度计划任务汇总', '2018合同年度计划任务汇总，请注意。。。', null, null, null, '03', '综合管理部', '20180118', '20180111', 'HZ', '04', null, '18305', 'xuxh1', '2018-01-15 22:31:41', 'xuxh1', '2018-01-15 22:36:35', '0');
INSERT INTO `tbop04` VALUES ('8121768b-2234-4918-9b19-0906687beaf6', 'AY', null, '2018', '1', '4', 'ZWC', '高长仁1月第四周工作计划', '1、股份公司2018年度应急能力评估企业市场计划分解、组织跟踪相关企业市场信息\n2、湖北装备汉源公司标准化达标业务洽谈\n3、公司2017年度年会   专家现场查评要求整理', null, null, null, '013', '安全技术咨询中心', null, null, 'TB', '00', null, null, 'Gaocr', '2018-01-18 17:15:06', null, null, '0');
INSERT INTO `tbop04` VALUES ('8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'AY', null, '2018', '1', '4', 'ZWC', '填报1月第四周工作计划', '填报1月第四周工作计划', null, null, null, '013', '安全技术咨询中心', null, null, 'TB', '01', null, null, 'Gaocr', '2018-01-17 10:13:27', 'Wangr', '2018-01-19 15:08:14', '0');
INSERT INTO `tbop04` VALUES ('9291b859-e2f7-4c92-8005-75f6339af8b2', 'AY', 'OP01', '2018', null, null, 'NJH', '2018年合同计划发布测试', '2018年合同计划发布测试', null, 'LuW', '卢玮', '04', '市场部', '20180120', '20180116', 'TB', '04', null, null, 'xuxh1', '2018-01-16 09:09:07', 'xuxh1', '2018-01-16 09:09:17', '0');
INSERT INTO `tbop04` VALUES ('97bd5400-a90d-4636-b77c-afb0fb3340bf', 'AY', null, '2018', '2', '1', 'ZWC', '安全技术咨询中心2月第1周工作计划填报', '安全技术咨询中心2月第1周工作计划填报', null, 'lexh,Duanwb,Gaocr,Guangwx,Huangsx,Taoxf,Tongt,Wangr,zhoud', '乐雪焕,段伟博,高长仁,光文祥,黄仕鑫,陶小飞,童涛,汪锐,周栋', '013', '安全技术咨询中心', null, null, 'TB', '01', null, null, 'Gaocr', '2018-01-25 08:59:00', 'Gaocr', '2018-01-25 08:59:14', '0');
INSERT INTO `tbop04` VALUES ('9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, '2018', '1', '3', 'ZWC', '周任务测试33', '周任务测试33', null, null, null, '03', '综合管理部', null, null, 'TB', '01', null, null, 'xuxh1', '2018-01-16 08:56:34', 'Qinxc', '2018-01-16 08:58:37', '0');
INSERT INTO `tbop04` VALUES ('bb78f05f-e63c-4926-ad9c-be10e34986a7', 'AY', 'OP01', '2018', '1', null, 'YJH', '2018年1月合同月计划任务发布测试', '2018年1月合同月计划任务发布测试，请注意。。。', null, 'LuW', '卢玮', '04', '市场部', '20180118', '20180111', 'TB', '04', null, null, 'liuwl', '2018-01-15 23:11:27', 'liuwl', '2018-01-15 23:12:20', '0');
INSERT INTO `tbop04` VALUES ('e153e4f2-e0ea-498e-a192-9e863a8c0617', 'AY', 'OP01', '2018', null, null, 'NJH', '2018年合同计划汇总', '2018年合同计划汇总', null, null, null, '03', '综合管理部', '20180120', '20180116', 'HZ', '04', null, '18711', 'xuxh1', '2018-01-16 09:17:28', 'xuxh1', '2018-01-16 09:19:08', '0');
INSERT INTO `tbop04` VALUES ('e17ab167-6af9-4654-83a3-7bcc4dcf8076', 'AY', 'OP01', '2018', '1', null, 'YJH', '2018年1月合同计划汇总测试', '2018年1月合同计划汇总测试', null, null, null, '03', '综合管理部', '20180118', '20180111', 'HZ', '01', null, '18901', 'xuxh1', '2018-01-16 00:10:38', 'xuxh1', '2018-01-16 11:56:42', '0');
INSERT INTO `tbop04` VALUES ('fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', 'OP02', '2018', '1', null, 'YJH', '2018年1月产值计划', null, null, 'Cuihh,Caiz,Mengly,Xiongw,Xinw,Fangsl,Jinw,00082,Wanghb,Xiars,Yim,Chengy,Gex,Luox,yangying,Zenglq,Zhaom,lexh,Duanwb,Gaocr,Guangwx,Huangsx,Taoxf,Tongt,Wangr,zhoud', '崔海华,蔡振,孟路园,熊伟,辛巍,方少林,金伟,,王浩宾,夏任司,易明,程迎,葛璇,罗鑫,杨迎,曾利琴,赵明,乐雪焕,段伟博,高长仁,光文祥,黄仕鑫,陶小飞,童涛,汪锐,周栋', '01,012,011,013', '安全事业部,安全评价技术中心,检测中心,安全技术咨询中心', '20180131', '20180119', 'TB', '01', null, null, 'Cuihh', '2018-01-19 14:28:38', 'Cuihh', '2018-01-19 14:28:48', '0');
INSERT INTO `tbop04` VALUES ('fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, '2018', '1', '3', 'ZWC', '2018年第3周工作计划填报', null, null, null, null, '01,011,012,013', '安全事业部,检测中心,安全评价技术中心,安全技术咨询中心', null, null, 'TB', '01', null, null, 'Cuihh', '2018-01-18 16:53:11', 'Gaocr', '2018-01-22 11:07:30', '0');
INSERT INTO `tbop04` VALUES ('fd80243d-c998-4620-96dd-d710341aee5a', 'AY', 'OP01', '2018', '1', null, 'YJH', '1月合同测试', null, null, 'LuW', '卢玮', '04', '市场部', '20180120', '20180116', 'TB', '02', null, null, 'liuwl', '2018-01-16 09:27:32', 'liuwl', '2018-01-16 09:27:38', '0');

-- ----------------------------
-- Table structure for tbop05
-- ----------------------------
DROP TABLE IF EXISTS `tbop05`;
CREATE TABLE `tbop05` (
  `OP05_ID_` varchar(50) NOT NULL COMMENT '系统ID',
  `OP04_ID_` varchar(50) NOT NULL COMMENT '主表ID',
  `COMP_ID_` varchar(10) DEFAULT NULL COMMENT '公司别',
  `OP_TYPE_` varchar(50) DEFAULT NULL COMMENT '业务类型',
  `OP_NO_` varchar(50) DEFAULT NULL COMMENT '业务编号',
  `DEPT_NO_` varchar(50) DEFAULT NULL COMMENT '责任部门ID',
  `DEPT_NAME_` varchar(50) DEFAULT NULL COMMENT '责任部门',
  `EMP_NO_` varchar(500) DEFAULT NULL COMMENT '责任人ID',
  `EMP_NAME_` varchar(500) DEFAULT NULL COMMENT '责任人',
  `URL_` varchar(100) DEFAULT NULL COMMENT '附件',
  `STATUS_` varchar(10) DEFAULT NULL COMMENT '状态',
  `TYPE_` varchar(10) DEFAULT NULL COMMENT '类别',
  `MEMO_` varchar(50) DEFAULT NULL COMMENT '备注',
  `CREATE_EMP_` varchar(20) DEFAULT NULL COMMENT '新增人',
  `CREATE_TIME_` datetime DEFAULT NULL COMMENT '新增时间',
  `UPDATE_EMP_` varchar(20) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME_` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`OP05_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务明细表';

-- ----------------------------
-- Records of tbop05
-- ----------------------------
INSERT INTO `tbop05` VALUES ('0096ce13-658c-4ea1-a109-c56781a80a5c', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'Luj', '陆军', '18484', '01', 'TB', null, 'xuxh1', '2018-01-16 00:37:48', null, null, '0');
INSERT INTO `tbop05` VALUES ('0398b9d0-024f-4a4e-846e-1edd9cda942d', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'AY', null, null, '013', '安全技术咨询中心', 'Guangwx', '光文祥', '19105', '04', 'TB', null, 'Gaocr', '2018-01-17 10:13:37', 'Cuihh', '2018-01-18 17:20:50', '0');
INSERT INTO `tbop05` VALUES ('06f90f18-73c3-4ef5-b24f-6bd259692420', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'xuxh1', '许晓卉', '18660', '02', 'TB', null, 'xuxh1', '2018-01-16 08:56:40', 'xuxh1', '2018-01-16 08:57:57', '0');
INSERT INTO `tbop05` VALUES ('072e95f1-7b3f-497a-9d2f-39184f6d7f7e', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '011', '检测中心', 'Cuihh', '崔海华', '19243', '04', 'TB', null, 'Cuihh', '2018-01-18 16:53:22', 'Cuihh', '2018-01-18 16:58:11', '0');
INSERT INTO `tbop05` VALUES ('0b03a9f1-6f75-4dca-a987-bcc1d0b611ea', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '01', '安全事业部', 'Cuihh', '崔海华', '19207', '04', 'TB', null, 'Cuihh', '2018-01-18 16:53:21', 'Cuihh', '2018-01-19 14:21:44', '0');
INSERT INTO `tbop05` VALUES ('0f0550a4-7865-4eff-9eef-59b0e2517a29', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '01', '安全事业部', 'Caiz', '蔡振', '19614', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:44', null, null, '0');
INSERT INTO `tbop05` VALUES ('0f4a5003-1ec3-4673-999c-6cc8ba3c769f', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '011', '检测中心', 'Zenglq', '曾利琴', '19740', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:46', null, null, '0');
INSERT INTO `tbop05` VALUES ('101d6199-5b46-463a-9cae-0c3a0b7b443a', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '011', '检测中心', 'Chengy', '程迎', '19279', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:22', null, null, '0');
INSERT INTO `tbop05` VALUES ('15319e70-459b-4488-8384-422099bdfea4', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '012', '安全评价技术中心', 'Fangsl', '方少林', '19315', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:23', null, null, '0');
INSERT INTO `tbop05` VALUES ('154a3bbe-15c1-4ec5-a9f1-29d3cd63f1b8', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '013', '安全技术咨询中心', 'Duanwb', '段伟博', '19767', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:47', null, null, '0');
INSERT INTO `tbop05` VALUES ('15eff167-1a38-41cc-93a5-044bdcf43467', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'liuwl', '刘伟龙', '18457', '01', 'TB', null, 'xuxh1', '2018-01-16 00:37:48', null, null, '0');
INSERT INTO `tbop05` VALUES ('1634f7da-6a9e-4bc5-8449-97029fb16adb', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'Qinl', '秦亮', '18285', '01', 'TB', null, 'xuxh1', '2018-01-16 00:34:18', null, null, '0');
INSERT INTO `tbop05` VALUES ('1b35cbd2-011d-4fbe-ab70-4f93f29df891', '5238031b-879b-4852-8e47-75e4c85c3277', 'AY', null, null, '011', '检测中心', 'Gex', '葛璇', '19010', '01', 'TB', null, 'yangying', '2018-01-17 09:24:44', null, null, '0');
INSERT INTO `tbop05` VALUES ('1c628366-4897-4368-abbd-faa6570193aa', '97bd5400-a90d-4636-b77c-afb0fb3340bf', 'AY', 'ZWC', null, '013', '安全技术咨询中心', 'Wangr', '汪锐', '19969', '01', 'TB', null, 'Gaocr', '2018-01-25 08:59:14', null, null, '0');
INSERT INTO `tbop05` VALUES ('1d80d625-ed56-4726-a4d8-8da47958023f', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'Luj', '陆军', '18276', '01', 'TB', null, 'xuxh1', '2018-01-16 00:34:18', null, null, '0');
INSERT INTO `tbop05` VALUES ('1fc7030e-19c6-4855-9af0-088f1a99d270', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '012', '安全评价技术中心', 'Wanghb', '王浩宾', '19342', '02', 'TB', null, 'Cuihh', '2018-01-18 16:53:24', 'Wanghb', '2018-01-19 15:35:28', '0');
INSERT INTO `tbop05` VALUES ('21f79b27-fbeb-4daf-903c-0602ca6f05af', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '012', '安全评价技术中心', 'Fangsl', '方少林', '19650', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:44', null, null, '0');
INSERT INTO `tbop05` VALUES ('22ab66eb-9adc-463d-af3f-ce98ddfeb8ae', '5238031b-879b-4852-8e47-75e4c85c3277', 'AY', null, null, '011', '检测中心', 'Chengy', '程迎', '19037', '04', 'TB', null, 'yangying', '2018-01-17 09:24:44', 'Cuihh', '2018-01-18 17:17:30', '0');
INSERT INTO `tbop05` VALUES ('230a24af-8d7a-47be-934e-f7f25ab6e14d', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'AY', null, null, '013', '安全技术咨询中心', 'Cuihh', '崔海华', '19087', '04', 'TB', null, 'Gaocr', '2018-01-17 10:13:37', 'Cuihh', '2018-01-19 14:40:38', '0');
INSERT INTO `tbop05` VALUES ('25bace80-aec3-49cf-a615-3e36a4bfb5b4', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'liuwl', '刘伟龙', '18579', '01', 'TB', null, 'xuxh1', '2018-01-16 08:56:39', null, null, '0');
INSERT INTO `tbop05` VALUES ('2616d459-e981-49e9-a977-46089c260f00', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'Qinl', '秦亮', '18493', '01', 'TB', null, 'xuxh1', '2018-01-16 00:37:48', null, null, '0');
INSERT INTO `tbop05` VALUES ('3142cbcb-8018-4cda-b637-8656a387cd6a', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '01', '安全事业部', 'Mengly', '孟路园', '19225', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:21', null, null, '0');
INSERT INTO `tbop05` VALUES ('33bf6d89-00d6-4952-870d-66f93500ad92', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '013', '安全技术咨询中心', 'Duanwb', '段伟博', '19387', '04', 'TB', null, 'Cuihh', '2018-01-18 16:53:24', 'Cuihh', '2018-01-18 17:21:10', '0');
INSERT INTO `tbop05` VALUES ('34e528fa-bf83-4643-a183-aed0aca065ee', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '013', '安全技术咨询中心', 'Huangsx', '黄仕鑫', '19405', '04', 'TB', null, 'Cuihh', '2018-01-18 16:53:25', 'Cuihh', '2018-01-18 17:16:13', '0');
INSERT INTO `tbop05` VALUES ('36b41911-74be-4e89-a268-bdefb613eebf', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'songwg', '宋伟刚', '18511', '01', 'TB', null, 'xuxh1', '2018-01-16 00:37:49', null, null, '0');
INSERT INTO `tbop05` VALUES ('38b820be-34cd-4c57-b747-bd3387c4efaf', 'fd80243d-c998-4620-96dd-d710341aee5a', 'AY', null, 'OP01', '04', '市场部', 'LuW', '卢玮', '18809', '02', 'TB', null, 'liuwl', '2018-01-16 09:27:38', 'LuW', '2018-01-16 09:31:14', '0');
INSERT INTO `tbop05` VALUES ('3c161602-d562-4fe6-96e3-0846c65bd8ce', '97bd5400-a90d-4636-b77c-afb0fb3340bf', 'AY', 'ZWC', null, '013', '安全技术咨询中心', 'Duanwb', '段伟博', '19915', '01', 'TB', null, 'Gaocr', '2018-01-25 08:59:13', null, null, '0');
INSERT INTO `tbop05` VALUES ('3ce58452-758f-4331-b071-8cb892935a69', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '012', '安全评价技术中心', 'Yim', '易明', '19695', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:45', null, null, '0');
INSERT INTO `tbop05` VALUES ('3e906c2c-673b-4635-b864-75c0354ce8ba', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '012', '安全评价技术中心', 'Zengzm', '曾早明', '19360', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:24', null, null, '0');
INSERT INTO `tbop05` VALUES ('421dd18b-e08a-4d1a-9408-f8c91663bef7', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'songwg', '宋伟刚', '18633', '01', 'TB', null, 'xuxh1', '2018-01-16 08:56:40', null, null, '0');
INSERT INTO `tbop05` VALUES ('43fedd93-0b99-4f0a-a3bc-a473650063de', '5238031b-879b-4852-8e47-75e4c85c3277', 'AY', null, null, '011', '检测中心', 'yangying', '杨迎', '19019', '04', 'TB', null, 'yangying', '2018-01-17 09:24:44', 'Cuihh', '2018-01-17 09:38:46', '0');
INSERT INTO `tbop05` VALUES ('4910ef81-8dd5-434e-a0d7-4c56944339dd', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'AY', null, null, '013', '安全技术咨询中心', 'Taoxf', '陶小飞', '19123', '04', 'TB', null, 'Gaocr', '2018-01-17 10:13:38', 'Cuihh', '2018-01-18 17:19:00', '0');
INSERT INTO `tbop05` VALUES ('499b5202-36c8-46f0-8e7f-3ce65be0d90b', '03399ef7-c58b-4988-b3c9-1573d250d6b7', 'AY', null, 'OP02', '013', '安全技术咨询中心', 'Duanwb', '段伟博', '18823', '01', 'TB', null, 'Yuany', '2018-01-16 09:40:39', null, null, '0');
INSERT INTO `tbop05` VALUES ('4adfdae1-a6b2-4c2f-9818-190dcb3813e0', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'xuxh1', '许晓卉', '18538', '04', 'TB', null, 'xuxh1', '2018-01-16 00:37:49', 'Qinxc', '2018-01-16 00:48:37', '0');
INSERT INTO `tbop05` VALUES ('4df5de45-e12d-4dd8-8d8a-0fa3f7262575', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '011', '检测中心', 'Zenglq', '曾利琴', '19288', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:23', null, null, '0');
INSERT INTO `tbop05` VALUES ('4ee61181-e9f2-4e86-a46b-ade2627a5a66', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'AY', null, null, '013', '安全技术咨询中心', 'Wangr', '汪锐', '19141', '02', 'TB', null, 'Gaocr', '2018-01-17 10:13:38', 'Wangr', '2018-01-19 15:14:56', '0');
INSERT INTO `tbop05` VALUES ('52fecc93-d10f-4e07-b743-7002b1e291b1', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'Qinxc', '秦向春', '18502', '01', 'TB', null, 'xuxh1', '2018-01-16 00:37:48', null, null, '0');
INSERT INTO `tbop05` VALUES ('55226ed2-fc50-4b10-89aa-5d6e16c8d3e6', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'zengs1', '曾闪', '18520', '01', 'TB', null, 'xuxh1', '2018-01-16 00:37:49', null, null, '0');
INSERT INTO `tbop05` VALUES ('57b0463f-ed25-4e6b-99c5-3d1e98d3ba54', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '012', '安全评价技术中心', 'Xiars', '夏任司', '19351', '02', 'TB', null, 'Cuihh', '2018-01-18 16:53:24', 'Xiars', '2018-01-19 15:38:08', '0');
INSERT INTO `tbop05` VALUES ('5a338b10-63ae-4d11-a8de-4c0b77b34e25', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '013', '安全技术咨询中心', 'zhoud', '周栋', '19450', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:25', null, null, '0');
INSERT INTO `tbop05` VALUES ('5a88995f-ad01-4502-80a8-f829d83eb34f', '5238031b-879b-4852-8e47-75e4c85c3277', 'AY', null, null, '011', '检测中心', 'Zhaom', '赵明', '19055', '04', 'TB', null, 'yangying', '2018-01-17 09:24:44', 'Cuihh', '2018-01-18 17:18:52', '0');
INSERT INTO `tbop05` VALUES ('5eb910c0-7fd7-44aa-9f0c-f705f643bee7', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '013', '安全技术咨询中心', 'Tongt', '童涛', '19812', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:47', null, null, '0');
INSERT INTO `tbop05` VALUES ('5efa5ecd-8139-41ee-8462-ba4cd8fbe0eb', 'bb78f05f-e63c-4926-ad9c-be10e34986a7', 'AY', null, 'OP01', '04', '市场部', 'LuW', '卢玮', '18323', '04', 'TB', null, 'liuwl', '2018-01-15 23:12:20', 'xuxh1', '2018-01-16 00:03:22', '0');
INSERT INTO `tbop05` VALUES ('60d3e3f9-f911-4b88-a4f3-9169e6268687', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'xuxh1', '许晓卉', '18430', '02', 'TB', null, 'xuxh1', '2018-01-16 00:34:19', 'xuxh1', '2018-01-16 00:44:59', '0');
INSERT INTO `tbop05` VALUES ('61c0663b-ebee-49b9-b3bb-3f86b3b804d8', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '012', '安全评价技术中心', 'Xinw', '辛巍', '19641', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:44', null, null, '0');
INSERT INTO `tbop05` VALUES ('64dec6d0-f2b9-40b9-9a6a-98f29a9b28d4', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '011', '检测中心', 'Luox', '罗鑫', '19270', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:22', null, null, '0');
INSERT INTO `tbop05` VALUES ('668885ff-78f0-4342-8b36-2696c1ada324', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '013', '安全技术咨询中心', 'Gaocr', '高长仁', '19776', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:47', null, null, '0');
INSERT INTO `tbop05` VALUES ('6949bbbf-9944-427e-9231-682264b9c5c9', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'Zhangzh', '张振辉', '18267', '01', 'TB', null, 'xuxh1', '2018-01-16 00:34:18', null, null, '0');
INSERT INTO `tbop05` VALUES ('698e302e-02da-4931-acd8-4809e4693d1f', '698e302e-02da-4931-acd8-4809e4693d1f', 'AY', null, 'OP01', '03', '综合管理部', 'Qinxc', '秦向春', '18305', '04', 'HZ', null, 'xuxh1', '2018-01-15 22:36:35', 'Wangh', '2018-01-15 22:57:43', '0');
INSERT INTO `tbop05` VALUES ('6a92664b-2e48-46c0-a718-ffd0b1ff3234', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '013', '安全技术咨询中心', 'Gaocr', '高长仁', '19459', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:26', null, null, '0');
INSERT INTO `tbop05` VALUES ('6da38ffb-0125-4dfa-938d-9739dbdbd244', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '013', '安全技术咨询中心', 'Guangwx', '光文祥', '19396', '04', 'TB', null, 'Cuihh', '2018-01-18 16:53:25', 'Cuihh', '2018-01-18 17:20:59', '0');
INSERT INTO `tbop05` VALUES ('6f8536a7-7df4-4f95-bdb3-df7bbe075d26', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '012', '安全评价技术中心', 'Xiongw', '熊伟', '19632', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:44', null, null, '0');
INSERT INTO `tbop05` VALUES ('7707638d-2fbc-4f02-901d-f20079dcb089', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'Gaof', '高飞', '18547', '01', 'TB', null, 'xuxh1', '2018-01-16 00:37:49', null, null, '0');
INSERT INTO `tbop05` VALUES ('781fab63-7d3d-4a53-a89c-c5e25b9869b4', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'Qinl', '秦亮', '18615', '01', 'TB', null, 'xuxh1', '2018-01-16 08:56:40', null, null, '0');
INSERT INTO `tbop05` VALUES ('7882e297-4731-4559-9ca6-2ca854714b59', '5238031b-879b-4852-8e47-75e4c85c3277', 'AY', null, null, '011', '检测中心', 'Cuihh', '崔海华', '19001', '04', 'TB', null, 'yangying', '2018-01-17 09:24:43', 'Cuihh', '2018-01-17 09:39:02', '0');
INSERT INTO `tbop05` VALUES ('7909eab5-a09c-4a25-9469-1947852418c2', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '011', '检测中心', 'Gex', '葛璇', '19252', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:22', null, null, '0');
INSERT INTO `tbop05` VALUES ('7bf9aad7-bad0-432a-9380-9c8145a2a023', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '011', '检测中心', 'Zhaom', '赵明', '19749', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:46', null, null, '0');
INSERT INTO `tbop05` VALUES ('7c0acf96-0050-4436-9569-572dcdae70bc', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'zengs1', '曾闪', '18642', '01', 'TB', null, 'xuxh1', '2018-01-16 08:56:40', null, null, '0');
INSERT INTO `tbop05` VALUES ('803e0e96-feb3-44d2-9c2f-9ec7169eb0f8', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '011', '检测中心', 'Chengy', '程迎', '19704', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:46', null, null, '0');
INSERT INTO `tbop05` VALUES ('832baec1-7764-4874-be19-6c8490e573c3', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'Wangrx', '王瑞霞', '18556', '01', 'TB', null, 'xuxh1', '2018-01-16 00:37:49', null, null, '0');
INSERT INTO `tbop05` VALUES ('83c040e1-cdd9-4b19-a14f-c2b86867dbba', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '012', '安全评价技术中心', 'lexh', '乐雪焕', '19333', '02', 'TB', null, 'Cuihh', '2018-01-18 16:53:24', 'lexh', '2018-01-19 16:12:17', '0');
INSERT INTO `tbop05` VALUES ('870a12b6-435b-4c10-bc05-60ee3bac0cf9', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'Gaof', '高飞', '18669', '01', 'TB', null, 'xuxh1', '2018-01-16 08:56:40', null, null, '0');
INSERT INTO `tbop05` VALUES ('8826725f-db13-4715-8f7f-905339ac11fe', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '011', '检测中心', 'yangying', '杨迎', '19731', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:46', null, null, '0');
INSERT INTO `tbop05` VALUES ('89c81285-2757-4f9f-9046-c9f2dd6c1b5d', '97bd5400-a90d-4636-b77c-afb0fb3340bf', 'AY', 'ZWC', null, '013', '安全技术咨询中心', 'lexh', '乐雪焕', '19906', '01', 'TB', null, 'Gaocr', '2018-01-25 08:59:13', null, null, '0');
INSERT INTO `tbop05` VALUES ('8a642e91-d8ee-4c5b-bde7-e94fec5097f3', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '012', '安全评价技术中心', 'Jinw', '金伟', '19324', '02', 'TB', null, 'Cuihh', '2018-01-18 16:53:23', 'Jinw', '2018-01-19 15:26:17', '0');
INSERT INTO `tbop05` VALUES ('8cc4c6e8-3896-4afc-b1e1-95dab3a77731', '9291b859-e2f7-4c92-8005-75f6339af8b2', 'AY', null, 'OP01', '04', '市场部', 'LuW', '卢玮', '18692', '04', 'TB', null, 'xuxh1', '2018-01-16 09:09:17', 'xuxh1', '2018-01-16 09:18:26', '0');
INSERT INTO `tbop05` VALUES ('93d710f5-c722-48ec-b59e-9eb88f48a458', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '011', '检测中心', 'Luox', '罗鑫', '19722', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:46', null, null, '0');
INSERT INTO `tbop05` VALUES ('940284b2-0430-4a34-bf57-3adb393e2ef0', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '012', '安全评价技术中心', 'Jinw', '金伟', '19659', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:45', null, null, '0');
INSERT INTO `tbop05` VALUES ('9553c4c5-a6d3-4d1a-b69e-5bc698fcb096', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'liuwl', '刘伟龙', '18249', '01', 'TB', null, 'xuxh1', '2018-01-16 00:34:18', null, null, '0');
INSERT INTO `tbop05` VALUES ('96346f49-c637-4b03-857e-15d5e135fef5', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '013', '安全技术咨询中心', 'Huangsx', '黄仕鑫', '19794', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:47', null, null, '0');
INSERT INTO `tbop05` VALUES ('97d6f46f-7c37-41d2-b581-c0b838a1be13', '5238031b-879b-4852-8e47-75e4c85c3277', 'AY', null, null, '011', '检测中心', 'Zenglq', '曾利琴', '19046', '01', 'TB', null, 'yangying', '2018-01-17 09:24:44', null, null, '0');
INSERT INTO `tbop05` VALUES ('9b023634-86f6-48ec-8618-9ef1506f19b4', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '011', '检测中心', 'Gex', '葛璇', '19713', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:46', null, null, '0');
INSERT INTO `tbop05` VALUES ('9ffc5d49-36c7-4990-be07-ee1268a8f441', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '01', '安全事业部', 'Mengly', '孟路园', '19623', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:44', null, null, '0');
INSERT INTO `tbop05` VALUES ('a448a730-1937-4916-8263-afea2182f998', '97bd5400-a90d-4636-b77c-afb0fb3340bf', 'AY', 'ZWC', null, '013', '安全技术咨询中心', 'Tongt', '童涛', '19960', '01', 'TB', null, 'Gaocr', '2018-01-25 08:59:14', null, null, '0');
INSERT INTO `tbop05` VALUES ('a49a15d0-10ec-4c91-84a4-1f92d68180d7', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '013', '安全技术咨询中心', 'Wangr', '汪锐', '19432', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:25', null, null, '0');
INSERT INTO `tbop05` VALUES ('a648e336-29e3-4c76-86ae-7cba9de160f4', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '013', '安全技术咨询中心', 'zhoud', '周栋', '19830', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:48', null, null, '0');
INSERT INTO `tbop05` VALUES ('ab4f2726-7ebf-46e6-bc40-d5b638a7455a', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '013', '安全技术咨询中心', 'Xinw', '辛巍', '19441', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:25', null, null, '0');
INSERT INTO `tbop05` VALUES ('ae7db010-47d7-4921-8526-34868b6de3f1', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'zengs1', '曾闪', '18412', '01', 'TB', null, 'xuxh1', '2018-01-16 00:34:19', null, null, '0');
INSERT INTO `tbop05` VALUES ('b0d3e17c-047e-4d3e-a1f1-d3282e753781', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '013', '安全技术咨询中心', 'Tongt', '童涛', '19423', '02', 'TB', null, 'Cuihh', '2018-01-18 16:53:25', 'Tongt', '2018-01-19 15:41:37', '0');
INSERT INTO `tbop05` VALUES ('b0f8644c-bb61-48d4-91d6-d8f7b344f64a', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '01', '安全事业部', 'Caiz', '蔡振', '19216', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:21', null, null, '0');
INSERT INTO `tbop05` VALUES ('b146d22a-0bb8-419a-a40e-8fc20a54fbd6', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '01', '安全事业部', 'Xiongw', '熊伟', '19234', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:22', null, null, '0');
INSERT INTO `tbop05` VALUES ('b32cf8c7-81f9-448e-9cf1-644784ebe6d9', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '013', '安全技术咨询中心', 'Taoxf', '陶小飞', '19803', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:47', null, null, '0');
INSERT INTO `tbop05` VALUES ('b33b6996-5ef9-4a57-9660-a49de1c7dada', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'AY', null, null, '013', '安全技术咨询中心', 'Tongt', '童涛', '19132', '04', 'TB', null, 'Gaocr', '2018-01-17 10:13:38', 'Cuihh', '2018-01-18 17:18:10', '0');
INSERT INTO `tbop05` VALUES ('b6be0169-3f19-40e3-8d0d-e5f59776a276', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'Xianyuxb', '鲜于晓波', '18651', '01', 'TB', null, 'xuxh1', '2018-01-16 08:56:40', null, null, '0');
INSERT INTO `tbop05` VALUES ('b94622eb-9743-4ea5-aeb6-1c138bb8c5f0', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'Xianyuxb', '鲜于晓波', '18529', '01', 'TB', null, 'xuxh1', '2018-01-16 00:37:49', null, null, '0');
INSERT INTO `tbop05` VALUES ('bb689532-7e73-4a46-aa8e-32804733d250', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'Zhangzh', '张振辉', '18597', '01', 'TB', null, 'xuxh1', '2018-01-16 08:56:39', null, null, '0');
INSERT INTO `tbop05` VALUES ('bc121d8f-0246-471c-bc36-6c55902ba97e', '5238031b-879b-4852-8e47-75e4c85c3277', 'AY', null, null, '011', '检测中心', 'Luox', '罗鑫', '19028', '01', 'TB', null, 'yangying', '2018-01-17 09:24:44', null, null, '0');
INSERT INTO `tbop05` VALUES ('bc70fa31-ddc3-46e0-a3c1-bec03cc6192d', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'Luj', '陆军', '18606', '01', 'TB', null, 'xuxh1', '2018-01-16 08:56:39', null, null, '0');
INSERT INTO `tbop05` VALUES ('bd6780f1-d59e-4769-a3cb-c2874cf891aa', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '011', '检测中心', 'Zhaom', '赵明', '19297', '04', 'TB', null, 'Cuihh', '2018-01-18 16:53:23', 'Cuihh', '2018-01-19 14:40:32', '0');
INSERT INTO `tbop05` VALUES ('bf10d65b-e145-4045-a0e3-b73109db6875', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '013', '安全技术咨询中心', 'Cuihh', '崔海华', '19378', '04', 'TB', null, 'Cuihh', '2018-01-18 16:53:24', 'Cuihh', '2018-01-18 16:58:00', '0');
INSERT INTO `tbop05` VALUES ('c2371951-a4c3-408d-94f7-d7745c6bfa78', '97bd5400-a90d-4636-b77c-afb0fb3340bf', 'AY', 'ZWC', null, '013', '安全技术咨询中心', 'Guangwx', '光文祥', '19933', '01', 'TB', null, 'Gaocr', '2018-01-25 08:59:13', null, null, '0');
INSERT INTO `tbop05` VALUES ('c27d0ab2-11c5-4d6a-89fc-468eca6b122c', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'Zhangzh', '张振辉', '18475', '01', 'TB', null, 'xuxh1', '2018-01-16 00:37:48', null, null, '0');
INSERT INTO `tbop05` VALUES ('c348263f-4790-4df1-8e23-2b1f1eead2fc', '3c00302b-c828-4143-b798-28fa4086f1de', 'AY', null, 'OP01', '04', '市场部', 'LuW', '卢玮', '18230', '04', 'TB', null, 'xuxh1', '2018-01-15 21:31:38', 'xuxh1', '2018-01-15 22:23:33', '0');
INSERT INTO `tbop05` VALUES ('c7446aeb-a7a9-4709-ba09-9a3589f0a825', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'AY', null, null, '013', '安全技术咨询中心', 'Xinw', '辛巍', '19150', '01', 'TB', null, 'Gaocr', '2018-01-17 10:13:38', null, null, '0');
INSERT INTO `tbop05` VALUES ('c80a41ef-fb10-4d9a-b7f0-8a5e7d2da698', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'Liuw', '刘炜', '18588', '01', 'TB', null, 'xuxh1', '2018-01-16 08:56:39', null, null, '0');
INSERT INTO `tbop05` VALUES ('d0f41896-0f4f-4f8b-9967-201b0f920b28', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'songwg', '宋伟刚', '18403', '01', 'TB', null, 'xuxh1', '2018-01-16 00:34:19', null, null, '0');
INSERT INTO `tbop05` VALUES ('d1ad7e95-af1a-4fc0-b6da-23c143c6414c', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '012', '安全评价技术中心', '00082', '', '19668', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:45', null, null, '0');
INSERT INTO `tbop05` VALUES ('d1ec6d90-be03-445a-b1e5-da7aeffd8886', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'AY', null, null, '013', '安全技术咨询中心', 'Huangsx', '黄仕鑫', '19114', '04', 'TB', null, 'Gaocr', '2018-01-17 10:13:37', 'Cuihh', '2018-01-18 17:16:26', '0');
INSERT INTO `tbop05` VALUES ('d4caeee9-2461-4c5d-8fed-96da741693e9', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'Xianyuxb', '鲜于晓波', '18421', '01', 'TB', null, 'xuxh1', '2018-01-16 00:34:19', null, null, '0');
INSERT INTO `tbop05` VALUES ('d543db2c-7780-44b8-8907-e811ced8d4f2', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'AY', null, null, '013', '安全技术咨询中心', 'zhoud', '周栋', '19159', '04', 'TB', null, 'Gaocr', '2018-01-17 10:13:38', 'Cuihh', '2018-01-18 17:19:28', '0');
INSERT INTO `tbop05` VALUES ('d557d6b6-3b4b-40a5-bc93-18ef44f7da8c', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '013', '安全技术咨询中心', 'Guangwx', '光文祥', '19785', '02', 'TB', null, 'Cuihh', '2018-01-19 14:28:47', 'Guangwx', '2018-01-24 14:42:19', '0');
INSERT INTO `tbop05` VALUES ('d6a26344-c24b-4612-bc04-253b39184b78', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'Qinxc', '秦向春', '18624', '01', 'TB', null, 'xuxh1', '2018-01-16 08:56:40', null, null, '0');
INSERT INTO `tbop05` VALUES ('d75b31c0-854a-43fb-a5a6-f1f906b0ea31', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '013', '安全技术咨询中心', 'Wangr', '汪锐', '19821', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:48', null, null, '0');
INSERT INTO `tbop05` VALUES ('dcdb090a-287b-4d60-8454-8b292131b9bf', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'Gaof', '高飞', '18439', '01', 'TB', null, 'xuxh1', '2018-01-16 00:34:19', null, null, '0');
INSERT INTO `tbop05` VALUES ('e0963ffa-109e-42d7-a2ea-b790a2ff082b', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'Liuw', '刘炜', '18258', '01', 'TB', null, 'xuxh1', '2018-01-16 00:34:18', null, null, '0');
INSERT INTO `tbop05` VALUES ('e153e4f2-e0ea-498e-a192-9e863a8c0617', 'e153e4f2-e0ea-498e-a192-9e863a8c0617', 'AY', null, 'OP01', '03', '综合管理部', 'Qinxc', '秦向春', '18711', '04', 'HZ', null, 'xuxh1', '2018-01-16 09:19:08', 'Wangh', '2018-01-16 09:21:28', '0');
INSERT INTO `tbop05` VALUES ('e17ab167-6af9-4654-83a3-7bcc4dcf8076', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', 'AY', null, 'OP01', '03', '综合管理部', 'Qinxc', '秦向春', '18901', '02', 'HZ', null, 'xuxh1', '2018-01-16 11:56:42', null, null, '0');
INSERT INTO `tbop05` VALUES ('e2b03f41-f555-4600-a11a-dea2c2c447f7', '97bd5400-a90d-4636-b77c-afb0fb3340bf', 'AY', 'ZWC', null, '013', '安全技术咨询中心', 'Taoxf', '陶小飞', '19951', '01', 'TB', null, 'Gaocr', '2018-01-25 08:59:14', null, null, '0');
INSERT INTO `tbop05` VALUES ('e2ccfaf3-ba21-4fbe-a62f-6fa83ec3a42a', '97bd5400-a90d-4636-b77c-afb0fb3340bf', 'AY', 'ZWC', null, '013', '安全技术咨询中心', 'zhoud', '周栋', '19978', '01', 'TB', null, 'Gaocr', '2018-01-25 08:59:14', null, null, '0');
INSERT INTO `tbop05` VALUES ('e3e34f59-25b4-44da-83c6-d0468baae551', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '012', '安全评价技术中心', 'Xiars', '夏任司', '19686', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:45', null, null, '0');
INSERT INTO `tbop05` VALUES ('e4b3877f-47f4-4bda-b23b-810de0317285', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '012', '安全评价技术中心', 'Yim', '易明', '19369', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:24', null, null, '0');
INSERT INTO `tbop05` VALUES ('e51c3999-d1fb-404d-8766-7bd63f11c38d', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'AY', null, null, '013', '安全技术咨询中心', 'Duanwb', '段伟博', '19096', '04', 'TB', null, 'Gaocr', '2018-01-17 10:13:37', 'Cuihh', '2018-01-18 17:19:36', '0');
INSERT INTO `tbop05` VALUES ('e8ad3707-d7c2-4efd-a8bd-8409c8c46617', '1e58edc3-43ae-4031-b390-f6cc4874b0d1', 'AY', null, 'OP01', '04', '市场部', 'LuW', '卢玮', '18346', '04', 'TB', null, 'xuxh1', '2018-01-16 00:05:56', 'xuxh1', '2018-01-16 00:09:03', '0');
INSERT INTO `tbop05` VALUES ('e942f857-be0d-4061-9db0-9b9fad363875', '97bd5400-a90d-4636-b77c-afb0fb3340bf', 'AY', 'ZWC', null, '013', '安全技术咨询中心', 'Huangsx', '黄仕鑫', '19942', '01', 'TB', null, 'Gaocr', '2018-01-25 08:59:13', null, null, '0');
INSERT INTO `tbop05` VALUES ('ea663ce0-d01d-402b-9066-1f381895ceaa', '0333d72a-def3-4f3e-9e96-80be3e895608', 'AY', null, null, '03', '综合管理部', 'Liuw', '刘炜', '18466', '01', 'TB', null, 'xuxh1', '2018-01-16 00:37:48', null, null, '0');
INSERT INTO `tbop05` VALUES ('eabdf0fc-fc28-4d3d-8957-b0011334e7f5', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '013', '安全技术咨询中心', 'lexh', '乐雪焕', '19758', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:47', null, null, '0');
INSERT INTO `tbop05` VALUES ('ecd03c7f-94b1-4cc7-a369-3b2fbc196de9', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '011', '检测中心', 'yangying', '杨迎', '19261', '02', 'TB', null, 'Cuihh', '2018-01-18 16:53:22', 'yangying', '2018-01-18 16:58:05', '0');
INSERT INTO `tbop05` VALUES ('ee9eddb1-8186-4f07-8fde-072e40393c93', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'Wangrx', '王瑞霞', '18448', '01', 'TB', null, 'xuxh1', '2018-01-16 00:34:19', null, null, '0');
INSERT INTO `tbop05` VALUES ('f0c839b2-46c6-42c0-9875-f46a1e827a43', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '012', '安全评价技术中心', 'Cuihh', '崔海华', '19306', '04', 'TB', null, 'Cuihh', '2018-01-18 16:53:23', 'Cuihh', '2018-01-18 16:57:47', '0');
INSERT INTO `tbop05` VALUES ('f17ac449-9fc3-4f93-9ac8-67b8e59ad0cc', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '012', '安全评价技术中心', 'Wanghb', '王浩宾', '19677', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:45', null, null, '0');
INSERT INTO `tbop05` VALUES ('f47ba3e3-e91d-42c0-a5dd-95be827c7876', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'AY', null, null, '013', '安全技术咨询中心', 'Taoxf', '陶小飞', '19414', '01', 'TB', null, 'Cuihh', '2018-01-18 16:53:25', null, null, '0');
INSERT INTO `tbop05` VALUES ('f5835a4f-893e-4129-8f04-c95a4a21091c', '0bdfbe09-9230-474c-8e24-5fed6fc69048', 'AY', null, null, '03', '综合管理部', 'Qinxc', '秦向春', '18294', '01', 'TB', null, 'xuxh1', '2018-01-16 00:34:18', null, null, '0');
INSERT INTO `tbop05` VALUES ('f9a4c3b3-c61d-4184-83ec-c6f3b3b836fe', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'AY', null, null, '013', '安全技术咨询中心', 'Gaocr', '高长仁', '19168', '04', 'TB', null, 'Gaocr', '2018-01-17 10:13:38', 'Cuihh', '2018-01-18 17:17:49', '0');
INSERT INTO `tbop05` VALUES ('fca23947-b1b0-4481-8f46-8db7feee9e9c', '97bd5400-a90d-4636-b77c-afb0fb3340bf', 'AY', 'ZWC', null, '013', '安全技术咨询中心', 'Gaocr', '高长仁', '19924', '01', 'TB', null, 'Gaocr', '2018-01-25 08:59:13', null, null, '0');
INSERT INTO `tbop05` VALUES ('fe137b3e-6eb4-4d75-a206-0f7ed7582e1f', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', 'AY', null, null, '03', '综合管理部', 'Wangrx', '王瑞霞', '18678', '01', 'TB', null, 'xuxh1', '2018-01-16 08:56:40', null, null, '0');
INSERT INTO `tbop05` VALUES ('fe385bcf-39e0-410c-bd01-7bcf18853e07', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'AY', null, 'OP02', '01', '安全事业部', 'Cuihh', '崔海华', '19605', '01', 'TB', null, 'Cuihh', '2018-01-19 14:28:44', null, null, '0');

-- ----------------------------
-- Table structure for tbop06
-- ----------------------------
DROP TABLE IF EXISTS `tbop06`;
CREATE TABLE `tbop06` (
  `OP06_ID_` varchar(50) NOT NULL COMMENT '系统ID',
  `OP04_ID_` varchar(50) NOT NULL COMMENT '任务主表ID',
  `OP05_ID_` varchar(50) NOT NULL COMMENT '任务明细ID',
  `OP02_ID_` varchar(50) DEFAULT NULL COMMENT '业务数据ID',
  `COMP_ID_` varchar(10) DEFAULT NULL COMMENT '公司别',
  `STATUS_` varchar(10) DEFAULT NULL COMMENT '状态',
  `TYPE_` varchar(10) DEFAULT NULL COMMENT '类别',
  `MEMO_` varchar(50) DEFAULT NULL COMMENT '备注',
  `CREATE_EMP_` varchar(20) DEFAULT NULL COMMENT '新增人',
  `CREATE_TIME_` datetime DEFAULT NULL COMMENT '新增时间',
  `UPDATE_EMP_` varchar(20) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME_` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`OP06_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关系表';

-- ----------------------------
-- Records of tbop06
-- ----------------------------
INSERT INTO `tbop06` VALUES ('022266b6-c518-4256-9a2f-76775914387f', '5238031b-879b-4852-8e47-75e4c85c3277', '5a88995f-ad01-4502-80a8-f829d83eb34f', '75b3cf49-1ae8-4340-8d8e-126ac2c858c5', 'AY', null, null, null, 'Zhaom', '2018-01-17 09:47:26', null, null, '0');
INSERT INTO `tbop06` VALUES ('06d82c4a-2f78-4c22-9df6-c26ed3958459', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', '0398b9d0-024f-4a4e-846e-1edd9cda942d', '13b2fcf4-1f7d-4f0f-b0a2-7822472bb7a9', 'AY', null, null, null, 'Guangwx', '2018-01-18 16:55:52', null, null, '0');
INSERT INTO `tbop06` VALUES ('07c1f873-4d07-4ac7-9ebb-ff9c9a5d01d1', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', 'ef12cea0-9f6b-4102-882f-64aaf4cb0f71', 'AY', null, null, null, 'xuxh1', '2018-01-16 11:56:42', null, null, '0');
INSERT INTO `tbop06` VALUES ('0d027031-00cf-41c9-9532-2238086fdf3e', '9291b859-e2f7-4c92-8005-75f6339af8b2', '8cc4c6e8-3896-4afc-b1e1-95dab3a77731', '6579e71a-36c2-4699-a2f6-fa1ca5b28809', 'AY', null, null, null, 'LuW', '2018-01-16 09:11:49', null, null, '0');
INSERT INTO `tbop06` VALUES ('0e10dfae-395b-4737-bf19-d068ef5d005e', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'e51c3999-d1fb-404d-8766-7bd63f11c38d', 'cedc6b8f-a6d7-4dec-ac68-22c493ea5797', 'AY', null, null, null, 'Duanwb', '2018-01-18 09:13:47', null, null, '0');
INSERT INTO `tbop06` VALUES ('1595833d-d0c4-4853-a3fa-3bb5028bc813', 'bb78f05f-e63c-4926-ad9c-be10e34986a7', '5efa5ecd-8139-41ee-8462-ba4cd8fbe0eb', 'ef12cea0-9f6b-4102-882f-64aaf4cb0f71', 'AY', null, 'YWC', null, 'LuW', '2018-01-15 23:39:54', null, null, '0');
INSERT INTO `tbop06` VALUES ('1cae9495-4a10-4f62-80a4-416220599585', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', '6a92664b-2e48-46c0-a718-ffd0b1ff3234', 'd97c595e-3130-454f-a959-4fac480a710f', 'AY', null, null, null, 'Gaocr', '2018-01-22 11:08:38', null, null, '0');
INSERT INTO `tbop06` VALUES ('24acd50b-7984-4ca0-9d80-a895f2759ea2', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'd543db2c-7780-44b8-8907-e811ced8d4f2', '045021c9-cf13-4937-ba08-56079d1b50b9', 'AY', null, null, null, 'zhoud', '2018-01-18 08:54:24', null, null, '0');
INSERT INTO `tbop06` VALUES ('2673fddf-6b0f-4b9e-b2be-3508d010ea9f', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'b33b6996-5ef9-4a57-9660-a49de1c7dada', '90818806-5bca-4b5f-b0b7-6b37550c2a9f', 'AY', null, null, null, 'Tongt', '2018-01-17 17:43:32', null, null, '0');
INSERT INTO `tbop06` VALUES ('2c7af015-b13f-45f8-9529-31eb7b9781f1', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', '83c040e1-cdd9-4b19-a14f-c2b86867dbba', 'aa7e44bd-edf3-4c0f-b0a6-a052f5a0bc8a', 'AY', null, null, null, 'lexh', '2018-01-19 12:44:27', null, null, '0');
INSERT INTO `tbop06` VALUES ('2caf9cad-e56d-41b4-b49a-c5419ab049eb', 'e153e4f2-e0ea-498e-a192-9e863a8c0617', 'e153e4f2-e0ea-498e-a192-9e863a8c0617', '21d46292-c551-4edb-9ea5-14e6895972ed', 'AY', null, null, null, 'xuxh1', '2018-01-16 09:19:08', null, null, '0');
INSERT INTO `tbop06` VALUES ('33136859-d512-4cac-865b-45aa8bfba3fb', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'bd6780f1-d59e-4769-a3cb-c2874cf891aa', '070a9876-f740-4dc0-a488-2820de153452', 'AY', null, null, null, 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop06` VALUES ('33e33ae8-fa4a-4d98-855d-679a3de5ccc7', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'f9a4c3b3-c61d-4184-83ec-c6f3b3b836fe', 'ef53d052-80e7-4bce-8020-57e8551397e9', 'AY', null, null, null, 'Gaocr', '2018-01-17 10:17:46', null, null, '0');
INSERT INTO `tbop06` VALUES ('3624d559-b9e9-4795-a16b-0732cf1b7759', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'd543db2c-7780-44b8-8907-e811ced8d4f2', 'da2946e3-5c8c-458f-9b47-de41cc1f7c7d', 'AY', null, null, null, 'zhoud', '2018-01-18 08:51:42', null, null, '0');
INSERT INTO `tbop06` VALUES ('37e3ad71-f63f-4d1c-be01-f7ee4acd4e57', 'fd80243d-c998-4620-96dd-d710341aee5a', '38b820be-34cd-4c57-b747-bd3387c4efaf', 'acb44d24-7bb8-476d-a89f-1a2d5e72de40', 'AY', null, 'YJH', null, 'LuW', '2018-01-16 09:30:38', null, null, '0');
INSERT INTO `tbop06` VALUES ('3890cf73-94fb-4716-b8a5-14c165d1da31', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', '0349e63f-0de5-4f08-8f9f-9d88e2c728aa', 'AY', null, null, null, 'xuxh1', '2018-01-16 11:56:42', null, null, '0');
INSERT INTO `tbop06` VALUES ('3be3583c-8737-4b01-b5f9-4e2449634aa5', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', '8a642e91-d8ee-4c5b-bde7-e94fec5097f3', '68523a3e-e57f-4117-928f-6a49499c4e61', 'AY', null, null, null, 'Jinw', '2018-01-19 15:26:13', null, null, '0');
INSERT INTO `tbop06` VALUES ('461a6943-d82e-4cae-a779-b1ea8d81d736', 'fd092b0c-97e5-4dee-8aad-9b5771cb7d3e', 'd557d6b6-3b4b-40a5-bc93-18ef44f7da8c', '6bcd687d-2e93-4bfc-b2a7-e47dddd22ce7', 'AY', null, 'YWC', null, 'Guangwx', '2018-01-24 14:41:19', null, null, '0');
INSERT INTO `tbop06` VALUES ('48b0b6b4-ac3d-4284-8874-8dd7f0391744', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'e51c3999-d1fb-404d-8766-7bd63f11c38d', '66661710-11ca-47c7-b15e-005c3ab49d26', 'AY', null, null, null, 'Duanwb', '2018-01-18 09:13:47', null, null, '0');
INSERT INTO `tbop06` VALUES ('4da8cd52-344f-45af-af28-457dd7a0b00a', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'bd6780f1-d59e-4769-a3cb-c2874cf891aa', 'f3a5da06-65fd-4cdb-acbd-e65d9b3b031b', 'AY', null, null, null, 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop06` VALUES ('52946e02-5b92-4e07-8228-26983d6d4d9b', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'ecd03c7f-94b1-4cc7-a369-3b2fbc196de9', 'b988ab64-10f6-4b6f-b14c-9768aa02bc08', 'AY', null, null, null, 'yangying', '2018-01-18 16:54:58', null, null, '0');
INSERT INTO `tbop06` VALUES ('5daa530f-fcae-4c62-bfdf-e1401a90acc1', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', '108bcb88-3355-4421-84fe-e6fbdc98d15b', 'AY', null, null, null, 'xuxh1', '2018-01-16 11:56:42', null, null, '0');
INSERT INTO `tbop06` VALUES ('60c95e0e-db2a-46e5-a628-0e4ec443a4aa', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'b0d3e17c-047e-4d3e-a1f1-d3282e753781', '3dcb4e6c-123d-47a4-bd8e-ba95c3c0f074', 'AY', null, null, null, 'Tongt', '2018-01-19 15:41:33', null, null, '0');
INSERT INTO `tbop06` VALUES ('632c5bcc-64d9-42a0-a2ba-847845f95609', 'fd80243d-c998-4620-96dd-d710341aee5a', '38b820be-34cd-4c57-b747-bd3387c4efaf', 'dcbdd8a2-cc84-4e84-9277-681b8f86f4ef', 'AY', null, 'YJH', null, 'LuW', '2018-01-16 09:30:38', null, null, '0');
INSERT INTO `tbop06` VALUES ('67fa6b18-8f09-425f-a20d-9eb0e3860c00', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', '4ee61181-e9f2-4e86-a46b-ade2627a5a66', 'c25a64a3-5333-4a0e-a31b-6df32b6fc0fd', 'AY', null, null, null, 'Wangr', '2018-01-19 15:11:18', null, null, '0');
INSERT INTO `tbop06` VALUES ('6a3fa43d-dd9f-4e6a-bd57-3e92095998f9', '1e58edc3-43ae-4031-b390-f6cc4874b0d1', 'e8ad3707-d7c2-4efd-a8bd-8409c8c46617', '9315ecaa-39f9-4dd2-a992-a36776de09a2', 'AY', null, 'YJH', null, 'LuW', '2018-01-16 00:06:21', null, null, '0');
INSERT INTO `tbop06` VALUES ('6b652ff6-ac5d-4c3f-95d7-a2672231fd31', 'fd80243d-c998-4620-96dd-d710341aee5a', '38b820be-34cd-4c57-b747-bd3387c4efaf', 'b6822913-3ee5-4943-be66-d4ec7934073a', 'AY', null, 'YWC', null, 'LuW', '2018-01-16 09:29:16', null, null, '0');
INSERT INTO `tbop06` VALUES ('6bf33263-c891-4cdf-9b9b-94a4d2cdea20', '1e58edc3-43ae-4031-b390-f6cc4874b0d1', 'e8ad3707-d7c2-4efd-a8bd-8409c8c46617', '108bcb88-3355-4421-84fe-e6fbdc98d15b', 'AY', null, 'YJH', null, 'LuW', '2018-01-16 00:06:21', null, null, '0');
INSERT INTO `tbop06` VALUES ('70a21fef-6bdb-448a-966e-141fff23ba1b', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'd543db2c-7780-44b8-8907-e811ced8d4f2', '1f6e77df-fb9f-4c86-a2c4-b193545a0ea5', 'AY', null, null, null, 'zhoud', '2018-01-18 08:51:42', null, null, '0');
INSERT INTO `tbop06` VALUES ('70e73374-bd61-4216-bfb2-638261edcbd8', '5238031b-879b-4852-8e47-75e4c85c3277', '5a88995f-ad01-4502-80a8-f829d83eb34f', '92d55ed4-90da-4b00-a549-642fa8bf2f7f', 'AY', null, null, null, 'Zhaom', '2018-01-17 09:46:38', null, null, '0');
INSERT INTO `tbop06` VALUES ('72f76cbe-34b9-43fc-8b0c-1fdf0a2f1d69', '0333d72a-def3-4f3e-9e96-80be3e895608', '4adfdae1-a6b2-4c2f-9818-190dcb3813e0', 'ccf61899-ead0-477f-affb-429f6dffdf88', 'AY', null, null, null, 'Qinxc', '2018-01-16 00:46:33', null, null, '0');
INSERT INTO `tbop06` VALUES ('741c66d8-00ed-4d2d-baca-faad2037c775', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'ecd03c7f-94b1-4cc7-a369-3b2fbc196de9', 'ded0846c-953f-4f5a-94c7-ead8bc7e8e50', 'AY', null, null, null, 'yangying', '2018-01-18 16:55:37', null, null, '0');
INSERT INTO `tbop06` VALUES ('74ad7521-7dc7-4354-8fab-dab6e7f40a89', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', '6a92664b-2e48-46c0-a718-ffd0b1ff3234', 'c8ec9533-5730-46ba-bd9e-a0e8de162c56', 'AY', null, null, null, 'Gaocr', '2018-01-22 11:08:38', null, null, '0');
INSERT INTO `tbop06` VALUES ('7f046127-b734-419f-8bdc-e890056d120c', '0bdfbe09-9230-474c-8e24-5fed6fc69048', '60d3e3f9-f911-4b88-a4f3-9169e6268687', '97dc8e44-6b0a-4c16-98a4-a89bf4d80a3e', 'AY', null, null, null, 'xuxh1', '2018-01-16 00:38:29', null, null, '0');
INSERT INTO `tbop06` VALUES ('8239c9e6-89c6-4434-9cc0-9adc5c663655', '698e302e-02da-4931-acd8-4809e4693d1f', '698e302e-02da-4931-acd8-4809e4693d1f', 'a0e7a5d1-e583-456d-b6db-6bd01fc9367c', 'AY', null, null, null, 'xuxh1', '2018-01-15 22:36:35', null, null, '0');
INSERT INTO `tbop06` VALUES ('85204fd3-9fb8-49d4-b947-6ff7c4f6f04f', 'bb78f05f-e63c-4926-ad9c-be10e34986a7', '5efa5ecd-8139-41ee-8462-ba4cd8fbe0eb', '8dd1624f-855a-4f96-b039-64d268a9e3ee', 'AY', null, 'YWC', null, 'LuW', '2018-01-15 23:39:54', null, null, '0');
INSERT INTO `tbop06` VALUES ('85ed0cbc-9a3b-4885-8864-4a13a9dad631', '0bdfbe09-9230-474c-8e24-5fed6fc69048', '60d3e3f9-f911-4b88-a4f3-9169e6268687', 'fcb7aa1f-7101-46cb-8310-fc4a15037734', 'AY', null, null, null, 'xuxh1', '2018-01-16 00:38:18', null, null, '0');
INSERT INTO `tbop06` VALUES ('882296f2-1377-4511-a4b4-d3ff1df34298', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', '0398b9d0-024f-4a4e-846e-1edd9cda942d', '37337e77-027e-4fbe-95a1-dfec11511e50', 'AY', null, null, null, 'Guangwx', '2018-01-18 16:55:42', null, null, '0');
INSERT INTO `tbop06` VALUES ('88f2764e-f9a6-48c8-b6bc-5495d1447f8d', '5238031b-879b-4852-8e47-75e4c85c3277', '22ab66eb-9adc-463d-af3f-ce98ddfeb8ae', '354faaae-791c-4aef-b4eb-d6123ef2fe40', 'AY', null, null, null, 'Chengy', '2018-01-17 10:30:03', null, null, '0');
INSERT INTO `tbop06` VALUES ('8d03e911-dd71-4d4a-b320-84d1fdf92e05', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', '06f90f18-73c3-4ef5-b24f-6bd259692420', 'c478240e-5572-41e3-bf87-44b41428277a', 'AY', null, null, null, 'xuxh1', '2018-01-16 08:57:50', null, null, '0');
INSERT INTO `tbop06` VALUES ('96f3c2f6-0ad9-442f-a1b5-b13e665702da', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', '83c040e1-cdd9-4b19-a14f-c2b86867dbba', 'daea6366-283f-4447-a678-d4143711e20d', 'AY', null, null, null, 'lexh', '2018-01-19 12:44:46', null, null, '0');
INSERT INTO `tbop06` VALUES ('993bb1b6-5324-494c-b19b-abb11c77a1f2', '5238031b-879b-4852-8e47-75e4c85c3277', '5a88995f-ad01-4502-80a8-f829d83eb34f', '903de194-e97e-4102-8506-57a7df7f0e0d', 'AY', null, null, null, 'Zhaom', '2018-01-17 09:47:26', null, null, '0');
INSERT INTO `tbop06` VALUES ('9956bdd5-113b-41c1-b4ec-26fc0a99ab6e', '698e302e-02da-4931-acd8-4809e4693d1f', '698e302e-02da-4931-acd8-4809e4693d1f', '23f002d6-5bbc-4421-b4ce-5436fd29ce70', 'AY', null, null, null, 'xuxh1', '2018-01-15 22:36:35', null, null, '0');
INSERT INTO `tbop06` VALUES ('99b2708b-dfb1-4574-87dd-77f5264684c4', '5238031b-879b-4852-8e47-75e4c85c3277', '22ab66eb-9adc-463d-af3f-ce98ddfeb8ae', '69e2e9b8-9e09-439f-92d7-c4ca2aae69cd', 'AY', null, null, null, 'Chengy', '2018-01-17 09:49:44', null, null, '0');
INSERT INTO `tbop06` VALUES ('99e24485-e440-4b1e-8842-3a187efdabc9', '0bdfbe09-9230-474c-8e24-5fed6fc69048', '60d3e3f9-f911-4b88-a4f3-9169e6268687', '6ec003e1-1a4f-47de-8aa6-91faa84ac390', 'AY', null, null, null, 'xuxh1', '2018-01-16 00:44:52', null, null, '0');
INSERT INTO `tbop06` VALUES ('9a9c412a-9e83-436a-b945-38f68dff5d28', 'bb78f05f-e63c-4926-ad9c-be10e34986a7', '5efa5ecd-8139-41ee-8462-ba4cd8fbe0eb', '0349e63f-0de5-4f08-8f9f-9d88e2c728aa', 'AY', null, 'YWC', null, 'LuW', '2018-01-15 23:39:54', null, null, '0');
INSERT INTO `tbop06` VALUES ('9b0e865e-08a9-4c3b-93de-443f875cf37b', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'b33b6996-5ef9-4a57-9660-a49de1c7dada', '9c2dcccf-9631-4fa8-98b5-b7ef9c831051', 'AY', null, null, null, 'Tongt', '2018-01-17 17:43:32', null, null, '0');
INSERT INTO `tbop06` VALUES ('9c7a5e43-c2a6-4ef3-8bb4-32871166b0b9', 'e153e4f2-e0ea-498e-a192-9e863a8c0617', 'e153e4f2-e0ea-498e-a192-9e863a8c0617', '6579e71a-36c2-4699-a2f6-fa1ca5b28809', 'AY', null, null, null, 'xuxh1', '2018-01-16 09:19:08', null, null, '0');
INSERT INTO `tbop06` VALUES ('9d7c33b1-70ff-4e47-8dfd-5b7bc6bb2d1c', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', '8dd1624f-855a-4f96-b039-64d268a9e3ee', 'AY', null, null, null, 'xuxh1', '2018-01-16 11:56:42', null, null, '0');
INSERT INTO `tbop06` VALUES ('a339f627-00f4-4c3e-8009-82d5e8b6bbe9', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'bd6780f1-d59e-4769-a3cb-c2874cf891aa', '0761164c-0a0a-4160-b802-0db36860221c', 'AY', null, null, null, 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop06` VALUES ('a6228b98-53ca-48ec-a5a1-ac4886d68e4c', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'bd6780f1-d59e-4769-a3cb-c2874cf891aa', 'a95e60fc-2cd5-4ad5-8fcf-ffbc5ea057e8', 'AY', null, null, null, 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop06` VALUES ('ae70e5a6-50e8-4a79-8332-e2eb92c2f9ac', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', 'd543db2c-7780-44b8-8907-e811ced8d4f2', '8307e6d0-d254-493a-becb-9863abb82805', 'AY', null, null, null, 'zhoud', '2018-01-18 08:51:42', null, null, '0');
INSERT INTO `tbop06` VALUES ('b37f405f-b335-4615-a9cc-30c7f6743074', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'bd6780f1-d59e-4769-a3cb-c2874cf891aa', '66665592-0189-44bc-b02b-0d0b91ba1d18', 'AY', null, null, null, 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop06` VALUES ('b4a3a59a-26d5-4b23-a6aa-37e0e698f226', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', '06f90f18-73c3-4ef5-b24f-6bd259692420', '8fbfee55-48fc-4d90-b7c2-511d63c83ecb', 'AY', null, null, null, 'xuxh1', '2018-01-16 08:57:43', null, null, '0');
INSERT INTO `tbop06` VALUES ('b8021b49-1849-4371-a9bf-d315b7f47ce5', '9ae65b75-9a2d-4dfa-bb31-050ecfa321ea', '06f90f18-73c3-4ef5-b24f-6bd259692420', 'be0b095e-f08d-4738-8adb-ec9a64b61073', 'AY', null, null, null, 'xuxh1', '2018-01-16 08:57:43', null, null, '0');
INSERT INTO `tbop06` VALUES ('bb5873e0-185a-4df4-8ea9-be11941d47db', 'fd80243d-c998-4620-96dd-d710341aee5a', '38b820be-34cd-4c57-b747-bd3387c4efaf', 'de132a4e-deb2-4520-926d-e039611c2a1c', 'AY', null, 'YWC', null, 'LuW', '2018-01-16 09:29:16', null, null, '0');
INSERT INTO `tbop06` VALUES ('bbb6204c-5e00-42e3-bc1c-d1ac4fcf929f', '0333d72a-def3-4f3e-9e96-80be3e895608', '4adfdae1-a6b2-4c2f-9818-190dcb3813e0', 'ced3b8a4-5f22-4e47-8437-96300f9e0d65', 'AY', null, null, null, 'Qinxc', '2018-01-16 00:46:53', null, null, '0');
INSERT INTO `tbop06` VALUES ('c900c932-cf6e-4bc2-8b22-bb2fca150f29', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', '4ee61181-e9f2-4e86-a46b-ade2627a5a66', '3ed23241-1802-4a18-bb02-c59f59e750c2', 'AY', null, null, null, 'Wangr', '2018-01-19 15:11:18', null, null, '0');
INSERT INTO `tbop06` VALUES ('cb8c5035-6a90-42e2-baa8-428ec594345a', '0333d72a-def3-4f3e-9e96-80be3e895608', '4adfdae1-a6b2-4c2f-9818-190dcb3813e0', '78278804-da29-410f-a34e-0ccfbd3818d8', 'AY', null, null, null, 'Qinxc', '2018-01-16 00:46:53', null, null, '0');
INSERT INTO `tbop06` VALUES ('cc86fb3a-35f1-472f-99a2-857b7620ed2c', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', '9315ecaa-39f9-4dd2-a992-a36776de09a2', 'AY', null, null, null, 'xuxh1', '2018-01-16 11:56:42', null, null, '0');
INSERT INTO `tbop06` VALUES ('d391e2d9-fb90-47f9-9122-aa2f05479283', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', '1fc7030e-19c6-4855-9af0-088f1a99d270', '0f6d4548-5e1f-4762-9d0e-77034dcd4eaf', 'AY', null, null, null, 'Wanghb', '2018-01-19 15:35:19', null, null, '0');
INSERT INTO `tbop06` VALUES ('dc645122-30ec-45e3-ae29-23d2be1995a9', '3c00302b-c828-4143-b798-28fa4086f1de', 'c348263f-4790-4df1-8e23-2b1f1eead2fc', 'a0e7a5d1-e583-456d-b6db-6bd01fc9367c', 'AY', null, null, null, 'LuW', '2018-01-15 21:34:09', null, null, '0');
INSERT INTO `tbop06` VALUES ('dce53f47-7bb9-4865-98e8-0fa3b46f870a', '8de2b78e-42a8-4fb4-b6df-b72660cfab4a', '0398b9d0-024f-4a4e-846e-1edd9cda942d', '0a5aef66-2d7e-4119-bb35-aa1d40f71d30', 'AY', null, null, null, 'Guangwx', '2018-01-18 16:55:42', null, null, '0');
INSERT INTO `tbop06` VALUES ('dec5cb7f-fbda-4464-8045-a2324233c31e', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'bd6780f1-d59e-4769-a3cb-c2874cf891aa', '93e7a139-1a21-41a4-80cf-c5aa96f49797', 'AY', null, null, null, 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop06` VALUES ('e1be3678-2bcc-4d92-b0eb-238b9898026a', '5238031b-879b-4852-8e47-75e4c85c3277', '5a88995f-ad01-4502-80a8-f829d83eb34f', '3fdbef32-9c39-41fe-a015-97f10439beb3', 'AY', null, null, null, 'Zhaom', '2018-01-17 09:46:38', null, null, '0');
INSERT INTO `tbop06` VALUES ('ec06dd8e-d3fe-40e1-8531-5b356bf11beb', '3c00302b-c828-4143-b798-28fa4086f1de', 'c348263f-4790-4df1-8e23-2b1f1eead2fc', '23f002d6-5bbc-4421-b4ce-5436fd29ce70', 'AY', null, null, null, 'LuW', '2018-01-15 21:34:09', null, null, '0');
INSERT INTO `tbop06` VALUES ('ed590853-62e4-46d5-b639-564addba27c3', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', 'bd6780f1-d59e-4769-a3cb-c2874cf891aa', 'f9e14a83-4ef2-4a91-8e1a-2f9c8b5913e6', 'AY', null, null, null, 'Zhaom', '2018-01-19 08:33:32', null, null, '0');
INSERT INTO `tbop06` VALUES ('eeb1ac8f-5583-4ecd-8879-91aa03f6931e', '9291b859-e2f7-4c92-8005-75f6339af8b2', '8cc4c6e8-3896-4afc-b1e1-95dab3a77731', '21d46292-c551-4edb-9ea5-14e6895972ed', 'AY', null, null, null, 'LuW', '2018-01-16 09:11:49', null, null, '0');
INSERT INTO `tbop06` VALUES ('f2bdd87e-7f75-4d57-ac27-2219737640f8', '5238031b-879b-4852-8e47-75e4c85c3277', '22ab66eb-9adc-463d-af3f-ce98ddfeb8ae', 'a6f39f53-cddf-49cf-9981-91de2f6b4f64', 'AY', null, null, null, 'Chengy', '2018-01-17 10:29:43', null, null, '0');
INSERT INTO `tbop06` VALUES ('f8f0415b-b7a7-4600-9e2e-94c64c40a276', 'fd23cd70-d8ae-4f48-88e0-b394afb1290c', '83c040e1-cdd9-4b19-a14f-c2b86867dbba', '2d84b6de-f2ca-4fdf-99b4-aa099a0ff5aa', 'AY', null, null, null, 'lexh', '2018-01-19 12:44:37', null, null, '0');

-- ----------------------------
-- Table structure for tbop07
-- ----------------------------
DROP TABLE IF EXISTS `tbop07`;
CREATE TABLE `tbop07` (
  `OP07_ID_` varchar(50) NOT NULL COMMENT '系统ID',
  `COMP_ID_` varchar(10) DEFAULT NULL COMMENT '公司别',
  `OP_NO_` varchar(5) DEFAULT NULL COMMENT '类别',
  `OP_TYPE_` varchar(5) DEFAULT NULL COMMENT '作业类型',
  `LEVEL_` varchar(20) DEFAULT NULL COMMENT '重要级别',
  `YEAR_` varchar(4) DEFAULT NULL COMMENT '年份',
  `MONTH_` varchar(2) DEFAULT NULL COMMENT '月份',
  `WEEK_` varchar(2) DEFAULT NULL COMMENT '周',
  `TYPE_NO_` varchar(5) DEFAULT NULL COMMENT '工作类别代码',
  `TYPE_NAME_` varchar(20) DEFAULT NULL COMMENT '工作类别',
  `TYPE_NO_1` varchar(5) DEFAULT NULL COMMENT '工作类别代码1',
  `TYPE_NAME_1` varchar(20) DEFAULT NULL COMMENT '一级分类',
  `TYPE_NO_2` varchar(5) DEFAULT NULL COMMENT '工作类别代码2',
  `TYPE_NAME_2` varchar(20) DEFAULT NULL COMMENT '二级分类',
  `TYPE_NO_3` varchar(5) DEFAULT NULL COMMENT '工作类别代码3',
  `TYPE_NAME_3` varchar(20) DEFAULT NULL COMMENT '三级分类',
  `TYPE_NO_4` varchar(5) DEFAULT NULL COMMENT '工作类别代码4',
  `TYPE_NAME_4` varchar(20) DEFAULT NULL COMMENT '四级分类',
  `HT_NO_` varchar(200) DEFAULT NULL COMMENT '安源编号合同',
  `XM_NO_` varchar(200) DEFAULT NULL COMMENT '安源编号项目',
  `AA_NO_` varchar(200) DEFAULT NULL COMMENT '安源编号财务',
  `CONTENT_` varchar(500) DEFAULT NULL COMMENT '工作内容',
  `CONTENT_TEMP_` varchar(200) DEFAULT NULL COMMENT '工作内容备用',
  `CONTENT_TEMP_2` varchar(200) DEFAULT NULL COMMENT '工作内容备用2',
  `CONTENT_TEMP_3` varchar(200) DEFAULT NULL COMMENT '工作内容备用3',
  `AMT_` decimal(18,5) DEFAULT NULL COMMENT '计划总金额',
  `AMT_1` decimal(18,5) DEFAULT NULL COMMENT '金额1',
  `AMT_2` decimal(18,5) DEFAULT NULL COMMENT '金额2',
  `AMT_3` decimal(18,5) DEFAULT NULL COMMENT '金额3',
  `AMT_4` decimal(18,5) DEFAULT NULL COMMENT '金额4',
  `AMT_WW_` decimal(18,5) DEFAULT NULL COMMENT '计划外委金额',
  `AMT_TOTAL_` decimal(18,5) DEFAULT NULL COMMENT '完成总金额',
  `AMT_WW_TOTAL_` decimal(18,5) DEFAULT NULL COMMENT '完成外委金额',
  `RATE_` decimal(18,5) DEFAULT NULL COMMENT '累计比例',
  `TYPE_WW_` varchar(20) DEFAULT NULL COMMENT '外委类型',
  `DATE_START_` varchar(50) DEFAULT NULL COMMENT '计划启动时间',
  `DATE_END_` varchar(50) DEFAULT NULL COMMENT '计划完成时间',
  `DATE_FINISH_` varchar(50) DEFAULT NULL COMMENT '实际完成时间',
  `DATE_1` varchar(50) DEFAULT NULL COMMENT '时间1',
  `DATE_2` varchar(50) DEFAULT NULL COMMENT '时间2',
  `DATE_3` varchar(50) DEFAULT NULL COMMENT '时间3',
  `STATUS_` varchar(2) DEFAULT NULL COMMENT '状态',
  `DEPT_NO_ZR_` varchar(100) DEFAULT NULL COMMENT '责任部门',
  `DEPT_NAME_ZR_` varchar(500) DEFAULT NULL COMMENT '责任部门名称',
  `EMP_NO_ZR_` varchar(100) DEFAULT NULL COMMENT '责任人',
  `EMP_NAME_ZR_` varchar(500) DEFAULT NULL COMMENT '责任人名称',
  `EMP_NO_XG_` varchar(500) DEFAULT NULL COMMENT '经办人ID',
  `EMP_NAME_XG_` varchar(500) DEFAULT NULL COMMENT '经办人',
  `DEPT_NO_XG_` varchar(100) DEFAULT NULL COMMENT '承办部门ID',
  `DEPT_NAME_XG_` varchar(100) DEFAULT NULL COMMENT '承办部门',
  `EMP_NO_XG_2` varchar(500) DEFAULT NULL COMMENT '经办人ID2',
  `EMP_NAME_XG2` varchar(500) DEFAULT NULL COMMENT '经办人2',
  `DEPT_NO_XG_2` varchar(100) DEFAULT NULL COMMENT '承办部门ID2',
  `DEPT_NAME_XG_2` varchar(100) DEFAULT NULL COMMENT '承办部门2',
  `MEMO_` varchar(200) DEFAULT NULL COMMENT '备注',
  `CREATE_EMP_` varchar(20) DEFAULT NULL COMMENT '新增人',
  `CREATE_TIME_` datetime DEFAULT NULL COMMENT '新增时间',
  `UPDATE_EMP_` varchar(20) DEFAULT NULL COMMENT '修改人',
  `UPDATE_TIME_` datetime DEFAULT NULL COMMENT '修改时间',
  `VERSION` int(6) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`OP07_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目表';

-- ----------------------------
-- Records of tbop07
-- ----------------------------
INSERT INTO `tbop07` VALUES ('0192d795-169a-45af-89e3-da59082a9404', 'AY', 'OP02', null, null, '2018', '1', null, null, null, null, null, null, null, null, null, null, null, null, 'AY2611', null, '湖北广水中华山二期风电场工程安全预评价', '国电长源广水风电有限公司', null, null, '2.00000', '20.00000', '10.00000', null, null, null, null, null, null, null, null, null, null, null, null, '2017-12-12 14:19', null, '01', '安全事业部', 'zhengwj', '郑文君', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 11:53:32', null, null, '0');
INSERT INTO `tbop07` VALUES ('075c9e79-1eee-43f5-822d-b6161e61884b', 'AY', 'OP01', null, '1', '2018', null, null, null, null, 'B', '环保业务', 'B06', '土地复垦、发展诊断', 'B0601', '电网土地复垦', '', '', 'XSH00000421', null, null, '恩施鹤峰220kV输变电工程水土保持方案报告书', '国网湖北省电力公司恩施供电公司', null, null, '16.50000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-09', null, '02', '环境事业部', 'Yulr', '余良睿', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 23:28:49', 'liuwl', '2018-01-15 23:33:08', '0');
INSERT INTO `tbop07` VALUES ('140212ae-8fe5-466f-b505-3ef5deba6642', 'AY', 'OP03', null, null, '2018', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'KPS00000321', '建设工程环评咨询服务框架合同-孝感2016框招', '国网湖北省电力有限公司孝感供电公司', null, null, '6.06300', null, null, null, null, null, null, null, null, null, null, null, null, '2018年3月 第三周', '', '2018-01-09', null, '022', '生态保护技术中心', 'Zhangl', '张磊', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 12:04:17', null, null, '0');
INSERT INTO `tbop07` VALUES ('2e498b6f-2bfb-4569-bb43-c1bd29192ebc', 'AY', 'OP03', null, null, '2018', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'KPS00000324', '能源领域安全生产法律法规汇编', '湖北省电力规划研究中心', null, null, '8.00000', null, null, null, null, null, null, null, null, null, null, null, null, '2018年1月 第一周', '', '2018-01-11', null, '04', '市场部', 'Zhangf', '张帆', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-12 14:41:35', null, null, '0');
INSERT INTO `tbop07` VALUES ('34638120-a4a4-4307-ac74-fdbba20dcc84', 'AY', 'OP01', null, '1', '2018', null, null, null, null, 'A', '安全业务', 'A05', '安全管家', 'A0503', '安全工程', '', '', 'XSH00000424', null, null, '孝感大悟墨关风电场220kV送出工程水土保持方案报告书', '中广核湖北大悟风力发电有限公司', null, null, '6.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-12', null, '02', '环境事业部', 'Huoj', '霍俊', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 23:28:49', 'liuwl', '2018-01-15 23:33:08', '0');
INSERT INTO `tbop07` VALUES ('359cab6e-f449-4910-9316-5dc7a13b8f19', 'AY', 'OP01', null, '1', '2018', null, null, null, null, 'B', '环保业务', 'B06', '土地复垦、发展诊断', 'B0601', '电网土地复垦', '', '', 'XSH00000423', null, null, '湖北省电力装备有限公司2017年度安全生产标准化“回头看”专项检查', '湖北省电力装备有限公司', null, null, '2.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-09', null, '01', '安全事业部', 'Duanwb', '段伟博', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 23:28:49', 'liuwl', '2018-01-15 23:33:08', '0');
INSERT INTO `tbop07` VALUES ('3cdd2f20-69cb-40a1-a7d4-255e187362d5', 'AY', 'OP01', null, '1', '2018', null, null, null, null, 'A', '安全业务', 'A05', '安全管家', 'A0502', '省外安全管家业务', '', '', 'XSH00000418', null, null, '湖北华电江陵发电有限公司一期2*660MW工程职业病危害控制效果评价项目', '湖北华电江陵发电有限公司', null, null, '10.80000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2017-12-29', null, '01', '安全事业部', 'Zhangf', '张帆', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-16 09:23:56', 'liuwl', '2018-01-16 09:24:56', '0');
INSERT INTO `tbop07` VALUES ('458c9f62-5029-40b7-83e8-1787516d3e9d', 'AY', 'OP01', null, '1', '2018', null, null, null, null, 'A', '安全业务', 'A04', '应急产业', 'A0401', '湖北电网', '', '', 'XSH00000420', null, null, '湖北竹溪丰溪风电场项目安全预评价', '竹溪洁源新能源有限公司', null, null, '10.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-02', null, '01', '安全事业部', 'Huoj', '霍俊', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-16 09:23:56', 'liuwl', '2018-01-16 09:24:56', '0');
INSERT INTO `tbop07` VALUES ('4c427e38-120f-4a74-9a24-a3c20a422b8f', 'AY', 'OP02', null, null, '2018', '1', null, null, null, null, null, null, null, null, null, null, null, null, 'QT2571', null, '鄂州电厂风险分级管控、隐患排查治理咨询', '湖北能源集团鄂州发电有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-12-29 15:34', null, '01', '安全事业部', 'zhengwj', '郑文君', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 11:50:36', null, null, '0');
INSERT INTO `tbop07` VALUES ('4cc70401-cb61-470f-a3ac-385155a6af6d', 'AY', 'OP03', null, null, '2018', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'KPS00000312', '荆州旺能环保能源有限公司“扩建三号炉及改造现有锅炉”工程项目职业病危害预评价', '荆州旺能环保能源有限公司', null, null, '7.50000', null, null, null, null, null, null, null, null, null, null, null, null, '2018年2月 第五周', '', '2017-12-26', null, '013', '安全技术咨询中心', 'Tongt', '童涛', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 12:04:40', null, null, '0');
INSERT INTO `tbop07` VALUES ('52e34da9-f831-4140-8045-f946f00ff77e', 'AY', 'OP01', null, '1', '2018', null, null, null, null, 'A', '安全业务', 'A05', '安全管家', 'A0503', '安全工程', '', '', 'XSH00000422', null, null, '江西省电力设备总厂2017年度安全生产标准化“回头看”专项检查', '江西省电力设备总厂', null, null, '2.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-1-9', null, '01', '安全事业部', 'Zhangf', '张帆', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 23:28:49', 'liuwl', '2018-01-15 23:33:08', '0');
INSERT INTO `tbop07` VALUES ('65a72416-41b1-43a0-b8e1-1acfe95d7df8', 'AY', 'OP02', null, null, '2018', '1', null, null, null, null, null, null, null, null, null, null, null, null, 'QT2581', null, '中国水利水电第六工程局有限公司2017年度安全生产标准化“回头看”专项检查', '中国水利水电第六工程局有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-04 12:34', null, '01', '安全事业部', 'zhengwj', '郑文君', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 11:23:48', null, null, '0');
INSERT INTO `tbop07` VALUES ('85ed7cee-ec7e-4d8a-957b-f60e8f49293b', 'AY', 'OP02', null, null, '2018', '1', null, null, null, null, null, null, null, null, null, null, null, null, 'ZG0011', null, '湖北华电江陵发电有限公司一期2*660MW工程职业病危害控制效果评价项目', '湖北华电江陵发电有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-12-29 15:30', null, '01', '安全事业部', 'zhengwj', '郑文君', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 11:50:36', null, null, '0');
INSERT INTO `tbop07` VALUES ('88caed25-1525-4bac-83a7-fdaa52435f6f', 'AY', 'OP02', null, null, '2018', '1', null, null, null, null, null, null, null, null, null, null, null, null, 'AY2621', null, '湖北竹溪丰溪风电场项目安全预评价', '竹溪洁源新能源有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2018-01-08 10:20', null, '01', '安全事业部', 'zhengwj', '郑文君', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-12 14:42:05', null, null, '0');
INSERT INTO `tbop07` VALUES ('953976af-4996-41e5-a7f4-7e086cfcf50a', 'AY', 'OP02', null, null, '2018', '1', null, null, null, null, null, null, null, null, null, null, null, null, 'HPJ0251', null, '荆州弥市110kV输变电工程后评价', '国网湖北省电力公司荆州供电公司', null, null, '7.13500', '14.27000', '50.00000', null, null, null, null, null, null, null, null, null, null, null, null, '2017-11-20 10:05', null, '02', '环境事业部', 'Zhuhw', '朱红卫', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-16 09:55:28', null, null, '0');
INSERT INTO `tbop07` VALUES ('ab312e5d-ef64-4edb-93c2-ff74208432e1', 'AY', 'OP01', null, '1', '2018', null, null, null, null, 'B', '环保业务', 'B06', '土地复垦、发展诊断', 'B0601', '电网土地复垦', '', '', 'XSH00000425', null, null, '核动力运行研究所长城科技园区服务中心综合楼建设项目职业卫生“三同时”', '核动力运行研究所', null, null, '9.00000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-15', null, '01', '安全事业部', 'Zhangf', '张帆', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 23:28:49', 'liuwl', '2018-01-15 23:33:08', '0');
INSERT INTO `tbop07` VALUES ('ab8834df-c4f0-4a57-abd8-c03d19e25a7b', 'AY', 'OP02', null, null, '2018', '1', null, null, null, null, null, null, null, null, null, null, null, null, 'AY2601', null, '国电长源广水风电有限公司吉阳山风电项目安全预评价', '国电长源广水风电有限公司', null, null, '2.00000', '20.00000', '10.00000', null, null, null, null, null, null, null, null, null, null, null, null, '2017-12-12 14:17', null, '01', '安全事业部', 'zhengwj', '郑文君', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-15 11:53:32', null, null, '0');
INSERT INTO `tbop07` VALUES ('dd0ad930-e5fc-407b-a9f0-66eb8e3f0263', 'AY', 'OP01', null, '2', '2018', null, null, null, null, 'B', '环保业务', 'B04', '后评价', 'B0402', '新能源后评价', '', '', 'XSH00000419', null, null, '中国水利水电第六工程局有限公司2017年度安全生产标准化“回头看”专项检查', '中国水利水电第六工程局有限公司', null, null, '5.70000', null, null, null, null, null, null, null, null, null, null, null, null, '', '', '2018-01-02', null, '01', '安全事业部', 'Zhangf', '张帆', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-16 09:23:56', 'liuwl', '2018-01-16 09:24:56', '0');
INSERT INTO `tbop07` VALUES ('f2e363cb-c668-44dd-8a99-3f88a3da96c9', 'AY', 'OP02', null, null, '2018', '1', null, null, null, null, null, null, null, null, null, null, null, null, 'SF3581', null, '汉十铁路孝感烟店牵引站220千伏外部供电工程水土保持方案', '国网湖北省电力公司孝感供电公司', null, null, '0.50000', '5.00000', '10.00000', null, null, null, null, null, null, null, null, null, null, null, null, '2017-12-27 09:44', null, '02', '环境事业部', 'zhengwj', '郑文君', '', '', '', '', '', '', '', '', null, 'admin', '2018-01-15 10:26:38', null, null, '0');
INSERT INTO `tbop07` VALUES ('f5d7aadd-4706-44d4-874e-212ec18596c7', 'AY', 'OP03', null, null, '2018', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'KPS00000323', '江西省电力设备总厂2017年度安全生产标准化“回头看”专项检查', '江西省电力设备总厂', null, null, '2.00000', null, null, null, null, null, null, null, null, null, null, null, null, '2018年1月 第四周', '', '2018-01-10', null, '013', '安全技术咨询中心', 'zhoud', '周栋', '', '', '', '', '', '', '', '', null, 'liuwl', '2018-01-12 14:41:35', null, null, '0');

-- ----------------------------
-- Table structure for uflo_blob
-- ----------------------------
DROP TABLE IF EXISTS `uflo_blob`;
CREATE TABLE `uflo_blob` (
  `ID_` bigint(20) NOT NULL,
  `BLOB_VALUE_` longblob,
  `NAME_` varchar(60) DEFAULT NULL,
  `PROCESS_ID_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_blob
-- ----------------------------
INSERT INTO `uflo_blob` VALUES ('18102', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C75666C6F2D70726F63657373206E616D653D224E4A48485A22206B65793D22E6B187E680BBE5AEA1E6A0B8E6B581E7A88B223E0D0A2020203C737461727420673D2231352C38352C38302C353822206E616D653D22E8A18CE694BFE6B187E680BB222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763034312E64223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D222D352C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020203C2F73746172743E0D0A2020203C656E6420673D223531332C38352C38302C353522207465726D696E6174653D227472756522206E616D653D22E7BB93E69D9F222F3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223136372C37382C3130372C36332220616C6C6F772D737065636966792D61737369676E65653D227472756522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E6B187E680BBE5AEA1E6A0B8222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763034312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E983A8E997A8E5AEA1E6A0B8223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E9AB98E7AEA1E5AEA1E6A0B82220673D222D32392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E8A18CE694BFE6B187E680BB2220673D223139362C34323B3133332C34303B36342C34323A2D34312C2D323222206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E8A18CE694BFE6B187E680BB222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E9AB98E7AEA1E5AEA1E6A0B8222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223333352C37392C3130362C36302220616C6C6F772D737065636966792D61737369676E65653D227472756522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E6B187E680BBE5AEA1E6A0B8222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763034312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E9AB98E7AEA1E5AEA1E6A0B8223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E7BB93E69D9F2220673D222D32392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D223338312C34323B3234312C34313A2D34312C2D323222206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A3C2F75666C6F2D70726F636573733E, 'NJHHZ.uflo.xml', '18101');
INSERT INTO `uflo_blob` VALUES ('18104', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C75666C6F2D70726F63657373206E616D653D224E4A48544222206B65793D22E983A8E997A8E5AEA1E6A0B8E6B581E7A88B223E0D0A2020203C737461727420673D2231382C37392C38302C353422206E616D653D22E5BC80E5A78B223E0D0A2020202020203C6465736372697074696F6E2F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5A1ABE68AA5222F3E0D0A2020203C2F73746172743E0D0A2020203C656E6420673D223632392C37372C38302C353822207465726D696E6174653D227472756522206E616D653D22E7BB93E69D9F222F3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223134312C37372C3131342C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E58F91E5B883E79A84E5A1ABE68AA5E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763034312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E983A8E997A8E5A1ABE68AA5223E0D0A2020202020203C6465736372697074696F6E2F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D222D352C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E696B0E5A29E222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E4BFAEE694B9222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22526561642220636F6D706F6E656E743D22616464222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223239362C37392C3131362C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763034312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E983A8E997A8E5AEA1E6A0B8223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5A1ABE68AA52220673D223333342C34333B3232332C34323A2D34312C2D323222206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E8A18CE694BFE7A1AEE8AEA42220673D222D392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223438362C37372C3130372C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763034312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E8A18CE694BFE7A1AEE8AEA4223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D223531362C35303B3338362C34393A2D31392C2D323122206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E7BB93E69D9F2220673D222D392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A3C2F75666C6F2D70726F636573733E, 'NJHTB.uflo.xml', '18103');
INSERT INTO `uflo_blob` VALUES ('18106', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C75666C6F2D70726F63657373206E616D653D224E4A4854425F435A22206B65793D22E4BAA7E580BCE5B9B4E8AEA1E58892E5A1ABE68AA5223E0D0A2020203C737461727420673D2231382C37392C38302C353422206E616D653D22E5BC80E5A78B223E0D0A2020202020203C6465736372697074696F6E2F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5A1ABE68AA5222F3E0D0A2020203C2F73746172743E0D0A2020203C656E6420673D223834342C36332C38302C353822207465726D696E6174653D227472756522206E616D653D22E7BB93E69D9F222F3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223132342C37372C3131342C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E58F91E5B883E79A84E5A1ABE68AA5E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763034312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E983A8E997A8E5A1ABE68AA5223E0D0A2020202020203C6465736372697074696F6E2F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D222D352C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E696B0E5A29E222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E4BFAEE694B9222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22526561642220636F6D706F6E656E743D22616464222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223235392C37322C3131362C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763034312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E983A8E997A8E5AEA1E6A0B8223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5A1ABE68AA52220673D223239372C33383B3139362C33393A2D34312C2D323222206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E5B882E59CBAE983A82220673D222D392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223730322C36342C3130372C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763034312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E8A18CE694BFE7A1AEE8AEA4223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E7BB93E69D9F2220673D222D392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E5B882E59CBAE983A8E5AEA1E6A0B82220673D223732332C32393B3634312C32393A2D31392C2D323122206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223431312C37332C3131352C35302220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763034312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E5B882E59CBAE983A8223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E5B882E59CBAE983A8E5AEA1E6A0B82220673D222D31382C2D323522206E616D653D22E5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D223433322C33383B3335382C33393A2D31382C2D323022206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223535382C36392C3131352C35302220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763034312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E5B882E59CBAE983A8E5AEA1E6A0B8223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E8A18CE694BFE7A1AEE8AEA42220673D222D31372C2D323622206E616D653D22E5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E5B882E59CBAE983A82220673D223536372C34303B3530322C34313A2D31392C2D323122206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A3C2F75666C6F2D70726F636573733E, 'NJHTB_CZ.uflo.xml', '18105');
INSERT INTO `uflo_blob` VALUES ('18108', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C75666C6F2D70726F63657373206E616D653D226F705765656B22206B65793D22E591A8E8AEA1E58892E5AEA1E6A0B8E6B581E7A88B223E0D0A2020203C737461727420673D2231352C38352C38302C353822206E616D653D22E8A18CE694BFE58F91E5B883222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763036312E64223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E4BBBBE58AA1E5A1ABE68AA5222F3E0D0A2020203C2F73746172743E0D0A2020203C656E6420673D223438362C38312C38302C353522207465726D696E6174653D227472756522206E616D653D22E7BB93E69D9F222F3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223133312C37392C3130372C36332220616C6C6F772D737065636966792D61737369676E65653D227472756522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E4B88BE58F91E79A84E591A8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763036312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E4BBBBE58AA1E5A1ABE68AA5223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D222D32392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E8A18CE694BFE6B187E680BB222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E9AB98E7AEA1E5AEA1E6A0B8222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223331342C38302C3130362C36302220616C6C6F772D737065636966792D61737369676E65653D227472756522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E591A8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763036312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E983A8E997A8E5AEA1E6A0B8223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E7BB93E69D9F2220673D222D32392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E4BBBBE58AA1E5A1ABE68AA52220673D223331392C34323B3234312C34313A2D34312C2D323222206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A3C2F75666C6F2D70726F636573733E, 'opWeek.uflo.xml', '18107');
INSERT INTO `uflo_blob` VALUES ('18110', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C75666C6F2D70726F63657373206E616D653D22594A48485A22206B65793D22E69C88E8AEA1E58892E6B187E680BBE5AEA1E6A0B8E6B581E7A88B223E0D0A2020203C737461727420673D2231362C38362C38302C353822206E616D653D22E5BC80E5A78B222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763035312E64223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B8222F3E0D0A2020203C2F73746172743E0D0A2020203C656E6420673D223534302C38362C38302C353522207465726D696E6174653D227472756522206E616D653D22E7BB93E69D9F222F3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223136362C38322C3130372C36332220616C6C6F772D737065636966792D61737369676E65653D227472756522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E6B187E680BBE5AEA1E6A0B8222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763035312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E983A8E997A8E5AEA1E6A0B8223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E9AB98E7AEA1E5AEA1E6A0B82220673D222D32392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E5BC80E5A78B2220673D223139342C34303B36362C34313A2D34312C2D323222206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E8A18CE694BFE6B187E680BB222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E9AB98E7AEA1E5AEA1E6A0B8222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223334392C38352C3130362C36302220616C6C6F772D737065636966792D61737369676E65653D227472756522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E6B187E680BBE5AEA1E6A0B8222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763035312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E9AB98E7AEA1E5AEA1E6A0B8223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E7BB93E69D9F2220673D222D32392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D223338332C34353B3235372C34373A2D34312C2D323222206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A3C2F75666C6F2D70726F636573733E, 'YJHHZ.uflo.xml', '18109');
INSERT INTO `uflo_blob` VALUES ('18112', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C75666C6F2D70726F63657373206E616D653D22594A48544222206B65793D22E69C88E8AEA1E58892E5A1ABE68AA5E6B581E7A88B223E0D0A2020203C737461727420673D2231382C37392C38302C353422206E616D653D22E5BC80E5A78B223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5A1ABE68AA5222F3E0D0A2020203C2F73746172743E0D0A2020203C656E6420673D223632392C37372C38302C353822207465726D696E6174653D227472756522206E616D653D22E7BB93E69D9F222F3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223134312C37372C3131342C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E58F91E5B883E79A84E5A1ABE68AA5E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763035312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E983A8E997A8E5A1ABE68AA5223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D222D352C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E696B0E5A29E222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E4BFAEE694B9222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22526561642220636F6D706F6E656E743D22616464222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223239362C37392C3131362C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763035312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E983A8E997A8E5AEA1E6A0B8223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5A1ABE68AA52220673D223333342C34333B3232332C34323A2D34312C2D323222206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E8A18CE694BFE7A1AEE8AEA42220673D222D392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223438362C37372C3130372C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763035312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E8A18CE694BFE7A1AEE8AEA4223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D223531362C35303B3338362C34393A2D31392C2D323122206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E7BB93E69D9F2220673D222D392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A3C2F75666C6F2D70726F636573733E, 'YJHTB.uflo.xml', '18111');
INSERT INTO `uflo_blob` VALUES ('18114', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C75666C6F2D70726F63657373206E616D653D22594A4854425F435A22206B65793D22E4BAA7E580BCE69C88E8AEA1E58892E5A1ABE68AA5E6B581E7A88B223E0D0A2020203C737461727420673D2231382C37392C38302C353422206E616D653D22E5BC80E5A78B223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5A1ABE68AA5222F3E0D0A2020203C2F73746172743E0D0A2020203C656E6420673D223835372C38322C38302C353822207465726D696E6174653D227472756522206E616D653D22E7BB93E69D9F222F3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223132322C37372C3131342C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E58F91E5B883E79A84E5A1ABE68AA5E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763035312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E983A8E997A8E5A1ABE68AA5223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D222D352C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E696B0E5A29E222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22486964652220636F6D706F6E656E743D22E4BFAEE694B9222F3E0D0A2020202020203C636F6D706F6E656E742D617574686F7269747920617574686F726974793D22526561642220636F6D706F6E656E743D22616464222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223237332C37392C3131362C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763035312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E983A8E997A8E5AEA1E6A0B8223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5A1ABE68AA52220673D223333342C34333B3232332C34323A2D34312C2D323222206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E5B882E59CBAE983A82220673D222D31352C313822206E616D653D22E5908CE6848F222F3E0D0A2020203C2F7461736B3E0D0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223732322C37362C3130372C35352220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763035312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E8A18CE694BFE7A1AEE8AEA4223E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E7BB93E69D9F2220673D222D392C2D323222206E616D653D22E5908CE6848F222F3E0D0A2020202020203C73657175656E63652D666C6F7720746F3D22E5B882E59CBAE983A8E5AEA1E6A0B82220673D223734352C34343B3637342C34333A2D31392C2D323122206E616D653D22E4B88DE5908CE6848F222F3E0D0A2020203C2F7461736B3E0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223432312C38332C3131352C35302220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763035312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E5B882E59CBAE983A8223E0A2020202020203C73657175656E63652D666C6F7720746F3D22E5B882E59CBAE983A8E5AEA1E6A0B82220673D222D31312C2D313922206E616D653D22E5908CE6848F222F3E0A2020202020203C73657175656E63652D666C6F7720746F3D22E983A8E997A8E5AEA1E6A0B82220673D223437302C34333B3337362C34353A2D36392C2D323222206E616D653D22E4B88DE5908CE6848F222F3E0A2020203C2F7461736B3E0A2020203C7461736B2065787072657373696F6E3D22247B757365727D2220673D223537332C38362C3131352C35302220616C6C6F772D737065636966792D61737369676E65653D2266616C736522207461736B2D747970653D224E6F726D616C22207461736B2D6E616D653D22E38090247B66726F6D557365727DE38091E68F90E4BAA4E79A84E5AEA1E6A0B8E4BBBBE58AA1222075726C3D22636F6D2E6A67687A2E6F702E766965772E6F706A763035312E64222061737369676E6D656E742D747970653D2245787072657373696F6E22206E616D653D22E5B882E59CBAE983A8E5AEA1E6A0B8223E0A2020202020203C73657175656E63652D666C6F7720746F3D22E8A18CE694BFE7A1AEE8AEA42220673D222D31392C2D323022206E616D653D22E5908CE6848F222F3E0A2020202020203C73657175656E63652D666C6F7720746F3D22E5B882E59CBAE983A82220673D223630352C34333B3533342C34343A2D35372C2D323222206E616D653D22E4B88DE5908CE6848F222F3E0A2020203C2F7461736B3E0D0A3C2F75666C6F2D70726F636573733E, 'YJHTB_CZ.uflo.xml', '18113');

-- ----------------------------
-- Table structure for uflo_calendar
-- ----------------------------
DROP TABLE IF EXISTS `uflo_calendar`;
CREATE TABLE `uflo_calendar` (
  `ID_` bigint(20) NOT NULL,
  `CATEGORY_ID_` varchar(60) DEFAULT NULL,
  `DESC_` varchar(120) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  `TYPE_` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_calendar
-- ----------------------------

-- ----------------------------
-- Table structure for uflo_calendar_date
-- ----------------------------
DROP TABLE IF EXISTS `uflo_calendar_date`;
CREATE TABLE `uflo_calendar_date` (
  `ID_` bigint(20) NOT NULL,
  `CALENDAR_DATE_` datetime DEFAULT NULL,
  `CALENDAR_ID_` bigint(20) DEFAULT NULL,
  `DAY_OF_MONTH_` int(11) DEFAULT NULL,
  `DAY_OF_WEEK_` int(11) DEFAULT NULL,
  `MONTH_OF_YEAR_` int(11) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  `RANGE_END_TIME_` varchar(60) DEFAULT NULL,
  `RANGE_START_TIME_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_calendar_date
-- ----------------------------

-- ----------------------------
-- Table structure for uflo_context_property
-- ----------------------------
DROP TABLE IF EXISTS `uflo_context_property`;
CREATE TABLE `uflo_context_property` (
  `KEY_` varchar(120) NOT NULL,
  `VALUE_` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_context_property
-- ----------------------------
INSERT INTO `uflo_context_property` VALUES ('dbid', '20000');

-- ----------------------------
-- Table structure for uflo_his_activity
-- ----------------------------
DROP TABLE IF EXISTS `uflo_his_activity`;
CREATE TABLE `uflo_his_activity` (
  `ID_` bigint(20) NOT NULL,
  `DESCRIPTION_` varchar(120) DEFAULT NULL,
  `NODE_NAME_` varchar(60) DEFAULT NULL,
  `PROCESS_ID_` bigint(20) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `END_DATE_` datetime DEFAULT NULL,
  `HIS_PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `LEAVE_FLOW_NAME_` varchar(60) DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `ROOT_PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_his_activity
-- ----------------------------
INSERT INTO `uflo_his_activity` VALUES ('18205', null, '开始', '18113', '2018-01-15 18:08:27', '2018-01-15 18:08:27', '18202', null, '18201', '18201');
INSERT INTO `uflo_his_activity` VALUES ('18208', null, '部门填报', '18113', '2018-01-15 18:08:27', '2018-01-15 18:09:41', '18202', '同意', '18201', '18201');
INSERT INTO `uflo_his_activity` VALUES ('18213', null, '部门审核', '18113', '2018-01-15 18:09:41', '2018-01-15 18:10:19', '18202', '同意', '18201', '18201');
INSERT INTO `uflo_his_activity` VALUES ('18218', null, '市场部', '18113', '2018-01-15 18:10:19', '2018-01-15 18:10:33', '18202', '同意', '18201', '18201');
INSERT INTO `uflo_his_activity` VALUES ('18223', null, '市场部审核', '18113', '2018-01-15 18:10:33', '2018-01-15 18:10:42', '18202', '同意', '18201', '18201');
INSERT INTO `uflo_his_activity` VALUES ('18228', null, '行政确认', '18113', '2018-01-15 18:10:42', null, '18202', null, '18201', '18201');
INSERT INTO `uflo_his_activity` VALUES ('18234', '', '开始', '18103', '2018-01-15 21:31:38', '2018-01-15 21:31:38', '18231', null, '18230', '18230');
INSERT INTO `uflo_his_activity` VALUES ('18237', '', '部门填报', '18103', '2018-01-15 21:31:38', '2018-01-15 21:41:27', '18231', '同意', '18230', '18230');
INSERT INTO `uflo_his_activity` VALUES ('18242', null, '部门审核', '18103', '2018-01-15 21:41:27', '2018-01-15 22:00:28', '18231', '同意', '18230', '18230');
INSERT INTO `uflo_his_activity` VALUES ('18247', null, '行政确认', '18103', '2018-01-15 22:00:28', '2018-01-15 22:23:33', '18231', '同意', '18230', '18230');
INSERT INTO `uflo_his_activity` VALUES ('18253', null, '行政发布', '18107', '2018-01-16 00:34:17', '2018-01-16 00:34:17', '18250', null, '18249', '18249');
INSERT INTO `uflo_his_activity` VALUES ('18256', null, '任务填报', '18107', '2018-01-16 00:34:18', null, '18250', null, '18249', '18249');
INSERT INTO `uflo_his_activity` VALUES ('18262', null, '行政发布', '18107', '2018-01-16 00:34:18', '2018-01-16 00:34:18', '18259', null, '18258', '18258');
INSERT INTO `uflo_his_activity` VALUES ('18265', null, '任务填报', '18107', '2018-01-16 00:34:18', null, '18259', null, '18258', '18258');
INSERT INTO `uflo_his_activity` VALUES ('18271', null, '行政发布', '18107', '2018-01-16 00:34:18', '2018-01-16 00:34:18', '18268', null, '18267', '18267');
INSERT INTO `uflo_his_activity` VALUES ('18274', null, '任务填报', '18107', '2018-01-16 00:34:18', null, '18268', null, '18267', '18267');
INSERT INTO `uflo_his_activity` VALUES ('18280', null, '行政发布', '18107', '2018-01-16 00:34:18', '2018-01-16 00:34:18', '18277', null, '18276', '18276');
INSERT INTO `uflo_his_activity` VALUES ('18283', null, '任务填报', '18107', '2018-01-16 00:34:18', null, '18277', null, '18276', '18276');
INSERT INTO `uflo_his_activity` VALUES ('18289', null, '行政发布', '18107', '2018-01-16 00:34:18', '2018-01-16 00:34:18', '18286', null, '18285', '18285');
INSERT INTO `uflo_his_activity` VALUES ('18292', null, '任务填报', '18107', '2018-01-16 00:34:18', null, '18286', null, '18285', '18285');
INSERT INTO `uflo_his_activity` VALUES ('18298', null, '行政发布', '18107', '2018-01-16 00:34:18', '2018-01-16 00:34:18', '18295', null, '18294', '18294');
INSERT INTO `uflo_his_activity` VALUES ('18304', null, '结束', '18103', '2018-01-15 22:23:33', '2018-01-15 22:23:34', '18231', null, '18230', '18230');
INSERT INTO `uflo_his_activity` VALUES ('18309', null, '行政汇总', '18101', '2018-01-15 22:36:34', '2018-01-15 22:36:35', '18306', '同意', '18305', '18305');
INSERT INTO `uflo_his_activity` VALUES ('18312', null, '部门审核', '18101', '2018-01-15 22:36:35', '2018-01-15 22:49:20', '18306', '同意', '18305', '18305');
INSERT INTO `uflo_his_activity` VALUES ('18317', null, '高管审核', '18101', '2018-01-15 22:49:20', '2018-01-15 22:57:44', '18306', '同意', '18305', '18305');
INSERT INTO `uflo_his_activity` VALUES ('18322', null, '结束', '18101', '2018-01-15 22:57:44', '2018-01-15 22:57:44', '18306', null, '18305', '18305');
INSERT INTO `uflo_his_activity` VALUES ('18327', null, '开始', '18111', '2018-01-15 23:12:20', '2018-01-15 23:12:20', '18324', null, '18323', '18323');
INSERT INTO `uflo_his_activity` VALUES ('18330', null, '部门填报', '18111', '2018-01-15 23:12:20', '2018-01-15 23:51:30', '18324', '同意', '18323', '18323');
INSERT INTO `uflo_his_activity` VALUES ('18335', null, '部门审核', '18111', '2018-01-15 23:51:30', '2018-01-15 23:59:50', '18324', '同意', '18323', '18323');
INSERT INTO `uflo_his_activity` VALUES ('18340', null, '行政确认', '18111', '2018-01-15 23:59:50', '2018-01-16 00:03:22', '18324', '同意', '18323', '18323');
INSERT INTO `uflo_his_activity` VALUES ('18345', null, '结束', '18111', '2018-01-16 00:03:23', '2018-01-16 00:03:23', '18324', null, '18323', '18323');
INSERT INTO `uflo_his_activity` VALUES ('18350', null, '开始', '18111', '2018-01-16 00:05:56', '2018-01-16 00:05:56', '18347', null, '18346', '18346');
INSERT INTO `uflo_his_activity` VALUES ('18353', null, '部门填报', '18111', '2018-01-16 00:05:56', '2018-01-16 00:06:38', '18347', '同意', '18346', '18346');
INSERT INTO `uflo_his_activity` VALUES ('18358', null, '部门审核', '18111', '2018-01-16 00:06:38', '2018-01-16 00:07:06', '18347', '同意', '18346', '18346');
INSERT INTO `uflo_his_activity` VALUES ('18363', null, '行政确认', '18111', '2018-01-16 00:07:06', '2018-01-16 00:09:03', '18347', '同意', '18346', '18346');
INSERT INTO `uflo_his_activity` VALUES ('18368', null, '结束', '18111', '2018-01-16 00:09:04', '2018-01-16 00:09:04', '18347', null, '18346', '18346');
INSERT INTO `uflo_his_activity` VALUES ('18401', null, '任务填报', '18107', '2018-01-16 00:34:18', null, '18295', null, '18294', '18294');
INSERT INTO `uflo_his_activity` VALUES ('18407', null, '行政发布', '18107', '2018-01-16 00:34:19', '2018-01-16 00:34:19', '18404', null, '18403', '18403');
INSERT INTO `uflo_his_activity` VALUES ('18410', null, '任务填报', '18107', '2018-01-16 00:34:19', null, '18404', null, '18403', '18403');
INSERT INTO `uflo_his_activity` VALUES ('18416', null, '行政发布', '18107', '2018-01-16 00:34:19', '2018-01-16 00:34:19', '18413', null, '18412', '18412');
INSERT INTO `uflo_his_activity` VALUES ('18419', null, '任务填报', '18107', '2018-01-16 00:34:19', null, '18413', null, '18412', '18412');
INSERT INTO `uflo_his_activity` VALUES ('18425', null, '行政发布', '18107', '2018-01-16 00:34:19', '2018-01-16 00:34:19', '18422', null, '18421', '18421');
INSERT INTO `uflo_his_activity` VALUES ('18428', null, '任务填报', '18107', '2018-01-16 00:34:19', null, '18422', null, '18421', '18421');
INSERT INTO `uflo_his_activity` VALUES ('18434', null, '行政发布', '18107', '2018-01-16 00:34:19', '2018-01-16 00:34:19', '18431', null, '18430', '18430');
INSERT INTO `uflo_his_activity` VALUES ('18437', null, '任务填报', '18107', '2018-01-16 00:34:19', '2018-01-16 00:45:00', '18431', '同意', '18430', '18430');
INSERT INTO `uflo_his_activity` VALUES ('18443', null, '行政发布', '18107', '2018-01-16 00:34:19', '2018-01-16 00:34:19', '18440', null, '18439', '18439');
INSERT INTO `uflo_his_activity` VALUES ('18446', null, '任务填报', '18107', '2018-01-16 00:34:19', null, '18440', null, '18439', '18439');
INSERT INTO `uflo_his_activity` VALUES ('18452', null, '行政发布', '18107', '2018-01-16 00:34:19', '2018-01-16 00:34:19', '18449', null, '18448', '18448');
INSERT INTO `uflo_his_activity` VALUES ('18455', null, '任务填报', '18107', '2018-01-16 00:34:19', null, '18449', null, '18448', '18448');
INSERT INTO `uflo_his_activity` VALUES ('18461', null, '行政发布', '18107', '2018-01-16 00:37:47', '2018-01-16 00:37:47', '18458', null, '18457', '18457');
INSERT INTO `uflo_his_activity` VALUES ('18464', null, '任务填报', '18107', '2018-01-16 00:37:48', null, '18458', null, '18457', '18457');
INSERT INTO `uflo_his_activity` VALUES ('18470', null, '行政发布', '18107', '2018-01-16 00:37:48', '2018-01-16 00:37:48', '18467', null, '18466', '18466');
INSERT INTO `uflo_his_activity` VALUES ('18473', null, '任务填报', '18107', '2018-01-16 00:37:48', null, '18467', null, '18466', '18466');
INSERT INTO `uflo_his_activity` VALUES ('18479', null, '行政发布', '18107', '2018-01-16 00:37:48', '2018-01-16 00:37:48', '18476', null, '18475', '18475');
INSERT INTO `uflo_his_activity` VALUES ('18482', null, '任务填报', '18107', '2018-01-16 00:37:48', null, '18476', null, '18475', '18475');
INSERT INTO `uflo_his_activity` VALUES ('18488', null, '行政发布', '18107', '2018-01-16 00:37:48', '2018-01-16 00:37:48', '18485', null, '18484', '18484');
INSERT INTO `uflo_his_activity` VALUES ('18491', null, '任务填报', '18107', '2018-01-16 00:37:48', null, '18485', null, '18484', '18484');
INSERT INTO `uflo_his_activity` VALUES ('18497', null, '行政发布', '18107', '2018-01-16 00:37:48', '2018-01-16 00:37:48', '18494', null, '18493', '18493');
INSERT INTO `uflo_his_activity` VALUES ('18500', null, '任务填报', '18107', '2018-01-16 00:37:48', null, '18494', null, '18493', '18493');
INSERT INTO `uflo_his_activity` VALUES ('18506', null, '行政发布', '18107', '2018-01-16 00:37:48', '2018-01-16 00:37:48', '18503', null, '18502', '18502');
INSERT INTO `uflo_his_activity` VALUES ('18509', null, '任务填报', '18107', '2018-01-16 00:37:48', null, '18503', null, '18502', '18502');
INSERT INTO `uflo_his_activity` VALUES ('18515', null, '行政发布', '18107', '2018-01-16 00:37:48', '2018-01-16 00:37:49', '18512', null, '18511', '18511');
INSERT INTO `uflo_his_activity` VALUES ('18518', null, '任务填报', '18107', '2018-01-16 00:37:49', null, '18512', null, '18511', '18511');
INSERT INTO `uflo_his_activity` VALUES ('18524', null, '行政发布', '18107', '2018-01-16 00:37:49', '2018-01-16 00:37:49', '18521', null, '18520', '18520');
INSERT INTO `uflo_his_activity` VALUES ('18527', null, '任务填报', '18107', '2018-01-16 00:37:49', null, '18521', null, '18520', '18520');
INSERT INTO `uflo_his_activity` VALUES ('18533', null, '行政发布', '18107', '2018-01-16 00:37:49', '2018-01-16 00:37:49', '18530', null, '18529', '18529');
INSERT INTO `uflo_his_activity` VALUES ('18536', null, '任务填报', '18107', '2018-01-16 00:37:49', null, '18530', null, '18529', '18529');
INSERT INTO `uflo_his_activity` VALUES ('18542', null, '行政发布', '18107', '2018-01-16 00:37:49', '2018-01-16 00:37:49', '18539', null, '18538', '18538');
INSERT INTO `uflo_his_activity` VALUES ('18545', null, '任务填报', '18107', '2018-01-16 00:37:49', '2018-01-16 00:41:47', '18539', '同意', '18538', '18538');
INSERT INTO `uflo_his_activity` VALUES ('18551', null, '行政发布', '18107', '2018-01-16 00:37:49', '2018-01-16 00:37:49', '18548', null, '18547', '18547');
INSERT INTO `uflo_his_activity` VALUES ('18554', null, '任务填报', '18107', '2018-01-16 00:37:49', null, '18548', null, '18547', '18547');
INSERT INTO `uflo_his_activity` VALUES ('18560', null, '行政发布', '18107', '2018-01-16 00:37:49', '2018-01-16 00:37:49', '18557', null, '18556', '18556');
INSERT INTO `uflo_his_activity` VALUES ('18563', null, '任务填报', '18107', '2018-01-16 00:37:49', null, '18557', null, '18556', '18556');
INSERT INTO `uflo_his_activity` VALUES ('18568', null, '部门审核', '18107', '2018-01-16 00:41:47', '2018-01-16 00:48:37', '18539', '同意', '18538', '18538');
INSERT INTO `uflo_his_activity` VALUES ('18573', null, '部门审核', '18107', '2018-01-16 00:45:00', null, '18431', null, '18430', '18430');
INSERT INTO `uflo_his_activity` VALUES ('18578', null, '结束', '18107', '2018-01-16 00:48:37', '2018-01-16 00:48:37', '18539', null, '18538', '18538');
INSERT INTO `uflo_his_activity` VALUES ('18583', null, '行政发布', '18107', '2018-01-16 08:56:39', '2018-01-16 08:56:39', '18580', null, '18579', '18579');
INSERT INTO `uflo_his_activity` VALUES ('18586', null, '任务填报', '18107', '2018-01-16 08:56:39', null, '18580', null, '18579', '18579');
INSERT INTO `uflo_his_activity` VALUES ('18592', null, '行政发布', '18107', '2018-01-16 08:56:39', '2018-01-16 08:56:39', '18589', null, '18588', '18588');
INSERT INTO `uflo_his_activity` VALUES ('18595', null, '任务填报', '18107', '2018-01-16 08:56:39', null, '18589', null, '18588', '18588');
INSERT INTO `uflo_his_activity` VALUES ('18601', null, '行政发布', '18107', '2018-01-16 08:56:39', '2018-01-16 08:56:39', '18598', null, '18597', '18597');
INSERT INTO `uflo_his_activity` VALUES ('18604', null, '任务填报', '18107', '2018-01-16 08:56:39', null, '18598', null, '18597', '18597');
INSERT INTO `uflo_his_activity` VALUES ('18610', null, '行政发布', '18107', '2018-01-16 08:56:39', '2018-01-16 08:56:39', '18607', null, '18606', '18606');
INSERT INTO `uflo_his_activity` VALUES ('18613', null, '任务填报', '18107', '2018-01-16 08:56:39', null, '18607', null, '18606', '18606');
INSERT INTO `uflo_his_activity` VALUES ('18619', null, '行政发布', '18107', '2018-01-16 08:56:40', '2018-01-16 08:56:40', '18616', null, '18615', '18615');
INSERT INTO `uflo_his_activity` VALUES ('18622', null, '任务填报', '18107', '2018-01-16 08:56:40', null, '18616', null, '18615', '18615');
INSERT INTO `uflo_his_activity` VALUES ('18628', null, '行政发布', '18107', '2018-01-16 08:56:40', '2018-01-16 08:56:40', '18625', null, '18624', '18624');
INSERT INTO `uflo_his_activity` VALUES ('18631', null, '任务填报', '18107', '2018-01-16 08:56:40', null, '18625', null, '18624', '18624');
INSERT INTO `uflo_his_activity` VALUES ('18637', null, '行政发布', '18107', '2018-01-16 08:56:40', '2018-01-16 08:56:40', '18634', null, '18633', '18633');
INSERT INTO `uflo_his_activity` VALUES ('18640', null, '任务填报', '18107', '2018-01-16 08:56:40', null, '18634', null, '18633', '18633');
INSERT INTO `uflo_his_activity` VALUES ('18646', null, '行政发布', '18107', '2018-01-16 08:56:40', '2018-01-16 08:56:40', '18643', null, '18642', '18642');
INSERT INTO `uflo_his_activity` VALUES ('18649', null, '任务填报', '18107', '2018-01-16 08:56:40', null, '18643', null, '18642', '18642');
INSERT INTO `uflo_his_activity` VALUES ('18655', null, '行政发布', '18107', '2018-01-16 08:56:40', '2018-01-16 08:56:40', '18652', null, '18651', '18651');
INSERT INTO `uflo_his_activity` VALUES ('18658', null, '任务填报', '18107', '2018-01-16 08:56:40', null, '18652', null, '18651', '18651');
INSERT INTO `uflo_his_activity` VALUES ('18664', null, '行政发布', '18107', '2018-01-16 08:56:40', '2018-01-16 08:56:40', '18661', null, '18660', '18660');
INSERT INTO `uflo_his_activity` VALUES ('18667', null, '任务填报', '18107', '2018-01-16 08:56:40', '2018-01-16 08:57:57', '18661', '同意', '18660', '18660');
INSERT INTO `uflo_his_activity` VALUES ('18673', null, '行政发布', '18107', '2018-01-16 08:56:40', '2018-01-16 08:56:40', '18670', null, '18669', '18669');
INSERT INTO `uflo_his_activity` VALUES ('18676', null, '任务填报', '18107', '2018-01-16 08:56:40', null, '18670', null, '18669', '18669');
INSERT INTO `uflo_his_activity` VALUES ('18682', null, '行政发布', '18107', '2018-01-16 08:56:40', '2018-01-16 08:56:40', '18679', null, '18678', '18678');
INSERT INTO `uflo_his_activity` VALUES ('18685', null, '任务填报', '18107', '2018-01-16 08:56:40', null, '18679', null, '18678', '18678');
INSERT INTO `uflo_his_activity` VALUES ('18690', null, '部门审核', '18107', '2018-01-16 08:57:57', null, '18661', null, '18660', '18660');
INSERT INTO `uflo_his_activity` VALUES ('18696', '', '开始', '18103', '2018-01-16 09:09:17', '2018-01-16 09:09:17', '18693', null, '18692', '18692');
INSERT INTO `uflo_his_activity` VALUES ('18699', '', '部门填报', '18103', '2018-01-16 09:09:17', '2018-01-16 09:12:43', '18693', '同意', '18692', '18692');
INSERT INTO `uflo_his_activity` VALUES ('18704', null, '部门审核', '18103', '2018-01-16 09:12:43', '2018-01-16 09:14:39', '18693', '同意', '18692', '18692');
INSERT INTO `uflo_his_activity` VALUES ('18709', null, '行政确认', '18103', '2018-01-16 09:14:39', '2018-01-16 09:18:27', '18693', '同意', '18692', '18692');
INSERT INTO `uflo_his_activity` VALUES ('18715', null, '行政汇总', '18101', '2018-01-16 09:19:08', '2018-01-16 09:19:08', '18712', '同意', '18711', '18711');
INSERT INTO `uflo_his_activity` VALUES ('18718', null, '部门审核', '18101', '2018-01-16 09:19:08', '2018-01-16 09:20:14', '18712', '同意', '18711', '18711');
INSERT INTO `uflo_his_activity` VALUES ('18723', null, '高管审核', '18101', '2018-01-16 09:20:14', '2018-01-16 09:21:31', '18712', '同意', '18711', '18711');
INSERT INTO `uflo_his_activity` VALUES ('18804', null, '结束', '18103', '2018-01-16 09:18:27', '2018-01-16 09:18:28', '18693', null, '18692', '18692');
INSERT INTO `uflo_his_activity` VALUES ('18808', null, '结束', '18101', '2018-01-16 09:21:34', '2018-01-16 09:21:35', '18712', null, '18711', '18711');
INSERT INTO `uflo_his_activity` VALUES ('18813', null, '开始', '18111', '2018-01-16 09:27:37', '2018-01-16 09:27:38', '18810', null, '18809', '18809');
INSERT INTO `uflo_his_activity` VALUES ('18816', null, '部门填报', '18111', '2018-01-16 09:27:38', '2018-01-16 09:31:14', '18810', '同意', '18809', '18809');
INSERT INTO `uflo_his_activity` VALUES ('18821', null, '部门审核', '18111', '2018-01-16 09:31:15', null, '18810', null, '18809', '18809');
INSERT INTO `uflo_his_activity` VALUES ('18827', '', '开始', '18105', '2018-01-16 09:40:37', '2018-01-16 09:40:38', '18824', null, '18823', '18823');
INSERT INTO `uflo_his_activity` VALUES ('18830', '', '部门填报', '18105', '2018-01-16 09:40:39', null, '18824', null, '18823', '18823');
INSERT INTO `uflo_his_activity` VALUES ('18905', null, '开始', '18109', '2018-01-16 11:56:41', '2018-01-16 11:56:42', '18902', null, '18901', '18901');
INSERT INTO `uflo_his_activity` VALUES ('18908', null, '部门审核', '18109', '2018-01-16 11:56:42', null, '18902', null, '18901', '18901');
INSERT INTO `uflo_his_activity` VALUES ('19005', null, '行政发布', '18107', '2018-01-17 09:24:43', '2018-01-17 09:24:43', '19002', null, '19001', '19001');
INSERT INTO `uflo_his_activity` VALUES ('19008', null, '任务填报', '18107', '2018-01-17 09:24:43', '2018-01-17 09:38:55', '19002', '同意', '19001', '19001');
INSERT INTO `uflo_his_activity` VALUES ('19014', null, '行政发布', '18107', '2018-01-17 09:24:43', '2018-01-17 09:24:43', '19011', null, '19010', '19010');
INSERT INTO `uflo_his_activity` VALUES ('19017', null, '任务填报', '18107', '2018-01-17 09:24:44', null, '19011', null, '19010', '19010');
INSERT INTO `uflo_his_activity` VALUES ('19023', null, '行政发布', '18107', '2018-01-17 09:24:44', '2018-01-17 09:24:44', '19020', null, '19019', '19019');
INSERT INTO `uflo_his_activity` VALUES ('19026', null, '任务填报', '18107', '2018-01-17 09:24:44', '2018-01-17 09:25:50', '19020', '同意', '19019', '19019');
INSERT INTO `uflo_his_activity` VALUES ('19032', null, '行政发布', '18107', '2018-01-17 09:24:44', '2018-01-17 09:24:44', '19029', null, '19028', '19028');
INSERT INTO `uflo_his_activity` VALUES ('19035', null, '任务填报', '18107', '2018-01-17 09:24:44', null, '19029', null, '19028', '19028');
INSERT INTO `uflo_his_activity` VALUES ('19041', null, '行政发布', '18107', '2018-01-17 09:24:44', '2018-01-17 09:24:44', '19038', null, '19037', '19037');
INSERT INTO `uflo_his_activity` VALUES ('19044', null, '任务填报', '18107', '2018-01-17 09:24:44', '2018-01-17 10:30:22', '19038', '同意', '19037', '19037');
INSERT INTO `uflo_his_activity` VALUES ('19050', null, '行政发布', '18107', '2018-01-17 09:24:44', '2018-01-17 09:24:44', '19047', null, '19046', '19046');
INSERT INTO `uflo_his_activity` VALUES ('19053', null, '任务填报', '18107', '2018-01-17 09:24:44', null, '19047', null, '19046', '19046');
INSERT INTO `uflo_his_activity` VALUES ('19059', null, '行政发布', '18107', '2018-01-17 09:24:44', '2018-01-17 09:24:44', '19056', null, '19055', '19055');
INSERT INTO `uflo_his_activity` VALUES ('19062', null, '任务填报', '18107', '2018-01-17 09:24:44', '2018-01-17 09:49:57', '19056', '同意', '19055', '19055');
INSERT INTO `uflo_his_activity` VALUES ('19067', null, '部门审核', '18107', '2018-01-17 09:25:50', '2018-01-17 09:38:46', '19020', '同意', '19019', '19019');
INSERT INTO `uflo_his_activity` VALUES ('19072', null, '结束', '18107', '2018-01-17 09:38:46', '2018-01-17 09:38:46', '19020', null, '19019', '19019');
INSERT INTO `uflo_his_activity` VALUES ('19076', null, '部门审核', '18107', '2018-01-17 09:38:55', '2018-01-17 09:39:02', '19002', '同意', '19001', '19001');
INSERT INTO `uflo_his_activity` VALUES ('19081', null, '结束', '18107', '2018-01-17 09:39:02', '2018-01-17 09:39:02', '19002', null, '19001', '19001');
INSERT INTO `uflo_his_activity` VALUES ('19085', null, '部门审核', '18107', '2018-01-17 09:49:57', '2018-01-18 17:18:52', '19056', '同意', '19055', '19055');
INSERT INTO `uflo_his_activity` VALUES ('19091', null, '行政发布', '18107', '2018-01-17 10:13:37', '2018-01-17 10:13:37', '19088', null, '19087', '19087');
INSERT INTO `uflo_his_activity` VALUES ('19094', null, '任务填报', '18107', '2018-01-17 10:13:37', '2018-01-18 17:18:01', '19088', '同意', '19087', '19087');
INSERT INTO `uflo_his_activity` VALUES ('19100', null, '行政发布', '18107', '2018-01-17 10:13:37', '2018-01-17 10:13:37', '19097', null, '19096', '19096');
INSERT INTO `uflo_his_activity` VALUES ('19103', null, '任务填报', '18107', '2018-01-17 10:13:37', '2018-01-18 09:17:39', '19097', '同意', '19096', '19096');
INSERT INTO `uflo_his_activity` VALUES ('19109', null, '行政发布', '18107', '2018-01-17 10:13:37', '2018-01-17 10:13:37', '19106', null, '19105', '19105');
INSERT INTO `uflo_his_activity` VALUES ('19112', null, '任务填报', '18107', '2018-01-17 10:13:37', '2018-01-18 16:58:33', '19106', '同意', '19105', '19105');
INSERT INTO `uflo_his_activity` VALUES ('19118', null, '行政发布', '18107', '2018-01-17 10:13:37', '2018-01-17 10:13:37', '19115', null, '19114', '19114');
INSERT INTO `uflo_his_activity` VALUES ('19121', null, '任务填报', '18107', '2018-01-17 10:13:37', '2018-01-18 17:11:27', '19115', '同意', '19114', '19114');
INSERT INTO `uflo_his_activity` VALUES ('19127', null, '行政发布', '18107', '2018-01-17 10:13:37', '2018-01-17 10:13:38', '19124', null, '19123', '19123');
INSERT INTO `uflo_his_activity` VALUES ('19130', null, '任务填报', '18107', '2018-01-17 10:13:38', '2018-01-17 23:32:41', '19124', '同意', '19123', '19123');
INSERT INTO `uflo_his_activity` VALUES ('19136', null, '行政发布', '18107', '2018-01-17 10:13:38', '2018-01-17 10:13:38', '19133', null, '19132', '19132');
INSERT INTO `uflo_his_activity` VALUES ('19139', null, '任务填报', '18107', '2018-01-17 10:13:38', '2018-01-17 17:43:40', '19133', '同意', '19132', '19132');
INSERT INTO `uflo_his_activity` VALUES ('19145', null, '行政发布', '18107', '2018-01-17 10:13:38', '2018-01-17 10:13:38', '19142', null, '19141', '19141');
INSERT INTO `uflo_his_activity` VALUES ('19148', null, '任务填报', '18107', '2018-01-17 10:13:38', '2018-01-19 15:14:56', '19142', '同意', '19141', '19141');
INSERT INTO `uflo_his_activity` VALUES ('19154', null, '行政发布', '18107', '2018-01-17 10:13:38', '2018-01-17 10:13:38', '19151', null, '19150', '19150');
INSERT INTO `uflo_his_activity` VALUES ('19157', null, '任务填报', '18107', '2018-01-17 10:13:38', null, '19151', null, '19150', '19150');
INSERT INTO `uflo_his_activity` VALUES ('19163', null, '行政发布', '18107', '2018-01-17 10:13:38', '2018-01-17 10:13:38', '19160', null, '19159', '19159');
INSERT INTO `uflo_his_activity` VALUES ('19166', null, '任务填报', '18107', '2018-01-17 10:13:38', '2018-01-18 09:07:30', '19160', '同意', '19159', '19159');
INSERT INTO `uflo_his_activity` VALUES ('19172', null, '行政发布', '18107', '2018-01-17 10:13:38', '2018-01-17 10:13:38', '19169', null, '19168', '19168');
INSERT INTO `uflo_his_activity` VALUES ('19175', null, '任务填报', '18107', '2018-01-17 10:13:38', '2018-01-17 10:17:57', '19169', '同意', '19168', '19168');
INSERT INTO `uflo_his_activity` VALUES ('19180', null, '部门审核', '18107', '2018-01-17 10:17:57', '2018-01-18 17:17:49', '19169', '同意', '19168', '19168');
INSERT INTO `uflo_his_activity` VALUES ('19185', null, '部门审核', '18107', '2018-01-17 10:30:22', '2018-01-18 17:17:30', '19038', '同意', '19037', '19037');
INSERT INTO `uflo_his_activity` VALUES ('19190', null, '部门审核', '18107', '2018-01-17 17:43:40', '2018-01-18 17:18:11', '19133', '同意', '19132', '19132');
INSERT INTO `uflo_his_activity` VALUES ('19195', null, '部门审核', '18107', '2018-01-17 23:32:41', '2018-01-18 17:19:00', '19124', '同意', '19123', '19123');
INSERT INTO `uflo_his_activity` VALUES ('19200', null, '部门审核', '18107', '2018-01-18 09:07:30', '2018-01-18 17:19:28', '19160', '同意', '19159', '19159');
INSERT INTO `uflo_his_activity` VALUES ('19205', null, '部门审核', '18107', '2018-01-18 09:17:39', '2018-01-18 17:19:36', '19097', '同意', '19096', '19096');
INSERT INTO `uflo_his_activity` VALUES ('19211', null, '行政发布', '18107', '2018-01-18 16:53:21', '2018-01-18 16:53:21', '19208', null, '19207', '19207');
INSERT INTO `uflo_his_activity` VALUES ('19214', null, '任务填报', '18107', '2018-01-18 16:53:21', '2018-01-18 17:19:46', '19208', '同意', '19207', '19207');
INSERT INTO `uflo_his_activity` VALUES ('19220', null, '行政发布', '18107', '2018-01-18 16:53:21', '2018-01-18 16:53:21', '19217', null, '19216', '19216');
INSERT INTO `uflo_his_activity` VALUES ('19223', null, '任务填报', '18107', '2018-01-18 16:53:21', null, '19217', null, '19216', '19216');
INSERT INTO `uflo_his_activity` VALUES ('19229', null, '行政发布', '18107', '2018-01-18 16:53:21', '2018-01-18 16:53:21', '19226', null, '19225', '19225');
INSERT INTO `uflo_his_activity` VALUES ('19232', null, '任务填报', '18107', '2018-01-18 16:53:21', null, '19226', null, '19225', '19225');
INSERT INTO `uflo_his_activity` VALUES ('19238', null, '行政发布', '18107', '2018-01-18 16:53:22', '2018-01-18 16:53:22', '19235', null, '19234', '19234');
INSERT INTO `uflo_his_activity` VALUES ('19241', null, '任务填报', '18107', '2018-01-18 16:53:22', null, '19235', null, '19234', '19234');
INSERT INTO `uflo_his_activity` VALUES ('19247', null, '行政发布', '18107', '2018-01-18 16:53:22', '2018-01-18 16:53:22', '19244', null, '19243', '19243');
INSERT INTO `uflo_his_activity` VALUES ('19250', null, '任务填报', '18107', '2018-01-18 16:53:22', '2018-01-18 16:58:06', '19244', '同意', '19243', '19243');
INSERT INTO `uflo_his_activity` VALUES ('19256', null, '行政发布', '18107', '2018-01-18 16:53:22', '2018-01-18 16:53:22', '19253', null, '19252', '19252');
INSERT INTO `uflo_his_activity` VALUES ('19259', null, '任务填报', '18107', '2018-01-18 16:53:22', null, '19253', null, '19252', '19252');
INSERT INTO `uflo_his_activity` VALUES ('19265', null, '行政发布', '18107', '2018-01-18 16:53:22', '2018-01-18 16:53:22', '19262', null, '19261', '19261');
INSERT INTO `uflo_his_activity` VALUES ('19268', null, '任务填报', '18107', '2018-01-18 16:53:22', '2018-01-18 16:58:05', '19262', '同意', '19261', '19261');
INSERT INTO `uflo_his_activity` VALUES ('19274', null, '行政发布', '18107', '2018-01-18 16:53:22', '2018-01-18 16:53:22', '19271', null, '19270', '19270');
INSERT INTO `uflo_his_activity` VALUES ('19277', null, '任务填报', '18107', '2018-01-18 16:53:22', null, '19271', null, '19270', '19270');
INSERT INTO `uflo_his_activity` VALUES ('19283', null, '行政发布', '18107', '2018-01-18 16:53:22', '2018-01-18 16:53:22', '19280', null, '19279', '19279');
INSERT INTO `uflo_his_activity` VALUES ('19286', null, '任务填报', '18107', '2018-01-18 16:53:22', null, '19280', null, '19279', '19279');
INSERT INTO `uflo_his_activity` VALUES ('19292', null, '行政发布', '18107', '2018-01-18 16:53:22', '2018-01-18 16:53:23', '19289', null, '19288', '19288');
INSERT INTO `uflo_his_activity` VALUES ('19295', null, '任务填报', '18107', '2018-01-18 16:53:23', null, '19289', null, '19288', '19288');
INSERT INTO `uflo_his_activity` VALUES ('19301', null, '行政发布', '18107', '2018-01-18 16:53:23', '2018-01-18 16:53:23', '19298', null, '19297', '19297');
INSERT INTO `uflo_his_activity` VALUES ('19304', null, '任务填报', '18107', '2018-01-18 16:53:23', '2018-01-19 08:33:49', '19298', '同意', '19297', '19297');
INSERT INTO `uflo_his_activity` VALUES ('19310', null, '行政发布', '18107', '2018-01-18 16:53:23', '2018-01-18 16:53:23', '19307', null, '19306', '19306');
INSERT INTO `uflo_his_activity` VALUES ('19313', null, '任务填报', '18107', '2018-01-18 16:53:23', '2018-01-18 16:57:39', '19307', '同意', '19306', '19306');
INSERT INTO `uflo_his_activity` VALUES ('19319', null, '行政发布', '18107', '2018-01-18 16:53:23', '2018-01-18 16:53:23', '19316', null, '19315', '19315');
INSERT INTO `uflo_his_activity` VALUES ('19322', null, '任务填报', '18107', '2018-01-18 16:53:23', null, '19316', null, '19315', '19315');
INSERT INTO `uflo_his_activity` VALUES ('19328', null, '行政发布', '18107', '2018-01-18 16:53:23', '2018-01-18 16:53:23', '19325', null, '19324', '19324');
INSERT INTO `uflo_his_activity` VALUES ('19331', null, '任务填报', '18107', '2018-01-18 16:53:23', '2018-01-19 15:26:17', '19325', '同意', '19324', '19324');
INSERT INTO `uflo_his_activity` VALUES ('19337', null, '行政发布', '18107', '2018-01-18 16:53:23', '2018-01-18 16:53:23', '19334', null, '19333', '19333');
INSERT INTO `uflo_his_activity` VALUES ('19340', null, '任务填报', '18107', '2018-01-18 16:53:24', '2018-01-19 16:12:17', '19334', '同意', '19333', '19333');
INSERT INTO `uflo_his_activity` VALUES ('19346', null, '行政发布', '18107', '2018-01-18 16:53:24', '2018-01-18 16:53:24', '19343', null, '19342', '19342');
INSERT INTO `uflo_his_activity` VALUES ('19349', null, '任务填报', '18107', '2018-01-18 16:53:24', '2018-01-19 15:35:28', '19343', '同意', '19342', '19342');
INSERT INTO `uflo_his_activity` VALUES ('19355', null, '行政发布', '18107', '2018-01-18 16:53:24', '2018-01-18 16:53:24', '19352', null, '19351', '19351');
INSERT INTO `uflo_his_activity` VALUES ('19358', null, '任务填报', '18107', '2018-01-18 16:53:24', '2018-01-19 15:38:08', '19352', '同意', '19351', '19351');
INSERT INTO `uflo_his_activity` VALUES ('19364', null, '行政发布', '18107', '2018-01-18 16:53:24', '2018-01-18 16:53:24', '19361', null, '19360', '19360');
INSERT INTO `uflo_his_activity` VALUES ('19367', null, '任务填报', '18107', '2018-01-18 16:53:24', null, '19361', null, '19360', '19360');
INSERT INTO `uflo_his_activity` VALUES ('19373', null, '行政发布', '18107', '2018-01-18 16:53:24', '2018-01-18 16:53:24', '19370', null, '19369', '19369');
INSERT INTO `uflo_his_activity` VALUES ('19376', null, '任务填报', '18107', '2018-01-18 16:53:24', null, '19370', null, '19369', '19369');
INSERT INTO `uflo_his_activity` VALUES ('19382', null, '行政发布', '18107', '2018-01-18 16:53:24', '2018-01-18 16:53:24', '19379', null, '19378', '19378');
INSERT INTO `uflo_his_activity` VALUES ('19385', null, '任务填报', '18107', '2018-01-18 16:53:24', '2018-01-18 16:57:54', '19379', '同意', '19378', '19378');
INSERT INTO `uflo_his_activity` VALUES ('19391', null, '行政发布', '18107', '2018-01-18 16:53:24', '2018-01-18 16:53:24', '19388', null, '19387', '19387');
INSERT INTO `uflo_his_activity` VALUES ('19394', null, '任务填报', '18107', '2018-01-18 16:53:24', '2018-01-18 17:16:23', '19388', '同意', '19387', '19387');
INSERT INTO `uflo_his_activity` VALUES ('19400', null, '行政发布', '18107', '2018-01-18 16:53:24', '2018-01-18 16:53:25', '19397', null, '19396', '19396');
INSERT INTO `uflo_his_activity` VALUES ('19403', null, '任务填报', '18107', '2018-01-18 16:53:25', '2018-01-18 16:58:49', '19397', '同意', '19396', '19396');
INSERT INTO `uflo_his_activity` VALUES ('19409', null, '行政发布', '18107', '2018-01-18 16:53:25', '2018-01-18 16:53:25', '19406', null, '19405', '19405');
INSERT INTO `uflo_his_activity` VALUES ('19412', null, '任务填报', '18107', '2018-01-18 16:53:25', '2018-01-18 17:13:14', '19406', '同意', '19405', '19405');
INSERT INTO `uflo_his_activity` VALUES ('19418', null, '行政发布', '18107', '2018-01-18 16:53:25', '2018-01-18 16:53:25', '19415', null, '19414', '19414');
INSERT INTO `uflo_his_activity` VALUES ('19421', null, '任务填报', '18107', '2018-01-18 16:53:25', null, '19415', null, '19414', '19414');
INSERT INTO `uflo_his_activity` VALUES ('19427', null, '行政发布', '18107', '2018-01-18 16:53:25', '2018-01-18 16:53:25', '19424', null, '19423', '19423');
INSERT INTO `uflo_his_activity` VALUES ('19430', null, '任务填报', '18107', '2018-01-18 16:53:25', '2018-01-19 15:41:37', '19424', '同意', '19423', '19423');
INSERT INTO `uflo_his_activity` VALUES ('19436', null, '行政发布', '18107', '2018-01-18 16:53:25', '2018-01-18 16:53:25', '19433', null, '19432', '19432');
INSERT INTO `uflo_his_activity` VALUES ('19439', null, '任务填报', '18107', '2018-01-18 16:53:25', null, '19433', null, '19432', '19432');
INSERT INTO `uflo_his_activity` VALUES ('19445', null, '行政发布', '18107', '2018-01-18 16:53:25', '2018-01-18 16:53:25', '19442', null, '19441', '19441');
INSERT INTO `uflo_his_activity` VALUES ('19448', null, '任务填报', '18107', '2018-01-18 16:53:25', null, '19442', null, '19441', '19441');
INSERT INTO `uflo_his_activity` VALUES ('19454', null, '行政发布', '18107', '2018-01-18 16:53:25', '2018-01-18 16:53:25', '19451', null, '19450', '19450');
INSERT INTO `uflo_his_activity` VALUES ('19457', null, '任务填报', '18107', '2018-01-18 16:53:25', null, '19451', null, '19450', '19450');
INSERT INTO `uflo_his_activity` VALUES ('19463', null, '行政发布', '18107', '2018-01-18 16:53:26', '2018-01-18 16:53:26', '19460', null, '19459', '19459');
INSERT INTO `uflo_his_activity` VALUES ('19466', null, '任务填报', '18107', '2018-01-18 16:53:26', null, '19460', null, '19459', '19459');
INSERT INTO `uflo_his_activity` VALUES ('19471', null, '部门审核', '18107', '2018-01-18 16:57:39', '2018-01-18 16:57:47', '19307', '同意', '19306', '19306');
INSERT INTO `uflo_his_activity` VALUES ('19476', null, '结束', '18107', '2018-01-18 16:57:47', '2018-01-18 16:57:47', '19307', null, '19306', '19306');
INSERT INTO `uflo_his_activity` VALUES ('19480', null, '部门审核', '18107', '2018-01-18 16:57:54', '2018-01-18 16:58:00', '19379', '同意', '19378', '19378');
INSERT INTO `uflo_his_activity` VALUES ('19485', null, '结束', '18107', '2018-01-18 16:58:00', '2018-01-18 16:58:00', '19379', null, '19378', '19378');
INSERT INTO `uflo_his_activity` VALUES ('19489', null, '部门审核', '18107', '2018-01-18 16:58:05', null, '19262', null, '19261', '19261');
INSERT INTO `uflo_his_activity` VALUES ('19494', null, '部门审核', '18107', '2018-01-18 16:58:06', '2018-01-18 16:58:11', '19244', '同意', '19243', '19243');
INSERT INTO `uflo_his_activity` VALUES ('19499', null, '结束', '18107', '2018-01-18 16:58:11', '2018-01-18 16:58:12', '19244', null, '19243', '19243');
INSERT INTO `uflo_his_activity` VALUES ('19503', null, '部门审核', '18107', '2018-01-18 16:58:33', '2018-01-18 17:20:50', '19106', '同意', '19105', '19105');
INSERT INTO `uflo_his_activity` VALUES ('19508', null, '部门审核', '18107', '2018-01-18 16:58:49', '2018-01-18 17:20:59', '19397', '同意', '19396', '19396');
INSERT INTO `uflo_his_activity` VALUES ('19513', null, '部门审核', '18107', '2018-01-18 17:11:27', '2018-01-18 17:16:26', '19115', '同意', '19114', '19114');
INSERT INTO `uflo_his_activity` VALUES ('19518', null, '部门审核', '18107', '2018-01-18 17:13:14', '2018-01-18 17:16:13', '19406', '同意', '19405', '19405');
INSERT INTO `uflo_his_activity` VALUES ('19523', null, '结束', '18107', '2018-01-18 17:16:13', '2018-01-18 17:16:13', '19406', null, '19405', '19405');
INSERT INTO `uflo_his_activity` VALUES ('19527', null, '部门审核', '18107', '2018-01-18 17:16:23', '2018-01-18 17:21:10', '19388', '同意', '19387', '19387');
INSERT INTO `uflo_his_activity` VALUES ('19532', null, '结束', '18107', '2018-01-18 17:16:26', '2018-01-18 17:16:26', '19115', null, '19114', '19114');
INSERT INTO `uflo_his_activity` VALUES ('19536', null, '结束', '18107', '2018-01-18 17:17:30', '2018-01-18 17:17:30', '19038', null, '19037', '19037');
INSERT INTO `uflo_his_activity` VALUES ('19540', null, '结束', '18107', '2018-01-18 17:17:49', '2018-01-18 17:17:49', '19169', null, '19168', '19168');
INSERT INTO `uflo_his_activity` VALUES ('19544', null, '部门审核', '18107', '2018-01-18 17:18:01', '2018-01-19 14:40:38', '19088', '同意', '19087', '19087');
INSERT INTO `uflo_his_activity` VALUES ('19549', null, '结束', '18107', '2018-01-18 17:18:11', '2018-01-18 17:18:11', '19133', null, '19132', '19132');
INSERT INTO `uflo_his_activity` VALUES ('19553', null, '结束', '18107', '2018-01-18 17:18:52', '2018-01-18 17:18:52', '19056', null, '19055', '19055');
INSERT INTO `uflo_his_activity` VALUES ('19557', null, '结束', '18107', '2018-01-18 17:19:00', '2018-01-18 17:19:00', '19124', null, '19123', '19123');
INSERT INTO `uflo_his_activity` VALUES ('19561', null, '结束', '18107', '2018-01-18 17:19:28', '2018-01-18 17:19:28', '19160', null, '19159', '19159');
INSERT INTO `uflo_his_activity` VALUES ('19565', null, '结束', '18107', '2018-01-18 17:19:36', '2018-01-18 17:19:36', '19097', null, '19096', '19096');
INSERT INTO `uflo_his_activity` VALUES ('19569', null, '部门审核', '18107', '2018-01-18 17:19:46', '2018-01-19 14:21:44', '19208', '同意', '19207', '19207');
INSERT INTO `uflo_his_activity` VALUES ('19574', null, '结束', '18107', '2018-01-18 17:20:50', '2018-01-18 17:20:50', '19106', null, '19105', '19105');
INSERT INTO `uflo_his_activity` VALUES ('19578', null, '结束', '18107', '2018-01-18 17:20:59', '2018-01-18 17:20:59', '19397', null, '19396', '19396');
INSERT INTO `uflo_his_activity` VALUES ('19582', null, '结束', '18107', '2018-01-18 17:21:10', '2018-01-18 17:21:10', '19388', null, '19387', '19387');
INSERT INTO `uflo_his_activity` VALUES ('19586', null, '部门审核', '18107', '2018-01-19 08:33:49', '2018-01-19 14:40:32', '19298', '同意', '19297', '19297');
INSERT INTO `uflo_his_activity` VALUES ('19604', null, '结束', '18107', '2018-01-19 14:21:44', '2018-01-19 14:21:44', '19208', null, '19207', '19207');
INSERT INTO `uflo_his_activity` VALUES ('19609', null, '开始', '18113', '2018-01-19 14:28:44', '2018-01-19 14:28:44', '19606', null, '19605', '19605');
INSERT INTO `uflo_his_activity` VALUES ('19612', null, '部门填报', '18113', '2018-01-19 14:28:44', null, '19606', null, '19605', '19605');
INSERT INTO `uflo_his_activity` VALUES ('19618', null, '开始', '18113', '2018-01-19 14:28:44', '2018-01-19 14:28:44', '19615', null, '19614', '19614');
INSERT INTO `uflo_his_activity` VALUES ('19621', null, '部门填报', '18113', '2018-01-19 14:28:44', null, '19615', null, '19614', '19614');
INSERT INTO `uflo_his_activity` VALUES ('19627', null, '开始', '18113', '2018-01-19 14:28:44', '2018-01-19 14:28:44', '19624', null, '19623', '19623');
INSERT INTO `uflo_his_activity` VALUES ('19630', null, '部门填报', '18113', '2018-01-19 14:28:44', null, '19624', null, '19623', '19623');
INSERT INTO `uflo_his_activity` VALUES ('19636', null, '开始', '18113', '2018-01-19 14:28:44', '2018-01-19 14:28:44', '19633', null, '19632', '19632');
INSERT INTO `uflo_his_activity` VALUES ('19639', null, '部门填报', '18113', '2018-01-19 14:28:44', null, '19633', null, '19632', '19632');
INSERT INTO `uflo_his_activity` VALUES ('19645', null, '开始', '18113', '2018-01-19 14:28:44', '2018-01-19 14:28:44', '19642', null, '19641', '19641');
INSERT INTO `uflo_his_activity` VALUES ('19648', null, '部门填报', '18113', '2018-01-19 14:28:44', null, '19642', null, '19641', '19641');
INSERT INTO `uflo_his_activity` VALUES ('19654', null, '开始', '18113', '2018-01-19 14:28:44', '2018-01-19 14:28:44', '19651', null, '19650', '19650');
INSERT INTO `uflo_his_activity` VALUES ('19657', null, '部门填报', '18113', '2018-01-19 14:28:44', null, '19651', null, '19650', '19650');
INSERT INTO `uflo_his_activity` VALUES ('19663', null, '开始', '18113', '2018-01-19 14:28:45', '2018-01-19 14:28:45', '19660', null, '19659', '19659');
INSERT INTO `uflo_his_activity` VALUES ('19666', null, '部门填报', '18113', '2018-01-19 14:28:45', null, '19660', null, '19659', '19659');
INSERT INTO `uflo_his_activity` VALUES ('19672', null, '开始', '18113', '2018-01-19 14:28:45', '2018-01-19 14:28:45', '19669', null, '19668', '19668');
INSERT INTO `uflo_his_activity` VALUES ('19675', null, '部门填报', '18113', '2018-01-19 14:28:45', null, '19669', null, '19668', '19668');
INSERT INTO `uflo_his_activity` VALUES ('19681', null, '开始', '18113', '2018-01-19 14:28:45', '2018-01-19 14:28:45', '19678', null, '19677', '19677');
INSERT INTO `uflo_his_activity` VALUES ('19684', null, '部门填报', '18113', '2018-01-19 14:28:45', null, '19678', null, '19677', '19677');
INSERT INTO `uflo_his_activity` VALUES ('19690', null, '开始', '18113', '2018-01-19 14:28:45', '2018-01-19 14:28:45', '19687', null, '19686', '19686');
INSERT INTO `uflo_his_activity` VALUES ('19693', null, '部门填报', '18113', '2018-01-19 14:28:45', null, '19687', null, '19686', '19686');
INSERT INTO `uflo_his_activity` VALUES ('19699', null, '开始', '18113', '2018-01-19 14:28:45', '2018-01-19 14:28:45', '19696', null, '19695', '19695');
INSERT INTO `uflo_his_activity` VALUES ('19702', null, '部门填报', '18113', '2018-01-19 14:28:45', null, '19696', null, '19695', '19695');
INSERT INTO `uflo_his_activity` VALUES ('19708', null, '开始', '18113', '2018-01-19 14:28:46', '2018-01-19 14:28:46', '19705', null, '19704', '19704');
INSERT INTO `uflo_his_activity` VALUES ('19711', null, '部门填报', '18113', '2018-01-19 14:28:46', null, '19705', null, '19704', '19704');
INSERT INTO `uflo_his_activity` VALUES ('19717', null, '开始', '18113', '2018-01-19 14:28:46', '2018-01-19 14:28:46', '19714', null, '19713', '19713');
INSERT INTO `uflo_his_activity` VALUES ('19720', null, '部门填报', '18113', '2018-01-19 14:28:46', null, '19714', null, '19713', '19713');
INSERT INTO `uflo_his_activity` VALUES ('19726', null, '开始', '18113', '2018-01-19 14:28:46', '2018-01-19 14:28:46', '19723', null, '19722', '19722');
INSERT INTO `uflo_his_activity` VALUES ('19729', null, '部门填报', '18113', '2018-01-19 14:28:46', null, '19723', null, '19722', '19722');
INSERT INTO `uflo_his_activity` VALUES ('19735', null, '开始', '18113', '2018-01-19 14:28:46', '2018-01-19 14:28:46', '19732', null, '19731', '19731');
INSERT INTO `uflo_his_activity` VALUES ('19738', null, '部门填报', '18113', '2018-01-19 14:28:46', null, '19732', null, '19731', '19731');
INSERT INTO `uflo_his_activity` VALUES ('19744', null, '开始', '18113', '2018-01-19 14:28:46', '2018-01-19 14:28:46', '19741', null, '19740', '19740');
INSERT INTO `uflo_his_activity` VALUES ('19747', null, '部门填报', '18113', '2018-01-19 14:28:46', null, '19741', null, '19740', '19740');
INSERT INTO `uflo_his_activity` VALUES ('19753', null, '开始', '18113', '2018-01-19 14:28:46', '2018-01-19 14:28:46', '19750', null, '19749', '19749');
INSERT INTO `uflo_his_activity` VALUES ('19756', null, '部门填报', '18113', '2018-01-19 14:28:46', null, '19750', null, '19749', '19749');
INSERT INTO `uflo_his_activity` VALUES ('19762', null, '开始', '18113', '2018-01-19 14:28:46', '2018-01-19 14:28:46', '19759', null, '19758', '19758');
INSERT INTO `uflo_his_activity` VALUES ('19765', null, '部门填报', '18113', '2018-01-19 14:28:47', null, '19759', null, '19758', '19758');
INSERT INTO `uflo_his_activity` VALUES ('19771', null, '开始', '18113', '2018-01-19 14:28:47', '2018-01-19 14:28:47', '19768', null, '19767', '19767');
INSERT INTO `uflo_his_activity` VALUES ('19774', null, '部门填报', '18113', '2018-01-19 14:28:47', null, '19768', null, '19767', '19767');
INSERT INTO `uflo_his_activity` VALUES ('19780', null, '开始', '18113', '2018-01-19 14:28:47', '2018-01-19 14:28:47', '19777', null, '19776', '19776');
INSERT INTO `uflo_his_activity` VALUES ('19783', null, '部门填报', '18113', '2018-01-19 14:28:47', null, '19777', null, '19776', '19776');
INSERT INTO `uflo_his_activity` VALUES ('19789', null, '开始', '18113', '2018-01-19 14:28:47', '2018-01-19 14:28:47', '19786', null, '19785', '19785');
INSERT INTO `uflo_his_activity` VALUES ('19792', null, '部门填报', '18113', '2018-01-19 14:28:47', '2018-01-24 14:42:19', '19786', '同意', '19785', '19785');
INSERT INTO `uflo_his_activity` VALUES ('19798', null, '开始', '18113', '2018-01-19 14:28:47', '2018-01-19 14:28:47', '19795', null, '19794', '19794');
INSERT INTO `uflo_his_activity` VALUES ('19801', null, '部门填报', '18113', '2018-01-19 14:28:47', null, '19795', null, '19794', '19794');
INSERT INTO `uflo_his_activity` VALUES ('19807', null, '开始', '18113', '2018-01-19 14:28:47', '2018-01-19 14:28:47', '19804', null, '19803', '19803');
INSERT INTO `uflo_his_activity` VALUES ('19810', null, '部门填报', '18113', '2018-01-19 14:28:47', null, '19804', null, '19803', '19803');
INSERT INTO `uflo_his_activity` VALUES ('19816', null, '开始', '18113', '2018-01-19 14:28:47', '2018-01-19 14:28:47', '19813', null, '19812', '19812');
INSERT INTO `uflo_his_activity` VALUES ('19819', null, '部门填报', '18113', '2018-01-19 14:28:47', null, '19813', null, '19812', '19812');
INSERT INTO `uflo_his_activity` VALUES ('19825', null, '开始', '18113', '2018-01-19 14:28:47', '2018-01-19 14:28:48', '19822', null, '19821', '19821');
INSERT INTO `uflo_his_activity` VALUES ('19828', null, '部门填报', '18113', '2018-01-19 14:28:48', null, '19822', null, '19821', '19821');
INSERT INTO `uflo_his_activity` VALUES ('19834', null, '开始', '18113', '2018-01-19 14:28:48', '2018-01-19 14:28:48', '19831', null, '19830', '19830');
INSERT INTO `uflo_his_activity` VALUES ('19837', null, '部门填报', '18113', '2018-01-19 14:28:48', null, '19831', null, '19830', '19830');
INSERT INTO `uflo_his_activity` VALUES ('19842', null, '结束', '18107', '2018-01-19 14:40:32', '2018-01-19 14:40:32', '19298', null, '19297', '19297');
INSERT INTO `uflo_his_activity` VALUES ('19846', null, '结束', '18107', '2018-01-19 14:40:38', '2018-01-19 14:40:38', '19088', null, '19087', '19087');
INSERT INTO `uflo_his_activity` VALUES ('19850', null, '部门审核', '18107', '2018-01-19 15:14:56', null, '19142', null, '19141', '19141');
INSERT INTO `uflo_his_activity` VALUES ('19855', null, '部门审核', '18107', '2018-01-19 15:26:17', null, '19325', null, '19324', '19324');
INSERT INTO `uflo_his_activity` VALUES ('19860', null, '部门审核', '18107', '2018-01-19 15:35:28', null, '19343', null, '19342', '19342');
INSERT INTO `uflo_his_activity` VALUES ('19865', null, '部门审核', '18107', '2018-01-19 15:38:08', null, '19352', null, '19351', '19351');
INSERT INTO `uflo_his_activity` VALUES ('19870', null, '部门审核', '18107', '2018-01-19 15:41:37', null, '19424', null, '19423', '19423');
INSERT INTO `uflo_his_activity` VALUES ('19875', null, '部门审核', '18107', '2018-01-19 16:12:17', null, '19334', null, '19333', '19333');
INSERT INTO `uflo_his_activity` VALUES ('19904', null, '部门审核', '18113', '2018-01-24 14:42:19', null, '19786', null, '19785', '19785');
INSERT INTO `uflo_his_activity` VALUES ('19910', null, '行政发布', '18107', '2018-01-25 08:59:13', '2018-01-25 08:59:13', '19907', null, '19906', '19906');
INSERT INTO `uflo_his_activity` VALUES ('19913', null, '任务填报', '18107', '2018-01-25 08:59:13', null, '19907', null, '19906', '19906');
INSERT INTO `uflo_his_activity` VALUES ('19919', null, '行政发布', '18107', '2018-01-25 08:59:13', '2018-01-25 08:59:13', '19916', null, '19915', '19915');
INSERT INTO `uflo_his_activity` VALUES ('19922', null, '任务填报', '18107', '2018-01-25 08:59:13', null, '19916', null, '19915', '19915');
INSERT INTO `uflo_his_activity` VALUES ('19928', null, '行政发布', '18107', '2018-01-25 08:59:13', '2018-01-25 08:59:13', '19925', null, '19924', '19924');
INSERT INTO `uflo_his_activity` VALUES ('19931', null, '任务填报', '18107', '2018-01-25 08:59:13', null, '19925', null, '19924', '19924');
INSERT INTO `uflo_his_activity` VALUES ('19937', null, '行政发布', '18107', '2018-01-25 08:59:13', '2018-01-25 08:59:13', '19934', null, '19933', '19933');
INSERT INTO `uflo_his_activity` VALUES ('19940', null, '任务填报', '18107', '2018-01-25 08:59:13', null, '19934', null, '19933', '19933');
INSERT INTO `uflo_his_activity` VALUES ('19946', null, '行政发布', '18107', '2018-01-25 08:59:13', '2018-01-25 08:59:13', '19943', null, '19942', '19942');
INSERT INTO `uflo_his_activity` VALUES ('19949', null, '任务填报', '18107', '2018-01-25 08:59:13', null, '19943', null, '19942', '19942');
INSERT INTO `uflo_his_activity` VALUES ('19955', null, '行政发布', '18107', '2018-01-25 08:59:14', '2018-01-25 08:59:14', '19952', null, '19951', '19951');
INSERT INTO `uflo_his_activity` VALUES ('19958', null, '任务填报', '18107', '2018-01-25 08:59:14', null, '19952', null, '19951', '19951');
INSERT INTO `uflo_his_activity` VALUES ('19964', null, '行政发布', '18107', '2018-01-25 08:59:14', '2018-01-25 08:59:14', '19961', null, '19960', '19960');
INSERT INTO `uflo_his_activity` VALUES ('19967', null, '任务填报', '18107', '2018-01-25 08:59:14', null, '19961', null, '19960', '19960');
INSERT INTO `uflo_his_activity` VALUES ('19973', null, '行政发布', '18107', '2018-01-25 08:59:14', '2018-01-25 08:59:14', '19970', null, '19969', '19969');
INSERT INTO `uflo_his_activity` VALUES ('19976', null, '任务填报', '18107', '2018-01-25 08:59:14', null, '19970', null, '19969', '19969');
INSERT INTO `uflo_his_activity` VALUES ('19982', null, '行政发布', '18107', '2018-01-25 08:59:14', '2018-01-25 08:59:14', '19979', null, '19978', '19978');
INSERT INTO `uflo_his_activity` VALUES ('19985', null, '任务填报', '18107', '2018-01-25 08:59:14', null, '19979', null, '19978', '19978');

-- ----------------------------
-- Table structure for uflo_his_blob
-- ----------------------------
DROP TABLE IF EXISTS `uflo_his_blob`;
CREATE TABLE `uflo_his_blob` (
  `ID_` bigint(20) NOT NULL,
  `BLOB_VALUE_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_his_blob
-- ----------------------------

-- ----------------------------
-- Table structure for uflo_his_process_instance
-- ----------------------------
DROP TABLE IF EXISTS `uflo_his_process_instance`;
CREATE TABLE `uflo_his_process_instance` (
  `ID_` bigint(20) NOT NULL,
  `BUSINESS_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `END_DATE_` datetime DEFAULT NULL,
  `PROCESS_ID_` bigint(20) DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `PROMOTER_` varchar(60) DEFAULT NULL,
  `SUBJECT_` varchar(200) DEFAULT NULL,
  `TAG_` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_his_process_instance
-- ----------------------------
INSERT INTO `uflo_his_process_instance` VALUES ('18202', 'f9383132-863b-45a3-abba-430d6421fbde', '2018-01-15 18:08:27', null, '18113', '18201', 'xuxh1', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('18231', 'c348263f-4790-4df1-8e23-2b1f1eead2fc', '2018-01-15 21:31:38', '2018-01-15 22:23:34', '18103', '18230', 'xuxh1', '【合同】年计划填报：2018年度合同工作计划编制填报任务。【截止日期20180118】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('18250', '9553c4c5-a6d3-4d1a-b69e-5bc698fcb096', '2018-01-16 00:34:17', null, '18107', '18249', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18259', 'e0963ffa-109e-42d7-a2ea-b790a2ff082b', '2018-01-16 00:34:18', null, '18107', '18258', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18268', '6949bbbf-9944-427e-9231-682264b9c5c9', '2018-01-16 00:34:18', null, '18107', '18267', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18277', '1d80d625-ed56-4726-a4d8-8da47958023f', '2018-01-16 00:34:18', null, '18107', '18276', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18286', '1634f7da-6a9e-4bc5-8449-97029fb16adb', '2018-01-16 00:34:18', null, '18107', '18285', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18295', 'f5835a4f-893e-4129-8f04-c95a4a21091c', '2018-01-16 00:34:18', null, '18107', '18294', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18306', '698e302e-02da-4931-acd8-4809e4693d1f', '2018-01-15 22:36:34', '2018-01-15 22:57:44', '18101', '18305', 'xuxh1', '【合同】年计划汇总：2018合同年度计划任务汇总。【截止日期20180118】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('18324', '5efa5ecd-8139-41ee-8462-ba4cd8fbe0eb', '2018-01-15 23:12:20', '2018-01-16 00:03:23', '18111', '18323', 'liuwl', '【合同】月计划填报：2018年1月合同月计划任务发布测试。【截止日期20180118】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('18347', 'e8ad3707-d7c2-4efd-a8bd-8409c8c46617', '2018-01-16 00:05:56', '2018-01-16 00:09:04', '18111', '18346', 'xuxh1', '【合同】月计划填报：2018年1月合同月计划任务发布测试1。【截止日期20180118】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('18404', 'd0f41896-0f4f-4f8b-9967-201b0f920b28', '2018-01-16 00:34:19', null, '18107', '18403', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18413', 'ae7db010-47d7-4921-8526-34868b6de3f1', '2018-01-16 00:34:19', null, '18107', '18412', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18422', 'd4caeee9-2461-4c5d-8fed-96da741693e9', '2018-01-16 00:34:19', null, '18107', '18421', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18431', '60d3e3f9-f911-4b88-a4f3-9169e6268687', '2018-01-16 00:34:19', null, '18107', '18430', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18440', 'dcdb090a-287b-4d60-8454-8b292131b9bf', '2018-01-16 00:34:19', null, '18107', '18439', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18449', 'ee9eddb1-8186-4f07-8fde-072e40393c93', '2018-01-16 00:34:19', null, '18107', '18448', 'xuxh1', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18458', '15eff167-1a38-41cc-93a5-044bdcf43467', '2018-01-16 00:37:47', null, '18107', '18457', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18467', 'ea663ce0-d01d-402b-9066-1f381895ceaa', '2018-01-16 00:37:48', null, '18107', '18466', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18476', 'c27d0ab2-11c5-4d6a-89fc-468eca6b122c', '2018-01-16 00:37:48', null, '18107', '18475', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18485', '0096ce13-658c-4ea1-a109-c56781a80a5c', '2018-01-16 00:37:48', null, '18107', '18484', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18494', '2616d459-e981-49e9-a977-46089c260f00', '2018-01-16 00:37:48', null, '18107', '18493', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18503', '52fecc93-d10f-4e07-b743-7002b1e291b1', '2018-01-16 00:37:48', null, '18107', '18502', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18512', '36b41911-74be-4e89-a268-bdefb613eebf', '2018-01-16 00:37:48', null, '18107', '18511', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18521', '55226ed2-fc50-4b10-89aa-5d6e16c8d3e6', '2018-01-16 00:37:49', null, '18107', '18520', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18530', 'b94622eb-9743-4ea5-aeb6-1c138bb8c5f0', '2018-01-16 00:37:49', null, '18107', '18529', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18539', '4adfdae1-a6b2-4c2f-9818-190dcb3813e0', '2018-01-16 00:37:49', '2018-01-16 00:48:37', '18107', '18538', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18548', '7707638d-2fbc-4f02-901d-f20079dcb089', '2018-01-16 00:37:49', null, '18107', '18547', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18557', '832baec1-7764-4874-be19-6c8490e573c3', '2018-01-16 00:37:49', null, '18107', '18556', 'xuxh1', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18580', '25bace80-aec3-49cf-a615-3e36a4bfb5b4', '2018-01-16 08:56:39', null, '18107', '18579', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18589', 'c80a41ef-fb10-4d9a-b7f0-8a5e7d2da698', '2018-01-16 08:56:39', null, '18107', '18588', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18598', 'bb689532-7e73-4a46-aa8e-32804733d250', '2018-01-16 08:56:39', null, '18107', '18597', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18607', 'bc70fa31-ddc3-46e0-a3c1-bec03cc6192d', '2018-01-16 08:56:39', null, '18107', '18606', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18616', '781fab63-7d3d-4a53-a89c-c5e25b9869b4', '2018-01-16 08:56:40', null, '18107', '18615', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18625', 'd6a26344-c24b-4612-bc04-253b39184b78', '2018-01-16 08:56:40', null, '18107', '18624', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18634', '421dd18b-e08a-4d1a-9408-f8c91663bef7', '2018-01-16 08:56:40', null, '18107', '18633', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18643', '7c0acf96-0050-4436-9569-572dcdae70bc', '2018-01-16 08:56:40', null, '18107', '18642', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18652', 'b6be0169-3f19-40e3-8d0d-e5f59776a276', '2018-01-16 08:56:40', null, '18107', '18651', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18661', '06f90f18-73c3-4ef5-b24f-6bd259692420', '2018-01-16 08:56:40', null, '18107', '18660', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18670', '870a12b6-435b-4c10-bc05-60ee3bac0cf9', '2018-01-16 08:56:40', null, '18107', '18669', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18679', 'fe137b3e-6eb4-4d75-a206-0f7ed7582e1f', '2018-01-16 08:56:40', null, '18107', '18678', 'xuxh1', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('18693', '8cc4c6e8-3896-4afc-b1e1-95dab3a77731', '2018-01-16 09:09:17', '2018-01-16 09:18:28', '18103', '18692', 'xuxh1', '【合同】年计划填报：2018年合同计划发布测试。【截止日期20180120】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('18712', 'e153e4f2-e0ea-498e-a192-9e863a8c0617', '2018-01-16 09:19:08', '2018-01-16 09:21:35', '18101', '18711', 'xuxh1', '【合同】年计划汇总：2018年合同计划汇总。【截止日期20180120】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('18810', '38b820be-34cd-4c57-b747-bd3387c4efaf', '2018-01-16 09:27:37', null, '18111', '18809', 'liuwl', '【合同】月计划填报：1月合同测试。【截止日期20180120】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('18824', '499b5202-36c8-46f0-8e7f-3ce65be0d90b', '2018-01-16 09:40:37', null, '18105', '18823', 'Yuany', '【产值】年计划填报：产值测试。【截止日期20180119】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('18902', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', '2018-01-16 11:56:41', null, '18109', '18901', 'xuxh1', '【合同】月计划汇总：2018年1月合同计划汇总测试。【截止日期20180118】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19002', '7882e297-4731-4559-9ca6-2ca854714b59', '2018-01-17 09:24:43', '2018-01-17 09:39:02', '18107', '19001', 'yangying', '检测中心（实验室）第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19011', '1b35cbd2-011d-4fbe-ab70-4f93f29df891', '2018-01-17 09:24:43', null, '18107', '19010', 'yangying', '检测中心（实验室）第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19020', '43fedd93-0b99-4f0a-a3bc-a473650063de', '2018-01-17 09:24:44', '2018-01-17 09:38:46', '18107', '19019', 'yangying', '检测中心（实验室）第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19029', 'bc121d8f-0246-471c-bc36-6c55902ba97e', '2018-01-17 09:24:44', null, '18107', '19028', 'yangying', '检测中心（实验室）第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19038', '22ab66eb-9adc-463d-af3f-ce98ddfeb8ae', '2018-01-17 09:24:44', '2018-01-18 17:17:30', '18107', '19037', 'yangying', '检测中心（实验室）第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19047', '97d6f46f-7c37-41d2-b581-c0b838a1be13', '2018-01-17 09:24:44', null, '18107', '19046', 'yangying', '检测中心（实验室）第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19056', '5a88995f-ad01-4502-80a8-f829d83eb34f', '2018-01-17 09:24:44', '2018-01-18 17:18:52', '18107', '19055', 'yangying', '检测中心（实验室）第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19088', '230a24af-8d7a-47be-934e-f7f25ab6e14d', '2018-01-17 10:13:37', '2018-01-19 14:40:38', '18107', '19087', 'Gaocr', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19097', 'e51c3999-d1fb-404d-8766-7bd63f11c38d', '2018-01-17 10:13:37', '2018-01-18 17:19:36', '18107', '19096', 'Gaocr', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19106', '0398b9d0-024f-4a4e-846e-1edd9cda942d', '2018-01-17 10:13:37', '2018-01-18 17:20:50', '18107', '19105', 'Gaocr', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19115', 'd1ec6d90-be03-445a-b1e5-da7aeffd8886', '2018-01-17 10:13:37', '2018-01-18 17:16:26', '18107', '19114', 'Gaocr', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19124', '4910ef81-8dd5-434e-a0d7-4c56944339dd', '2018-01-17 10:13:37', '2018-01-18 17:19:00', '18107', '19123', 'Gaocr', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19133', 'b33b6996-5ef9-4a57-9660-a49de1c7dada', '2018-01-17 10:13:38', '2018-01-18 17:18:11', '18107', '19132', 'Gaocr', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19142', '4ee61181-e9f2-4e86-a46b-ade2627a5a66', '2018-01-17 10:13:38', null, '18107', '19141', 'Gaocr', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19151', 'c7446aeb-a7a9-4709-ba09-9a3589f0a825', '2018-01-17 10:13:38', null, '18107', '19150', 'Gaocr', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19160', 'd543db2c-7780-44b8-8907-e811ced8d4f2', '2018-01-17 10:13:38', '2018-01-18 17:19:28', '18107', '19159', 'Gaocr', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19169', 'f9a4c3b3-c61d-4184-83ec-c6f3b3b836fe', '2018-01-17 10:13:38', '2018-01-18 17:17:49', '18107', '19168', 'Gaocr', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19208', '0b03a9f1-6f75-4dca-a987-bcc1d0b611ea', '2018-01-18 16:53:21', '2018-01-19 14:21:44', '18107', '19207', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19217', 'b0f8644c-bb61-48d4-91d6-d8f7b344f64a', '2018-01-18 16:53:21', null, '18107', '19216', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19226', '3142cbcb-8018-4cda-b637-8656a387cd6a', '2018-01-18 16:53:21', null, '18107', '19225', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19235', 'b146d22a-0bb8-419a-a40e-8fc20a54fbd6', '2018-01-18 16:53:22', null, '18107', '19234', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19244', '072e95f1-7b3f-497a-9d2f-39184f6d7f7e', '2018-01-18 16:53:22', '2018-01-18 16:58:12', '18107', '19243', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19253', '7909eab5-a09c-4a25-9469-1947852418c2', '2018-01-18 16:53:22', null, '18107', '19252', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19262', 'ecd03c7f-94b1-4cc7-a369-3b2fbc196de9', '2018-01-18 16:53:22', null, '18107', '19261', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19271', '64dec6d0-f2b9-40b9-9a6a-98f29a9b28d4', '2018-01-18 16:53:22', null, '18107', '19270', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19280', '101d6199-5b46-463a-9cae-0c3a0b7b443a', '2018-01-18 16:53:22', null, '18107', '19279', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19289', '4df5de45-e12d-4dd8-8d8a-0fa3f7262575', '2018-01-18 16:53:22', null, '18107', '19288', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19298', 'bd6780f1-d59e-4769-a3cb-c2874cf891aa', '2018-01-18 16:53:23', '2018-01-19 14:40:32', '18107', '19297', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19307', 'f0c839b2-46c6-42c0-9875-f46a1e827a43', '2018-01-18 16:53:23', '2018-01-18 16:57:47', '18107', '19306', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19316', '15319e70-459b-4488-8384-422099bdfea4', '2018-01-18 16:53:23', null, '18107', '19315', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19325', '8a642e91-d8ee-4c5b-bde7-e94fec5097f3', '2018-01-18 16:53:23', null, '18107', '19324', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19334', '83c040e1-cdd9-4b19-a14f-c2b86867dbba', '2018-01-18 16:53:23', null, '18107', '19333', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19343', '1fc7030e-19c6-4855-9af0-088f1a99d270', '2018-01-18 16:53:24', null, '18107', '19342', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19352', '57b0463f-ed25-4e6b-99c5-3d1e98d3ba54', '2018-01-18 16:53:24', null, '18107', '19351', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19361', '3e906c2c-673b-4635-b864-75c0354ce8ba', '2018-01-18 16:53:24', null, '18107', '19360', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19370', 'e4b3877f-47f4-4bda-b23b-810de0317285', '2018-01-18 16:53:24', null, '18107', '19369', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19379', 'bf10d65b-e145-4045-a0e3-b73109db6875', '2018-01-18 16:53:24', '2018-01-18 16:58:00', '18107', '19378', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19388', '33bf6d89-00d6-4952-870d-66f93500ad92', '2018-01-18 16:53:24', '2018-01-18 17:21:10', '18107', '19387', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19397', '6da38ffb-0125-4dfa-938d-9739dbdbd244', '2018-01-18 16:53:24', '2018-01-18 17:20:59', '18107', '19396', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19406', '34e528fa-bf83-4643-a183-aed0aca065ee', '2018-01-18 16:53:25', '2018-01-18 17:16:13', '18107', '19405', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19415', 'f47ba3e3-e91d-42c0-a5dd-95be827c7876', '2018-01-18 16:53:25', null, '18107', '19414', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19424', 'b0d3e17c-047e-4d3e-a1f1-d3282e753781', '2018-01-18 16:53:25', null, '18107', '19423', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19433', 'a49a15d0-10ec-4c91-84a4-1f92d68180d7', '2018-01-18 16:53:25', null, '18107', '19432', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19442', 'ab4f2726-7ebf-46e6-bc40-d5b638a7455a', '2018-01-18 16:53:25', null, '18107', '19441', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19451', '5a338b10-63ae-4d11-a8de-4c0b77b34e25', '2018-01-18 16:53:25', null, '18107', '19450', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19460', '6a92664b-2e48-46c0-a718-ffd0b1ff3234', '2018-01-18 16:53:26', null, '18107', '19459', 'Cuihh', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_his_process_instance` VALUES ('19606', 'fe385bcf-39e0-410c-bd01-7bcf18853e07', '2018-01-19 14:28:44', null, '18113', '19605', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19615', '0f0550a4-7865-4eff-9eef-59b0e2517a29', '2018-01-19 14:28:44', null, '18113', '19614', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19624', '9ffc5d49-36c7-4990-be07-ee1268a8f441', '2018-01-19 14:28:44', null, '18113', '19623', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19633', '6f8536a7-7df4-4f95-bdb3-df7bbe075d26', '2018-01-19 14:28:44', null, '18113', '19632', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19642', '61c0663b-ebee-49b9-b3bb-3f86b3b804d8', '2018-01-19 14:28:44', null, '18113', '19641', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19651', '21f79b27-fbeb-4daf-903c-0602ca6f05af', '2018-01-19 14:28:44', null, '18113', '19650', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19660', '940284b2-0430-4a34-bf57-3adb393e2ef0', '2018-01-19 14:28:45', null, '18113', '19659', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19669', 'd1ad7e95-af1a-4fc0-b6da-23c143c6414c', '2018-01-19 14:28:45', null, '18113', '19668', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19678', 'f17ac449-9fc3-4f93-9ac8-67b8e59ad0cc', '2018-01-19 14:28:45', null, '18113', '19677', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19687', 'e3e34f59-25b4-44da-83c6-d0468baae551', '2018-01-19 14:28:45', null, '18113', '19686', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19696', '3ce58452-758f-4331-b071-8cb892935a69', '2018-01-19 14:28:45', null, '18113', '19695', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19705', '803e0e96-feb3-44d2-9c2f-9ec7169eb0f8', '2018-01-19 14:28:46', null, '18113', '19704', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19714', '9b023634-86f6-48ec-8618-9ef1506f19b4', '2018-01-19 14:28:46', null, '18113', '19713', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19723', '93d710f5-c722-48ec-b59e-9eb88f48a458', '2018-01-19 14:28:46', null, '18113', '19722', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19732', '8826725f-db13-4715-8f7f-905339ac11fe', '2018-01-19 14:28:46', null, '18113', '19731', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19741', '0f4a5003-1ec3-4673-999c-6cc8ba3c769f', '2018-01-19 14:28:46', null, '18113', '19740', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19750', '7bf9aad7-bad0-432a-9380-9c8145a2a023', '2018-01-19 14:28:46', null, '18113', '19749', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19759', 'eabdf0fc-fc28-4d3d-8957-b0011334e7f5', '2018-01-19 14:28:46', null, '18113', '19758', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19768', '154a3bbe-15c1-4ec5-a9f1-29d3cd63f1b8', '2018-01-19 14:28:47', null, '18113', '19767', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19777', '668885ff-78f0-4342-8b36-2696c1ada324', '2018-01-19 14:28:47', null, '18113', '19776', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19786', 'd557d6b6-3b4b-40a5-bc93-18ef44f7da8c', '2018-01-19 14:28:47', null, '18113', '19785', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19795', '96346f49-c637-4b03-857e-15d5e135fef5', '2018-01-19 14:28:47', null, '18113', '19794', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19804', 'b32cf8c7-81f9-448e-9cf1-644784ebe6d9', '2018-01-19 14:28:47', null, '18113', '19803', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19813', '5eb910c0-7fd7-44aa-9f0c-f705f643bee7', '2018-01-19 14:28:47', null, '18113', '19812', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19822', 'd75b31c0-854a-43fb-a5a6-f1f906b0ea31', '2018-01-19 14:28:47', null, '18113', '19821', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19831', 'a648e336-29e3-4c76-86ae-7cba9de160f4', '2018-01-19 14:28:48', null, '18113', '19830', 'Cuihh', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19907', '89c81285-2757-4f9f-9046-c9f2dd6c1b5d', '2018-01-25 08:59:13', null, '18107', '19906', 'Gaocr', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19916', '3c161602-d562-4fe6-96e3-0846c65bd8ce', '2018-01-25 08:59:13', null, '18107', '19915', 'Gaocr', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19925', 'fca23947-b1b0-4481-8f46-8db7feee9e9c', '2018-01-25 08:59:13', null, '18107', '19924', 'Gaocr', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19934', 'c2371951-a4c3-408d-94f7-d7745c6bfa78', '2018-01-25 08:59:13', null, '18107', '19933', 'Gaocr', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19943', 'e942f857-be0d-4061-9db0-9b9fad363875', '2018-01-25 08:59:13', null, '18107', '19942', 'Gaocr', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19952', 'e2b03f41-f555-4600-a11a-dea2c2c447f7', '2018-01-25 08:59:14', null, '18107', '19951', 'Gaocr', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19961', 'a448a730-1937-4916-8263-afea2182f998', '2018-01-25 08:59:14', null, '18107', '19960', 'Gaocr', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19970', '1c628366-4897-4368-abbd-faa6570193aa', '2018-01-25 08:59:14', null, '18107', '19969', 'Gaocr', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_his_process_instance` VALUES ('19979', 'e2ccfaf3-ba21-4fbe-a62f-6fa83ec3a42a', '2018-01-25 08:59:14', null, '18107', '19978', 'Gaocr', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);

-- ----------------------------
-- Table structure for uflo_his_task
-- ----------------------------
DROP TABLE IF EXISTS `uflo_his_task`;
CREATE TABLE `uflo_his_task` (
  `ID_` bigint(20) NOT NULL,
  `DESCRIPTION_` varchar(120) DEFAULT NULL,
  `NODE_NAME_` varchar(60) DEFAULT NULL,
  `PROCESS_ID_` bigint(20) DEFAULT NULL,
  `ASSIGNEE_` varchar(60) DEFAULT NULL,
  `BUSINESS_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `END_DATE_` datetime DEFAULT NULL,
  `HIS_PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `OPINION_` varchar(200) DEFAULT NULL,
  `OWNER_` varchar(60) DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `ROOT_PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(20) DEFAULT NULL,
  `SUBJECT_` varchar(200) DEFAULT NULL,
  `TASK_ID_` bigint(20) DEFAULT NULL,
  `TASK_NAME_` varchar(60) DEFAULT NULL,
  `TYPE_` varchar(20) DEFAULT NULL,
  `URL_` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_his_task
-- ----------------------------
INSERT INTO `uflo_his_task` VALUES ('18207', null, '开始', '18113', 'xuxh1', 'f9383132-863b-45a3-abba-430d6421fbde', '2018-01-15 18:08:27', null, '2018-01-15 18:08:27', '18202', null, 'xuxh1', '18201', '18201', 'Completed', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', '18206', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('18210', null, '部门填报', '18113', 'Gaof', 'f9383132-863b-45a3-abba-430d6421fbde', '2018-01-15 18:09:41', null, '2018-01-15 18:09:41', '18202', '同意:请求', 'Gaof', '18201', '18201', 'Completed', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', '18209', '【许晓卉】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('18215', null, '部门审核', '18113', 'yujj', 'f9383132-863b-45a3-abba-430d6421fbde', '2018-01-15 18:10:19', null, '2018-01-15 18:10:19', '18202', '同意:ok', 'yujj', '18201', '18201', 'Completed', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', '18214', '【高飞】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('18220', null, '市场部', '18113', 'yujj', 'f9383132-863b-45a3-abba-430d6421fbde', '2018-01-15 18:10:33', null, '2018-01-15 18:10:33', '18202', '同意:ok2', 'yujj', '18201', '18201', 'Completed', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', '18219', '【于晶锦】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('18225', null, '市场部审核', '18113', 'yujj', 'f9383132-863b-45a3-abba-430d6421fbde', '2018-01-15 18:10:42', null, '2018-01-15 18:10:42', '18202', '同意:rrr', 'yujj', '18201', '18201', 'Completed', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', '18224', '【于晶锦】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('18236', '', '开始', '18103', 'xuxh1', 'c348263f-4790-4df1-8e23-2b1f1eead2fc', '2018-01-15 21:31:38', null, '2018-01-15 21:31:38', '18231', null, 'xuxh1', '18230', '18230', 'Completed', '【合同】年计划填报：2018年度合同工作计划编制填报任务。【截止日期20180118】', '18235', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('18239', '', '部门填报', '18103', 'LuW', 'c348263f-4790-4df1-8e23-2b1f1eead2fc', '2018-01-15 21:41:26', null, '2018-01-15 21:41:26', '18231', '同意:OK', 'LuW', '18230', '18230', 'Completed', '【合同】年计划填报：2018年度合同工作计划编制填报任务。【截止日期20180118】', '18238', '【许晓卉】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18244', null, '部门审核', '18103', 'Yuany', 'c348263f-4790-4df1-8e23-2b1f1eead2fc', '2018-01-15 22:00:28', null, '2018-01-15 22:00:28', '18231', '同意:OK', 'Yuany', '18230', '18230', 'Completed', '【合同】年计划填报：2018年度合同工作计划编制填报任务。【截止日期20180118】', '18243', '【卢玮】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18255', null, '行政发布', '18107', 'xuxh1', '9553c4c5-a6d3-4d1a-b69e-5bc698fcb096', '2018-01-16 00:34:17', null, '2018-01-16 00:34:17', '18250', null, 'xuxh1', '18249', '18249', 'Completed', '周任务发布测试', '18254', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18264', null, '行政发布', '18107', 'xuxh1', 'e0963ffa-109e-42d7-a2ea-b790a2ff082b', '2018-01-16 00:34:18', null, '2018-01-16 00:34:18', '18259', null, 'xuxh1', '18258', '18258', 'Completed', '周任务发布测试', '18263', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18273', null, '行政发布', '18107', 'xuxh1', '6949bbbf-9944-427e-9231-682264b9c5c9', '2018-01-16 00:34:18', null, '2018-01-16 00:34:18', '18268', null, 'xuxh1', '18267', '18267', 'Completed', '周任务发布测试', '18272', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18282', null, '行政发布', '18107', 'xuxh1', '1d80d625-ed56-4726-a4d8-8da47958023f', '2018-01-16 00:34:18', null, '2018-01-16 00:34:18', '18277', null, 'xuxh1', '18276', '18276', 'Completed', '周任务发布测试', '18281', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18291', null, '行政发布', '18107', 'xuxh1', '1634f7da-6a9e-4bc5-8449-97029fb16adb', '2018-01-16 00:34:18', null, '2018-01-16 00:34:18', '18286', null, 'xuxh1', '18285', '18285', 'Completed', '周任务发布测试', '18290', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18300', null, '行政发布', '18107', 'xuxh1', 'f5835a4f-893e-4129-8f04-c95a4a21091c', '2018-01-16 00:34:18', null, '2018-01-16 00:34:18', '18295', null, 'xuxh1', '18294', '18294', 'Completed', '周任务发布测试', '18299', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18301', null, '行政确认', '18103', 'xuxh1', 'c348263f-4790-4df1-8e23-2b1f1eead2fc', '2018-01-15 22:23:33', null, '2018-01-15 22:23:33', '18231', '同意:OK', 'xuxh1', '18230', '18230', 'Completed', '【合同】年计划填报：2018年度合同工作计划编制填报任务。【截止日期20180118】', '18248', '【袁殷】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18311', null, '行政汇总', '18101', 'xuxh1', '698e302e-02da-4931-acd8-4809e4693d1f', '2018-01-15 22:36:34', null, '2018-01-15 22:36:34', '18306', null, 'xuxh1', '18305', '18305', 'Completed', '【合同】年计划汇总：2018合同年度计划任务汇总。【截止日期20180118】', '18310', '行政汇总', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18314', null, '部门审核', '18101', 'Qinxc', '698e302e-02da-4931-acd8-4809e4693d1f', '2018-01-15 22:49:19', null, '2018-01-15 22:49:19', '18306', '同意:请审核', 'Qinxc', '18305', '18305', 'Completed', '【合同】年计划汇总：2018合同年度计划任务汇总。【截止日期20180118】', '18313', '【许晓卉】提交的汇总审核', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18319', null, '高管审核', '18101', 'Wangh', '698e302e-02da-4931-acd8-4809e4693d1f', '2018-01-15 22:57:43', null, '2018-01-15 22:57:43', '18306', '同意:OK', 'Wangh', '18305', '18305', 'Completed', '【合同】年计划汇总：2018合同年度计划任务汇总。【截止日期20180118】', '18318', '【秦向春】提交的汇总审核', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18329', null, '开始', '18111', 'liuwl', '5efa5ecd-8139-41ee-8462-ba4cd8fbe0eb', '2018-01-15 23:12:20', null, '2018-01-15 23:12:20', '18324', null, 'liuwl', '18323', '18323', 'Completed', '【合同】月计划填报：2018年1月合同月计划任务发布测试。【截止日期20180118】', '18328', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('18332', null, '部门填报', '18111', 'LuW', '5efa5ecd-8139-41ee-8462-ba4cd8fbe0eb', '2018-01-15 23:51:29', null, '2018-01-15 23:51:29', '18324', '同意:OK', 'LuW', '18323', '18323', 'Completed', '【合同】月计划填报：2018年1月合同月计划任务发布测试。【截止日期20180118】', '18331', '【刘伟龙】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('18337', null, '部门审核', '18111', 'Yuany', '5efa5ecd-8139-41ee-8462-ba4cd8fbe0eb', '2018-01-15 23:59:49', null, '2018-01-15 23:59:49', '18324', '同意:OK', 'Yuany', '18323', '18323', 'Completed', '【合同】月计划填报：2018年1月合同月计划任务发布测试。【截止日期20180118】', '18336', '【卢玮】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('18342', null, '行政确认', '18111', 'xuxh1', '5efa5ecd-8139-41ee-8462-ba4cd8fbe0eb', '2018-01-16 00:03:22', null, '2018-01-16 00:03:22', '18324', '同意:OK', 'xuxh1', '18323', '18323', 'Completed', '【合同】月计划填报：2018年1月合同月计划任务发布测试。【截止日期20180118】', '18341', '【袁殷】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('18352', null, '开始', '18111', 'xuxh1', 'e8ad3707-d7c2-4efd-a8bd-8409c8c46617', '2018-01-16 00:05:56', null, '2018-01-16 00:05:56', '18347', null, 'xuxh1', '18346', '18346', 'Completed', '【合同】月计划填报：2018年1月合同月计划任务发布测试1。【截止日期20180118】', '18351', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('18355', null, '部门填报', '18111', 'LuW', 'e8ad3707-d7c2-4efd-a8bd-8409c8c46617', '2018-01-16 00:06:37', null, '2018-01-16 00:06:37', '18347', '同意:OK', 'LuW', '18346', '18346', 'Completed', '【合同】月计划填报：2018年1月合同月计划任务发布测试1。【截止日期20180118】', '18354', '【许晓卉】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('18360', null, '部门审核', '18111', 'Yuany', 'e8ad3707-d7c2-4efd-a8bd-8409c8c46617', '2018-01-16 00:07:05', null, '2018-01-16 00:07:05', '18347', '同意:OK', 'Yuany', '18346', '18346', 'Completed', '【合同】月计划填报：2018年1月合同月计划任务发布测试1。【截止日期20180118】', '18359', '【卢玮】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('18365', null, '行政确认', '18111', 'xuxh1', 'e8ad3707-d7c2-4efd-a8bd-8409c8c46617', '2018-01-16 00:09:03', null, '2018-01-16 00:09:03', '18347', '同意:ok', 'xuxh1', '18346', '18346', 'Completed', '【合同】月计划填报：2018年1月合同月计划任务发布测试1。【截止日期20180118】', '18364', '【袁殷】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('18409', null, '行政发布', '18107', 'xuxh1', 'd0f41896-0f4f-4f8b-9967-201b0f920b28', '2018-01-16 00:34:19', null, '2018-01-16 00:34:19', '18404', null, 'xuxh1', '18403', '18403', 'Completed', '周任务发布测试', '18408', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18418', null, '行政发布', '18107', 'xuxh1', 'ae7db010-47d7-4921-8526-34868b6de3f1', '2018-01-16 00:34:19', null, '2018-01-16 00:34:19', '18413', null, 'xuxh1', '18412', '18412', 'Completed', '周任务发布测试', '18417', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18427', null, '行政发布', '18107', 'xuxh1', 'd4caeee9-2461-4c5d-8fed-96da741693e9', '2018-01-16 00:34:19', null, '2018-01-16 00:34:19', '18422', null, 'xuxh1', '18421', '18421', 'Completed', '周任务发布测试', '18426', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18436', null, '行政发布', '18107', 'xuxh1', '60d3e3f9-f911-4b88-a4f3-9169e6268687', '2018-01-16 00:34:19', null, '2018-01-16 00:34:19', '18431', null, 'xuxh1', '18430', '18430', 'Completed', '周任务发布测试', '18435', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18445', null, '行政发布', '18107', 'xuxh1', 'dcdb090a-287b-4d60-8454-8b292131b9bf', '2018-01-16 00:34:19', null, '2018-01-16 00:34:19', '18440', null, 'xuxh1', '18439', '18439', 'Completed', '周任务发布测试', '18444', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18454', null, '行政发布', '18107', 'xuxh1', 'ee9eddb1-8186-4f07-8fde-072e40393c93', '2018-01-16 00:34:19', null, '2018-01-16 00:34:19', '18449', null, 'xuxh1', '18448', '18448', 'Completed', '周任务发布测试', '18453', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18463', null, '行政发布', '18107', 'xuxh1', '15eff167-1a38-41cc-93a5-044bdcf43467', '2018-01-16 00:37:47', null, '2018-01-16 00:37:47', '18458', null, 'xuxh1', '18457', '18457', 'Completed', '周任务测试2', '18462', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18472', null, '行政发布', '18107', 'xuxh1', 'ea663ce0-d01d-402b-9066-1f381895ceaa', '2018-01-16 00:37:48', null, '2018-01-16 00:37:48', '18467', null, 'xuxh1', '18466', '18466', 'Completed', '周任务测试2', '18471', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18481', null, '行政发布', '18107', 'xuxh1', 'c27d0ab2-11c5-4d6a-89fc-468eca6b122c', '2018-01-16 00:37:48', null, '2018-01-16 00:37:48', '18476', null, 'xuxh1', '18475', '18475', 'Completed', '周任务测试2', '18480', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18490', null, '行政发布', '18107', 'xuxh1', '0096ce13-658c-4ea1-a109-c56781a80a5c', '2018-01-16 00:37:48', null, '2018-01-16 00:37:48', '18485', null, 'xuxh1', '18484', '18484', 'Completed', '周任务测试2', '18489', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18499', null, '行政发布', '18107', 'xuxh1', '2616d459-e981-49e9-a977-46089c260f00', '2018-01-16 00:37:48', null, '2018-01-16 00:37:48', '18494', null, 'xuxh1', '18493', '18493', 'Completed', '周任务测试2', '18498', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18508', null, '行政发布', '18107', 'xuxh1', '52fecc93-d10f-4e07-b743-7002b1e291b1', '2018-01-16 00:37:48', null, '2018-01-16 00:37:48', '18503', null, 'xuxh1', '18502', '18502', 'Completed', '周任务测试2', '18507', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18517', null, '行政发布', '18107', 'xuxh1', '36b41911-74be-4e89-a268-bdefb613eebf', '2018-01-16 00:37:48', null, '2018-01-16 00:37:48', '18512', null, 'xuxh1', '18511', '18511', 'Completed', '周任务测试2', '18516', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18526', null, '行政发布', '18107', 'xuxh1', '55226ed2-fc50-4b10-89aa-5d6e16c8d3e6', '2018-01-16 00:37:49', null, '2018-01-16 00:37:49', '18521', null, 'xuxh1', '18520', '18520', 'Completed', '周任务测试2', '18525', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18535', null, '行政发布', '18107', 'xuxh1', 'b94622eb-9743-4ea5-aeb6-1c138bb8c5f0', '2018-01-16 00:37:49', null, '2018-01-16 00:37:49', '18530', null, 'xuxh1', '18529', '18529', 'Completed', '周任务测试2', '18534', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18544', null, '行政发布', '18107', 'xuxh1', '4adfdae1-a6b2-4c2f-9818-190dcb3813e0', '2018-01-16 00:37:49', null, '2018-01-16 00:37:49', '18539', null, 'xuxh1', '18538', '18538', 'Completed', '周任务测试2', '18543', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18553', null, '行政发布', '18107', 'xuxh1', '7707638d-2fbc-4f02-901d-f20079dcb089', '2018-01-16 00:37:49', null, '2018-01-16 00:37:49', '18548', null, 'xuxh1', '18547', '18547', 'Completed', '周任务测试2', '18552', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18562', null, '行政发布', '18107', 'xuxh1', '832baec1-7764-4874-be19-6c8490e573c3', '2018-01-16 00:37:49', null, '2018-01-16 00:37:49', '18557', null, 'xuxh1', '18556', '18556', 'Completed', '周任务测试2', '18561', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18565', null, '任务填报', '18107', 'xuxh1', '4adfdae1-a6b2-4c2f-9818-190dcb3813e0', '2018-01-16 00:41:47', null, '2018-01-16 00:41:47', '18539', '', 'xuxh1', '18538', '18538', 'Completed', '周任务测试2', '18546', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18570', null, '任务填报', '18107', 'xuxh1', '60d3e3f9-f911-4b88-a4f3-9169e6268687', '2018-01-16 00:44:59', null, '2018-01-16 00:44:59', '18431', '', 'xuxh1', '18430', '18430', 'Completed', '周任务发布测试', '18438', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18575', null, '部门审核', '18107', 'Qinxc', '4adfdae1-a6b2-4c2f-9818-190dcb3813e0', '2018-01-16 00:48:37', null, '2018-01-16 00:48:37', '18539', '同意', 'Qinxc', '18538', '18538', 'Completed', '周任务测试2', '18569', '【许晓卉】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18585', null, '行政发布', '18107', 'xuxh1', '25bace80-aec3-49cf-a615-3e36a4bfb5b4', '2018-01-16 08:56:39', null, '2018-01-16 08:56:39', '18580', null, 'xuxh1', '18579', '18579', 'Completed', '周任务测试33', '18584', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18594', null, '行政发布', '18107', 'xuxh1', 'c80a41ef-fb10-4d9a-b7f0-8a5e7d2da698', '2018-01-16 08:56:39', null, '2018-01-16 08:56:39', '18589', null, 'xuxh1', '18588', '18588', 'Completed', '周任务测试33', '18593', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18603', null, '行政发布', '18107', 'xuxh1', 'bb689532-7e73-4a46-aa8e-32804733d250', '2018-01-16 08:56:39', null, '2018-01-16 08:56:39', '18598', null, 'xuxh1', '18597', '18597', 'Completed', '周任务测试33', '18602', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18612', null, '行政发布', '18107', 'xuxh1', 'bc70fa31-ddc3-46e0-a3c1-bec03cc6192d', '2018-01-16 08:56:39', null, '2018-01-16 08:56:39', '18607', null, 'xuxh1', '18606', '18606', 'Completed', '周任务测试33', '18611', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18621', null, '行政发布', '18107', 'xuxh1', '781fab63-7d3d-4a53-a89c-c5e25b9869b4', '2018-01-16 08:56:40', null, '2018-01-16 08:56:40', '18616', null, 'xuxh1', '18615', '18615', 'Completed', '周任务测试33', '18620', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18630', null, '行政发布', '18107', 'xuxh1', 'd6a26344-c24b-4612-bc04-253b39184b78', '2018-01-16 08:56:40', null, '2018-01-16 08:56:40', '18625', null, 'xuxh1', '18624', '18624', 'Completed', '周任务测试33', '18629', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18639', null, '行政发布', '18107', 'xuxh1', '421dd18b-e08a-4d1a-9408-f8c91663bef7', '2018-01-16 08:56:40', null, '2018-01-16 08:56:40', '18634', null, 'xuxh1', '18633', '18633', 'Completed', '周任务测试33', '18638', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18648', null, '行政发布', '18107', 'xuxh1', '7c0acf96-0050-4436-9569-572dcdae70bc', '2018-01-16 08:56:40', null, '2018-01-16 08:56:40', '18643', null, 'xuxh1', '18642', '18642', 'Completed', '周任务测试33', '18647', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18657', null, '行政发布', '18107', 'xuxh1', 'b6be0169-3f19-40e3-8d0d-e5f59776a276', '2018-01-16 08:56:40', null, '2018-01-16 08:56:40', '18652', null, 'xuxh1', '18651', '18651', 'Completed', '周任务测试33', '18656', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18666', null, '行政发布', '18107', 'xuxh1', '06f90f18-73c3-4ef5-b24f-6bd259692420', '2018-01-16 08:56:40', null, '2018-01-16 08:56:40', '18661', null, 'xuxh1', '18660', '18660', 'Completed', '周任务测试33', '18665', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18675', null, '行政发布', '18107', 'xuxh1', '870a12b6-435b-4c10-bc05-60ee3bac0cf9', '2018-01-16 08:56:40', null, '2018-01-16 08:56:40', '18670', null, 'xuxh1', '18669', '18669', 'Completed', '周任务测试33', '18674', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18684', null, '行政发布', '18107', 'xuxh1', 'fe137b3e-6eb4-4d75-a206-0f7ed7582e1f', '2018-01-16 08:56:40', null, '2018-01-16 08:56:40', '18679', null, 'xuxh1', '18678', '18678', 'Completed', '周任务测试33', '18683', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18687', null, '任务填报', '18107', 'xuxh1', '06f90f18-73c3-4ef5-b24f-6bd259692420', '2018-01-16 08:57:57', null, '2018-01-16 08:57:57', '18661', '', 'xuxh1', '18660', '18660', 'Completed', '周任务测试33', '18668', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('18698', '', '开始', '18103', 'xuxh1', '8cc4c6e8-3896-4afc-b1e1-95dab3a77731', '2018-01-16 09:09:17', null, '2018-01-16 09:09:17', '18693', null, 'xuxh1', '18692', '18692', 'Completed', '【合同】年计划填报：2018年合同计划发布测试。【截止日期20180120】', '18697', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('18701', '', '部门填报', '18103', 'LuW', '8cc4c6e8-3896-4afc-b1e1-95dab3a77731', '2018-01-16 09:12:43', null, '2018-01-16 09:12:43', '18693', '同意:请审批', 'LuW', '18692', '18692', 'Completed', '【合同】年计划填报：2018年合同计划发布测试。【截止日期20180120】', '18700', '【许晓卉】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18706', null, '部门审核', '18103', 'Yuany', '8cc4c6e8-3896-4afc-b1e1-95dab3a77731', '2018-01-16 09:14:39', null, '2018-01-16 09:14:39', '18693', '同意:OK', 'Yuany', '18692', '18692', 'Completed', '【合同】年计划填报：2018年合同计划发布测试。【截止日期20180120】', '18705', '【卢玮】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18717', null, '行政汇总', '18101', 'xuxh1', 'e153e4f2-e0ea-498e-a192-9e863a8c0617', '2018-01-16 09:19:08', null, '2018-01-16 09:19:08', '18712', null, 'xuxh1', '18711', '18711', 'Completed', '【合同】年计划汇总：2018年合同计划汇总。【截止日期20180120】', '18716', '行政汇总', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18720', null, '部门审核', '18101', 'Qinxc', 'e153e4f2-e0ea-498e-a192-9e863a8c0617', '2018-01-16 09:20:14', null, '2018-01-16 09:20:14', '18712', '同意:OK', 'Qinxc', '18711', '18711', 'Completed', '【合同】年计划汇总：2018年合同计划汇总。【截止日期20180120】', '18719', '【许晓卉】提交的汇总审核', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18801', null, '行政确认', '18103', 'xuxh1', '8cc4c6e8-3896-4afc-b1e1-95dab3a77731', '2018-01-16 09:18:26', null, '2018-01-16 09:18:26', '18693', '同意:同意', 'xuxh1', '18692', '18692', 'Completed', '【合同】年计划填报：2018年合同计划发布测试。【截止日期20180120】', '18710', '【袁殷】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18805', null, '高管审核', '18101', 'Wangh', 'e153e4f2-e0ea-498e-a192-9e863a8c0617', '2018-01-16 09:21:28', null, '2018-01-16 09:21:28', '18712', '同意:同意', 'Wangh', '18711', '18711', 'Completed', '【合同】年计划汇总：2018年合同计划汇总。【截止日期20180120】', '18724', '【秦向春】提交的汇总审核', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_his_task` VALUES ('18815', null, '开始', '18111', 'liuwl', '38b820be-34cd-4c57-b747-bd3387c4efaf', '2018-01-16 09:27:37', null, '2018-01-16 09:27:37', '18810', null, 'liuwl', '18809', '18809', 'Completed', '【合同】月计划填报：1月合同测试。【截止日期20180120】', '18814', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('18818', null, '部门填报', '18111', 'LuW', '38b820be-34cd-4c57-b747-bd3387c4efaf', '2018-01-16 09:31:14', null, '2018-01-16 09:31:14', '18810', '同意:OK', 'LuW', '18809', '18809', 'Completed', '【合同】月计划填报：1月合同测试。【截止日期20180120】', '18817', '【刘伟龙】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('18829', '', '开始', '18105', 'Yuany', '499b5202-36c8-46f0-8e7f-3ce65be0d90b', '2018-01-16 09:40:37', null, '2018-01-16 09:40:37', '18824', null, 'Yuany', '18823', '18823', 'Completed', '【产值】年计划填报：产值测试。【截止日期20180119】', '18828', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('18907', null, '开始', '18109', 'xuxh1', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', '2018-01-16 11:56:41', null, '2018-01-16 11:56:41', '18902', null, 'xuxh1', '18901', '18901', 'Completed', '【合同】月计划汇总：2018年1月合同计划汇总测试。【截止日期20180118】', '18906', '开始', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('19007', null, '行政发布', '18107', 'yangying', '7882e297-4731-4559-9ca6-2ca854714b59', '2018-01-17 09:24:43', null, '2018-01-17 09:24:43', '19002', null, 'yangying', '19001', '19001', 'Completed', '检测中心（实验室）第四周工作计划', '19006', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19016', null, '行政发布', '18107', 'yangying', '1b35cbd2-011d-4fbe-ab70-4f93f29df891', '2018-01-17 09:24:43', null, '2018-01-17 09:24:43', '19011', null, 'yangying', '19010', '19010', 'Completed', '检测中心（实验室）第四周工作计划', '19015', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19025', null, '行政发布', '18107', 'yangying', '43fedd93-0b99-4f0a-a3bc-a473650063de', '2018-01-17 09:24:44', null, '2018-01-17 09:24:44', '19020', null, 'yangying', '19019', '19019', 'Completed', '检测中心（实验室）第四周工作计划', '19024', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19034', null, '行政发布', '18107', 'yangying', 'bc121d8f-0246-471c-bc36-6c55902ba97e', '2018-01-17 09:24:44', null, '2018-01-17 09:24:44', '19029', null, 'yangying', '19028', '19028', 'Completed', '检测中心（实验室）第四周工作计划', '19033', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19043', null, '行政发布', '18107', 'yangying', '22ab66eb-9adc-463d-af3f-ce98ddfeb8ae', '2018-01-17 09:24:44', null, '2018-01-17 09:24:44', '19038', null, 'yangying', '19037', '19037', 'Completed', '检测中心（实验室）第四周工作计划', '19042', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19052', null, '行政发布', '18107', 'yangying', '97d6f46f-7c37-41d2-b581-c0b838a1be13', '2018-01-17 09:24:44', null, '2018-01-17 09:24:44', '19047', null, 'yangying', '19046', '19046', 'Completed', '检测中心（实验室）第四周工作计划', '19051', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19061', null, '行政发布', '18107', 'yangying', '5a88995f-ad01-4502-80a8-f829d83eb34f', '2018-01-17 09:24:44', null, '2018-01-17 09:24:44', '19056', null, 'yangying', '19055', '19055', 'Completed', '检测中心（实验室）第四周工作计划', '19060', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19064', null, '任务填报', '18107', 'yangying', '43fedd93-0b99-4f0a-a3bc-a473650063de', '2018-01-17 09:25:50', null, '2018-01-17 09:25:50', '19020', '', 'yangying', '19019', '19019', 'Completed', '检测中心（实验室）第四周工作计划', '19027', '【杨迎】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19069', null, '部门审核', '18107', 'Cuihh', '43fedd93-0b99-4f0a-a3bc-a473650063de', '2018-01-17 09:38:46', null, '2018-01-17 09:38:46', '19020', '', 'Cuihh', '19019', '19019', 'Completed', '检测中心（实验室）第四周工作计划', '19068', '【杨迎】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19073', null, '任务填报', '18107', 'Cuihh', '7882e297-4731-4559-9ca6-2ca854714b59', '2018-01-17 09:38:55', null, '2018-01-17 09:38:55', '19002', '', 'Cuihh', '19001', '19001', 'Completed', '检测中心（实验室）第四周工作计划', '19009', '【杨迎】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19078', null, '部门审核', '18107', 'Cuihh', '7882e297-4731-4559-9ca6-2ca854714b59', '2018-01-17 09:39:02', null, '2018-01-17 09:39:02', '19002', '', 'Cuihh', '19001', '19001', 'Completed', '检测中心（实验室）第四周工作计划', '19077', '【崔海华】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19082', null, '任务填报', '18107', 'Zhaom', '5a88995f-ad01-4502-80a8-f829d83eb34f', '2018-01-17 09:49:57', null, '2018-01-17 09:49:57', '19056', '', 'Zhaom', '19055', '19055', 'Completed', '检测中心（实验室）第四周工作计划', '19063', '【杨迎】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19093', null, '行政发布', '18107', 'Gaocr', '230a24af-8d7a-47be-934e-f7f25ab6e14d', '2018-01-17 10:13:37', null, '2018-01-17 10:13:37', '19088', null, 'Gaocr', '19087', '19087', 'Completed', '填报1月第四周工作计划', '19092', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19102', null, '行政发布', '18107', 'Gaocr', 'e51c3999-d1fb-404d-8766-7bd63f11c38d', '2018-01-17 10:13:37', null, '2018-01-17 10:13:37', '19097', null, 'Gaocr', '19096', '19096', 'Completed', '填报1月第四周工作计划', '19101', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19111', null, '行政发布', '18107', 'Gaocr', '0398b9d0-024f-4a4e-846e-1edd9cda942d', '2018-01-17 10:13:37', null, '2018-01-17 10:13:37', '19106', null, 'Gaocr', '19105', '19105', 'Completed', '填报1月第四周工作计划', '19110', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19120', null, '行政发布', '18107', 'Gaocr', 'd1ec6d90-be03-445a-b1e5-da7aeffd8886', '2018-01-17 10:13:37', null, '2018-01-17 10:13:37', '19115', null, 'Gaocr', '19114', '19114', 'Completed', '填报1月第四周工作计划', '19119', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19129', null, '行政发布', '18107', 'Gaocr', '4910ef81-8dd5-434e-a0d7-4c56944339dd', '2018-01-17 10:13:37', null, '2018-01-17 10:13:37', '19124', null, 'Gaocr', '19123', '19123', 'Completed', '填报1月第四周工作计划', '19128', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19138', null, '行政发布', '18107', 'Gaocr', 'b33b6996-5ef9-4a57-9660-a49de1c7dada', '2018-01-17 10:13:38', null, '2018-01-17 10:13:38', '19133', null, 'Gaocr', '19132', '19132', 'Completed', '填报1月第四周工作计划', '19137', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19147', null, '行政发布', '18107', 'Gaocr', '4ee61181-e9f2-4e86-a46b-ade2627a5a66', '2018-01-17 10:13:38', null, '2018-01-17 10:13:38', '19142', null, 'Gaocr', '19141', '19141', 'Completed', '填报1月第四周工作计划', '19146', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19156', null, '行政发布', '18107', 'Gaocr', 'c7446aeb-a7a9-4709-ba09-9a3589f0a825', '2018-01-17 10:13:38', null, '2018-01-17 10:13:38', '19151', null, 'Gaocr', '19150', '19150', 'Completed', '填报1月第四周工作计划', '19155', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19165', null, '行政发布', '18107', 'Gaocr', 'd543db2c-7780-44b8-8907-e811ced8d4f2', '2018-01-17 10:13:38', null, '2018-01-17 10:13:38', '19160', null, 'Gaocr', '19159', '19159', 'Completed', '填报1月第四周工作计划', '19164', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19174', null, '行政发布', '18107', 'Gaocr', 'f9a4c3b3-c61d-4184-83ec-c6f3b3b836fe', '2018-01-17 10:13:38', null, '2018-01-17 10:13:38', '19169', null, 'Gaocr', '19168', '19168', 'Completed', '填报1月第四周工作计划', '19173', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19177', null, '任务填报', '18107', 'Gaocr', 'f9a4c3b3-c61d-4184-83ec-c6f3b3b836fe', '2018-01-17 10:17:57', null, '2018-01-17 10:17:57', '19169', '', 'Gaocr', '19168', '19168', 'Completed', '填报1月第四周工作计划', '19176', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19182', null, '任务填报', '18107', 'Chengy', '22ab66eb-9adc-463d-af3f-ce98ddfeb8ae', '2018-01-17 10:30:22', null, '2018-01-17 10:30:22', '19038', '', 'Chengy', '19037', '19037', 'Completed', '检测中心（实验室）第四周工作计划', '19045', '【杨迎】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19187', null, '任务填报', '18107', 'Tongt', 'b33b6996-5ef9-4a57-9660-a49de1c7dada', '2018-01-17 17:43:40', null, '2018-01-17 17:43:40', '19133', '', 'Tongt', '19132', '19132', 'Completed', '填报1月第四周工作计划', '19140', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19192', null, '任务填报', '18107', 'Taoxf', '4910ef81-8dd5-434e-a0d7-4c56944339dd', '2018-01-17 23:32:41', null, '2018-01-17 23:32:41', '19124', '', 'Taoxf', '19123', '19123', 'Completed', '填报1月第四周工作计划', '19131', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19197', null, '任务填报', '18107', 'zhoud', 'd543db2c-7780-44b8-8907-e811ced8d4f2', '2018-01-18 09:07:30', null, '2018-01-18 09:07:30', '19160', '', 'zhoud', '19159', '19159', 'Completed', '填报1月第四周工作计划', '19167', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19202', null, '任务填报', '18107', 'Duanwb', 'e51c3999-d1fb-404d-8766-7bd63f11c38d', '2018-01-18 09:17:39', null, '2018-01-18 09:17:39', '19097', '', 'Duanwb', '19096', '19096', 'Completed', '填报1月第四周工作计划', '19104', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19213', null, '行政发布', '18107', 'Cuihh', '0b03a9f1-6f75-4dca-a987-bcc1d0b611ea', '2018-01-18 16:53:21', null, '2018-01-18 16:53:21', '19208', null, 'Cuihh', '19207', '19207', 'Completed', '2018年第3周工作计划填报', '19212', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19222', null, '行政发布', '18107', 'Cuihh', 'b0f8644c-bb61-48d4-91d6-d8f7b344f64a', '2018-01-18 16:53:21', null, '2018-01-18 16:53:21', '19217', null, 'Cuihh', '19216', '19216', 'Completed', '2018年第3周工作计划填报', '19221', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19231', null, '行政发布', '18107', 'Cuihh', '3142cbcb-8018-4cda-b637-8656a387cd6a', '2018-01-18 16:53:21', null, '2018-01-18 16:53:21', '19226', null, 'Cuihh', '19225', '19225', 'Completed', '2018年第3周工作计划填报', '19230', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19240', null, '行政发布', '18107', 'Cuihh', 'b146d22a-0bb8-419a-a40e-8fc20a54fbd6', '2018-01-18 16:53:22', null, '2018-01-18 16:53:22', '19235', null, 'Cuihh', '19234', '19234', 'Completed', '2018年第3周工作计划填报', '19239', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19249', null, '行政发布', '18107', 'Cuihh', '072e95f1-7b3f-497a-9d2f-39184f6d7f7e', '2018-01-18 16:53:22', null, '2018-01-18 16:53:22', '19244', null, 'Cuihh', '19243', '19243', 'Completed', '2018年第3周工作计划填报', '19248', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19258', null, '行政发布', '18107', 'Cuihh', '7909eab5-a09c-4a25-9469-1947852418c2', '2018-01-18 16:53:22', null, '2018-01-18 16:53:22', '19253', null, 'Cuihh', '19252', '19252', 'Completed', '2018年第3周工作计划填报', '19257', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19267', null, '行政发布', '18107', 'Cuihh', 'ecd03c7f-94b1-4cc7-a369-3b2fbc196de9', '2018-01-18 16:53:22', null, '2018-01-18 16:53:22', '19262', null, 'Cuihh', '19261', '19261', 'Completed', '2018年第3周工作计划填报', '19266', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19276', null, '行政发布', '18107', 'Cuihh', '64dec6d0-f2b9-40b9-9a6a-98f29a9b28d4', '2018-01-18 16:53:22', null, '2018-01-18 16:53:22', '19271', null, 'Cuihh', '19270', '19270', 'Completed', '2018年第3周工作计划填报', '19275', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19285', null, '行政发布', '18107', 'Cuihh', '101d6199-5b46-463a-9cae-0c3a0b7b443a', '2018-01-18 16:53:22', null, '2018-01-18 16:53:22', '19280', null, 'Cuihh', '19279', '19279', 'Completed', '2018年第3周工作计划填报', '19284', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19294', null, '行政发布', '18107', 'Cuihh', '4df5de45-e12d-4dd8-8d8a-0fa3f7262575', '2018-01-18 16:53:22', null, '2018-01-18 16:53:22', '19289', null, 'Cuihh', '19288', '19288', 'Completed', '2018年第3周工作计划填报', '19293', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19303', null, '行政发布', '18107', 'Cuihh', 'bd6780f1-d59e-4769-a3cb-c2874cf891aa', '2018-01-18 16:53:23', null, '2018-01-18 16:53:23', '19298', null, 'Cuihh', '19297', '19297', 'Completed', '2018年第3周工作计划填报', '19302', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19312', null, '行政发布', '18107', 'Cuihh', 'f0c839b2-46c6-42c0-9875-f46a1e827a43', '2018-01-18 16:53:23', null, '2018-01-18 16:53:23', '19307', null, 'Cuihh', '19306', '19306', 'Completed', '2018年第3周工作计划填报', '19311', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19321', null, '行政发布', '18107', 'Cuihh', '15319e70-459b-4488-8384-422099bdfea4', '2018-01-18 16:53:23', null, '2018-01-18 16:53:23', '19316', null, 'Cuihh', '19315', '19315', 'Completed', '2018年第3周工作计划填报', '19320', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19330', null, '行政发布', '18107', 'Cuihh', '8a642e91-d8ee-4c5b-bde7-e94fec5097f3', '2018-01-18 16:53:23', null, '2018-01-18 16:53:23', '19325', null, 'Cuihh', '19324', '19324', 'Completed', '2018年第3周工作计划填报', '19329', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19339', null, '行政发布', '18107', 'Cuihh', '83c040e1-cdd9-4b19-a14f-c2b86867dbba', '2018-01-18 16:53:23', null, '2018-01-18 16:53:23', '19334', null, 'Cuihh', '19333', '19333', 'Completed', '2018年第3周工作计划填报', '19338', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19348', null, '行政发布', '18107', 'Cuihh', '1fc7030e-19c6-4855-9af0-088f1a99d270', '2018-01-18 16:53:24', null, '2018-01-18 16:53:24', '19343', null, 'Cuihh', '19342', '19342', 'Completed', '2018年第3周工作计划填报', '19347', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19357', null, '行政发布', '18107', 'Cuihh', '57b0463f-ed25-4e6b-99c5-3d1e98d3ba54', '2018-01-18 16:53:24', null, '2018-01-18 16:53:24', '19352', null, 'Cuihh', '19351', '19351', 'Completed', '2018年第3周工作计划填报', '19356', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19366', null, '行政发布', '18107', 'Cuihh', '3e906c2c-673b-4635-b864-75c0354ce8ba', '2018-01-18 16:53:24', null, '2018-01-18 16:53:24', '19361', null, 'Cuihh', '19360', '19360', 'Completed', '2018年第3周工作计划填报', '19365', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19375', null, '行政发布', '18107', 'Cuihh', 'e4b3877f-47f4-4bda-b23b-810de0317285', '2018-01-18 16:53:24', null, '2018-01-18 16:53:24', '19370', null, 'Cuihh', '19369', '19369', 'Completed', '2018年第3周工作计划填报', '19374', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19384', null, '行政发布', '18107', 'Cuihh', 'bf10d65b-e145-4045-a0e3-b73109db6875', '2018-01-18 16:53:24', null, '2018-01-18 16:53:24', '19379', null, 'Cuihh', '19378', '19378', 'Completed', '2018年第3周工作计划填报', '19383', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19393', null, '行政发布', '18107', 'Cuihh', '33bf6d89-00d6-4952-870d-66f93500ad92', '2018-01-18 16:53:24', null, '2018-01-18 16:53:24', '19388', null, 'Cuihh', '19387', '19387', 'Completed', '2018年第3周工作计划填报', '19392', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19402', null, '行政发布', '18107', 'Cuihh', '6da38ffb-0125-4dfa-938d-9739dbdbd244', '2018-01-18 16:53:25', null, '2018-01-18 16:53:25', '19397', null, 'Cuihh', '19396', '19396', 'Completed', '2018年第3周工作计划填报', '19401', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19411', null, '行政发布', '18107', 'Cuihh', '34e528fa-bf83-4643-a183-aed0aca065ee', '2018-01-18 16:53:25', null, '2018-01-18 16:53:25', '19406', null, 'Cuihh', '19405', '19405', 'Completed', '2018年第3周工作计划填报', '19410', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19420', null, '行政发布', '18107', 'Cuihh', 'f47ba3e3-e91d-42c0-a5dd-95be827c7876', '2018-01-18 16:53:25', null, '2018-01-18 16:53:25', '19415', null, 'Cuihh', '19414', '19414', 'Completed', '2018年第3周工作计划填报', '19419', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19429', null, '行政发布', '18107', 'Cuihh', 'b0d3e17c-047e-4d3e-a1f1-d3282e753781', '2018-01-18 16:53:25', null, '2018-01-18 16:53:25', '19424', null, 'Cuihh', '19423', '19423', 'Completed', '2018年第3周工作计划填报', '19428', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19438', null, '行政发布', '18107', 'Cuihh', 'a49a15d0-10ec-4c91-84a4-1f92d68180d7', '2018-01-18 16:53:25', null, '2018-01-18 16:53:25', '19433', null, 'Cuihh', '19432', '19432', 'Completed', '2018年第3周工作计划填报', '19437', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19447', null, '行政发布', '18107', 'Cuihh', 'ab4f2726-7ebf-46e6-bc40-d5b638a7455a', '2018-01-18 16:53:25', null, '2018-01-18 16:53:25', '19442', null, 'Cuihh', '19441', '19441', 'Completed', '2018年第3周工作计划填报', '19446', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19456', null, '行政发布', '18107', 'Cuihh', '5a338b10-63ae-4d11-a8de-4c0b77b34e25', '2018-01-18 16:53:25', null, '2018-01-18 16:53:25', '19451', null, 'Cuihh', '19450', '19450', 'Completed', '2018年第3周工作计划填报', '19455', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19465', null, '行政发布', '18107', 'Cuihh', '6a92664b-2e48-46c0-a718-ffd0b1ff3234', '2018-01-18 16:53:26', null, '2018-01-18 16:53:26', '19460', null, 'Cuihh', '19459', '19459', 'Completed', '2018年第3周工作计划填报', '19464', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19468', null, '任务填报', '18107', 'Cuihh', 'f0c839b2-46c6-42c0-9875-f46a1e827a43', '2018-01-18 16:57:38', null, '2018-01-18 16:57:38', '19307', '', 'Cuihh', '19306', '19306', 'Completed', '2018年第3周工作计划填报', '19314', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19473', null, '部门审核', '18107', 'Cuihh', 'f0c839b2-46c6-42c0-9875-f46a1e827a43', '2018-01-18 16:57:47', null, '2018-01-18 16:57:47', '19307', '', 'Cuihh', '19306', '19306', 'Completed', '2018年第3周工作计划填报', '19472', '【崔海华】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19477', null, '任务填报', '18107', 'Cuihh', 'bf10d65b-e145-4045-a0e3-b73109db6875', '2018-01-18 16:57:54', null, '2018-01-18 16:57:54', '19379', '', 'Cuihh', '19378', '19378', 'Completed', '2018年第3周工作计划填报', '19386', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19482', null, '部门审核', '18107', 'Cuihh', 'bf10d65b-e145-4045-a0e3-b73109db6875', '2018-01-18 16:58:00', null, '2018-01-18 16:58:00', '19379', '', 'Cuihh', '19378', '19378', 'Completed', '2018年第3周工作计划填报', '19481', '【崔海华】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19486', null, '任务填报', '18107', 'yangying', 'ecd03c7f-94b1-4cc7-a369-3b2fbc196de9', '2018-01-18 16:58:05', null, '2018-01-18 16:58:05', '19262', '', 'yangying', '19261', '19261', 'Completed', '2018年第3周工作计划填报', '19269', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19491', null, '任务填报', '18107', 'Cuihh', '072e95f1-7b3f-497a-9d2f-39184f6d7f7e', '2018-01-18 16:58:06', null, '2018-01-18 16:58:06', '19244', '', 'Cuihh', '19243', '19243', 'Completed', '2018年第3周工作计划填报', '19251', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19496', null, '部门审核', '18107', 'Cuihh', '072e95f1-7b3f-497a-9d2f-39184f6d7f7e', '2018-01-18 16:58:11', null, '2018-01-18 16:58:11', '19244', '', 'Cuihh', '19243', '19243', 'Completed', '2018年第3周工作计划填报', '19495', '【崔海华】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19500', null, '任务填报', '18107', 'Guangwx', '0398b9d0-024f-4a4e-846e-1edd9cda942d', '2018-01-18 16:58:33', null, '2018-01-18 16:58:33', '19106', '', 'Guangwx', '19105', '19105', 'Completed', '填报1月第四周工作计划', '19113', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19505', null, '任务填报', '18107', 'Guangwx', '6da38ffb-0125-4dfa-938d-9739dbdbd244', '2018-01-18 16:58:49', null, '2018-01-18 16:58:49', '19397', '', 'Guangwx', '19396', '19396', 'Completed', '2018年第3周工作计划填报', '19404', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19510', null, '任务填报', '18107', 'Huangsx', 'd1ec6d90-be03-445a-b1e5-da7aeffd8886', '2018-01-18 17:11:27', null, '2018-01-18 17:11:27', '19115', '', 'Huangsx', '19114', '19114', 'Completed', '填报1月第四周工作计划', '19122', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19515', null, '任务填报', '18107', 'Huangsx', '34e528fa-bf83-4643-a183-aed0aca065ee', '2018-01-18 17:13:14', null, '2018-01-18 17:13:14', '19406', '', 'Huangsx', '19405', '19405', 'Completed', '2018年第3周工作计划填报', '19413', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19520', null, '部门审核', '18107', 'Cuihh', '34e528fa-bf83-4643-a183-aed0aca065ee', '2018-01-18 17:16:13', null, '2018-01-18 17:16:13', '19406', '', 'Cuihh', '19405', '19405', 'Completed', '2018年第3周工作计划填报', '19519', '【黄仕鑫】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19524', null, '任务填报', '18107', 'Duanwb', '33bf6d89-00d6-4952-870d-66f93500ad92', '2018-01-18 17:16:23', null, '2018-01-18 17:16:23', '19388', '', 'Duanwb', '19387', '19387', 'Completed', '2018年第3周工作计划填报', '19395', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19529', null, '部门审核', '18107', 'Cuihh', 'd1ec6d90-be03-445a-b1e5-da7aeffd8886', '2018-01-18 17:16:26', null, '2018-01-18 17:16:26', '19115', '', 'Cuihh', '19114', '19114', 'Completed', '填报1月第四周工作计划', '19514', '【黄仕鑫】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19533', null, '部门审核', '18107', 'Cuihh', '22ab66eb-9adc-463d-af3f-ce98ddfeb8ae', '2018-01-18 17:17:30', null, '2018-01-18 17:17:30', '19038', '', 'Cuihh', '19037', '19037', 'Completed', '检测中心（实验室）第四周工作计划', '19186', '【程迎】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19537', null, '部门审核', '18107', 'Cuihh', 'f9a4c3b3-c61d-4184-83ec-c6f3b3b836fe', '2018-01-18 17:17:49', null, '2018-01-18 17:17:49', '19169', '', 'Cuihh', '19168', '19168', 'Completed', '填报1月第四周工作计划', '19181', '【高长仁】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19541', null, '任务填报', '18107', 'Cuihh', '230a24af-8d7a-47be-934e-f7f25ab6e14d', '2018-01-18 17:18:01', null, '2018-01-18 17:18:01', '19088', '', 'Cuihh', '19087', '19087', 'Completed', '填报1月第四周工作计划', '19095', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19546', null, '部门审核', '18107', 'Cuihh', 'b33b6996-5ef9-4a57-9660-a49de1c7dada', '2018-01-18 17:18:10', null, '2018-01-18 17:18:10', '19133', '', 'Cuihh', '19132', '19132', 'Completed', '填报1月第四周工作计划', '19191', '【童涛】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19550', null, '部门审核', '18107', 'Cuihh', '5a88995f-ad01-4502-80a8-f829d83eb34f', '2018-01-18 17:18:52', null, '2018-01-18 17:18:52', '19056', '', 'Cuihh', '19055', '19055', 'Completed', '检测中心（实验室）第四周工作计划', '19086', '【赵明】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19554', null, '部门审核', '18107', 'Cuihh', '4910ef81-8dd5-434e-a0d7-4c56944339dd', '2018-01-18 17:19:00', null, '2018-01-18 17:19:00', '19124', '', 'Cuihh', '19123', '19123', 'Completed', '填报1月第四周工作计划', '19196', '【陶小飞】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19558', null, '部门审核', '18107', 'Cuihh', 'd543db2c-7780-44b8-8907-e811ced8d4f2', '2018-01-18 17:19:28', null, '2018-01-18 17:19:28', '19160', '', 'Cuihh', '19159', '19159', 'Completed', '填报1月第四周工作计划', '19201', '【周栋】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19562', null, '部门审核', '18107', 'Cuihh', 'e51c3999-d1fb-404d-8766-7bd63f11c38d', '2018-01-18 17:19:36', null, '2018-01-18 17:19:36', '19097', '', 'Cuihh', '19096', '19096', 'Completed', '填报1月第四周工作计划', '19206', '【段伟博】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19566', null, '任务填报', '18107', 'Cuihh', '0b03a9f1-6f75-4dca-a987-bcc1d0b611ea', '2018-01-18 17:19:46', null, '2018-01-18 17:19:46', '19208', '', 'Cuihh', '19207', '19207', 'Completed', '2018年第3周工作计划填报', '19215', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19571', null, '部门审核', '18107', 'Cuihh', '0398b9d0-024f-4a4e-846e-1edd9cda942d', '2018-01-18 17:20:50', null, '2018-01-18 17:20:50', '19106', '', 'Cuihh', '19105', '19105', 'Completed', '填报1月第四周工作计划', '19504', '【光文祥】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19575', null, '部门审核', '18107', 'Cuihh', '6da38ffb-0125-4dfa-938d-9739dbdbd244', '2018-01-18 17:20:59', null, '2018-01-18 17:20:59', '19397', '', 'Cuihh', '19396', '19396', 'Completed', '2018年第3周工作计划填报', '19509', '【光文祥】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19579', null, '部门审核', '18107', 'Cuihh', '33bf6d89-00d6-4952-870d-66f93500ad92', '2018-01-18 17:21:10', null, '2018-01-18 17:21:10', '19388', '', 'Cuihh', '19387', '19387', 'Completed', '2018年第3周工作计划填报', '19528', '【段伟博】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19583', null, '任务填报', '18107', 'Zhaom', 'bd6780f1-d59e-4769-a3cb-c2874cf891aa', '2018-01-19 08:33:49', null, '2018-01-19 08:33:49', '19298', '', 'Zhaom', '19297', '19297', 'Completed', '2018年第3周工作计划填报', '19305', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19601', null, '部门审核', '18107', 'Cuihh', '0b03a9f1-6f75-4dca-a987-bcc1d0b611ea', '2018-01-19 14:21:44', null, '2018-01-19 14:21:44', '19208', '', 'Cuihh', '19207', '19207', 'Completed', '2018年第3周工作计划填报', '19570', '【崔海华】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19611', null, '开始', '18113', 'Cuihh', 'fe385bcf-39e0-410c-bd01-7bcf18853e07', '2018-01-19 14:28:44', null, '2018-01-19 14:28:44', '19606', null, 'Cuihh', '19605', '19605', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19610', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19620', null, '开始', '18113', 'Cuihh', '0f0550a4-7865-4eff-9eef-59b0e2517a29', '2018-01-19 14:28:44', null, '2018-01-19 14:28:44', '19615', null, 'Cuihh', '19614', '19614', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19619', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19629', null, '开始', '18113', 'Cuihh', '9ffc5d49-36c7-4990-be07-ee1268a8f441', '2018-01-19 14:28:44', null, '2018-01-19 14:28:44', '19624', null, 'Cuihh', '19623', '19623', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19628', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19638', null, '开始', '18113', 'Cuihh', '6f8536a7-7df4-4f95-bdb3-df7bbe075d26', '2018-01-19 14:28:44', null, '2018-01-19 14:28:44', '19633', null, 'Cuihh', '19632', '19632', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19637', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19647', null, '开始', '18113', 'Cuihh', '61c0663b-ebee-49b9-b3bb-3f86b3b804d8', '2018-01-19 14:28:44', null, '2018-01-19 14:28:44', '19642', null, 'Cuihh', '19641', '19641', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19646', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19656', null, '开始', '18113', 'Cuihh', '21f79b27-fbeb-4daf-903c-0602ca6f05af', '2018-01-19 14:28:44', null, '2018-01-19 14:28:44', '19651', null, 'Cuihh', '19650', '19650', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19655', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19665', null, '开始', '18113', 'Cuihh', '940284b2-0430-4a34-bf57-3adb393e2ef0', '2018-01-19 14:28:45', null, '2018-01-19 14:28:45', '19660', null, 'Cuihh', '19659', '19659', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19664', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19674', null, '开始', '18113', 'Cuihh', 'd1ad7e95-af1a-4fc0-b6da-23c143c6414c', '2018-01-19 14:28:45', null, '2018-01-19 14:28:45', '19669', null, 'Cuihh', '19668', '19668', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19673', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19683', null, '开始', '18113', 'Cuihh', 'f17ac449-9fc3-4f93-9ac8-67b8e59ad0cc', '2018-01-19 14:28:45', null, '2018-01-19 14:28:45', '19678', null, 'Cuihh', '19677', '19677', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19682', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19692', null, '开始', '18113', 'Cuihh', 'e3e34f59-25b4-44da-83c6-d0468baae551', '2018-01-19 14:28:45', null, '2018-01-19 14:28:45', '19687', null, 'Cuihh', '19686', '19686', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19691', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19701', null, '开始', '18113', 'Cuihh', '3ce58452-758f-4331-b071-8cb892935a69', '2018-01-19 14:28:45', null, '2018-01-19 14:28:45', '19696', null, 'Cuihh', '19695', '19695', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19700', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19710', null, '开始', '18113', 'Cuihh', '803e0e96-feb3-44d2-9c2f-9ec7169eb0f8', '2018-01-19 14:28:46', null, '2018-01-19 14:28:46', '19705', null, 'Cuihh', '19704', '19704', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19709', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19719', null, '开始', '18113', 'Cuihh', '9b023634-86f6-48ec-8618-9ef1506f19b4', '2018-01-19 14:28:46', null, '2018-01-19 14:28:46', '19714', null, 'Cuihh', '19713', '19713', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19718', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19728', null, '开始', '18113', 'Cuihh', '93d710f5-c722-48ec-b59e-9eb88f48a458', '2018-01-19 14:28:46', null, '2018-01-19 14:28:46', '19723', null, 'Cuihh', '19722', '19722', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19727', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19737', null, '开始', '18113', 'Cuihh', '8826725f-db13-4715-8f7f-905339ac11fe', '2018-01-19 14:28:46', null, '2018-01-19 14:28:46', '19732', null, 'Cuihh', '19731', '19731', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19736', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19746', null, '开始', '18113', 'Cuihh', '0f4a5003-1ec3-4673-999c-6cc8ba3c769f', '2018-01-19 14:28:46', null, '2018-01-19 14:28:46', '19741', null, 'Cuihh', '19740', '19740', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19745', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19755', null, '开始', '18113', 'Cuihh', '7bf9aad7-bad0-432a-9380-9c8145a2a023', '2018-01-19 14:28:46', null, '2018-01-19 14:28:46', '19750', null, 'Cuihh', '19749', '19749', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19754', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19764', null, '开始', '18113', 'Cuihh', 'eabdf0fc-fc28-4d3d-8957-b0011334e7f5', '2018-01-19 14:28:46', null, '2018-01-19 14:28:46', '19759', null, 'Cuihh', '19758', '19758', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19763', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19773', null, '开始', '18113', 'Cuihh', '154a3bbe-15c1-4ec5-a9f1-29d3cd63f1b8', '2018-01-19 14:28:47', null, '2018-01-19 14:28:47', '19768', null, 'Cuihh', '19767', '19767', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19772', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19782', null, '开始', '18113', 'Cuihh', '668885ff-78f0-4342-8b36-2696c1ada324', '2018-01-19 14:28:47', null, '2018-01-19 14:28:47', '19777', null, 'Cuihh', '19776', '19776', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19781', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19791', null, '开始', '18113', 'Cuihh', 'd557d6b6-3b4b-40a5-bc93-18ef44f7da8c', '2018-01-19 14:28:47', null, '2018-01-19 14:28:47', '19786', null, 'Cuihh', '19785', '19785', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19790', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19800', null, '开始', '18113', 'Cuihh', '96346f49-c637-4b03-857e-15d5e135fef5', '2018-01-19 14:28:47', null, '2018-01-19 14:28:47', '19795', null, 'Cuihh', '19794', '19794', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19799', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19809', null, '开始', '18113', 'Cuihh', 'b32cf8c7-81f9-448e-9cf1-644784ebe6d9', '2018-01-19 14:28:47', null, '2018-01-19 14:28:47', '19804', null, 'Cuihh', '19803', '19803', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19808', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19818', null, '开始', '18113', 'Cuihh', '5eb910c0-7fd7-44aa-9f0c-f705f643bee7', '2018-01-19 14:28:47', null, '2018-01-19 14:28:47', '19813', null, 'Cuihh', '19812', '19812', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19817', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19827', null, '开始', '18113', 'Cuihh', 'd75b31c0-854a-43fb-a5a6-f1f906b0ea31', '2018-01-19 14:28:47', null, '2018-01-19 14:28:47', '19822', null, 'Cuihh', '19821', '19821', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19826', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19836', null, '开始', '18113', 'Cuihh', 'a648e336-29e3-4c76-86ae-7cba9de160f4', '2018-01-19 14:28:48', null, '2018-01-19 14:28:48', '19831', null, 'Cuihh', '19830', '19830', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19835', '开始', 'Normal', null);
INSERT INTO `uflo_his_task` VALUES ('19839', null, '部门审核', '18107', 'Cuihh', 'bd6780f1-d59e-4769-a3cb-c2874cf891aa', '2018-01-19 14:40:32', null, '2018-01-19 14:40:32', '19298', '', 'Cuihh', '19297', '19297', 'Completed', '2018年第3周工作计划填报', '19587', '【赵明】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19843', null, '部门审核', '18107', 'Cuihh', '230a24af-8d7a-47be-934e-f7f25ab6e14d', '2018-01-19 14:40:38', null, '2018-01-19 14:40:38', '19088', '', 'Cuihh', '19087', '19087', 'Completed', '填报1月第四周工作计划', '19545', '【崔海华】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19847', null, '任务填报', '18107', 'Wangr', '4ee61181-e9f2-4e86-a46b-ade2627a5a66', '2018-01-19 15:14:56', null, '2018-01-19 15:14:56', '19142', '', 'Wangr', '19141', '19141', 'Completed', '填报1月第四周工作计划', '19149', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19852', null, '任务填报', '18107', 'Jinw', '8a642e91-d8ee-4c5b-bde7-e94fec5097f3', '2018-01-19 15:26:17', null, '2018-01-19 15:26:17', '19325', '', 'Jinw', '19324', '19324', 'Completed', '2018年第3周工作计划填报', '19332', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19857', null, '任务填报', '18107', 'Wanghb', '1fc7030e-19c6-4855-9af0-088f1a99d270', '2018-01-19 15:35:28', null, '2018-01-19 15:35:28', '19343', '', 'Wanghb', '19342', '19342', 'Completed', '2018年第3周工作计划填报', '19350', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19862', null, '任务填报', '18107', 'Xiars', '57b0463f-ed25-4e6b-99c5-3d1e98d3ba54', '2018-01-19 15:38:08', null, '2018-01-19 15:38:08', '19352', '', 'Xiars', '19351', '19351', 'Completed', '2018年第3周工作计划填报', '19359', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19867', null, '任务填报', '18107', 'Tongt', 'b0d3e17c-047e-4d3e-a1f1-d3282e753781', '2018-01-19 15:41:37', null, '2018-01-19 15:41:37', '19424', '', 'Tongt', '19423', '19423', 'Completed', '2018年第3周工作计划填报', '19431', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19872', null, '任务填报', '18107', 'lexh', '83c040e1-cdd9-4b19-a14f-c2b86867dbba', '2018-01-19 16:12:17', null, '2018-01-19 16:12:17', '19334', '', 'lexh', '19333', '19333', 'Completed', '2018年第3周工作计划填报', '19341', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19901', null, '部门填报', '18113', 'Guangwx', 'd557d6b6-3b4b-40a5-bc93-18ef44f7da8c', '2018-01-24 14:42:19', null, '2018-01-24 14:42:19', '19786', '同意:无意见', 'Guangwx', '19785', '19785', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '19793', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_his_task` VALUES ('19912', null, '行政发布', '18107', 'Gaocr', '89c81285-2757-4f9f-9046-c9f2dd6c1b5d', '2018-01-25 08:59:13', null, '2018-01-25 08:59:13', '19907', null, 'Gaocr', '19906', '19906', 'Completed', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '19911', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19921', null, '行政发布', '18107', 'Gaocr', '3c161602-d562-4fe6-96e3-0846c65bd8ce', '2018-01-25 08:59:13', null, '2018-01-25 08:59:13', '19916', null, 'Gaocr', '19915', '19915', 'Completed', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '19920', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19930', null, '行政发布', '18107', 'Gaocr', 'fca23947-b1b0-4481-8f46-8db7feee9e9c', '2018-01-25 08:59:13', null, '2018-01-25 08:59:13', '19925', null, 'Gaocr', '19924', '19924', 'Completed', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '19929', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19939', null, '行政发布', '18107', 'Gaocr', 'c2371951-a4c3-408d-94f7-d7745c6bfa78', '2018-01-25 08:59:13', null, '2018-01-25 08:59:13', '19934', null, 'Gaocr', '19933', '19933', 'Completed', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '19938', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19948', null, '行政发布', '18107', 'Gaocr', 'e942f857-be0d-4061-9db0-9b9fad363875', '2018-01-25 08:59:13', null, '2018-01-25 08:59:13', '19943', null, 'Gaocr', '19942', '19942', 'Completed', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '19947', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19957', null, '行政发布', '18107', 'Gaocr', 'e2b03f41-f555-4600-a11a-dea2c2c447f7', '2018-01-25 08:59:14', null, '2018-01-25 08:59:14', '19952', null, 'Gaocr', '19951', '19951', 'Completed', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '19956', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19966', null, '行政发布', '18107', 'Gaocr', 'a448a730-1937-4916-8263-afea2182f998', '2018-01-25 08:59:14', null, '2018-01-25 08:59:14', '19961', null, 'Gaocr', '19960', '19960', 'Completed', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '19965', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19975', null, '行政发布', '18107', 'Gaocr', '1c628366-4897-4368-abbd-faa6570193aa', '2018-01-25 08:59:14', null, '2018-01-25 08:59:14', '19970', null, 'Gaocr', '19969', '19969', 'Completed', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '19974', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_his_task` VALUES ('19984', null, '行政发布', '18107', 'Gaocr', 'e2ccfaf3-ba21-4fbe-a62f-6fa83ec3a42a', '2018-01-25 08:59:14', null, '2018-01-25 08:59:14', '19979', null, 'Gaocr', '19978', '19978', 'Completed', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '19983', '行政发布', 'Normal', 'com.jghz.op.view.opjv061.d');

-- ----------------------------
-- Table structure for uflo_his_variable
-- ----------------------------
DROP TABLE IF EXISTS `uflo_his_variable`;
CREATE TABLE `uflo_his_variable` (
  `ID_` bigint(20) NOT NULL,
  `HIS_PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `KEY_` varchar(60) DEFAULT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_his_variable
-- ----------------------------
INSERT INTO `uflo_his_variable` VALUES ('18302', '18231', 'fromUser', '许晓卉', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18303', '18231', 'user', 'xuxh1', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18320', '18306', 'fromUser', '王晖', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18321', '18306', 'user', 'xuxh1', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18343', '18324', 'fromUser', '许晓卉', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18344', '18324', 'user', 'liuwl', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18366', '18347', 'fromUser', '许晓卉', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18367', '18347', 'user', 'xuxh1', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18576', '18539', 'fromUser', '秦向春', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18577', '18539', 'user', 'xuxh1', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18802', '18693', 'fromUser', '许晓卉', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18803', '18693', 'user', 'xuxh1', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18806', '18712', 'fromUser', '王晖', 'String');
INSERT INTO `uflo_his_variable` VALUES ('18807', '18712', 'user', 'xuxh1', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19070', '19020', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19071', '19020', 'user', 'yangying', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19079', '19002', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19080', '19002', 'user', 'yangying', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19474', '19307', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19475', '19307', 'user', 'Cuihh', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19483', '19379', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19484', '19379', 'user', 'Cuihh', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19497', '19244', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19498', '19244', 'user', 'Cuihh', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19521', '19406', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19522', '19406', 'user', 'Cuihh', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19530', '19115', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19531', '19115', 'user', 'Gaocr', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19534', '19038', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19535', '19038', 'user', 'yangying', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19538', '19169', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19539', '19169', 'user', 'Gaocr', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19547', '19133', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19548', '19133', 'user', 'Gaocr', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19551', '19056', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19552', '19056', 'user', 'yangying', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19555', '19124', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19556', '19124', 'user', 'Gaocr', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19559', '19160', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19560', '19160', 'user', 'Gaocr', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19563', '19097', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19564', '19097', 'user', 'Gaocr', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19572', '19106', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19573', '19106', 'user', 'Gaocr', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19576', '19397', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19577', '19397', 'user', 'Cuihh', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19580', '19388', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19581', '19388', 'user', 'Cuihh', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19602', '19208', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19603', '19208', 'user', 'Cuihh', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19840', '19298', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19841', '19298', 'user', 'Cuihh', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19844', '19088', 'fromUser', '崔海华', 'String');
INSERT INTO `uflo_his_variable` VALUES ('19845', '19088', 'user', 'Gaocr', 'String');

-- ----------------------------
-- Table structure for uflo_job_heartbeat
-- ----------------------------
DROP TABLE IF EXISTS `uflo_job_heartbeat`;
CREATE TABLE `uflo_job_heartbeat` (
  `ID_` varchar(60) NOT NULL,
  `DATE_` datetime DEFAULT NULL,
  `INSTANCE_NAME_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_job_heartbeat
-- ----------------------------

-- ----------------------------
-- Table structure for uflo_process
-- ----------------------------
DROP TABLE IF EXISTS `uflo_process`;
CREATE TABLE `uflo_process` (
  `ID_` bigint(20) NOT NULL,
  `CATEGORY_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  `EFFECT_DATE_` datetime DEFAULT NULL,
  `KEY_` varchar(60) DEFAULT NULL,
  `NAME_` varchar(60) DEFAULT NULL,
  `START_PROCESS_URL_` varchar(120) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_process
-- ----------------------------
INSERT INTO `uflo_process` VALUES ('18101', null, '2018-01-15 18:04:33', null, null, '汇总审核流程', 'NJHHZ', null, '1');
INSERT INTO `uflo_process` VALUES ('18103', null, '2018-01-15 18:04:41', null, null, '部门审核流程', 'NJHTB', null, '1');
INSERT INTO `uflo_process` VALUES ('18105', null, '2018-01-15 18:04:49', null, null, '产值年计划填报', 'NJHTB_CZ', null, '1');
INSERT INTO `uflo_process` VALUES ('18107', null, '2018-01-15 18:04:59', null, null, '周计划审核流程', 'opWeek', null, '1');
INSERT INTO `uflo_process` VALUES ('18109', null, '2018-01-15 18:05:08', null, null, '月计划汇总审核流程', 'YJHHZ', null, '1');
INSERT INTO `uflo_process` VALUES ('18111', null, '2018-01-15 18:05:17', null, null, '月计划填报流程', 'YJHTB', null, '1');
INSERT INTO `uflo_process` VALUES ('18113', null, '2018-01-15 18:05:25', null, null, '产值月计划填报流程', 'YJHTB_CZ', null, '1');

-- ----------------------------
-- Table structure for uflo_process_instance
-- ----------------------------
DROP TABLE IF EXISTS `uflo_process_instance`;
CREATE TABLE `uflo_process_instance` (
  `ID_` bigint(20) NOT NULL,
  `BUSINESS_ID_` varchar(60) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `CURRENT_NODE_` varchar(60) DEFAULT NULL,
  `CURRENT_TASK_` varchar(60) DEFAULT NULL,
  `HIS_PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `PARALLEL_INSTANCE_COUNT_` int(11) DEFAULT NULL,
  `PARENT_ID_` bigint(20) DEFAULT NULL,
  `PROCESS_ID_` bigint(20) DEFAULT NULL,
  `PROMOTER_` varchar(60) DEFAULT NULL,
  `ROOT_ID_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(20) DEFAULT NULL,
  `SUBJECT_` varchar(200) DEFAULT NULL,
  `TAG_` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_process_instance
-- ----------------------------
INSERT INTO `uflo_process_instance` VALUES ('18201', 'f9383132-863b-45a3-abba-430d6421fbde', '2018-01-15 18:08:27', '行政确认', '行政确认', '18202', '0', '0', '18113', 'xuxh1', '18201', 'Start', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', null);
INSERT INTO `uflo_process_instance` VALUES ('18249', '9553c4c5-a6d3-4d1a-b69e-5bc698fcb096', '2018-01-16 00:34:17', '任务填报', '任务填报', '18250', '0', '0', '18107', 'xuxh1', '18249', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18258', 'e0963ffa-109e-42d7-a2ea-b790a2ff082b', '2018-01-16 00:34:18', '任务填报', '任务填报', '18259', '0', '0', '18107', 'xuxh1', '18258', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18267', '6949bbbf-9944-427e-9231-682264b9c5c9', '2018-01-16 00:34:18', '任务填报', '任务填报', '18268', '0', '0', '18107', 'xuxh1', '18267', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18276', '1d80d625-ed56-4726-a4d8-8da47958023f', '2018-01-16 00:34:18', '任务填报', '任务填报', '18277', '0', '0', '18107', 'xuxh1', '18276', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18285', '1634f7da-6a9e-4bc5-8449-97029fb16adb', '2018-01-16 00:34:18', '任务填报', '任务填报', '18286', '0', '0', '18107', 'xuxh1', '18285', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18294', 'f5835a4f-893e-4129-8f04-c95a4a21091c', '2018-01-16 00:34:18', '任务填报', '任务填报', '18295', '0', '0', '18107', 'xuxh1', '18294', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18403', 'd0f41896-0f4f-4f8b-9967-201b0f920b28', '2018-01-16 00:34:19', '任务填报', '任务填报', '18404', '0', '0', '18107', 'xuxh1', '18403', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18412', 'ae7db010-47d7-4921-8526-34868b6de3f1', '2018-01-16 00:34:19', '任务填报', '任务填报', '18413', '0', '0', '18107', 'xuxh1', '18412', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18421', 'd4caeee9-2461-4c5d-8fed-96da741693e9', '2018-01-16 00:34:19', '任务填报', '任务填报', '18422', '0', '0', '18107', 'xuxh1', '18421', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18430', '60d3e3f9-f911-4b88-a4f3-9169e6268687', '2018-01-16 00:34:19', '部门审核', '部门审核', '18431', '0', '0', '18107', 'xuxh1', '18430', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18439', 'dcdb090a-287b-4d60-8454-8b292131b9bf', '2018-01-16 00:34:19', '任务填报', '任务填报', '18440', '0', '0', '18107', 'xuxh1', '18439', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18448', 'ee9eddb1-8186-4f07-8fde-072e40393c93', '2018-01-16 00:34:19', '任务填报', '任务填报', '18449', '0', '0', '18107', 'xuxh1', '18448', 'Start', '周任务发布测试', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18457', '15eff167-1a38-41cc-93a5-044bdcf43467', '2018-01-16 00:37:47', '任务填报', '任务填报', '18458', '0', '0', '18107', 'xuxh1', '18457', 'Start', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18466', 'ea663ce0-d01d-402b-9066-1f381895ceaa', '2018-01-16 00:37:48', '任务填报', '任务填报', '18467', '0', '0', '18107', 'xuxh1', '18466', 'Start', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18475', 'c27d0ab2-11c5-4d6a-89fc-468eca6b122c', '2018-01-16 00:37:48', '任务填报', '任务填报', '18476', '0', '0', '18107', 'xuxh1', '18475', 'Start', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18484', '0096ce13-658c-4ea1-a109-c56781a80a5c', '2018-01-16 00:37:48', '任务填报', '任务填报', '18485', '0', '0', '18107', 'xuxh1', '18484', 'Start', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18493', '2616d459-e981-49e9-a977-46089c260f00', '2018-01-16 00:37:48', '任务填报', '任务填报', '18494', '0', '0', '18107', 'xuxh1', '18493', 'Start', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18502', '52fecc93-d10f-4e07-b743-7002b1e291b1', '2018-01-16 00:37:48', '任务填报', '任务填报', '18503', '0', '0', '18107', 'xuxh1', '18502', 'Start', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18511', '36b41911-74be-4e89-a268-bdefb613eebf', '2018-01-16 00:37:48', '任务填报', '任务填报', '18512', '0', '0', '18107', 'xuxh1', '18511', 'Start', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18520', '55226ed2-fc50-4b10-89aa-5d6e16c8d3e6', '2018-01-16 00:37:49', '任务填报', '任务填报', '18521', '0', '0', '18107', 'xuxh1', '18520', 'Start', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18529', 'b94622eb-9743-4ea5-aeb6-1c138bb8c5f0', '2018-01-16 00:37:49', '任务填报', '任务填报', '18530', '0', '0', '18107', 'xuxh1', '18529', 'Start', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18547', '7707638d-2fbc-4f02-901d-f20079dcb089', '2018-01-16 00:37:49', '任务填报', '任务填报', '18548', '0', '0', '18107', 'xuxh1', '18547', 'Start', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18556', '832baec1-7764-4874-be19-6c8490e573c3', '2018-01-16 00:37:49', '任务填报', '任务填报', '18557', '0', '0', '18107', 'xuxh1', '18556', 'Start', '周任务测试2', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18579', '25bace80-aec3-49cf-a615-3e36a4bfb5b4', '2018-01-16 08:56:39', '任务填报', '任务填报', '18580', '0', '0', '18107', 'xuxh1', '18579', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18588', 'c80a41ef-fb10-4d9a-b7f0-8a5e7d2da698', '2018-01-16 08:56:39', '任务填报', '任务填报', '18589', '0', '0', '18107', 'xuxh1', '18588', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18597', 'bb689532-7e73-4a46-aa8e-32804733d250', '2018-01-16 08:56:39', '任务填报', '任务填报', '18598', '0', '0', '18107', 'xuxh1', '18597', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18606', 'bc70fa31-ddc3-46e0-a3c1-bec03cc6192d', '2018-01-16 08:56:39', '任务填报', '任务填报', '18607', '0', '0', '18107', 'xuxh1', '18606', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18615', '781fab63-7d3d-4a53-a89c-c5e25b9869b4', '2018-01-16 08:56:40', '任务填报', '任务填报', '18616', '0', '0', '18107', 'xuxh1', '18615', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18624', 'd6a26344-c24b-4612-bc04-253b39184b78', '2018-01-16 08:56:40', '任务填报', '任务填报', '18625', '0', '0', '18107', 'xuxh1', '18624', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18633', '421dd18b-e08a-4d1a-9408-f8c91663bef7', '2018-01-16 08:56:40', '任务填报', '任务填报', '18634', '0', '0', '18107', 'xuxh1', '18633', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18642', '7c0acf96-0050-4436-9569-572dcdae70bc', '2018-01-16 08:56:40', '任务填报', '任务填报', '18643', '0', '0', '18107', 'xuxh1', '18642', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18651', 'b6be0169-3f19-40e3-8d0d-e5f59776a276', '2018-01-16 08:56:40', '任务填报', '任务填报', '18652', '0', '0', '18107', 'xuxh1', '18651', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18660', '06f90f18-73c3-4ef5-b24f-6bd259692420', '2018-01-16 08:56:40', '部门审核', '部门审核', '18661', '0', '0', '18107', 'xuxh1', '18660', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18669', '870a12b6-435b-4c10-bc05-60ee3bac0cf9', '2018-01-16 08:56:40', '任务填报', '任务填报', '18670', '0', '0', '18107', 'xuxh1', '18669', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18678', 'fe137b3e-6eb4-4d75-a206-0f7ed7582e1f', '2018-01-16 08:56:40', '任务填报', '任务填报', '18679', '0', '0', '18107', 'xuxh1', '18678', 'Start', '周任务测试33', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('18809', '38b820be-34cd-4c57-b747-bd3387c4efaf', '2018-01-16 09:27:37', '部门审核', '部门审核', '18810', '0', '0', '18111', 'liuwl', '18809', 'Start', '【合同】月计划填报：1月合同测试。【截止日期20180120】', null);
INSERT INTO `uflo_process_instance` VALUES ('18823', '499b5202-36c8-46f0-8e7f-3ce65be0d90b', '2018-01-16 09:40:37', '部门填报', '部门填报', '18824', '0', '0', '18105', 'Yuany', '18823', 'Start', '【产值】年计划填报：产值测试。【截止日期20180119】', null);
INSERT INTO `uflo_process_instance` VALUES ('18901', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', '2018-01-16 11:56:41', '部门审核', '部门审核', '18902', '0', '0', '18109', 'xuxh1', '18901', 'Start', '【合同】月计划汇总：2018年1月合同计划汇总测试。【截止日期20180118】', null);
INSERT INTO `uflo_process_instance` VALUES ('19010', '1b35cbd2-011d-4fbe-ab70-4f93f29df891', '2018-01-17 09:24:43', '任务填报', '任务填报', '19011', '0', '0', '18107', 'yangying', '19010', 'Start', '检测中心（实验室）第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19028', 'bc121d8f-0246-471c-bc36-6c55902ba97e', '2018-01-17 09:24:44', '任务填报', '任务填报', '19029', '0', '0', '18107', 'yangying', '19028', 'Start', '检测中心（实验室）第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19046', '97d6f46f-7c37-41d2-b581-c0b838a1be13', '2018-01-17 09:24:44', '任务填报', '任务填报', '19047', '0', '0', '18107', 'yangying', '19046', 'Start', '检测中心（实验室）第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19141', '4ee61181-e9f2-4e86-a46b-ade2627a5a66', '2018-01-17 10:13:38', '部门审核', '部门审核', '19142', '0', '0', '18107', 'Gaocr', '19141', 'Start', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19150', 'c7446aeb-a7a9-4709-ba09-9a3589f0a825', '2018-01-17 10:13:38', '任务填报', '任务填报', '19151', '0', '0', '18107', 'Gaocr', '19150', 'Start', '填报1月第四周工作计划', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19216', 'b0f8644c-bb61-48d4-91d6-d8f7b344f64a', '2018-01-18 16:53:21', '任务填报', '任务填报', '19217', '0', '0', '18107', 'Cuihh', '19216', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19225', '3142cbcb-8018-4cda-b637-8656a387cd6a', '2018-01-18 16:53:21', '任务填报', '任务填报', '19226', '0', '0', '18107', 'Cuihh', '19225', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19234', 'b146d22a-0bb8-419a-a40e-8fc20a54fbd6', '2018-01-18 16:53:22', '任务填报', '任务填报', '19235', '0', '0', '18107', 'Cuihh', '19234', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19252', '7909eab5-a09c-4a25-9469-1947852418c2', '2018-01-18 16:53:22', '任务填报', '任务填报', '19253', '0', '0', '18107', 'Cuihh', '19252', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19261', 'ecd03c7f-94b1-4cc7-a369-3b2fbc196de9', '2018-01-18 16:53:22', '部门审核', '部门审核', '19262', '0', '0', '18107', 'Cuihh', '19261', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19270', '64dec6d0-f2b9-40b9-9a6a-98f29a9b28d4', '2018-01-18 16:53:22', '任务填报', '任务填报', '19271', '0', '0', '18107', 'Cuihh', '19270', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19279', '101d6199-5b46-463a-9cae-0c3a0b7b443a', '2018-01-18 16:53:22', '任务填报', '任务填报', '19280', '0', '0', '18107', 'Cuihh', '19279', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19288', '4df5de45-e12d-4dd8-8d8a-0fa3f7262575', '2018-01-18 16:53:22', '任务填报', '任务填报', '19289', '0', '0', '18107', 'Cuihh', '19288', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19315', '15319e70-459b-4488-8384-422099bdfea4', '2018-01-18 16:53:23', '任务填报', '任务填报', '19316', '0', '0', '18107', 'Cuihh', '19315', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19324', '8a642e91-d8ee-4c5b-bde7-e94fec5097f3', '2018-01-18 16:53:23', '部门审核', '部门审核', '19325', '0', '0', '18107', 'Cuihh', '19324', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19333', '83c040e1-cdd9-4b19-a14f-c2b86867dbba', '2018-01-18 16:53:23', '部门审核', '部门审核', '19334', '0', '0', '18107', 'Cuihh', '19333', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19342', '1fc7030e-19c6-4855-9af0-088f1a99d270', '2018-01-18 16:53:24', '部门审核', '部门审核', '19343', '0', '0', '18107', 'Cuihh', '19342', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19351', '57b0463f-ed25-4e6b-99c5-3d1e98d3ba54', '2018-01-18 16:53:24', '部门审核', '部门审核', '19352', '0', '0', '18107', 'Cuihh', '19351', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19360', '3e906c2c-673b-4635-b864-75c0354ce8ba', '2018-01-18 16:53:24', '任务填报', '任务填报', '19361', '0', '0', '18107', 'Cuihh', '19360', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19369', 'e4b3877f-47f4-4bda-b23b-810de0317285', '2018-01-18 16:53:24', '任务填报', '任务填报', '19370', '0', '0', '18107', 'Cuihh', '19369', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19414', 'f47ba3e3-e91d-42c0-a5dd-95be827c7876', '2018-01-18 16:53:25', '任务填报', '任务填报', '19415', '0', '0', '18107', 'Cuihh', '19414', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19423', 'b0d3e17c-047e-4d3e-a1f1-d3282e753781', '2018-01-18 16:53:25', '部门审核', '部门审核', '19424', '0', '0', '18107', 'Cuihh', '19423', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19432', 'a49a15d0-10ec-4c91-84a4-1f92d68180d7', '2018-01-18 16:53:25', '任务填报', '任务填报', '19433', '0', '0', '18107', 'Cuihh', '19432', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19441', 'ab4f2726-7ebf-46e6-bc40-d5b638a7455a', '2018-01-18 16:53:25', '任务填报', '任务填报', '19442', '0', '0', '18107', 'Cuihh', '19441', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19450', '5a338b10-63ae-4d11-a8de-4c0b77b34e25', '2018-01-18 16:53:25', '任务填报', '任务填报', '19451', '0', '0', '18107', 'Cuihh', '19450', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19459', '6a92664b-2e48-46c0-a718-ffd0b1ff3234', '2018-01-18 16:53:26', '任务填报', '任务填报', '19460', '0', '0', '18107', 'Cuihh', '19459', 'Start', '2018年第3周工作计划填报', '周工作个人填报');
INSERT INTO `uflo_process_instance` VALUES ('19605', 'fe385bcf-39e0-410c-bd01-7bcf18853e07', '2018-01-19 14:28:44', '部门填报', '部门填报', '19606', '0', '0', '18113', 'Cuihh', '19605', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19614', '0f0550a4-7865-4eff-9eef-59b0e2517a29', '2018-01-19 14:28:44', '部门填报', '部门填报', '19615', '0', '0', '18113', 'Cuihh', '19614', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19623', '9ffc5d49-36c7-4990-be07-ee1268a8f441', '2018-01-19 14:28:44', '部门填报', '部门填报', '19624', '0', '0', '18113', 'Cuihh', '19623', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19632', '6f8536a7-7df4-4f95-bdb3-df7bbe075d26', '2018-01-19 14:28:44', '部门填报', '部门填报', '19633', '0', '0', '18113', 'Cuihh', '19632', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19641', '61c0663b-ebee-49b9-b3bb-3f86b3b804d8', '2018-01-19 14:28:44', '部门填报', '部门填报', '19642', '0', '0', '18113', 'Cuihh', '19641', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19650', '21f79b27-fbeb-4daf-903c-0602ca6f05af', '2018-01-19 14:28:44', '部门填报', '部门填报', '19651', '0', '0', '18113', 'Cuihh', '19650', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19659', '940284b2-0430-4a34-bf57-3adb393e2ef0', '2018-01-19 14:28:45', '部门填报', '部门填报', '19660', '0', '0', '18113', 'Cuihh', '19659', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19668', 'd1ad7e95-af1a-4fc0-b6da-23c143c6414c', '2018-01-19 14:28:45', '部门填报', '部门填报', '19669', '0', '0', '18113', 'Cuihh', '19668', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19677', 'f17ac449-9fc3-4f93-9ac8-67b8e59ad0cc', '2018-01-19 14:28:45', '部门填报', '部门填报', '19678', '0', '0', '18113', 'Cuihh', '19677', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19686', 'e3e34f59-25b4-44da-83c6-d0468baae551', '2018-01-19 14:28:45', '部门填报', '部门填报', '19687', '0', '0', '18113', 'Cuihh', '19686', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19695', '3ce58452-758f-4331-b071-8cb892935a69', '2018-01-19 14:28:45', '部门填报', '部门填报', '19696', '0', '0', '18113', 'Cuihh', '19695', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19704', '803e0e96-feb3-44d2-9c2f-9ec7169eb0f8', '2018-01-19 14:28:46', '部门填报', '部门填报', '19705', '0', '0', '18113', 'Cuihh', '19704', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19713', '9b023634-86f6-48ec-8618-9ef1506f19b4', '2018-01-19 14:28:46', '部门填报', '部门填报', '19714', '0', '0', '18113', 'Cuihh', '19713', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19722', '93d710f5-c722-48ec-b59e-9eb88f48a458', '2018-01-19 14:28:46', '部门填报', '部门填报', '19723', '0', '0', '18113', 'Cuihh', '19722', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19731', '8826725f-db13-4715-8f7f-905339ac11fe', '2018-01-19 14:28:46', '部门填报', '部门填报', '19732', '0', '0', '18113', 'Cuihh', '19731', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19740', '0f4a5003-1ec3-4673-999c-6cc8ba3c769f', '2018-01-19 14:28:46', '部门填报', '部门填报', '19741', '0', '0', '18113', 'Cuihh', '19740', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19749', '7bf9aad7-bad0-432a-9380-9c8145a2a023', '2018-01-19 14:28:46', '部门填报', '部门填报', '19750', '0', '0', '18113', 'Cuihh', '19749', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19758', 'eabdf0fc-fc28-4d3d-8957-b0011334e7f5', '2018-01-19 14:28:46', '部门填报', '部门填报', '19759', '0', '0', '18113', 'Cuihh', '19758', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19767', '154a3bbe-15c1-4ec5-a9f1-29d3cd63f1b8', '2018-01-19 14:28:47', '部门填报', '部门填报', '19768', '0', '0', '18113', 'Cuihh', '19767', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19776', '668885ff-78f0-4342-8b36-2696c1ada324', '2018-01-19 14:28:47', '部门填报', '部门填报', '19777', '0', '0', '18113', 'Cuihh', '19776', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19785', 'd557d6b6-3b4b-40a5-bc93-18ef44f7da8c', '2018-01-19 14:28:47', '部门审核', '部门审核', '19786', '0', '0', '18113', 'Cuihh', '19785', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19794', '96346f49-c637-4b03-857e-15d5e135fef5', '2018-01-19 14:28:47', '部门填报', '部门填报', '19795', '0', '0', '18113', 'Cuihh', '19794', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19803', 'b32cf8c7-81f9-448e-9cf1-644784ebe6d9', '2018-01-19 14:28:47', '部门填报', '部门填报', '19804', '0', '0', '18113', 'Cuihh', '19803', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19812', '5eb910c0-7fd7-44aa-9f0c-f705f643bee7', '2018-01-19 14:28:47', '部门填报', '部门填报', '19813', '0', '0', '18113', 'Cuihh', '19812', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19821', 'd75b31c0-854a-43fb-a5a6-f1f906b0ea31', '2018-01-19 14:28:47', '部门填报', '部门填报', '19822', '0', '0', '18113', 'Cuihh', '19821', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19830', 'a648e336-29e3-4c76-86ae-7cba9de160f4', '2018-01-19 14:28:48', '部门填报', '部门填报', '19831', '0', '0', '18113', 'Cuihh', '19830', 'Start', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', null);
INSERT INTO `uflo_process_instance` VALUES ('19906', '89c81285-2757-4f9f-9046-c9f2dd6c1b5d', '2018-01-25 08:59:13', '任务填报', '任务填报', '19907', '0', '0', '18107', 'Gaocr', '19906', 'Start', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_process_instance` VALUES ('19915', '3c161602-d562-4fe6-96e3-0846c65bd8ce', '2018-01-25 08:59:13', '任务填报', '任务填报', '19916', '0', '0', '18107', 'Gaocr', '19915', 'Start', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_process_instance` VALUES ('19924', 'fca23947-b1b0-4481-8f46-8db7feee9e9c', '2018-01-25 08:59:13', '任务填报', '任务填报', '19925', '0', '0', '18107', 'Gaocr', '19924', 'Start', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_process_instance` VALUES ('19933', 'c2371951-a4c3-408d-94f7-d7745c6bfa78', '2018-01-25 08:59:13', '任务填报', '任务填报', '19934', '0', '0', '18107', 'Gaocr', '19933', 'Start', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_process_instance` VALUES ('19942', 'e942f857-be0d-4061-9db0-9b9fad363875', '2018-01-25 08:59:13', '任务填报', '任务填报', '19943', '0', '0', '18107', 'Gaocr', '19942', 'Start', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_process_instance` VALUES ('19951', 'e2b03f41-f555-4600-a11a-dea2c2c447f7', '2018-01-25 08:59:14', '任务填报', '任务填报', '19952', '0', '0', '18107', 'Gaocr', '19951', 'Start', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_process_instance` VALUES ('19960', 'a448a730-1937-4916-8263-afea2182f998', '2018-01-25 08:59:14', '任务填报', '任务填报', '19961', '0', '0', '18107', 'Gaocr', '19960', 'Start', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_process_instance` VALUES ('19969', '1c628366-4897-4368-abbd-faa6570193aa', '2018-01-25 08:59:14', '任务填报', '任务填报', '19970', '0', '0', '18107', 'Gaocr', '19969', 'Start', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);
INSERT INTO `uflo_process_instance` VALUES ('19978', 'e2ccfaf3-ba21-4fbe-a62f-6fa83ec3a42a', '2018-01-25 08:59:14', '任务填报', '任务填报', '19979', '0', '0', '18107', 'Gaocr', '19978', 'Start', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', null);

-- ----------------------------
-- Table structure for uflo_task
-- ----------------------------
DROP TABLE IF EXISTS `uflo_task`;
CREATE TABLE `uflo_task` (
  `ID_` bigint(20) NOT NULL,
  `DESCRIPTION_` varchar(120) DEFAULT NULL,
  `NODE_NAME_` varchar(60) DEFAULT NULL,
  `PROCESS_ID_` bigint(20) DEFAULT NULL,
  `ASSIGNEE_` varchar(60) DEFAULT NULL,
  `BUSINESS_ID_` varchar(60) DEFAULT NULL,
  `COUNTERSIGN_COUNT_` int(11) DEFAULT NULL,
  `CREATE_DATE_` datetime DEFAULT NULL,
  `DATE_UNIT_` varchar(20) DEFAULT NULL,
  `DUE_ACTION_DATE_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `END_DATE_` datetime DEFAULT NULL,
  `OPINION_` varchar(200) DEFAULT NULL,
  `OWNER_` varchar(60) DEFAULT NULL,
  `PREV_STATE_` varchar(20) DEFAULT NULL,
  `PREV_TASK_` varchar(60) DEFAULT NULL,
  `PRIORITY_` varchar(20) DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `PROGRESS_` int(11) DEFAULT NULL,
  `ROOT_PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(20) DEFAULT NULL,
  `SUBJECT_` varchar(200) DEFAULT NULL,
  `TASK_NAME_` varchar(60) DEFAULT NULL,
  `TYPE_` varchar(20) DEFAULT NULL,
  `URL_` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_task
-- ----------------------------
INSERT INTO `uflo_task` VALUES ('18209', null, '部门填报', '18113', 'Gaof', 'f9383132-863b-45a3-abba-430d6421fbde', '0', '2018-01-15 18:08:27', null, null, null, '2018-01-15 18:09:41', '同意:请求', 'Gaof', null, '开始', null, '18201', '100', '18201', 'Completed', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', '【许晓卉】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('18214', null, '部门审核', '18113', 'yujj', 'f9383132-863b-45a3-abba-430d6421fbde', '0', '2018-01-15 18:09:41', null, null, null, '2018-01-15 18:10:19', '同意:ok', 'yujj', null, '部门填报', null, '18201', '100', '18201', 'Completed', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', '【高飞】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('18219', null, '市场部', '18113', 'yujj', 'f9383132-863b-45a3-abba-430d6421fbde', '0', '2018-01-15 18:10:19', null, null, null, '2018-01-15 18:10:33', '同意:ok2', 'yujj', null, '部门审核', null, '18201', '100', '18201', 'Completed', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', '【于晶锦】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('18224', null, '市场部审核', '18113', 'yujj', 'f9383132-863b-45a3-abba-430d6421fbde', '0', '2018-01-15 18:10:33', null, null, null, '2018-01-15 18:10:42', '同意:rrr', 'yujj', null, '市场部', null, '18201', '100', '18201', 'Completed', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', '【于晶锦】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('18229', null, '行政确认', '18113', 'xuxh1', 'f9383132-863b-45a3-abba-430d6421fbde', '0', '2018-01-15 18:10:42', null, null, null, null, null, 'xuxh1', null, '市场部审核', null, '18201', null, '18201', 'Created', '【产值】月计划填报：产值测试2018年。【截止日期20180127】', '【于晶锦】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('18257', null, '任务填报', '18107', 'liuwl', '9553c4c5-a6d3-4d1a-b69e-5bc698fcb096', '0', '2018-01-16 00:34:18', null, null, null, null, null, 'liuwl', null, '行政发布', null, '18249', null, '18249', 'Created', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18266', null, '任务填报', '18107', 'Liuw', 'e0963ffa-109e-42d7-a2ea-b790a2ff082b', '0', '2018-01-16 00:34:18', null, null, null, null, null, 'Liuw', null, '行政发布', null, '18258', null, '18258', 'Created', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18275', null, '任务填报', '18107', 'Zhangzh', '6949bbbf-9944-427e-9231-682264b9c5c9', '0', '2018-01-16 00:34:18', null, null, null, null, null, 'Zhangzh', null, '行政发布', null, '18267', null, '18267', 'Created', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18284', null, '任务填报', '18107', 'Luj', '1d80d625-ed56-4726-a4d8-8da47958023f', '0', '2018-01-16 00:34:18', null, null, null, null, null, 'Luj', null, '行政发布', null, '18276', null, '18276', 'Created', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18293', null, '任务填报', '18107', 'Qinl', '1634f7da-6a9e-4bc5-8449-97029fb16adb', '0', '2018-01-16 00:34:18', null, null, null, null, null, 'Qinl', null, '行政发布', null, '18285', null, '18285', 'Created', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18402', null, '任务填报', '18107', 'Qinxc', 'f5835a4f-893e-4129-8f04-c95a4a21091c', '0', '2018-01-16 00:34:18', null, null, null, null, null, 'Qinxc', null, '行政发布', null, '18294', null, '18294', 'Created', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18411', null, '任务填报', '18107', 'songwg', 'd0f41896-0f4f-4f8b-9967-201b0f920b28', '0', '2018-01-16 00:34:19', null, null, null, null, null, 'songwg', null, '行政发布', null, '18403', null, '18403', 'Created', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18420', null, '任务填报', '18107', 'zengs1', 'ae7db010-47d7-4921-8526-34868b6de3f1', '0', '2018-01-16 00:34:19', null, null, null, null, null, 'zengs1', null, '行政发布', null, '18412', null, '18412', 'Created', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18429', null, '任务填报', '18107', 'Xianyuxb', 'd4caeee9-2461-4c5d-8fed-96da741693e9', '0', '2018-01-16 00:34:19', null, null, null, null, null, 'Xianyuxb', null, '行政发布', null, '18421', null, '18421', 'Created', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18438', null, '任务填报', '18107', 'xuxh1', '60d3e3f9-f911-4b88-a4f3-9169e6268687', '0', '2018-01-16 00:34:19', null, null, null, '2018-01-16 00:44:59', '', 'xuxh1', null, '行政发布', null, '18430', '100', '18430', 'Completed', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18447', null, '任务填报', '18107', 'Gaof', 'dcdb090a-287b-4d60-8454-8b292131b9bf', '0', '2018-01-16 00:34:19', null, null, null, null, null, 'Gaof', null, '行政发布', null, '18439', null, '18439', 'Created', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18456', null, '任务填报', '18107', 'Wangrx', 'ee9eddb1-8186-4f07-8fde-072e40393c93', '0', '2018-01-16 00:34:19', null, null, null, null, null, 'Wangrx', null, '行政发布', null, '18448', null, '18448', 'Created', '周任务发布测试', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18465', null, '任务填报', '18107', 'liuwl', '15eff167-1a38-41cc-93a5-044bdcf43467', '0', '2018-01-16 00:37:48', null, null, null, null, null, 'liuwl', null, '行政发布', null, '18457', null, '18457', 'Created', '周任务测试2', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18474', null, '任务填报', '18107', 'Liuw', 'ea663ce0-d01d-402b-9066-1f381895ceaa', '0', '2018-01-16 00:37:48', null, null, null, null, null, 'Liuw', null, '行政发布', null, '18466', null, '18466', 'Created', '周任务测试2', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18483', null, '任务填报', '18107', 'Zhangzh', 'c27d0ab2-11c5-4d6a-89fc-468eca6b122c', '0', '2018-01-16 00:37:48', null, null, null, null, null, 'Zhangzh', null, '行政发布', null, '18475', null, '18475', 'Created', '周任务测试2', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18492', null, '任务填报', '18107', 'Luj', '0096ce13-658c-4ea1-a109-c56781a80a5c', '0', '2018-01-16 00:37:48', null, null, null, null, null, 'Luj', null, '行政发布', null, '18484', null, '18484', 'Created', '周任务测试2', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18501', null, '任务填报', '18107', 'Qinl', '2616d459-e981-49e9-a977-46089c260f00', '0', '2018-01-16 00:37:48', null, null, null, null, null, 'Qinl', null, '行政发布', null, '18493', null, '18493', 'Created', '周任务测试2', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18510', null, '任务填报', '18107', 'Qinxc', '52fecc93-d10f-4e07-b743-7002b1e291b1', '0', '2018-01-16 00:37:48', null, null, null, null, null, 'Qinxc', null, '行政发布', null, '18502', null, '18502', 'Created', '周任务测试2', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18519', null, '任务填报', '18107', 'songwg', '36b41911-74be-4e89-a268-bdefb613eebf', '0', '2018-01-16 00:37:49', null, null, null, null, null, 'songwg', null, '行政发布', null, '18511', null, '18511', 'Created', '周任务测试2', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18528', null, '任务填报', '18107', 'zengs1', '55226ed2-fc50-4b10-89aa-5d6e16c8d3e6', '0', '2018-01-16 00:37:49', null, null, null, null, null, 'zengs1', null, '行政发布', null, '18520', null, '18520', 'Created', '周任务测试2', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18537', null, '任务填报', '18107', 'Xianyuxb', 'b94622eb-9743-4ea5-aeb6-1c138bb8c5f0', '0', '2018-01-16 00:37:49', null, null, null, null, null, 'Xianyuxb', null, '行政发布', null, '18529', null, '18529', 'Created', '周任务测试2', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18555', null, '任务填报', '18107', 'Gaof', '7707638d-2fbc-4f02-901d-f20079dcb089', '0', '2018-01-16 00:37:49', null, null, null, null, null, 'Gaof', null, '行政发布', null, '18547', null, '18547', 'Created', '周任务测试2', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18564', null, '任务填报', '18107', 'Wangrx', '832baec1-7764-4874-be19-6c8490e573c3', '0', '2018-01-16 00:37:49', null, null, null, null, null, 'Wangrx', null, '行政发布', null, '18556', null, '18556', 'Created', '周任务测试2', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18574', null, '部门审核', '18107', 'Qinxc', '60d3e3f9-f911-4b88-a4f3-9169e6268687', '0', '2018-01-16 00:45:00', null, null, null, null, null, 'Qinxc', null, '任务填报', null, '18430', null, '18430', 'Created', '周任务发布测试', '【许晓卉】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18587', null, '任务填报', '18107', 'liuwl', '25bace80-aec3-49cf-a615-3e36a4bfb5b4', '0', '2018-01-16 08:56:39', null, null, null, null, null, 'liuwl', null, '行政发布', null, '18579', null, '18579', 'Created', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18596', null, '任务填报', '18107', 'Liuw', 'c80a41ef-fb10-4d9a-b7f0-8a5e7d2da698', '0', '2018-01-16 08:56:39', null, null, null, null, null, 'Liuw', null, '行政发布', null, '18588', null, '18588', 'Created', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18605', null, '任务填报', '18107', 'Zhangzh', 'bb689532-7e73-4a46-aa8e-32804733d250', '0', '2018-01-16 08:56:39', null, null, null, null, null, 'Zhangzh', null, '行政发布', null, '18597', null, '18597', 'Created', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18614', null, '任务填报', '18107', 'Luj', 'bc70fa31-ddc3-46e0-a3c1-bec03cc6192d', '0', '2018-01-16 08:56:39', null, null, null, null, null, 'Luj', null, '行政发布', null, '18606', null, '18606', 'Created', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18623', null, '任务填报', '18107', 'Qinl', '781fab63-7d3d-4a53-a89c-c5e25b9869b4', '0', '2018-01-16 08:56:40', null, null, null, null, null, 'Qinl', null, '行政发布', null, '18615', null, '18615', 'Created', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18632', null, '任务填报', '18107', 'Qinxc', 'd6a26344-c24b-4612-bc04-253b39184b78', '0', '2018-01-16 08:56:40', null, null, null, null, null, 'Qinxc', null, '行政发布', null, '18624', null, '18624', 'Created', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18641', null, '任务填报', '18107', 'songwg', '421dd18b-e08a-4d1a-9408-f8c91663bef7', '0', '2018-01-16 08:56:40', null, null, null, null, null, 'songwg', null, '行政发布', null, '18633', null, '18633', 'Created', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18650', null, '任务填报', '18107', 'zengs1', '7c0acf96-0050-4436-9569-572dcdae70bc', '0', '2018-01-16 08:56:40', null, null, null, null, null, 'zengs1', null, '行政发布', null, '18642', null, '18642', 'Created', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18659', null, '任务填报', '18107', 'Xianyuxb', 'b6be0169-3f19-40e3-8d0d-e5f59776a276', '0', '2018-01-16 08:56:40', null, null, null, null, null, 'Xianyuxb', null, '行政发布', null, '18651', null, '18651', 'Created', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18668', null, '任务填报', '18107', 'xuxh1', '06f90f18-73c3-4ef5-b24f-6bd259692420', '0', '2018-01-16 08:56:40', null, null, null, '2018-01-16 08:57:57', '', 'xuxh1', null, '行政发布', null, '18660', '100', '18660', 'Completed', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18677', null, '任务填报', '18107', 'Gaof', '870a12b6-435b-4c10-bc05-60ee3bac0cf9', '0', '2018-01-16 08:56:40', null, null, null, null, null, 'Gaof', null, '行政发布', null, '18669', null, '18669', 'Created', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18686', null, '任务填报', '18107', 'Wangrx', 'fe137b3e-6eb4-4d75-a206-0f7ed7582e1f', '0', '2018-01-16 08:56:40', null, null, null, null, null, 'Wangrx', null, '行政发布', null, '18678', null, '18678', 'Created', '周任务测试33', '【许晓卉】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18691', null, '部门审核', '18107', 'Qinxc', '06f90f18-73c3-4ef5-b24f-6bd259692420', '0', '2018-01-16 08:57:57', null, null, null, null, null, 'Qinxc', null, '任务填报', null, '18660', null, '18660', 'Created', '周任务测试33', '【许晓卉】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('18817', null, '部门填报', '18111', 'LuW', '38b820be-34cd-4c57-b747-bd3387c4efaf', '0', '2018-01-16 09:27:38', null, null, null, '2018-01-16 09:31:13', '同意:OK', 'LuW', null, '开始', null, '18809', '100', '18809', 'Completed', '【合同】月计划填报：1月合同测试。【截止日期20180120】', '【刘伟龙】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('18822', null, '部门审核', '18111', 'Yuany', '38b820be-34cd-4c57-b747-bd3387c4efaf', '0', '2018-01-16 09:31:15', null, null, null, null, null, 'Yuany', null, '部门填报', null, '18809', null, '18809', 'Created', '【合同】月计划填报：1月合同测试。【截止日期20180120】', '【卢玮】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('18831', '', '部门填报', '18105', 'Duanwb', '499b5202-36c8-46f0-8e7f-3ce65be0d90b', '0', '2018-01-16 09:40:39', null, null, null, null, null, 'Duanwb', null, '开始', null, '18823', null, '18823', 'Created', '【产值】年计划填报：产值测试。【截止日期20180119】', '【袁殷】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv041.d');
INSERT INTO `uflo_task` VALUES ('18909', null, '部门审核', '18109', 'Qinxc', 'e17ab167-6af9-4654-83a3-7bcc4dcf8076', '0', '2018-01-16 11:56:42', null, null, null, null, null, 'Qinxc', null, '开始', null, '18901', null, '18901', 'Created', '【合同】月计划汇总：2018年1月合同计划汇总测试。【截止日期20180118】', '【许晓卉】提交的汇总审核', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19018', null, '任务填报', '18107', 'Gex', '1b35cbd2-011d-4fbe-ab70-4f93f29df891', '0', '2018-01-17 09:24:44', null, null, null, null, null, 'Gex', null, '行政发布', null, '19010', null, '19010', 'Created', '检测中心（实验室）第四周工作计划', '【杨迎】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19036', null, '任务填报', '18107', 'Luox', 'bc121d8f-0246-471c-bc36-6c55902ba97e', '0', '2018-01-17 09:24:44', null, null, null, null, null, 'Luox', null, '行政发布', null, '19028', null, '19028', 'Created', '检测中心（实验室）第四周工作计划', '【杨迎】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19054', null, '任务填报', '18107', 'Zenglq', '97d6f46f-7c37-41d2-b581-c0b838a1be13', '0', '2018-01-17 09:24:44', null, null, null, null, null, 'Zenglq', null, '行政发布', null, '19046', null, '19046', 'Created', '检测中心（实验室）第四周工作计划', '【杨迎】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19149', null, '任务填报', '18107', 'Wangr', '4ee61181-e9f2-4e86-a46b-ade2627a5a66', '0', '2018-01-17 10:13:38', null, null, null, '2018-01-19 15:14:56', '', 'Wangr', null, '行政发布', null, '19141', '100', '19141', 'Completed', '填报1月第四周工作计划', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19158', null, '任务填报', '18107', 'Xinw', 'c7446aeb-a7a9-4709-ba09-9a3589f0a825', '0', '2018-01-17 10:13:38', null, null, null, null, null, 'Xinw', null, '行政发布', null, '19150', null, '19150', 'Created', '填报1月第四周工作计划', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19224', null, '任务填报', '18107', 'Caiz', 'b0f8644c-bb61-48d4-91d6-d8f7b344f64a', '0', '2018-01-18 16:53:21', null, null, null, null, null, 'Caiz', null, '行政发布', null, '19216', null, '19216', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19233', null, '任务填报', '18107', 'Mengly', '3142cbcb-8018-4cda-b637-8656a387cd6a', '0', '2018-01-18 16:53:21', null, null, null, null, null, 'Mengly', null, '行政发布', null, '19225', null, '19225', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19242', null, '任务填报', '18107', 'Xiongw', 'b146d22a-0bb8-419a-a40e-8fc20a54fbd6', '0', '2018-01-18 16:53:22', null, null, null, null, null, 'Xiongw', null, '行政发布', null, '19234', null, '19234', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19260', null, '任务填报', '18107', 'Gex', '7909eab5-a09c-4a25-9469-1947852418c2', '0', '2018-01-18 16:53:22', null, null, null, null, null, 'Gex', null, '行政发布', null, '19252', null, '19252', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19269', null, '任务填报', '18107', 'yangying', 'ecd03c7f-94b1-4cc7-a369-3b2fbc196de9', '0', '2018-01-18 16:53:22', null, null, null, '2018-01-18 16:58:05', '', 'yangying', null, '行政发布', null, '19261', '100', '19261', 'Completed', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19278', null, '任务填报', '18107', 'Luox', '64dec6d0-f2b9-40b9-9a6a-98f29a9b28d4', '0', '2018-01-18 16:53:22', null, null, null, null, null, 'Luox', null, '行政发布', null, '19270', null, '19270', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19287', null, '任务填报', '18107', 'Chengy', '101d6199-5b46-463a-9cae-0c3a0b7b443a', '0', '2018-01-18 16:53:22', null, null, null, null, null, 'Chengy', null, '行政发布', null, '19279', null, '19279', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19296', null, '任务填报', '18107', 'Zenglq', '4df5de45-e12d-4dd8-8d8a-0fa3f7262575', '0', '2018-01-18 16:53:23', null, null, null, null, null, 'Zenglq', null, '行政发布', null, '19288', null, '19288', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19323', null, '任务填报', '18107', 'Fangsl', '15319e70-459b-4488-8384-422099bdfea4', '0', '2018-01-18 16:53:23', null, null, null, null, null, 'Fangsl', null, '行政发布', null, '19315', null, '19315', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19332', null, '任务填报', '18107', 'Jinw', '8a642e91-d8ee-4c5b-bde7-e94fec5097f3', '0', '2018-01-18 16:53:23', null, null, null, '2018-01-19 15:26:17', '', 'Jinw', null, '行政发布', null, '19324', '100', '19324', 'Completed', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19341', null, '任务填报', '18107', 'lexh', '83c040e1-cdd9-4b19-a14f-c2b86867dbba', '0', '2018-01-18 16:53:24', null, null, null, '2018-01-19 16:12:17', '', 'lexh', null, '行政发布', null, '19333', '100', '19333', 'Completed', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19350', null, '任务填报', '18107', 'Wanghb', '1fc7030e-19c6-4855-9af0-088f1a99d270', '0', '2018-01-18 16:53:24', null, null, null, '2018-01-19 15:35:28', '', 'Wanghb', null, '行政发布', null, '19342', '100', '19342', 'Completed', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19359', null, '任务填报', '18107', 'Xiars', '57b0463f-ed25-4e6b-99c5-3d1e98d3ba54', '0', '2018-01-18 16:53:24', null, null, null, '2018-01-19 15:38:08', '', 'Xiars', null, '行政发布', null, '19351', '100', '19351', 'Completed', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19368', null, '任务填报', '18107', 'Zengzm', '3e906c2c-673b-4635-b864-75c0354ce8ba', '0', '2018-01-18 16:53:24', null, null, null, null, null, 'Zengzm', null, '行政发布', null, '19360', null, '19360', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19377', null, '任务填报', '18107', 'Yim', 'e4b3877f-47f4-4bda-b23b-810de0317285', '0', '2018-01-18 16:53:24', null, null, null, null, null, 'Yim', null, '行政发布', null, '19369', null, '19369', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19422', null, '任务填报', '18107', 'Taoxf', 'f47ba3e3-e91d-42c0-a5dd-95be827c7876', '0', '2018-01-18 16:53:25', null, null, null, null, null, 'Taoxf', null, '行政发布', null, '19414', null, '19414', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19431', null, '任务填报', '18107', 'Tongt', 'b0d3e17c-047e-4d3e-a1f1-d3282e753781', '0', '2018-01-18 16:53:25', null, null, null, '2018-01-19 15:41:37', '', 'Tongt', null, '行政发布', null, '19423', '100', '19423', 'Completed', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19440', null, '任务填报', '18107', 'Wangr', 'a49a15d0-10ec-4c91-84a4-1f92d68180d7', '0', '2018-01-18 16:53:25', null, null, null, null, null, 'Wangr', null, '行政发布', null, '19432', null, '19432', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19449', null, '任务填报', '18107', 'Xinw', 'ab4f2726-7ebf-46e6-bc40-d5b638a7455a', '0', '2018-01-18 16:53:25', null, null, null, null, null, 'Xinw', null, '行政发布', null, '19441', null, '19441', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19458', null, '任务填报', '18107', 'zhoud', '5a338b10-63ae-4d11-a8de-4c0b77b34e25', '0', '2018-01-18 16:53:25', null, null, null, null, null, 'zhoud', null, '行政发布', null, '19450', null, '19450', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19467', null, '任务填报', '18107', 'Gaocr', '6a92664b-2e48-46c0-a718-ffd0b1ff3234', '0', '2018-01-18 16:53:26', null, null, null, null, null, 'Gaocr', null, '行政发布', null, '19459', null, '19459', 'Created', '2018年第3周工作计划填报', '【崔海华】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19490', null, '部门审核', '18107', 'Cuihh', 'ecd03c7f-94b1-4cc7-a369-3b2fbc196de9', '0', '2018-01-18 16:58:05', null, null, null, null, null, 'Cuihh', null, '任务填报', null, '19261', null, '19261', 'Created', '2018年第3周工作计划填报', '【杨迎】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19613', null, '部门填报', '18113', 'Cuihh', 'fe385bcf-39e0-410c-bd01-7bcf18853e07', '0', '2018-01-19 14:28:44', null, null, null, null, null, 'Cuihh', null, '开始', null, '19605', null, '19605', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19622', null, '部门填报', '18113', 'Caiz', '0f0550a4-7865-4eff-9eef-59b0e2517a29', '0', '2018-01-19 14:28:44', null, null, null, null, null, 'Caiz', null, '开始', null, '19614', null, '19614', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19631', null, '部门填报', '18113', 'Mengly', '9ffc5d49-36c7-4990-be07-ee1268a8f441', '0', '2018-01-19 14:28:44', null, null, null, null, null, 'Mengly', null, '开始', null, '19623', null, '19623', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19640', null, '部门填报', '18113', 'Xiongw', '6f8536a7-7df4-4f95-bdb3-df7bbe075d26', '0', '2018-01-19 14:28:44', null, null, null, null, null, 'Xiongw', null, '开始', null, '19632', null, '19632', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19649', null, '部门填报', '18113', 'Xinw', '61c0663b-ebee-49b9-b3bb-3f86b3b804d8', '0', '2018-01-19 14:28:44', null, null, null, null, null, 'Xinw', null, '开始', null, '19641', null, '19641', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19658', null, '部门填报', '18113', 'Fangsl', '21f79b27-fbeb-4daf-903c-0602ca6f05af', '0', '2018-01-19 14:28:44', null, null, null, null, null, 'Fangsl', null, '开始', null, '19650', null, '19650', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19667', null, '部门填报', '18113', 'Jinw', '940284b2-0430-4a34-bf57-3adb393e2ef0', '0', '2018-01-19 14:28:45', null, null, null, null, null, 'Jinw', null, '开始', null, '19659', null, '19659', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19676', null, '部门填报', '18113', '00082', 'd1ad7e95-af1a-4fc0-b6da-23c143c6414c', '0', '2018-01-19 14:28:45', null, null, null, null, null, '00082', null, '开始', null, '19668', null, '19668', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19685', null, '部门填报', '18113', 'Wanghb', 'f17ac449-9fc3-4f93-9ac8-67b8e59ad0cc', '0', '2018-01-19 14:28:45', null, null, null, null, null, 'Wanghb', null, '开始', null, '19677', null, '19677', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19694', null, '部门填报', '18113', 'Xiars', 'e3e34f59-25b4-44da-83c6-d0468baae551', '0', '2018-01-19 14:28:45', null, null, null, null, null, 'Xiars', null, '开始', null, '19686', null, '19686', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19703', null, '部门填报', '18113', 'Yim', '3ce58452-758f-4331-b071-8cb892935a69', '0', '2018-01-19 14:28:45', null, null, null, null, null, 'Yim', null, '开始', null, '19695', null, '19695', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19712', null, '部门填报', '18113', 'Chengy', '803e0e96-feb3-44d2-9c2f-9ec7169eb0f8', '0', '2018-01-19 14:28:46', null, null, null, null, null, 'Chengy', null, '开始', null, '19704', null, '19704', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19721', null, '部门填报', '18113', 'Gex', '9b023634-86f6-48ec-8618-9ef1506f19b4', '0', '2018-01-19 14:28:46', null, null, null, null, null, 'Gex', null, '开始', null, '19713', null, '19713', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19730', null, '部门填报', '18113', 'Luox', '93d710f5-c722-48ec-b59e-9eb88f48a458', '0', '2018-01-19 14:28:46', null, null, null, null, null, 'Luox', null, '开始', null, '19722', null, '19722', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19739', null, '部门填报', '18113', 'yangying', '8826725f-db13-4715-8f7f-905339ac11fe', '0', '2018-01-19 14:28:46', null, null, null, null, null, 'yangying', null, '开始', null, '19731', null, '19731', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19748', null, '部门填报', '18113', 'Zenglq', '0f4a5003-1ec3-4673-999c-6cc8ba3c769f', '0', '2018-01-19 14:28:46', null, null, null, null, null, 'Zenglq', null, '开始', null, '19740', null, '19740', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19757', null, '部门填报', '18113', 'Zhaom', '7bf9aad7-bad0-432a-9380-9c8145a2a023', '0', '2018-01-19 14:28:46', null, null, null, null, null, 'Zhaom', null, '开始', null, '19749', null, '19749', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19766', null, '部门填报', '18113', 'lexh', 'eabdf0fc-fc28-4d3d-8957-b0011334e7f5', '0', '2018-01-19 14:28:47', null, null, null, null, null, 'lexh', null, '开始', null, '19758', null, '19758', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19775', null, '部门填报', '18113', 'Duanwb', '154a3bbe-15c1-4ec5-a9f1-29d3cd63f1b8', '0', '2018-01-19 14:28:47', null, null, null, null, null, 'Duanwb', null, '开始', null, '19767', null, '19767', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19784', null, '部门填报', '18113', 'Gaocr', '668885ff-78f0-4342-8b36-2696c1ada324', '0', '2018-01-19 14:28:47', null, null, null, null, null, 'Gaocr', null, '开始', null, '19776', null, '19776', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19793', null, '部门填报', '18113', 'Guangwx', 'd557d6b6-3b4b-40a5-bc93-18ef44f7da8c', '0', '2018-01-19 14:28:47', null, null, null, '2018-01-24 14:42:19', '同意:无意见', 'Guangwx', null, '开始', null, '19785', '100', '19785', 'Completed', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19802', null, '部门填报', '18113', 'Huangsx', '96346f49-c637-4b03-857e-15d5e135fef5', '0', '2018-01-19 14:28:47', null, null, null, null, null, 'Huangsx', null, '开始', null, '19794', null, '19794', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19811', null, '部门填报', '18113', 'Taoxf', 'b32cf8c7-81f9-448e-9cf1-644784ebe6d9', '0', '2018-01-19 14:28:47', null, null, null, null, null, 'Taoxf', null, '开始', null, '19803', null, '19803', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19820', null, '部门填报', '18113', 'Tongt', '5eb910c0-7fd7-44aa-9f0c-f705f643bee7', '0', '2018-01-19 14:28:47', null, null, null, null, null, 'Tongt', null, '开始', null, '19812', null, '19812', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19829', null, '部门填报', '18113', 'Wangr', 'd75b31c0-854a-43fb-a5a6-f1f906b0ea31', '0', '2018-01-19 14:28:48', null, null, null, null, null, 'Wangr', null, '开始', null, '19821', null, '19821', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19838', null, '部门填报', '18113', 'zhoud', 'a648e336-29e3-4c76-86ae-7cba9de160f4', '0', '2018-01-19 14:28:48', null, null, null, null, null, 'zhoud', null, '开始', null, '19830', null, '19830', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【崔海华】发布的填报任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19851', null, '部门审核', '18107', 'Gaocr', '4ee61181-e9f2-4e86-a46b-ade2627a5a66', '0', '2018-01-19 15:14:56', null, null, null, null, null, 'Gaocr', null, '任务填报', null, '19141', null, '19141', 'Created', '填报1月第四周工作计划', '【汪锐】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19856', null, '部门审核', '18107', 'Yim', '8a642e91-d8ee-4c5b-bde7-e94fec5097f3', '0', '2018-01-19 15:26:17', null, null, null, null, null, 'Yim', null, '任务填报', null, '19324', null, '19324', 'Created', '2018年第3周工作计划填报', '【金伟】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19861', null, '部门审核', '18107', 'Yim', '1fc7030e-19c6-4855-9af0-088f1a99d270', '0', '2018-01-19 15:35:28', null, null, null, null, null, 'Yim', null, '任务填报', null, '19342', null, '19342', 'Created', '2018年第3周工作计划填报', '【王浩宾】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19866', null, '部门审核', '18107', 'Yim', '57b0463f-ed25-4e6b-99c5-3d1e98d3ba54', '0', '2018-01-19 15:38:08', null, null, null, null, null, 'Yim', null, '任务填报', null, '19351', null, '19351', 'Created', '2018年第3周工作计划填报', '【夏任司】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19871', null, '部门审核', '18107', 'Gaocr', 'b0d3e17c-047e-4d3e-a1f1-d3282e753781', '0', '2018-01-19 15:41:37', null, null, null, null, null, 'Gaocr', null, '任务填报', null, '19423', null, '19423', 'Created', '2018年第3周工作计划填报', '【童涛】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19876', null, '部门审核', '18107', 'Yim', '83c040e1-cdd9-4b19-a14f-c2b86867dbba', '0', '2018-01-19 16:12:17', null, null, null, null, null, 'Yim', null, '任务填报', null, '19333', null, '19333', 'Created', '2018年第3周工作计划填报', '【乐雪焕】提交的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19905', null, '部门审核', '18113', 'Gaocr', 'd557d6b6-3b4b-40a5-bc93-18ef44f7da8c', '0', '2018-01-24 14:42:19', null, null, null, null, null, 'Gaocr', null, '部门填报', null, '19785', null, '19785', 'Created', '【产值】月计划填报：2018年1月产值计划。【截止日期20180131】', '【光文祥】提交的审核任务', 'Normal', 'com.jghz.op.view.opjv051.d');
INSERT INTO `uflo_task` VALUES ('19914', null, '任务填报', '18107', 'lexh', '89c81285-2757-4f9f-9046-c9f2dd6c1b5d', '0', '2018-01-25 08:59:13', null, null, null, null, null, 'lexh', null, '行政发布', null, '19906', null, '19906', 'Created', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19923', null, '任务填报', '18107', 'Duanwb', '3c161602-d562-4fe6-96e3-0846c65bd8ce', '0', '2018-01-25 08:59:13', null, null, null, null, null, 'Duanwb', null, '行政发布', null, '19915', null, '19915', 'Created', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19932', null, '任务填报', '18107', 'Gaocr', 'fca23947-b1b0-4481-8f46-8db7feee9e9c', '0', '2018-01-25 08:59:13', null, null, null, null, null, 'Gaocr', null, '行政发布', null, '19924', null, '19924', 'Created', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19941', null, '任务填报', '18107', 'Guangwx', 'c2371951-a4c3-408d-94f7-d7745c6bfa78', '0', '2018-01-25 08:59:13', null, null, null, null, null, 'Guangwx', null, '行政发布', null, '19933', null, '19933', 'Created', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19950', null, '任务填报', '18107', 'Huangsx', 'e942f857-be0d-4061-9db0-9b9fad363875', '0', '2018-01-25 08:59:13', null, null, null, null, null, 'Huangsx', null, '行政发布', null, '19942', null, '19942', 'Created', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19959', null, '任务填报', '18107', 'Taoxf', 'e2b03f41-f555-4600-a11a-dea2c2c447f7', '0', '2018-01-25 08:59:14', null, null, null, null, null, 'Taoxf', null, '行政发布', null, '19951', null, '19951', 'Created', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19968', null, '任务填报', '18107', 'Tongt', 'a448a730-1937-4916-8263-afea2182f998', '0', '2018-01-25 08:59:14', null, null, null, null, null, 'Tongt', null, '行政发布', null, '19960', null, '19960', 'Created', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19977', null, '任务填报', '18107', 'Wangr', '1c628366-4897-4368-abbd-faa6570193aa', '0', '2018-01-25 08:59:14', null, null, null, null, null, 'Wangr', null, '行政发布', null, '19969', null, '19969', 'Created', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');
INSERT INTO `uflo_task` VALUES ('19986', null, '任务填报', '18107', 'zhoud', 'e2ccfaf3-ba21-4fbe-a62f-6fa83ec3a42a', '0', '2018-01-25 08:59:14', null, null, null, null, null, 'zhoud', null, '行政发布', null, '19978', null, '19978', 'Created', '【2018年2月第1周】周工作填报：安全技术咨询中心2月第1周工作计划填报', '【高长仁】下发的周任务', 'Normal', 'com.jghz.op.view.opjv061.d');

-- ----------------------------
-- Table structure for uflo_task_appointor
-- ----------------------------
DROP TABLE IF EXISTS `uflo_task_appointor`;
CREATE TABLE `uflo_task_appointor` (
  `ID_` bigint(20) NOT NULL,
  `APPOINTOR_` varchar(60) DEFAULT NULL,
  `APPOINTOR_NODE_` varchar(60) DEFAULT NULL,
  `OWNER_` varchar(60) DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `TASK_NODE_NAME_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_task_appointor
-- ----------------------------
INSERT INTO `uflo_task_appointor` VALUES ('17293', 'Duanhl', '任务填报', 'Xuhj', '17284', '部门审核');

-- ----------------------------
-- Table structure for uflo_task_participator
-- ----------------------------
DROP TABLE IF EXISTS `uflo_task_participator`;
CREATE TABLE `uflo_task_participator` (
  `ID_` bigint(20) NOT NULL,
  `TASK_ID_` bigint(20) NOT NULL,
  `USER_` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FKEC9EE25955ECFDEB` (`TASK_ID_`) USING BTREE,
  CONSTRAINT `uflo_task_participator_ibfk_1` FOREIGN KEY (`TASK_ID_`) REFERENCES `uflo_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_task_participator
-- ----------------------------

-- ----------------------------
-- Table structure for uflo_task_reminder
-- ----------------------------
DROP TABLE IF EXISTS `uflo_task_reminder`;
CREATE TABLE `uflo_task_reminder` (
  `ID_` bigint(20) NOT NULL,
  `CRON_` varchar(60) DEFAULT NULL,
  `PROCESS_ID_` bigint(20) DEFAULT NULL,
  `REMINDER_HANDLER_BEAN_` varchar(120) DEFAULT NULL,
  `START_DATE_` datetime DEFAULT NULL,
  `TASK_ID_` bigint(20) DEFAULT NULL,
  `TASK_NODE_NAME_` varchar(60) DEFAULT NULL,
  `REMINDER_TYPE_` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_task_reminder
-- ----------------------------

-- ----------------------------
-- Table structure for uflo_variable
-- ----------------------------
DROP TABLE IF EXISTS `uflo_variable`;
CREATE TABLE `uflo_variable` (
  `TYPE_` varchar(30) NOT NULL,
  `ID_` bigint(20) NOT NULL,
  `KEY_` varchar(60) DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `ROOT_PROCESS_INSTANCE_ID_` bigint(20) DEFAULT NULL,
  `BLOB_ID_` bigint(20) DEFAULT NULL,
  `BOOLEAN_VALUE_` bit(1) DEFAULT NULL,
  `BYTE_VALUE_` tinyint(4) DEFAULT NULL,
  `CHARACTER_VALUE_` char(1) DEFAULT NULL,
  `DATE_VALUE_` datetime DEFAULT NULL,
  `DOUBLE_VALUE_` double DEFAULT NULL,
  `FLOAT_VALUE_` float DEFAULT NULL,
  `INTEGER_VALUE_` int(11) DEFAULT NULL,
  `LONG_VALUE_` bigint(20) DEFAULT NULL,
  `SHORT_VALUE_` smallint(6) DEFAULT NULL,
  `STRING_VALUE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uflo_variable
-- ----------------------------
INSERT INTO `uflo_variable` VALUES ('String', '18226', 'fromUser', '18201', '18201', null, null, null, null, null, null, null, null, null, null, '于晶锦');
INSERT INTO `uflo_variable` VALUES ('String', '18227', 'user', '18201', '18201', null, null, null, null, null, null, null, null, null, null, 'xuxh1');
INSERT INTO `uflo_variable` VALUES ('String', '18251', 'user', '18249', '18249', null, null, null, null, null, null, null, null, null, null, 'liuwl');
INSERT INTO `uflo_variable` VALUES ('String', '18252', 'fromUser', '18249', '18249', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18260', 'user', '18258', '18258', null, null, null, null, null, null, null, null, null, null, 'Liuw');
INSERT INTO `uflo_variable` VALUES ('String', '18261', 'fromUser', '18258', '18258', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18269', 'user', '18267', '18267', null, null, null, null, null, null, null, null, null, null, 'Zhangzh');
INSERT INTO `uflo_variable` VALUES ('String', '18270', 'fromUser', '18267', '18267', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18278', 'user', '18276', '18276', null, null, null, null, null, null, null, null, null, null, 'Luj');
INSERT INTO `uflo_variable` VALUES ('String', '18279', 'fromUser', '18276', '18276', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18287', 'user', '18285', '18285', null, null, null, null, null, null, null, null, null, null, 'Qinl');
INSERT INTO `uflo_variable` VALUES ('String', '18288', 'fromUser', '18285', '18285', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18296', 'user', '18294', '18294', null, null, null, null, null, null, null, null, null, null, 'Qinxc');
INSERT INTO `uflo_variable` VALUES ('String', '18297', 'fromUser', '18294', '18294', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18405', 'user', '18403', '18403', null, null, null, null, null, null, null, null, null, null, 'songwg');
INSERT INTO `uflo_variable` VALUES ('String', '18406', 'fromUser', '18403', '18403', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18414', 'user', '18412', '18412', null, null, null, null, null, null, null, null, null, null, 'zengs1');
INSERT INTO `uflo_variable` VALUES ('String', '18415', 'fromUser', '18412', '18412', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18423', 'user', '18421', '18421', null, null, null, null, null, null, null, null, null, null, 'Xianyuxb');
INSERT INTO `uflo_variable` VALUES ('String', '18424', 'fromUser', '18421', '18421', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18441', 'user', '18439', '18439', null, null, null, null, null, null, null, null, null, null, 'Gaof');
INSERT INTO `uflo_variable` VALUES ('String', '18442', 'fromUser', '18439', '18439', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18450', 'user', '18448', '18448', null, null, null, null, null, null, null, null, null, null, 'Wangrx');
INSERT INTO `uflo_variable` VALUES ('String', '18451', 'fromUser', '18448', '18448', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18459', 'user', '18457', '18457', null, null, null, null, null, null, null, null, null, null, 'liuwl');
INSERT INTO `uflo_variable` VALUES ('String', '18460', 'fromUser', '18457', '18457', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18468', 'user', '18466', '18466', null, null, null, null, null, null, null, null, null, null, 'Liuw');
INSERT INTO `uflo_variable` VALUES ('String', '18469', 'fromUser', '18466', '18466', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18477', 'user', '18475', '18475', null, null, null, null, null, null, null, null, null, null, 'Zhangzh');
INSERT INTO `uflo_variable` VALUES ('String', '18478', 'fromUser', '18475', '18475', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18486', 'user', '18484', '18484', null, null, null, null, null, null, null, null, null, null, 'Luj');
INSERT INTO `uflo_variable` VALUES ('String', '18487', 'fromUser', '18484', '18484', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18495', 'user', '18493', '18493', null, null, null, null, null, null, null, null, null, null, 'Qinl');
INSERT INTO `uflo_variable` VALUES ('String', '18496', 'fromUser', '18493', '18493', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18504', 'user', '18502', '18502', null, null, null, null, null, null, null, null, null, null, 'Qinxc');
INSERT INTO `uflo_variable` VALUES ('String', '18505', 'fromUser', '18502', '18502', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18513', 'user', '18511', '18511', null, null, null, null, null, null, null, null, null, null, 'songwg');
INSERT INTO `uflo_variable` VALUES ('String', '18514', 'fromUser', '18511', '18511', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18522', 'user', '18520', '18520', null, null, null, null, null, null, null, null, null, null, 'zengs1');
INSERT INTO `uflo_variable` VALUES ('String', '18523', 'fromUser', '18520', '18520', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18531', 'user', '18529', '18529', null, null, null, null, null, null, null, null, null, null, 'Xianyuxb');
INSERT INTO `uflo_variable` VALUES ('String', '18532', 'fromUser', '18529', '18529', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18549', 'user', '18547', '18547', null, null, null, null, null, null, null, null, null, null, 'Gaof');
INSERT INTO `uflo_variable` VALUES ('String', '18550', 'fromUser', '18547', '18547', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18558', 'user', '18556', '18556', null, null, null, null, null, null, null, null, null, null, 'Wangrx');
INSERT INTO `uflo_variable` VALUES ('String', '18559', 'fromUser', '18556', '18556', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18571', 'fromUser', '18430', '18430', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18572', 'user', '18430', '18430', null, null, null, null, null, null, null, null, null, null, 'Qinxc');
INSERT INTO `uflo_variable` VALUES ('String', '18581', 'user', '18579', '18579', null, null, null, null, null, null, null, null, null, null, 'liuwl');
INSERT INTO `uflo_variable` VALUES ('String', '18582', 'fromUser', '18579', '18579', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18590', 'user', '18588', '18588', null, null, null, null, null, null, null, null, null, null, 'Liuw');
INSERT INTO `uflo_variable` VALUES ('String', '18591', 'fromUser', '18588', '18588', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18599', 'user', '18597', '18597', null, null, null, null, null, null, null, null, null, null, 'Zhangzh');
INSERT INTO `uflo_variable` VALUES ('String', '18600', 'fromUser', '18597', '18597', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18608', 'user', '18606', '18606', null, null, null, null, null, null, null, null, null, null, 'Luj');
INSERT INTO `uflo_variable` VALUES ('String', '18609', 'fromUser', '18606', '18606', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18617', 'user', '18615', '18615', null, null, null, null, null, null, null, null, null, null, 'Qinl');
INSERT INTO `uflo_variable` VALUES ('String', '18618', 'fromUser', '18615', '18615', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18626', 'user', '18624', '18624', null, null, null, null, null, null, null, null, null, null, 'Qinxc');
INSERT INTO `uflo_variable` VALUES ('String', '18627', 'fromUser', '18624', '18624', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18635', 'user', '18633', '18633', null, null, null, null, null, null, null, null, null, null, 'songwg');
INSERT INTO `uflo_variable` VALUES ('String', '18636', 'fromUser', '18633', '18633', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18644', 'user', '18642', '18642', null, null, null, null, null, null, null, null, null, null, 'zengs1');
INSERT INTO `uflo_variable` VALUES ('String', '18645', 'fromUser', '18642', '18642', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18653', 'user', '18651', '18651', null, null, null, null, null, null, null, null, null, null, 'Xianyuxb');
INSERT INTO `uflo_variable` VALUES ('String', '18654', 'fromUser', '18651', '18651', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18671', 'user', '18669', '18669', null, null, null, null, null, null, null, null, null, null, 'Gaof');
INSERT INTO `uflo_variable` VALUES ('String', '18672', 'fromUser', '18669', '18669', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18680', 'user', '18678', '18678', null, null, null, null, null, null, null, null, null, null, 'Wangrx');
INSERT INTO `uflo_variable` VALUES ('String', '18681', 'fromUser', '18678', '18678', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18688', 'fromUser', '18660', '18660', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18689', 'user', '18660', '18660', null, null, null, null, null, null, null, null, null, null, 'Qinxc');
INSERT INTO `uflo_variable` VALUES ('String', '18819', 'fromUser', '18809', '18809', null, null, null, null, null, null, null, null, null, null, '卢玮');
INSERT INTO `uflo_variable` VALUES ('String', '18820', 'user', '18809', '18809', null, null, null, null, null, null, null, null, null, null, 'Yuany');
INSERT INTO `uflo_variable` VALUES ('String', '18825', 'fromUser', '18823', '18823', null, null, null, null, null, null, null, null, null, null, '袁殷');
INSERT INTO `uflo_variable` VALUES ('String', '18826', 'user', '18823', '18823', null, null, null, null, null, null, null, null, null, null, 'Duanwb');
INSERT INTO `uflo_variable` VALUES ('String', '18903', 'fromUser', '18901', '18901', null, null, null, null, null, null, null, null, null, null, '许晓卉');
INSERT INTO `uflo_variable` VALUES ('String', '18904', 'user', '18901', '18901', null, null, null, null, null, null, null, null, null, null, 'Qinxc');
INSERT INTO `uflo_variable` VALUES ('String', '19012', 'user', '19010', '19010', null, null, null, null, null, null, null, null, null, null, 'Gex');
INSERT INTO `uflo_variable` VALUES ('String', '19013', 'fromUser', '19010', '19010', null, null, null, null, null, null, null, null, null, null, '杨迎');
INSERT INTO `uflo_variable` VALUES ('String', '19030', 'user', '19028', '19028', null, null, null, null, null, null, null, null, null, null, 'Luox');
INSERT INTO `uflo_variable` VALUES ('String', '19031', 'fromUser', '19028', '19028', null, null, null, null, null, null, null, null, null, null, '杨迎');
INSERT INTO `uflo_variable` VALUES ('String', '19048', 'user', '19046', '19046', null, null, null, null, null, null, null, null, null, null, 'Zenglq');
INSERT INTO `uflo_variable` VALUES ('String', '19049', 'fromUser', '19046', '19046', null, null, null, null, null, null, null, null, null, null, '杨迎');
INSERT INTO `uflo_variable` VALUES ('String', '19152', 'user', '19150', '19150', null, null, null, null, null, null, null, null, null, null, 'Xinw');
INSERT INTO `uflo_variable` VALUES ('String', '19153', 'fromUser', '19150', '19150', null, null, null, null, null, null, null, null, null, null, '高长仁');
INSERT INTO `uflo_variable` VALUES ('String', '19218', 'user', '19216', '19216', null, null, null, null, null, null, null, null, null, null, 'Caiz');
INSERT INTO `uflo_variable` VALUES ('String', '19219', 'fromUser', '19216', '19216', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19227', 'user', '19225', '19225', null, null, null, null, null, null, null, null, null, null, 'Mengly');
INSERT INTO `uflo_variable` VALUES ('String', '19228', 'fromUser', '19225', '19225', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19236', 'user', '19234', '19234', null, null, null, null, null, null, null, null, null, null, 'Xiongw');
INSERT INTO `uflo_variable` VALUES ('String', '19237', 'fromUser', '19234', '19234', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19254', 'user', '19252', '19252', null, null, null, null, null, null, null, null, null, null, 'Gex');
INSERT INTO `uflo_variable` VALUES ('String', '19255', 'fromUser', '19252', '19252', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19272', 'user', '19270', '19270', null, null, null, null, null, null, null, null, null, null, 'Luox');
INSERT INTO `uflo_variable` VALUES ('String', '19273', 'fromUser', '19270', '19270', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19281', 'user', '19279', '19279', null, null, null, null, null, null, null, null, null, null, 'Chengy');
INSERT INTO `uflo_variable` VALUES ('String', '19282', 'fromUser', '19279', '19279', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19290', 'user', '19288', '19288', null, null, null, null, null, null, null, null, null, null, 'Zenglq');
INSERT INTO `uflo_variable` VALUES ('String', '19291', 'fromUser', '19288', '19288', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19317', 'user', '19315', '19315', null, null, null, null, null, null, null, null, null, null, 'Fangsl');
INSERT INTO `uflo_variable` VALUES ('String', '19318', 'fromUser', '19315', '19315', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19362', 'user', '19360', '19360', null, null, null, null, null, null, null, null, null, null, 'Zengzm');
INSERT INTO `uflo_variable` VALUES ('String', '19363', 'fromUser', '19360', '19360', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19371', 'user', '19369', '19369', null, null, null, null, null, null, null, null, null, null, 'Yim');
INSERT INTO `uflo_variable` VALUES ('String', '19372', 'fromUser', '19369', '19369', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19416', 'user', '19414', '19414', null, null, null, null, null, null, null, null, null, null, 'Taoxf');
INSERT INTO `uflo_variable` VALUES ('String', '19417', 'fromUser', '19414', '19414', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19434', 'user', '19432', '19432', null, null, null, null, null, null, null, null, null, null, 'Wangr');
INSERT INTO `uflo_variable` VALUES ('String', '19435', 'fromUser', '19432', '19432', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19443', 'user', '19441', '19441', null, null, null, null, null, null, null, null, null, null, 'Xinw');
INSERT INTO `uflo_variable` VALUES ('String', '19444', 'fromUser', '19441', '19441', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19452', 'user', '19450', '19450', null, null, null, null, null, null, null, null, null, null, 'zhoud');
INSERT INTO `uflo_variable` VALUES ('String', '19453', 'fromUser', '19450', '19450', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19461', 'user', '19459', '19459', null, null, null, null, null, null, null, null, null, null, 'Gaocr');
INSERT INTO `uflo_variable` VALUES ('String', '19462', 'fromUser', '19459', '19459', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19487', 'fromUser', '19261', '19261', null, null, null, null, null, null, null, null, null, null, '杨迎');
INSERT INTO `uflo_variable` VALUES ('String', '19488', 'user', '19261', '19261', null, null, null, null, null, null, null, null, null, null, 'Cuihh');
INSERT INTO `uflo_variable` VALUES ('String', '19607', 'fromUser', '19605', '19605', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19608', 'user', '19605', '19605', null, null, null, null, null, null, null, null, null, null, 'Cuihh');
INSERT INTO `uflo_variable` VALUES ('String', '19616', 'fromUser', '19614', '19614', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19617', 'user', '19614', '19614', null, null, null, null, null, null, null, null, null, null, 'Caiz');
INSERT INTO `uflo_variable` VALUES ('String', '19625', 'fromUser', '19623', '19623', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19626', 'user', '19623', '19623', null, null, null, null, null, null, null, null, null, null, 'Mengly');
INSERT INTO `uflo_variable` VALUES ('String', '19634', 'fromUser', '19632', '19632', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19635', 'user', '19632', '19632', null, null, null, null, null, null, null, null, null, null, 'Xiongw');
INSERT INTO `uflo_variable` VALUES ('String', '19643', 'fromUser', '19641', '19641', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19644', 'user', '19641', '19641', null, null, null, null, null, null, null, null, null, null, 'Xinw');
INSERT INTO `uflo_variable` VALUES ('String', '19652', 'fromUser', '19650', '19650', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19653', 'user', '19650', '19650', null, null, null, null, null, null, null, null, null, null, 'Fangsl');
INSERT INTO `uflo_variable` VALUES ('String', '19661', 'fromUser', '19659', '19659', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19662', 'user', '19659', '19659', null, null, null, null, null, null, null, null, null, null, 'Jinw');
INSERT INTO `uflo_variable` VALUES ('String', '19670', 'fromUser', '19668', '19668', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19671', 'user', '19668', '19668', null, null, null, null, null, null, null, null, null, null, '00082');
INSERT INTO `uflo_variable` VALUES ('String', '19679', 'fromUser', '19677', '19677', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19680', 'user', '19677', '19677', null, null, null, null, null, null, null, null, null, null, 'Wanghb');
INSERT INTO `uflo_variable` VALUES ('String', '19688', 'fromUser', '19686', '19686', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19689', 'user', '19686', '19686', null, null, null, null, null, null, null, null, null, null, 'Xiars');
INSERT INTO `uflo_variable` VALUES ('String', '19697', 'fromUser', '19695', '19695', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19698', 'user', '19695', '19695', null, null, null, null, null, null, null, null, null, null, 'Yim');
INSERT INTO `uflo_variable` VALUES ('String', '19706', 'fromUser', '19704', '19704', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19707', 'user', '19704', '19704', null, null, null, null, null, null, null, null, null, null, 'Chengy');
INSERT INTO `uflo_variable` VALUES ('String', '19715', 'fromUser', '19713', '19713', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19716', 'user', '19713', '19713', null, null, null, null, null, null, null, null, null, null, 'Gex');
INSERT INTO `uflo_variable` VALUES ('String', '19724', 'fromUser', '19722', '19722', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19725', 'user', '19722', '19722', null, null, null, null, null, null, null, null, null, null, 'Luox');
INSERT INTO `uflo_variable` VALUES ('String', '19733', 'fromUser', '19731', '19731', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19734', 'user', '19731', '19731', null, null, null, null, null, null, null, null, null, null, 'yangying');
INSERT INTO `uflo_variable` VALUES ('String', '19742', 'fromUser', '19740', '19740', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19743', 'user', '19740', '19740', null, null, null, null, null, null, null, null, null, null, 'Zenglq');
INSERT INTO `uflo_variable` VALUES ('String', '19751', 'fromUser', '19749', '19749', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19752', 'user', '19749', '19749', null, null, null, null, null, null, null, null, null, null, 'Zhaom');
INSERT INTO `uflo_variable` VALUES ('String', '19760', 'fromUser', '19758', '19758', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19761', 'user', '19758', '19758', null, null, null, null, null, null, null, null, null, null, 'lexh');
INSERT INTO `uflo_variable` VALUES ('String', '19769', 'fromUser', '19767', '19767', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19770', 'user', '19767', '19767', null, null, null, null, null, null, null, null, null, null, 'Duanwb');
INSERT INTO `uflo_variable` VALUES ('String', '19778', 'fromUser', '19776', '19776', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19779', 'user', '19776', '19776', null, null, null, null, null, null, null, null, null, null, 'Gaocr');
INSERT INTO `uflo_variable` VALUES ('String', '19796', 'fromUser', '19794', '19794', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19797', 'user', '19794', '19794', null, null, null, null, null, null, null, null, null, null, 'Huangsx');
INSERT INTO `uflo_variable` VALUES ('String', '19805', 'fromUser', '19803', '19803', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19806', 'user', '19803', '19803', null, null, null, null, null, null, null, null, null, null, 'Taoxf');
INSERT INTO `uflo_variable` VALUES ('String', '19814', 'fromUser', '19812', '19812', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19815', 'user', '19812', '19812', null, null, null, null, null, null, null, null, null, null, 'Tongt');
INSERT INTO `uflo_variable` VALUES ('String', '19823', 'fromUser', '19821', '19821', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19824', 'user', '19821', '19821', null, null, null, null, null, null, null, null, null, null, 'Wangr');
INSERT INTO `uflo_variable` VALUES ('String', '19832', 'fromUser', '19830', '19830', null, null, null, null, null, null, null, null, null, null, '崔海华');
INSERT INTO `uflo_variable` VALUES ('String', '19833', 'user', '19830', '19830', null, null, null, null, null, null, null, null, null, null, 'zhoud');
INSERT INTO `uflo_variable` VALUES ('String', '19848', 'fromUser', '19141', '19141', null, null, null, null, null, null, null, null, null, null, '汪锐');
INSERT INTO `uflo_variable` VALUES ('String', '19849', 'user', '19141', '19141', null, null, null, null, null, null, null, null, null, null, 'Gaocr');
INSERT INTO `uflo_variable` VALUES ('String', '19853', 'fromUser', '19324', '19324', null, null, null, null, null, null, null, null, null, null, '金伟');
INSERT INTO `uflo_variable` VALUES ('String', '19854', 'user', '19324', '19324', null, null, null, null, null, null, null, null, null, null, 'Yim');
INSERT INTO `uflo_variable` VALUES ('String', '19858', 'fromUser', '19342', '19342', null, null, null, null, null, null, null, null, null, null, '王浩宾');
INSERT INTO `uflo_variable` VALUES ('String', '19859', 'user', '19342', '19342', null, null, null, null, null, null, null, null, null, null, 'Yim');
INSERT INTO `uflo_variable` VALUES ('String', '19863', 'fromUser', '19351', '19351', null, null, null, null, null, null, null, null, null, null, '夏任司');
INSERT INTO `uflo_variable` VALUES ('String', '19864', 'user', '19351', '19351', null, null, null, null, null, null, null, null, null, null, 'Yim');
INSERT INTO `uflo_variable` VALUES ('String', '19868', 'fromUser', '19423', '19423', null, null, null, null, null, null, null, null, null, null, '童涛');
INSERT INTO `uflo_variable` VALUES ('String', '19869', 'user', '19423', '19423', null, null, null, null, null, null, null, null, null, null, 'Gaocr');
INSERT INTO `uflo_variable` VALUES ('String', '19873', 'fromUser', '19333', '19333', null, null, null, null, null, null, null, null, null, null, '乐雪焕');
INSERT INTO `uflo_variable` VALUES ('String', '19874', 'user', '19333', '19333', null, null, null, null, null, null, null, null, null, null, 'Yim');
INSERT INTO `uflo_variable` VALUES ('String', '19902', 'fromUser', '19785', '19785', null, null, null, null, null, null, null, null, null, null, '光文祥');
INSERT INTO `uflo_variable` VALUES ('String', '19903', 'user', '19785', '19785', null, null, null, null, null, null, null, null, null, null, 'Gaocr');
INSERT INTO `uflo_variable` VALUES ('String', '19908', 'fromUser', '19906', '19906', null, null, null, null, null, null, null, null, null, null, '高长仁');
INSERT INTO `uflo_variable` VALUES ('String', '19909', 'user', '19906', '19906', null, null, null, null, null, null, null, null, null, null, 'lexh');
INSERT INTO `uflo_variable` VALUES ('String', '19917', 'fromUser', '19915', '19915', null, null, null, null, null, null, null, null, null, null, '高长仁');
INSERT INTO `uflo_variable` VALUES ('String', '19918', 'user', '19915', '19915', null, null, null, null, null, null, null, null, null, null, 'Duanwb');
INSERT INTO `uflo_variable` VALUES ('String', '19926', 'fromUser', '19924', '19924', null, null, null, null, null, null, null, null, null, null, '高长仁');
INSERT INTO `uflo_variable` VALUES ('String', '19927', 'user', '19924', '19924', null, null, null, null, null, null, null, null, null, null, 'Gaocr');
INSERT INTO `uflo_variable` VALUES ('String', '19935', 'fromUser', '19933', '19933', null, null, null, null, null, null, null, null, null, null, '高长仁');
INSERT INTO `uflo_variable` VALUES ('String', '19936', 'user', '19933', '19933', null, null, null, null, null, null, null, null, null, null, 'Guangwx');
INSERT INTO `uflo_variable` VALUES ('String', '19944', 'fromUser', '19942', '19942', null, null, null, null, null, null, null, null, null, null, '高长仁');
INSERT INTO `uflo_variable` VALUES ('String', '19945', 'user', '19942', '19942', null, null, null, null, null, null, null, null, null, null, 'Huangsx');
INSERT INTO `uflo_variable` VALUES ('String', '19953', 'fromUser', '19951', '19951', null, null, null, null, null, null, null, null, null, null, '高长仁');
INSERT INTO `uflo_variable` VALUES ('String', '19954', 'user', '19951', '19951', null, null, null, null, null, null, null, null, null, null, 'Taoxf');
INSERT INTO `uflo_variable` VALUES ('String', '19962', 'fromUser', '19960', '19960', null, null, null, null, null, null, null, null, null, null, '高长仁');
INSERT INTO `uflo_variable` VALUES ('String', '19963', 'user', '19960', '19960', null, null, null, null, null, null, null, null, null, null, 'Tongt');
INSERT INTO `uflo_variable` VALUES ('String', '19971', 'fromUser', '19969', '19969', null, null, null, null, null, null, null, null, null, null, '高长仁');
INSERT INTO `uflo_variable` VALUES ('String', '19972', 'user', '19969', '19969', null, null, null, null, null, null, null, null, null, null, 'Wangr');
INSERT INTO `uflo_variable` VALUES ('String', '19980', 'fromUser', '19978', '19978', null, null, null, null, null, null, null, null, null, null, '高长仁');
INSERT INTO `uflo_variable` VALUES ('String', '19981', 'user', '19978', '19978', null, null, null, null, null, null, null, null, null, null, 'zhoud');
