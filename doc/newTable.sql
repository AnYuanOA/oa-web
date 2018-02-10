/**用户微信绑定表**/
CREATE TABLE bdf2_user_wechat
(
  ID_       INT AUTO_INCREMENT COMMENT '主键id' PRIMARY KEY,
  ACCOUNT_  VARCHAR(20)  NULL COMMENT 'OA账号',
  OPEN_ID_  VARCHAR(100) NULL COMMENT '微信openid',
  CHATNICK_ VARCHAR(250) NULL COMMENT '微信昵称',
  W_PASSWORD_ VARCHAR(250) NULL COMMENT '秘钥',
)
  COMMENT '用户微信绑定表';
  
  alter table bdf2_user_wechat add AVATAR_URL varchar(500) ;