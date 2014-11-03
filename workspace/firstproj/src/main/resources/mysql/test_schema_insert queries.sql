
-- insert tb_user table
INSERT INTO test.TB_USER (user_id,user_nm,join_date) VALUES ('koj','권오준',CURRENT_TIMESTAMP());

INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('bys','배영수',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('khk','김희걸',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('ysh','윤성환',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('osh','오승환',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('kh','권혁',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('ajm','안지만',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('syw','신용운',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('lws','이우선',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('ldg','이동걸',CURRENT_TIMESTAMP());

INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('yjh','양지훈',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('cwc','차우찬',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('bjh','백정현',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('kkt','김기태',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('kkp','김건필',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('cwj','최원제',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('jhw','김현우',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('hhy','홍효의',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('scm','심창민',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('lhd','이현동',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('lsw','이승우',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('jhk','조현근',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('pkh','박근홍',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('njy','노진용',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('dyj','두영진',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('vdhk','밴덴헐크',CURRENT_TIMESTAMP());
INSERT INTO `test`.`TB_USER` (`user_id`,`user_nm`,`join_date`) VALUES ('rod','로드리게스',CURRENT_TIMESTAMP());




-- insert tb_attr_elem_map table
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (1,1,6,'ajm','안지만','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (2,4,6,'ajm','안지만','overhand',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (3,8,6,'ajm','안지만','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');


INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (1,1,6,'bys','배영수','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (2,4,6,'bys','배영수','overhand',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (3,8,6,'bys','배영수','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');


INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (1,1,6,'khk','김희걸','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (2,4,6,'khk','김희걸','overhand',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (3,8,6,'khk','김희걸','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');



INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (1,1,6,'ysh','윤성환','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (2,4,6,'ysh','윤성환','overhand',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (3,8,6,'ysh','윤성환','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');


INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (1,1,6,'osh','오승환','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (2,4,6,'osh','오승환','overhand',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (3,8,6,'osh','오승환','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');



INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (1,2,6,'kh','권혁','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (2,4,6,'kh','권혁','overhand',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (3,9,6,'kh','권혁','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');


INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (1,1,6,'syw','신용운','sidearm',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (2,6,6,'syw','신용운','overhand',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (3,8,6,'syw','신용운','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');



INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (1,2,6,'ajm','안지만','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (2,4,6,'ajm','안지만','overhand',CURRENT_TIMESTAMP(),'jwlee0208','Paul');
INSERT INTO `test`.`TB_ATTR_ELEM_MAP` (`attr_id`,`attr_elem_id`,`cat_id`,`user_id`,`user_name`,`attr_elem_map_name`,`create_date`,`create_user_id`,`create_user_name`) VALUES (3,9,6,'ajm','안지만','right',CURRENT_TIMESTAMP(),'jwlee0208','Paul');